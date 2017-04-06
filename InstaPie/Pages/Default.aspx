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
    

     <div id="instaWrap">
        <div id="instaInfo">
            <!--input type="color" id="instaColor"/-->
            <input type="text" id="instaStuff1" class="pieText"/>
            <input type="number" id="instaNumber1" class="pieNr" value="0"/><br />

            <input type="text" id="instaStuff2" value="test" class="pieText"/>
            <input type="number" id="instaNumber2" class="pieNr" value="0"/><br />

            <input type="text" id="instaStuff3" class="pieText"/>
            <input type="number" id="instaNumber3" class="pieNr" value="0"/><br />

            <input type="text" id="instaStuff4" class="pieText"/>
            <input type="number" id="instaNumber4" class="pieNr" value="0"/><br />

            <input type="text" id="instaStuff5" class="pieText"/>
            <input type="number" id="instaNumber5" class="pieNr" value="0"/><br />
            
            <input type="text" id="instaStuff6" class="pieText"/>
            <input type="number" id="instaNumber6" class="pieNr" value="0"/><br />
            
            <input type="text" id="instaStuff7" class="pieText"/>
            <input type="number" id="instaNumber7" class="pieNr" value="0"/><br />
            
            <input type="text" id="instaStuff8" class="pieText"/>
            <input type="number" id="instaNumber8" class="pieNr" value="0"/><br />
            
            <input type="text" id="instaStuff9" class="pieText"/>
            <input type="number" id="instaNumber9" class="pieNr" value="0"/><br />
            
            <input type="text" id="instaStuff10" class="pieText"/>
            <input type="number" id="instaNumber10" class="pieNr" value="0"/><br />
            
            <br />
             
<div class="flip-container" ontouchstart="this.classList.toggle('hover');">
	<div class="flipper">
		<div class="front">
			<!-- front content -->
            <div id="buttonDiv">
                <input type="button" id="updatePie" class="updateButton" value="Update &#8635" onclick="updatePieNow();">
                <input type="button" id="clearPie" class="clearButton" value="&#9587" onclick="clearAll();">
                <input type="button" id="updateTest" value="Stuff" onclick="testFunc();">
            </div>
		</div>
		<div class="back">
			<!-- back content -->
            <a href="http://www.develit.ninja/" target="_blank"><h2 id="loggo">www.develit.ninja</h2></a>
		</div>
	</div>
</div>
              <div id="testResults"></div>
        </div>
         <div id="pieAndInfo" class="dragThis">
         <div id="pie" "></div>
            <div id="outerDiv"> 
             <textarea  id="textArea" rows:10 cols:7></textarea>  
            </div>
         </div>
    </div>
    

    <script>initiatePie();</script>

</asp:Content>
