<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_View.aspx.cs" Inherits="Admin_Admin_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Pending Property</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .content {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 90vh;
           
        }
        
        .main-container{
            display: flex;
        }
        .nav {
            position: sticky;
            top: 0;
        }

         .property-img {
             width: 100%;
    height: 250px; /* fixed height */
    object-fit: cover;
    object-position: center;
        }
        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .modern-table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    border-radius: 12px;
    overflow: hidden;
    background-color: #fff;
}

.modern-table thead {
    background-color: #4a90e2;
    color: white;
    font-size: 1rem;
    text-align: left;
}

.modern-table th, 
.modern-table td {
    padding: 16px 20px;
    border-bottom: 1px solid #eaeaea;
    
}

.modern-table tbody tr:hover {
    background-color: #f5faff;
}

.modern-table tbody tr:last-child td {
    border-bottom: none;
}
        .rent {
            text-align: center;
        }
        
/* Responsive Design */
@media (max-width: 768px) {
    .property-form-card {
        width: 90%;
    }
}
.nav-icon svg {
    display: none;
}

.cross-icon svg {
    display: none;
}
.side-bar {
    height: 100vh;
    width: 280px;
    padding: 12px;
    transition: 0.1s;
   
}
   
@media (max-width:500px) {
    .side-bar {
        width: 0;
   overflow: hidden;
   padding: 0 ;
   position:fixed;
   z-index: 100;
  
    }
    .nav-icon svg {
        display: block;
    }
    
}



    </style>
    <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />
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
            <a href="Admin_Home.aspx" class="nav-link text-white" aria-current="page">
              <svg class="bi pe-none me-2" width="16" height="16"></use></svg>
              Home
            </a>
          </li>
          <li>
            <a href="PendingProperties.aspx" class="nav-link text-white active">
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
            <strong><asp:Label runat="server" ID="lblUserName"></asp:Label></strong>
          </a>
          <ul class="dropdown-menu dropdown-menu-dark text-small shadow" style="">
           
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
             <asp:Button ID="Button1" runat="server" CssClass="dropdown-item" Text="Sign out" />
          </ul>
        </div>
      </div>  
       <div class="content">

 <div class="main pt-1 w-100">
         <div class="container mt-4 mb-5">
              <div class="nav-icon mx-2 my-3">
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
</svg>
       </div>
            <h2 class="text-center mb-4">Property Details</h2>

            <div class="card shadow p-4 mb-4">
                <div class="row">
                    <div class="col-md-6">
                        <div class="section-title">Property Info</div>
                        <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server" /></p>
                        <p><strong>Type:</strong> <asp:Label ID="lblType" runat="server" /></p>
                        <p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server" /></p>
                        <p><strong>Landmark:</strong> <asp:Label ID="lblLandmark" runat="server" /></p>
                    </div>
                    <div class="col-md-6">
                        <div class="section-title">Facilities & Rules</div>
                        <p><strong>Facilities:</strong> 
                            <asp:Label ID="lblFacilities_1" runat="server" />
                            <asp:Label ID="lblFacilities_2" runat="server" />
                            <asp:Label ID="lblFacilities_3" runat="server" />
                            <asp:Label ID="lblFacilities_4" runat="server" />
                            <asp:Label ID="lblFacilities_5" runat="server" />
                            <asp:Label ID="lblFacilities_6" runat="server" />
                            <asp:Label ID="lblFacilities_7" runat="server" />
                            <asp:Label ID="lblFacilities_8" runat="server" />
                            <asp:Label ID="lblFacilities_9" runat="server" />

                        </p>
                        <p><strong>Rules:</strong>
                             <asp:Label ID="lblRules_1" runat="server" />
                            <asp:Label ID="lblRules_2" runat="server" />
                            <asp:Label ID="lblRules_3" runat="server" />
                            <asp:Label ID="lblRules_4" runat="server" />

                        </p>
                        <p><strong>Description:</strong> <asp:Label ID="lblDescription" runat="server" /></p>
                    </div>
                </div>
            </div>

            <div class="card shadow p-4 mb-4">
                <div class="section-title mb-3">Property Images</div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <asp:Image ID="img1" runat="server" CssClass="img-fluid property-img rounded" />
                    </div>
                    <div class="col-md-4">
                        <asp:Image ID="img2" runat="server" CssClass="img-fluid property-img rounded" />
                    </div>
                    <div class="col-md-4">
                        <asp:Image ID="img3" runat="server" CssClass="img-fluid property-img rounded" />
                    </div>
                </div>
            </div>

             <div class="card shadow p-4 mb-4">
                <div class="section-title">Room Details</div>
                <p><strong>Number of Rooms:</strong> <asp:Label ID="lblNumberOfRooms" runat="server" /></p>
                 <p><strong>Only for:</strong> <asp:Label ID="lblGender" runat="server" /></p>
                 <p><strong>Rent:</strong></p>
                 
                 <table class="modern-table">
    <thead>
        <tr>
            <th>Room Type</th>
            <th class="rent">Unit</th>
            <th>Rent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Single Room</td>
            <td class="rent"><asp:Label runat="server" ID="lblSingleRoomUnit"></asp:Label></td>
            <td><asp:Label runat="server" ID="lblSingleRoomRent"></asp:Label></td>
        </tr>
        <tr>
            <td>Double Room</td>
            <td class="rent"><asp:Label runat="server" ID="lblDoubleRoomUnit"></asp:Label></td>
            <td><asp:Label runat="server" ID="lblDoubleRoomRent"></asp:Label></td>
        </tr>
        <tr>
            <td>Triple Room</td>
            <td class="rent"><asp:Label runat="server" ID="lblTripleRoomUnit"></asp:Label></td>
            <td><asp:Label runat="server" ID="lblTripleRoomRent"></asp:Label></td>
        </tr>
    </tbody>
</table>


            </div>

            <div class="card shadow p-4 mb-4">
                <div class="section-title">Owner Details</div>
                <p><strong>Name:</strong> <asp:Label ID="lblOwnerName" runat="server" /></p>
                <p><strong>Contact:</strong> <asp:Label ID="lblContact" runat="server" /></p>
            </div>

            <div class="text-center mt-4">
                <asp:Button ID="btnApprove" runat="server" CssClass="btn btn-success px-4 me-2" Text="Approve" OnClick="Approve_Click"/>
                <asp:Button ID="btnReject" runat="server" CssClass="btn btn-danger px-4" Text="Reject" OnClick="Reject_Click"/>
            </div>
        </div>  
   </div>
      
    </form>

    <script src="../General/JavaScript/PageLoader.js"></script>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
          <script src="../General/JavaScript/ResponsiveSidebar.js"></script>

</body>
</html>
