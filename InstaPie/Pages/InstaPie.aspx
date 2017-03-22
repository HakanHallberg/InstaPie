<%@ Page language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<WebPartPages:AllowFraming ID="AllowFraming" runat="server" />

<html>
<head>
    <title>InstaPie</title>
    <script type="text/javascript" src="../Scripts/jquery-3.1.1.min.js"></script>
    <link href="../Content/App.css" rel="stylesheet" />
</head>
<body>
        <div id="instaWrap2">
        <div id="instaInfo2">
            <input type="text" id="instaStuff2"/>
            <input type="color" id="instaColor2"/>
            <input type="number" id="instaNumber2"/>
            <button id="instaSend2">Submit</button>
        </div>
        <canvas id="instaPie2"></canvas>
    </div>
</body>
</html>
