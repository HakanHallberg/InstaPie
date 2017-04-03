﻿<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS Styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Add your JavaScript to the following file -->
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script type="text/javascript" src="../Scripts/go.js"></script>
    <script type="text/javascript" src="../Scripts/goSamples.js"></script>
    <!--jquery för dragging-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    InstaPie
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    
<script id="code">
  function init() {
    //if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
    var $ = go.GraphObject.make;
    var pieRadius = 100;

    myDiagram =
      $(go.Diagram, "myDiagramDiv",
        {
          initialContentAlignment: go.Spot.Center,
          "textEditingTool.starting": go.TextEditingTool.SingleClick,
          "ModelChanged": onModelChanged,
          "undoManager.isEnabled": true
        }
      );

    // When a count changes in our model, ensure we trigger a redrawing of each slice in the pie
    function onModelChanged(e) {
      if (e.change === go.ChangedEvent.Property && e.propertyName === "count") {
        var slicedata = e.object;
        var nodedata = findNodeDataForSlice(slicedata);
        if (nodedata) {
          // Update the count binding to force makeGeo/positionSlice
          myDiagram.model.updateTargetBindings(nodedata, "count");
          // If the count went to 0, hide the slice
          var sliceindex = nodedata.slices.indexOf(slicedata);
          var slice = myDiagram.findNodeForKey(nodedata.key).findObject("PIE").elt(sliceindex);
          var sliceshape = slice.findObject("SLICE");
          if (slicedata.count === 0)
            sliceshape.visible = false;
          else
            sliceshape.visible = true;
        }
      }
    }

    var sliceTemplate =
      $(go.Panel,
        $(go.Shape,
          {
            name: "SLICE",
            strokeWidth: 2, stroke: "transparent",
            isGeometryPositioned: true
          },
          new go.Binding("fill", "color"),
          new go.Binding("geometry", "", makeGeo)
        ),
        new go.Binding("position", "", positionSlice),
        { // Allow the user to "select" slices when clicking them
          click: function(e, slice) {
            var sliceShape = slice.findObject("SLICE");
            var oldskips = slice.diagram.skipsUndoManager;
            slice.diagram.skipsUndoManager = true;
            if (sliceShape.stroke === "transparent") {
              sliceShape.stroke = go.Brush.darkenBy(slice.data.color, 0.4);
              // Move the slice out from the pie when selected
              var nodedata = findNodeDataForSlice(slice.data);
              if (nodedata) {
                var sliceindex = nodedata.slices.indexOf(slice.data);
                var angles = getAngles(nodedata, sliceindex);
                if (angles.sweep !== 360) {
                  var angle = angles.start + angles.sweep / 2;
                  var offsetPoint = new go.Point(pieRadius / 10, 0);
                  slice.position = offsetPoint.rotate(angle).offset(pieRadius / 10, pieRadius / 10);
                }
              }
            } else {
              sliceShape.stroke = "transparent";
              slice.position = new go.Point(pieRadius / 10, pieRadius / 10);
            }
            slice.diagram.skipsUndoManager = oldskips;
          }
        },
        {
          toolTip:
            $(go.Adornment, "Auto",
              $(go.Shape, { fill: "lightgray" }),
              $(go.TextBlock,
                { font: "10pt Verdana, sans-serif", margin: 4 },
                new go.Binding("text", "", function(data) {
                      // Display text and percentage rounded to 2 decimals
                      var nodedata = findNodeDataForSlice(data);
                      if (nodedata) {
                        var percent = Math.round((data.count / getTotalCount(nodedata) * 100) * 100) / 100;
                        return data.text + ": " + percent + "%";
                      }
                      return "";
                    }))
            )
        }
      );

    var optionTemplate =
      $(go.Panel, "TableRow",
        $(go.TextBlock,
          { column: 0,
            font: "10pt Verdana, sans-serif", alignment: go.Spot.Left,
            margin: 5 },
          new go.Binding("text")
        ),
        $(go.Panel, "Auto",
          { column: 1 },
          $(go.Shape, { fill: "#F2F2F2" }),
          $(go.TextBlock,
            {
              font: "10pt Verdana, sans-serif",
              textAlign: "right", margin: 2,
              wrap: go.TextBlock.None, width: 40,
              editable: true, isMultiline: false,
              textValidation: isValidCount
            },
            new go.Binding("text", "count").makeTwoWay(function(count) { return parseInt(count, 10); })
          )
        ),
        $(go.Panel, "Horizontal",
          { column: 2 },
          $("Button",
            {
              click: incrementCount
            },
            $(go.Shape, "PlusLine", { margin: 3, desiredSize: new go.Size(7, 7) })
          ),
          $("Button",
            {
              click: decrementCount
            },
            $(go.Shape, "MinusLine", { margin: 3, desiredSize: new go.Size(7, 7) })
          )
        )
      );

    myDiagram.nodeTemplate =
      $(go.Node, "Vertical",
        { deletable: false },
        $(go.TextBlock,
          { font: "11pt Verdana, sans-serif", margin: 5 },
          new go.Binding("text")
        ),
        $(go.Panel, "Horizontal",
          $(go.Panel, "Position",
            {
              name: "PIE",
              // account for slices offsetting when selected so the node won't change size
              desiredSize: new go.Size(pieRadius * 2.2  + 5, pieRadius * 2.2 + 5),
              itemTemplate: sliceTemplate
            },
            new go.Binding("itemArray", "slices")
          ),
          $(go.Panel, "Table",
            {
              margin: 5,
              itemTemplate: optionTemplate
            },
            new go.Binding("itemArray", "slices")
          )
        )
      );

    myDiagram.model = new go.Model(
      [
        { key: 0,
          text: "InstaPie",
          slices: [
            { text: "Option 1", count: 20, color: "#B378C1" },
            { text: "Option 2", count: 20, color: "#F25F5C" },
            { text: "Option 3", count: 20, color: "#FFE066" },
            { text: "Option 4", count: 20, color: "#2B98C5" },
            { text: "Option 5", count: 20, color: "#70C1B3" }
          ]
        }
      ]
    );
    myDiagram.model.copiesArrays = true;
    myDiagram.model.copiesArrayObjects = true;

    // Validation function for editing text
    function isValidCount(textblock, oldstr, newstr) {
      if (newstr === "") return false;
      var num = +newstr; // quick way to convert a string to a number
      return !isNaN(num) && Number.isInteger(num) && num >= 0;
    }

    // Given some slice data, find the corresponding node data
    function findNodeDataForSlice(slice) {
      var arr = myDiagram.model.nodeDataArray;
      for (var i = 0; i < arr.length; i++) {
        var data = arr[i];
        if (data.slices.indexOf(slice) >= 0) {
          return data;
        }
      }
    }

    function makeGeo(data) {
      var nodedata = findNodeDataForSlice(data);
      var sliceindex = nodedata.slices.indexOf(data);
      var angles = getAngles(nodedata, sliceindex);

      // Constructing the Geomtery this way is much more efficient than calling go.GraphObject.make:
      return new go.Geometry()
            .add(new go.PathFigure(pieRadius, pieRadius)  // start point
                 .add(new go.PathSegment(go.PathSegment.Arc,
                                         angles.start, angles.sweep,  // angles
                                         pieRadius, pieRadius,  // center
                                         pieRadius, pieRadius)  // radius
                      .close()));
    }

    // Ensure slices get the proper positioning after we update any counts
    function positionSlice(data, obj) {
      var nodedata = findNodeDataForSlice(data);
      var sliceindex = nodedata.slices.indexOf(data);
      var angles = getAngles(nodedata, sliceindex);

      var selected = obj.findObject("SLICE").stroke !== "transparent";
      if (selected && angles.sweep !== 360) {
        var offsetPoint = new go.Point(pieRadius / 10, 0); // offset by 1/10 the radius
        offsetPoint = offsetPoint.rotate(angles.start + angles.sweep / 2); // rotate to the correct angle
        offsetPoint = offsetPoint.offset(pieRadius / 10, pieRadius / 10); // translate center toward middle of pie panel
        return offsetPoint;
      }
      return new go.Point(pieRadius / 10, pieRadius / 10);
    }

    // This is a bit inefficient, but should be OK for normal-sized graphs with reasonable numbers of slices per node
    function findAllSelectedItems() {
      var slices = [];
      for (var nit = myDiagram.nodes; nit.next(); ) {
        var node = nit.value;
        var pie = node.findObject("PIE");
        if (pie) {
          for (var sit = pie.elements; sit.next(); ) {
            var slicepanel = sit.value;
            if (slicepanel.findObject("SLICE").stroke !== "transparent") slices.push(slicepanel);
          }
        }
      }
      return slices;
    }

    // Override the standard CommandHandler deleteSelection behavior.
    // If there are any selected slices, delete them instead of deleting any selected nodes or links.
    myDiagram.commandHandler.canDeleteSelection = function() {
      // True if there are any selected deletable nodes or links,
      // or if there are any selected slices within nodes
      return go.CommandHandler.prototype.canDeleteSelection.call(myDiagram.commandHandler) ||
             findAllSelectedItems().length > 0;
    };

    myDiagram.commandHandler.deleteSelection = function() {
      var slices = findAllSelectedItems();
      if (slices.length > 0) {  // if there are any selected slices, delete them
        myDiagram.startTransaction("delete slices");
        var nodeset = new go.Set();
        for (var i = 0; i < slices.length; i++) {
          var panel = slices[i];
          var nodedata = panel.part.data;
          var slicearray = nodedata.slices;
          var slicedata = panel.data;
          var sliceindex = slicearray.indexOf(slicedata);
          // Remove the slice from the model
          myDiagram.model.removeArrayItem(slicearray, sliceindex);
          nodeset.add(nodedata);
        }
        // Force geometries to be redrawn on any node that had slices deleted
        nodeset.each(function(data) {
          myDiagram.model.updateTargetBindings(data, "count");
        });
        myDiagram.commitTransaction("delete slices");
      } else {  // otherwise just delete nodes and/or links, as usual
        go.CommandHandler.prototype.deleteSelection.call(myDiagram.commandHandler);
      }
    };

    // Return total count of a given node
    function getTotalCount(nodedata) {
      var totCount = 0;
      for (var i = 0; i < nodedata.slices.length; i++) {
        totCount += nodedata.slices[i].count;
      }
      return totCount;
    }

    // Determine start and sweep angles given some node data and the index of the slice
    function getAngles(nodedata, index) {
      var totCount = getTotalCount(nodedata);
      var startAngle = -90;
      for (var i = 0; i < index; i++) {
        startAngle += 360 * nodedata.slices[i].count / totCount;
      }
      return { "start": startAngle, "sweep": 360 * nodedata.slices[index].count / totCount };
    }

    // When user hits + button, increment count on that option
    function incrementCount(e, obj) {
      myDiagram.model.startTransaction("increment count");
      var slicedata = obj.panel.panel.data;
      myDiagram.model.setDataProperty(slicedata, "count", slicedata.count + 1);
      myDiagram.model.commitTransaction("increment count");
    }

    // When user hits - button, decrement count on that option
    function decrementCount(e, obj) {
      myDiagram.model.startTransaction("decrement count");
      var slicedata = obj.panel.panel.data;
      if (slicedata.count > 0)
        myDiagram.model.setDataProperty(slicedata, "count", slicedata.count - 1);
      myDiagram.model.commitTransaction("decrement count");
    }
    }
    <script src="//cdnjs.cloudflare.com/ajax/libs/d3/4.7.2/d3.min.js"></script>
    <script src="../Scripts/d3pie.min.js"></script>
