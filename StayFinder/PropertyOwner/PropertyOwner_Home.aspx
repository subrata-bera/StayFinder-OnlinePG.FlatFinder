<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PropertyOwner_Home.aspx.cs" Inherits="PropertyOwner_PropertyOwner_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />
       

     <style>
        
      body {
        background-color: #f1f5f9;
      }
      .dashboard-card {
        background: #ffffff;
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        padding: 30px;
        transition: all 0.3s ease-in-out;
        text-align: center;
      }
      .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      }
      .dashboard-title {
        font-size: 1.2rem;
        font-weight: 600;
        margin-bottom: 10px;
        color: #333;
      }
      .dashboard-number {
        font-size: 2.5rem;
        font-weight: bold;
        margin-bottom: 20px;
        color: #0d6efd;
      }
      .view-btn {
        background-color: #0d6efd;
        color: #fff;
        border-radius: 30px;
        padding: 8px 20px;
        font-size: 0.9rem;
        transition: background-color 0.3s;
      }
      .view-btn:hover {
        background-color: #0b5ed7;
        color: #fff;
      }

    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="main">
        <div class="nav side-bar d-flex flex-column flex-shrink-0  text-bg-dark">
           
            <div class="cross-icon ms-auto p-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
</svg>
            </div>

          <span class="fs-4">Stay Finder</span>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
          <li class="nav-item">
            <a href="PropertyOwner_Home.aspx" class="nav-link active" aria-current="page">
              <svg class="bi pe-none me-2" width="16" height="16"></use></svg>
              Home
            </a>
          </li>
          <li>
            <a href="TermsAndConditions.aspx" class="nav-link text-white">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
              Add Property
            </a>

          </li>
          <li>
            <a href="PropertyList.aspx" class="nav-link text-white">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
              My properties
            </a>
          </li>
          <li>
            <a href="SiteView_Requests.aspx" class="nav-link text-white">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
         Site-View Requests
            </a>
          </li>
         
        </ul>
        <hr>
        <div class="dropdown">
          <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img runat="server" id="profileImage" alt="" width="32" height="32" class="rounded-circle me-2">
            <strong><asp:Label  runat="server" ID="lblUserName" Text="bdo"></asp:Label></strong>
          </a>
          <ul class="dropdown-menu dropdown-menu-dark text-small shadow" style="">
           
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
             <asp:Button ID="Button1" runat="server" CssClass="dropdown-item" Text="Sign out" OnClick="signout_Click" />
          </ul>
        </div>
      </div>  

       

       <div class="content">
           <div class="nav-icon mx-2 my-3">
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
</svg>
       </div>
          
            <div class="container py-2">
      <div class="row g-4">

          <h3>Properties</h3>
          <hr />

          <!-- Total Properties -->
        <div class="col-md-4">
          <div class="dashboard-card">
            <div class="dashboard-title">Total Properties Added</div>
            <div class="dashboard-number">
              <asp:Label ID="lblTotalProperties" runat="server"></asp:Label>
            </div>
            <a href="PropertyList.aspx" class="btn view-btn btn-primary btn-primary">View</a>
          </div>
        </div>


        <!-- Pending Properties -->
        <div class="col-md-4">
          <div class="dashboard-card">
            <div class="dashboard-title">Pending Properties</div>
            <div class="dashboard-number">
              <asp:Label ID="lblPendingProperties" runat="server" Text="0"></asp:Label>
            </div>
            <a href="PropertyList.aspx" class="btn view-btn btn-primary">View</a>
          </div>
        </div>

        
        <!-- Approved Properties -->
        <div class="col-md-4">
          <div class="dashboard-card">
            <div class="dashboard-title">Approved Properties</div>
            <div class="dashboard-number">
              <asp:Label ID="lblApprovedProperties" CssClass="text-success" runat="server"></asp:Label>
            </div>
            <a href="PropertyList.aspx" class="btn view-btn btn-primary">View</a>
          </div>
        </div>

          <!-- Rejected Properties -->
        <div class="col-md-4">
          <div class="dashboard-card">
            <div class="dashboard-title">Rejected Properties</div>
            <div class="dashboard-number">
              <asp:Label ID="lblRejectedProperties" runat="server" CssClass="text-danger"></asp:Label>
            </div>
            <a href="PropertyList.aspx" class="btn view-btn btn-primary btn-primary">View</a>
          </div>
        </div>

         </div>

               
         <div class="row g-4 py-5">

          <h3>Site-Visit Requests</h3>
          <hr />

           <!-- Total Requests -->
        <div class="col-md-4">
          <div class="dashboard-card">
            <div class="dashboard-title">Total Requests</div>
            <div class="dashboard-number">
              <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
            </div>
            <a href="SiteView_Requests.aspx" class="btn view-btn btn-primary">View</a>
          </div>
        </div>

        <!-- Pending Requests -->
        <div class="col-md-4">
          <div class="dashboard-card">
            <div class="dashboard-title">Pending Booking Requests</div>
            <div class="dashboard-number">
              <asp:Label ID="lblPendingBookings" runat="server" Text="0"></asp:Label>
            </div>
            <a href="SiteView_Requests.aspx" class="btn view-btn btn-primary">View</a>
          </div>
        </div>

        <!-- Accepted Requests -->
        <div class="col-md-4">
          <div class="dashboard-card">
            <div class="dashboard-title">Accepted Booking Requests</div>
            <div class="dashboard-number">
              <asp:Label ID="lblAcceptedBookings" CssClass="text-success" runat="server"></asp:Label>
            </div>
            <a href="SiteView_Requests.aspx" class="btn view-btn btn-primary">View</a>
          </div>
        </div>

             <!-- Rejected Requests -->
        <div class="col-md-4">
          <div class="dashboard-card">
            <div class="dashboard-title">Rejected Requests</div>
            <div class="dashboard-number">
              <asp:Label ID="Label2" CssClass="text-danger" runat="server" Text="0"></asp:Label>
            </div>
            <a href="SiteView_Requests.aspx" class="btn view-btn btn-primary">View</a>
          </div>
        </div>

      </div>
    </div>
       </div>


   </div>
      
    </form>


        <script src="../General/JavaScript/ResponsiveSidebar.js"></script>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
    