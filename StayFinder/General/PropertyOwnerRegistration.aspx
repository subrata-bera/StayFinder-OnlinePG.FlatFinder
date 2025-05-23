<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PropertyOwnerRegistration.aspx.cs" Inherits="General_PropertyOwnerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Property Owner Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="StyleSheets/PropertyOwnerRegistration.css" rel="stylesheet" />
    <link href="StyleSheets/Navbar.css" rel="stylesheet" />
    <style>
        html, body {
    overflow: auto; /* Allows scrolling */
    scrollbar-width: none; /* Hides scrollbar in Firefox */
    -ms-overflow-style: none; /* Hides scrollbar in IE/Edge */
}

body::-webkit-scrollbar {
    display: none; /* Hides scrollbar in Chrome, Safari, Edge */
}

    .hover-dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0; /* removes animation gap */
    }


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a href="index.aspx" class="navbar-brand">Stay Finder</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
       <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
    <ul class="navbar-nav">
        <li class="nav-item"><a href="../Default.aspx" class="nav-link active">Home</a></li>
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
    <div class="container mt-5 pt-5">
    <div class="registration-form-card">
        <h2>Property Owner Registration</h2>
       
            
            <!-- Full Name -->
            <div class="mb-3">
                <label class="form-label">Full name</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtName" placeholder="Enter your full name" required></asp:TextBox>
            </div>

            <!-- Email -->
            <div class="mb-3">
                <label class="form-label">Email address</label>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Enter your email" required></asp:TextBox>
            </div>

           

            <!-- Contact Number -->
            <div class="mb-3">
                <label class="form-label">Contact Number</label>
                <asp:Textbox runat="server" ID="txtContact" CssClass="form-control" placeholder="Enter your phone number" required></asp:Textbox>
            </div>

            <!-- Address -->
            <div class="mb-3">
              
               <label class="form-label">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" placeholder="Enter your full address" required></asp:TextBox>
                
            </div>
             <!-- Password -->
            <div class="mb-3">
                <label class="form-label">Password</label>
                <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" placeholder="Enter a strong password" required></asp:TextBox>
            </div>

            <!-- Confirm Password -->
            <div class="mb-3">
                <label class="form-label">Confirm Password</label>
                <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control" placeholder="Re-enter your password" required></asp:TextBox>
            </div>

            <!-- Upload Profile Picture -->
            <div class="mb-3">
                <label class="form-label">Upload Profile Picture</label>
                <asp:FileUpload ID="profilepicture" runat="server" CssClass="form-control" accept=".jpg,.jpeg,.png"/>
            </div>

         <div class="mb-3 text-center">
               <asp:Label runat="server" ID="lblError"></asp:Label>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <asp:Button runat="server" CssClass="btn btn-primary btn-lg" Text="Register" OnClick="register_Click" />
            </div>
             <div class="text-center">
                 <asp:HyperLink runat="server" CssClass="btn btn-outline-primary btn-lg w-100 mt-2" NavigateUrl="~/General/PropertyOwnerLogin.aspx" Text="Back to login"></asp:HyperLink>
            </div>
        </form>
    </div>
</div>

    </form>



   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
