<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" after="corev15app.css" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    InstaPie
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

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

            <input type="button" id="instaAdd10" class="updateButton" value="Update &#8635" onclick="updatePieTitle(10);">
            <input type="button" id="instaAdd10" class="clearButton" value="&#9587" onclick="clearAll();">
            <br />

            <div id="testResults"></div>
        </div>
        <div id="instaPie"></div>
    </div>

</asp:Content>
