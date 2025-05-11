<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit_Property.aspx.cs" Inherits="PropertyOwner_Edit_Property" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Property Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />
     
</head>
<body>
     <form id="form1" runat="server">
        <div class="main">
  <div class="nav side-bar d-flex flex-column flex-shrink-0 text-bg-dark" >
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
            <a href="PropertyList" class="nav-link text-white active">
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
          <li>
            <a href="#" class="nav-link text-white">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
              nav_3
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

            <div class="content w-100" style=" font-family: 'Poppins', sans-serif;">
                    <div class="content">
           <div class="nav-icon mx-2 my-3">
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
</svg>
       </div>
                <div class="container">
    <div class="property-form-card">
        <h2>Edit Property</h2>
            
            <!-- Property Name -->
            <div class="mb-3">
                <label class="form-label">Property Name</label>
                <asp:TextBox runat="server" ID="txtPropertyName" CssClass="form-control" placeholder="Enter property name" required></asp:TextBox>
            </div>

            <!-- Property Type -->
            <div class="mb-3">
    <label class="form-label" for="ddlPropertyType">Property Type</label>
    <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-select" required>
        <asp:ListItem Value="" Text="Select Type" Selected="True"></asp:ListItem>
        <asp:ListItem Value="Mess" Text="Mess"></asp:ListItem>
        <asp:ListItem Value="PG" Text="PG"></asp:ListItem>
        <asp:ListItem Value="Flat" Text="Flat"></asp:ListItem>
    </asp:DropDownList>
</div>

          <div class="mb-3">
    <label class="form-label" for="ddlPropertyGender">Preferred Tenant Gender</label>
    <asp:DropDownList ID="ddlPropertyGender" runat="server" CssClass="form-select">
        <asp:ListItem Value="" Text="Select Type" Selected="True"></asp:ListItem>
        <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
        <asp:ListItem Value="Female" Text="Female"></asp:ListItem>

    </asp:DropDownList>
</div>


            <!-- Location -->
            <div class="mb-3">
                <label class="form-label">Full address</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtLocation" Placeholder="Eneter full address"></asp:TextBox>
            </div>
         <div class="mb-3">
                <label class="form-label">City</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtCity" Placeholder="Enetr your city"></asp:TextBox>
            </div>
            <!-- Rent -->
            <div class="mb-3">
                <label class="form-label">Rent (INR)</label>
                <asp:TextBox runat="server" ID="txtRent" CssClass="form-control" TextMode="Number" required></asp:TextBox>

            </div>

            <!-- No. of Rooms -->
            <div class="mb-3">
                <label class="form-label">Number of Rooms</label>
                <asp:TextBox runat="server" ID="txtRoom" CssClass="form-control" TextMode="Number" required></asp:TextBox>

            </div>

            <!-- Description -->
            <div class="mb-3">
                <label class="form-label">Description</label>
                 <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" placeholder="Enter about the property" TextMode="MultiLine" rows="3" required></asp:TextBox>

            </div>

            <!-- Facilities -->
            <div class="mb-3">
                <label class="form-label">Facilities</label>
                <div class="form-check">
                    <asp:CheckBox ID="chWifi" runat="server" />
                    <label class="form-check-label">WiFi</label>
                </div>
                <div class="form-check">
                   <asp:CheckBox ID="chParking" runat="server"  />
                    <label class="form-check-label">Parking</label>
                </div>
                <div class="form-check">
                <asp:CheckBox ID="chFood" runat="server" />
                  <label class="form-check-label">Food Service</label>
                </div>
            </div>




            <!-- Upload Images -->
            <div class="mb-3">
                <label class="form-label">Upload Images</label>
                <asp:FileUpload runat="server" ID="PropertyImage" CssClass="form-control" required/>
            </div>

            <!-- Contact Details -->
            <div class="mb-3">
                <label class="form-label">Owner Contact</label>
                <asp:TextBox runat="server" ID="txtContact" CssClass="form-control" placeholder="Enter contact number" required></asp:TextBox>
            </div>
             
              <div class="mb-3 text-center">
                  <asp:Label runat="server" ID="lblError"></asp:Label>
              </div>
            <!-- Submit Button -->
            <div class="text-center">
                <asp:Button runat="server" CssClass="btn btn-primary btn-lg" Text="Update" OnClick="Edit_Click" />
            </div>
    </div>
</div>
            </div>

            </div>
    </form>

              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
     <script>
         document.addEventListener("DOMContentLoaded", function () {
             var fileInput = document.getElementById('<%= PropertyImage.ClientID %>');
             if (fileInput) {
                 fileInput.setAttribute("accept", ".jpg,.jpeg"); // Restrict to JPG and JPEG
             }
         });
</script>
        <script src="../General/JavaScript/ResponsiveSidebar.js"></script>

</body>
</html>
