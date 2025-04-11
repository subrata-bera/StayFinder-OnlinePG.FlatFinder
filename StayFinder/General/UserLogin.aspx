<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Login - User</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="StyleSheets/Navbar.css" rel="stylesheet" />
    <link href="StyleSheets/PageLoader.css" rel="stylesheet" />
     <style>
            #lblSignup {
                text-decoration: none;
                border: 2px solid #0D6EFD;
                padding: 8px 12px;
                border-radius: 7px;
                transition:0.3s;
            
            }
                #lblSignup:hover {
                    background-color: #0D6EFD;
                    color: #ffff;
                }
        </style>

</head>
<body>
   <div id="loader">
    <div class="spinner"></div>
</div>
    <form id="form1" runat="server">
    <div>
          <header class="navbar navbar-expand-lg">
    <div class="container">
        <a href="index.aspx" class="navbar-brand">Stay Finder</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a href="index.aspx" class="nav-link active">Home</a></li>
                <li class="nav-item"><a href="FindPg_Mess.aspx" class="nav-link">Find PG/Mess</a></li>
                <li class="nav-item"><a href="PropertyOwnerLogin.aspx" class="nav-link">Login</a></li>
                <li class="nav-item"><a href="AdminLogin.aspx" class="nav-link">Admin</a></li>
                <li class="nav-item"><a href="#" class="nav-link">About</a></li>
            </ul>
        </div>
    </div>
</header>
        <div class="login py-5 mt-5">
            <div class="container d-flex justify-content-center align-items-center my-5">
    <div class="card p-4 shadow-lg" style="width: 350px;">
        <h1 class="h3 mb-3 fw-normal text-center">Login </h1>

        <div class="form-floating mb-2">
            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="name@example.com"></asp:TextBox>
            
            <label for="floatingInput">Email address</label>
        </div>
        <div class="form-floating mb-2">
            <asp:TextBox TextMode="Password" ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
            <label for="floatingPassword">Password</label>
            
        </div>

       
        
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary w-100 py-2" Text="Sign in" OnClick="signinClick" />
        <asp:HyperLink ID="lblSignup" runat="server" CssClass="mt-3 text-center text-body-seconday" Text="Sign Up" NavigateUrl="UserRegistration.aspx"></asp:HyperLink>
    </div>

</div>
            <center><asp:Label runat="server" ID="lblError"></asp:Label></center>

        </div>
    </div>
    </form>

    <script src="JavaScript/PageLoader.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


</body>
</html>
