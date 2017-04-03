<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <meta name="WebPartPageExpansion" content="full" />
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
    <script type="text/javascript" src="../Scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../Scripts/d3.min.js"></script>
    <script src="../Scripts/d3pie.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    InstaPie
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div id="pie" class="dragThis"></div>

    <script>
    var pie = new d3pie("pie", {
        size: {
        pieOuterRadius: "100%",
			canvasHeight: 360
		},
		data: {
        sortOrder: "value-asc",
			smallSegmentGrouping: {
        enabled: true,
				value: 2,
				valueType: "percentage",
				label: "Other birds",
				color: "#999999"
			},
			content: [
				{label: "Bushtit", value: 50 },
				{label: "Chickadee", value: 25 },
				{label: "Kestrel", value: 25 }
			]
		}
	});
    </script>

     <div id="instaWrap">
        <div id="instaInfo">
            <!--input type="color" id="instaColor"/-->
            <input type="text" id="instaStuff1" class="pieText"/>
            <input type="number" id="instaNumber1" class="pieNr"/><br />

            <input type="text" id="instaStuff2" class="pieText"/>
            <input type="number" id="instaNumber2" class="pieNr"/><br />

            <input type="text" id="instaStuff3" class="pieText"/>
            <input type="number" id="instaNumber3" class="pieNr"/><br />

            <input type="text" id="instaStuff4" class="pieText"/>
            <input type="number" id="instaNumber4" class="pieNr"/><br />

            <input type="text" id="instaStuff5" class="pieText"/>
            <input type="number" id="instaNumber5" class="pieNr"/><br />
            
            <input type="text" id="instaStuff6" class="pieText"/>
            <input type="number" id="instaNumber6" class="pieNr"/><br />
            
            <input type="text" id="instaStuff7" class="pieText"/>
            <input type="number" id="instaNumber7" class="pieNr"/><br />
            
            <input type="text" id="instaStuff8" class="pieText"/>
            <input type="number" id="instaNumber8" class="pieNr"/><br />
            
            <input type="text" id="instaStuff9" class="pieText"/>
            <input type="number" id="instaNumber9" class="pieNr"/><br />
            
            <input type="text" id="instaStuff10" class="pieText"/>
            <input type="number" id="instaNumber10" class="pieNr"/><br />
            
            <br />
             
              <div class="flip-container" ontouchstart="this.classList.toggle('hover');">
	<div class="flipper">
		<div class="front">
			<!-- front content -->
            <div id="buttonDiv">
            <input type="button" id="updatePie" class="updateButton" value="Update &#8635" onclick="updatePie();">
            <input type="button" id="clearPie" class="clearButton" value="&#9587" onclick="clearAll();">
            </div> 
		</div>
		<div class="back">
			<!-- back content -->
            <a href="http://www.develit.ninja/" target="_blank"><h2 id="loggo">Develit</h2></a>
		</div>
	</div>
</div>  
              <div id="testResults"></div>
        </div>
    </div>
</asp:Content>