</script>
    
    <!--div id="sample"-->
        <div id="myDiagramDiv" style=" width: 100%; height: 500px;"></div>    
    <!--/div-->
    <div id="draggable1" class="ui-widget-content"><textarea name="text1" cols="35" rows="8">Option 1&#10;&#10;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel risus a urna viverra sagittis.</textarea></div>
    <div id="draggable2" class="ui-widget-content"><textarea name="text2" cols="35" rows="8">Option 2&#10;&#10;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel risus a urna viverra sagittis.</textarea></div>
    <div id="draggable3" class="ui-widget-content"><textarea name="text3" cols="35" rows="8">Option 3&#10;&#10;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel risus a urna viverra sagittis.</textarea></div>
    <div id="draggable4" class="ui-widget-content"><textarea name="text4" cols="35" rows="8">Option 4&#10;&#10;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel risus a urna viverra sagittis.</textarea></div>
    <div id="draggable5" class="ui-widget-content"><textarea name="text5" cols="35" rows="8">Option 5&#10;&#10;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vel risus a urna viverra sagittis.</textarea></div>

    <div id="myPie"></div>

    <script>
        var pie = new d3pie("mypie", {
            header: {
            title: {
            text: "A very simple example pie"
		}
	},
	data: {
            content: [
			{label: "JavaScript", value: 264131 },
			{label: "Ruby", value: 218812 },
			{label: "Java", value: 157618},
		]
	}
});
        });
</script>
</asp:Content>
