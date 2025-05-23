<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Owner_View.aspx.cs" Inherits="Admin_Owner_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

     <title>Owner Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Segoe UI', sans-serif;
        }

        .card-custom {
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .profile-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 5px solid #ffffff;
            margin-top: -75px;
            background-color: white;
        }

        .property-card {
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            transition: 0.3s ease;
        }

        .property-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container mt-5">
            <div class="card card-custom p-4">
                <div class="text-center">
                    <img runat="server" alt="Profile Photo" class="profile-img shadow" runat="server" id="imgProfile" />
                    <h3 class="mt-3 fw-bold" id="ownerName"><asp:Label runat="server" ID="lblName" /></h3>
                    <p class="text-muted" id="ownerEmail"><asp:Label runat="server" ID="lblEmail" /></p>
                    <p class="text-muted"><asp:Label runat="server" ID="lblContact" /></p>
                    <p class="text-muted"><asp:Label runat="server" ID="lblAddress" /></p>
                </div>

                <hr />

                <h5 class="fw-semibold mb-3">Listed Properties</h5>
                <asp:Repeater ID="rptProperties" runat="server">
                    <ItemTemplate>
                        <div class="card property-card mb-3">
                            <div class="card-body d-flex">
                                <div class="image border" style="margin-right:20px">
    <img src='<%# Eval("PropertyImage") == DBNull.Value || Eval("PropertyImage") == null || string.IsNullOrEmpty(Eval("ProperTyImage").ToString()) ? "../General/Assets/DefaultPropertyImage.wepb" : "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("PropertyImage")) %>' width="150" height="100" />
                                </div>
                               <div class="text">
                                    <h6 class="card-title"><%# Eval("PropertyName") %></h6>
                                <p class="card-text mb-1"><strong>Location:</strong> <%# Eval("Location") %></p>
                                <p class="card-text"><strong>Type:</strong> <%# Eval("PropertyType") %></p>
                               </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Label runat="server" ID="lblNoProperties" Text="No properties listed by this owner." Visible="false" CssClass="text-danger mt-3 fw-semibold d-block text-center" />
            </div>
        </div>
    </form>
</body>
</html>
