<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Request_View.aspx.cs" Inherits="PropertyOwner_Request_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>View Request</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
     <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />
   <%-- <link href="../General/StyleSheets/BookingRequestApproval.css" rel="stylesheet" />--%>
    <style>

        .details .form-label {
    font-size: 0.95rem;
    color: #555;
}

.details .form-control-plaintext {
    font-size: 1rem;
    font-weight: 500;
    color: #222;
}

    </style>
     
</head>
<body>
    <form id="form1" runat="server">
   <div class="main">
       
        <div class="nav side-bar d-flex flex-column flex-shrink-0 text-bg-dark">
             <div class="cross-icon ms-auto p-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
</svg>
            </div>
          <span class="fs-4">Stay Finder</span>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
          <li class="nav-item">
            <a href="PropertyOwner_Home.aspx" class="nav-link text-white" aria-current="page">
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
            <a href="SiteView_Requests.aspx" class="nav-link active">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
         Site-View Requests
            </a>
          </li>
         
        </ul>
        <hr>
        <div class="dropdown">
          <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img runat="server" id="profileImage" alt="" width="32" height="32" class="rounded-circle me-2">
            <strong><asp:Label runat="server" ID="lblUserName" Text="bdo"></asp:Label></strong>
          </a>
          <ul class="dropdown-menu dropdown-menu-dark text-small shadow" style="">
           
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
              <asp:HyperLink ID="HyperLink1" runat="server" CssClass="dropdown-item" Text="Sign out" NavigateUrl="../General/PropertyOwnerLogin.aspx"></asp:HyperLink>
          </ul>
        </div>
      </div> 


       

       <div class="details container py-5">

              <div class="nav-icon mx-2 my-3">
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
</svg>
       </div>
    <div class="card shadow-sm border-0 rounded-4 p-4">
        <h3 class="text-center text-primary mb-4">
            <asp:Label runat="server" ID="lblHeading"></asp:Label>
        </h3>

        <div class="row g-4">
            <!-- Column 1 -->
            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label fw-semibold">Name</label>
                    <p><asp:Label runat="server" ID="lblName" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Address</label>
                    <p><asp:Label runat="server" ID="lblAddress" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Document Type</label>
                    <p><asp:Label runat="server" ID="lblDocumentType" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Request Type</label>
                    <p><asp:Label runat="server" ID="lblRequestType" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
            </div>

            <!-- Column 2 -->
            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label fw-semibold">Contact</label>
                    <p><asp:Label runat="server" ID="lblContact" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Number of People</label>
                    <p><asp:Label runat="server" ID="lblPeople" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Document Number</label>
                    <p><asp:Label runat="server" ID="lblDocumentNumber" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
            </div>

            <!-- Column 3 -->
            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label fw-semibold">Gender</label>
                    <p><asp:Label runat="server" ID="lblGender" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-semibold">Booking Date</label>
                    <p><asp:Label runat="server" ID="lblBookingdate" CssClass="form-control-plaintext"></asp:Label></p>
                </div>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-primary mt-2" Text="📄 View Document" OnClick="View_Click" />
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="d-flex justify-content-end gap-3 mt-4">
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-secondary" Text="Back" />
            <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" OnClick="Accept_Click" Text="Accept" />
        </div>
    </div>
</div>

   </div>
    </form>
            <script src="../General/JavaScript/ResponsiveSidebar.js"></script>

     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
        crossorigin="anonymous"></script>
</body>
</html>
