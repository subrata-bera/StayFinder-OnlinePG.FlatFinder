<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_View.aspx.cs" Inherits="Admin_Admin_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
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
    </style>
    <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />
<body>
     <div id="loader">
    <div class="spinner"></div>
</div>
    <form id="form1" runat="server">
   <div class="main-container">
        <div class="nav d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px; height: 100vh;">
          
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

 <div class="main mt-5 pt-5 w-100">
          <div class="heading text-center mt-1">
            <h2><asp:Label runat="server" ID="lblName"></asp:Label></h2>
          </div>
        <div class="content mt-4">
            <div class="image">
<asp:Image ID="PropertyImage" runat="server" CssClass="img-fluid" />
            </div>
            <div class="sub-content px-5">
                <div class="box p-3">
<p class="fs-5"><asp:Label runat="server" ID="lblDescriptiojn"></asp:Label></p>              
                  <div class="type fs-4">
                    <p>Property Type: <asp:Label runat="server" id="lblType"></asp:Label></p>
                    <p class="mx-5"><asp:Label runat="server" id="lblGender"></asp:Label></p>
                </div>
                <p class="fs-4">Facilities: <asp:Label runat="server" id="lblFacilities_1"></asp:Label> <asp:Label runat="server" id="lblFacilities_2"></asp:Label> <asp:Label runat="server" id="lblFacilities_3"></asp:Label></p>
                <p class="fs-4">Number of rooms: <asp:Label runat="server" id="lblNumberOfRooms"></asp:Label></p>
                <p class="fs-4">Owner: <asp:Label runat="server" id="lblOwnerName"></asp:Label></p>
                

                <div class="location">
                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6"/>
                      </svg>
                 <span class="mx-3 fs-4"> <asp:Label runat="server" id="lblAddress"></asp:Label></span>
                </div>
                 <div class="contact my-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-telephone-fill mx-1" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z"/>
                      </svg>
                      <span class="mx-2 fs-4"><asp:Label runat="server" id="lblContact"></asp:Label></span>
                 </div>
                    </div>
                           <div class="footer my-5 py-3">

                            <div class="button">
                             <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger mx-2" Text="Reject" OnClick="Reject_Click" />
                            <asp:Button ID="btnApprove" runat="server" CssClass="btn btn-success" Text="Approve" OnClick="Approve_Click"/>
                            </div>

                     <div class="rent fs-3 fw-bolder text-success">
                        <p><asp:Label runat="server" id="lblRent"></asp:Label>/month</p>
                    </div>
                           </div>
               
            </div>
        </div>
    </div>           
   </div>
      
    </form>

    <script src="../General/JavaScript/PageLoader.js"></script>

          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
