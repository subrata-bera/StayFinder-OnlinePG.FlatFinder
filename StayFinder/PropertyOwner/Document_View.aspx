<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Document_View.aspx.cs" Inherits="PropertyOwner_Document_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
         <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />
     <title>View Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
        crossorigin="anonymous" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .document-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 2rem;
        }

        .document-card {
            background-color: white;
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.1);
            max-width: 90%;
            width: 600px;
            text-align: center;
        }

        .document-card img {
            max-width: 100%;
            height: auto;
            border-radius: 0.5rem;
            border: 1px solid #ccc;
        }

        .document-card .btn {
            margin-top: 2rem;
        }
    </style>
           
</head>
<body>
   
    <form id="form1" runat="server">
               <div class="document-container">
            <div class="document-card">
                <asp:Image ID="imgDocument" runat="server" AlternateText="Document Image" />
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="back_Click" Text="OK" />
            </div>
        </div>
    </form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script> 
</body>
</html>
