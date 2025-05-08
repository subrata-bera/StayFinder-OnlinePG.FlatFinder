<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PropertyList.aspx.cs" Inherits="PropertyOwner_PropertyList" %>

  <!DOCTYPE html>

  <html xmlns="http://www.w3.org/1999/xhtml">

  <head runat="server">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Property List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />
    <link href="../General/StyleSheets/PropertyList.css" rel="stylesheet" />
      
  </head>

  <body>
    <form id="form1" runat="server">
      <div class="main">
        <div class="nav d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px; height: 100vh;">

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
              <a href="PropertyList.aspx" class="nav-link text-white active">
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
            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
              data-bs-toggle="dropdown" aria-expanded="false">
              <img runat="server" id="profileImage" alt="" width="32" height="32" class="rounded-circle me-2">
              <strong>
                <asp:Label runat="server" ID="lblUserName" Text="bdo"></asp:Label>
              </strong>
            </a>
            <ul class="dropdown-menu dropdown-menu-dark text-small shadow" style="">

              <li><a class="dropdown-item" href="#">Settings</a></li>
              <li><a class="dropdown-item" href="#">Profile</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <asp:Button ID="Button1" runat="server" CssClass="dropdown-item" Text="Sign out"
                OnClick="signout_Click" />
            </ul>
          </div>
        </div>
        <div class="content">

          <!-- Move .property-container inside the Repeater -->
          <div class="property-container">
            <asp:Repeater ID="rptPropertyList" runat="server" OnItemCommand="rptPropertyList_ItemCommand">
              <ItemTemplate>
                <!-- Each item is inside .property-container now -->
                <div class="card border-dark" style="width: 18rem;">
                  <img src="data:image/png;base64,<%# Convert.ToBase64String((byte[])Eval(" PropertyImage")) %>"
                  class="card-img-top" alt="Property Image">
                  <div class="card-body">
                    <h5 class="card-title">
                      <%# Eval("PropertyName") %>
                    </h5>
                    <p class="card-text">
                      <%# Eval("Description") %>
                    </p>
                  </div>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">Rent: <%# Eval("Rent") %>
                    </li>
                   <%-- <li class="list-group-item">Facilities: <%# Eval("Facilities_1") %> ,<%# Eval("Facilities_2") %> ,
                          <%# Eval("Facilities_3") %>
                    </li>--%>
                    <li class="list-group-item">For <%# Eval("Gender") %>
                    </li>
                    <li class="list-group-item">Status: <%# Eval("ApprovalStatus") %>
                    </li>
                    <li class="list-group-item">Approved by: <%# Eval("ApprovedBy") %>
                    </li>


                  </ul>
                  <div class="card-body">
                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" CommandName="DeleteProperty"
                      CommandArgument='<%# Eval("ID") %>'
                      OnClientClick="return confirm('Are you sure you want to delete this property?');">
                      Delete
                    </asp:LinkButton>
                    <a href='Edit_Property.aspx?ID=<%# Eval("ID") %>' class="btn btn-warning">Edit details</a>
                  </div>
                </div>
              </ItemTemplate>
            </asp:Repeater>
          </div> <!-- Closing .property-container here -->
        </div>


      </div>
    </form>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
  </body>

  </html>