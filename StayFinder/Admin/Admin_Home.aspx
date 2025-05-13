<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Home.aspx.cs" Inherits="Admin_Admin_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Home</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
           
        <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />
        <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />

    <style>
        .main-container {
            display:flex;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: 0.3s ease-in-out;
        }
        .card:hover {
            transform: scale(1.03);
        }
        .card-icon {
            font-size: 2.5rem;
        }
        .dashboard-title {
            font-weight: 700;
            font-size: 2rem;
        }
    </style>
</head>
<body>
    <div id="loader">
    <div class="spinner"></div>
</div>
     <form id="form1" runat="server">
   <div class="main-container">
        <div class="nav d-flex side-bar flex-column flex-shrink-0  text-bg-dark">
            <div class="cross-icon ms-auto p-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
</svg>
            </div>
          <span class="fs-4">Stay Finder</span>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
          <li class="nav-item">
            <a href="Admin_Home.aspx" class="nav-link active" aria-current="page">
              <svg class="bi pe-none me-2" width="16" height="16"></use></svg>
              Home
            </a>
          </li>
          <li>
            <a href="PendingProperties.aspx" class="nav-link text-white">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
              Pending Property
            </a>

          </li>

             <li>
            <a href="ManageOwners.aspx" class="nav-link text-white">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
              Manage Owners
            </a>

          </li>
             <li>
            <a href="ManageUsers.aspx" class="nav-link text-white">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
              Manage Users
            </a>

          </li>
         
        
          
        </ul>
        <hr>
        <div class="dropdown">
          <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <strong><asp:Label runat="server" ID="lblUserName" Text="bdo"></asp:Label></strong>
          </a>
          <ul class="dropdown-menu dropdown-menu-dark text-small shadow" style="">
           
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
             <asp:Button ID="Button1" runat="server" CssClass="dropdown-item" Text="Sign out" OnClick="signout_Click" />
          </ul>
        </div>
      </div>  






         <div class="container py-5">
             <div class="nav-icon mx-2 my-3">
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
</svg>
       </div>
            <h2 class="text-center mb-4 dashboard-title">Admin Dashboard</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card bg-primary text-white text-center p-4">
                        <i class="bi bi-people-fill card-icon mb-2"></i>
                        <h4>Registered Owners</h4>
                        <asp:Label ID="lblOwners" runat="server" CssClass="fs-4 fw-bold" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card bg-success text-white text-center p-4">
                        <i class="bi bi-house-door-fill card-icon mb-2"></i>
                        <h4>Total Properties</h4>
                        <asp:Label ID="lblTotalProperties" runat="server" CssClass="fs-4 fw-bold" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card bg-warning text-dark text-center p-4">
                        <i class="bi bi-hourglass-split card-icon mb-2"></i>
                        <h4>Pending Approvals</h4>
                        <asp:Label ID="lblPending" runat="server" CssClass="fs-4 fw-bold" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card bg-info text-dark text-center p-4">
                        <i class="bi bi-check-circle-fill card-icon mb-2"></i>
                        <h4>Approved Properties</h4>
                        <asp:Label ID="lblApproved" runat="server" CssClass="fs-4 fw-bold" Text="0"></asp:Label>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card bg-danger text-white text-center p-4">
                        <i class="bi bi-x-circle-fill card-icon mb-2"></i>
                        <h4>Rejected Properties</h4>
                        <asp:Label ID="lblRejected" runat="server" CssClass="fs-4 fw-bold" Text="0"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
   </div>
      
    </form>

    <script src="../General/JavaScript/PageLoader.js"></script>
      <script src="../General/JavaScript/ResponsiveSidebar.js"></script>


          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
