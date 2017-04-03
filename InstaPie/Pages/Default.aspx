<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <meta name="WebPartPageExpansion" content="full" />

    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="../Scripts/d3.min.js"></script>
    <script src="../Scripts/d3pie.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    InstaPie
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div id="pie"></div>

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
				{label: "Bushtit", value: 5 },
				{label: "Chickadee", value: 2 },
				{label: "Elephants", value: 6 },
				{label: "Killdeer", value: 3 },
				{label: "Caspian Tern", value: 2 },
				{label: "Blackbird", value: 1 },
				{label: "Song Sparrow", value: 6 },
				{label: "Blue Jay", value: 5 },
				{label: "Black-throated Gray warbler", value: 1 },
				{label: "Pelican", value: 6 },
				{label: "Bewick's Wren", value: 5 },
				{label: "Cowbird", value: 1 },
				{label: "Fox Sparrow", value: 6 },
				{label: "Common Yellowthroat", value: 5 },
				{label: "Virginia Rail", value: 1 },
				{label: "Sora", value: 1 },
				{label: "Osprey", value: 1 },
				{label: "Merlin", value: 1 },
				{label: "Kestrel", value: 1 }
			]
		}
	});
    </script>
</asp:Content>
