<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindPg_Mess.aspx.cs" Inherits="General_FIndPg_Mess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find PG/Mess</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="StyleSheets/FindPg_Mess.css" rel="stylesheet" />
    <link href="StyleSheets/Navbar.css" rel="stylesheet" />
    <link href="StyleSheets/PageLoader.css" rel="stylesheet" />
    <style>
    .hover-dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0; /* removes animation gap */
    }
</style>

</head>
<body>
    <div id="loader">
    <div class="spinner"></div>
</div>

    <form id="form1" runat="server">
         <header class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a href="index.aspx" class="navbar-brand">Stay Finder</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
       <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
    <ul class="navbar-nav">
        <li class="nav-item"><a href="index.aspx" class="nav-link active">Home</a></li>
        <li class="nav-item"><a href="FindPg_Mess.aspx" class="nav-link">Find Your Stay</a></li>

        <!-- Dropdown for Login -->
        <li class="nav-item dropdown hover-dropdown">
            <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">Login</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../User/Login.aspx">User Login</a></li>
                <li><a class="dropdown-item" href="PropertyOwnerLogin.aspx">Property Owner Login</a></li>
                <li><a class="dropdown-item" href="AdminLogin.aspx">Admin Login</a></li>
            </ul>
        </li>

        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
    </ul>
</div>
    </div>
</header>
       
        

    <div class="album py-5 bg-body-tertiary mt-5">
        <div class="container">
            <center>
        <asp:Label runat="server" ID="noDataMessage" Visible="false" CssClass="text-center mx-5  text-danger fs-4">No data found</asp:Label>
            </center>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                 <asp:Repeater ID="rptPropertyList" runat="server">
                    <ItemTemplate>
    <div class="col">
        <div class="card">
            <img src="data:image/png;base64,<%# Convert.ToBase64String((byte[])Eval("PropertyImage")) %>" id="PropertyImage" />
            <div class="card-body">
                <h3><%# Eval("PropertyName") %></h3>
                <p><i class="bi bi-geo-alt"></i> <%# Eval("Location") %></p>
                <p><i class="bi bi-house"></i> Type: <%# Eval("Gender") %></p>
                <p><i class="bi bi-person"></i> Owner: <%# Eval("OwnerName") %></p>
                <p><i class="bi bi-phone"></i> Contact: <%# Eval("Contact") %></p>
                <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                   <a href='PropertyDetails.aspx?ID=<%# Eval("ID") %>' class="btn btn-outline-secondary">View</a>
                    </div>
                    <div class="rent">
    <b><%# "₹ " + Eval("MinRent") + " - ₹ " + Eval("MaxRent") + " / Month" %></b>
</div>

                </div>
            </div>
        </div>
    </div>
</ItemTemplate>

                     </asp:Repeater>
            </div>
        </div>
    </div>
    </form>
    <script src="JavaScript/PageLoader.js"></script>
    <script src="JavaScript/SearchProperty.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    

</body>
</html>
