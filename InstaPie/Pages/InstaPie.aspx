<%@ Page language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<WebPartPages:AllowFraming ID="AllowFraming" runat="server" />

<html>
<head>
    <title>InstaPie</title>
    <script type="text/javascript" src="../Scripts/jquery-3.1.1.min.js"></script>
    <link href="../Content/AppPart.css" rel="stylesheet" />
</head>
<body>
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
    <script type="text/javascript" src="../Scripts/App.js"></script>
</body>
</html>
