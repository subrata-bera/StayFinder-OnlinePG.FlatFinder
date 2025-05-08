<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewDocument.aspx.cs" Inherits="User_ViewDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Uploaded Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        #imgDocument {
            width: 100%;
            height: 100%;
        }
        .container {
            display: flex;
            flex-direction: column;
            width: 50vmax;
            height: 85vmin;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
   <div class="container py-5 text-center">
            <asp:Image ID="imgDocument" runat="server" CssClass="img-fluid border rounded" />
       <asp:Button runat="server" CssClass="btn btn-primary my-3" Text="Ok" OnClick="back_Click"  />
        </div>
    </form>
</body>
</html>
