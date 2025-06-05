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
        <div class="nav d-flex side-bar flex-column flex-shrink-0 text-bg-dark">
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
                

       <div class="content">
           <div class="nav-icon mx-2 my-3">
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
</svg>
       </div>
           <div class="container mb-4">
  <h2 class="text-center fw-bold text-primary border-bottom pb-2">
    Your Properties
  </h2>
</div>

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
                    </li>
                   <%-- <li class="list-group-item">Facilities: <%# Eval("Facilities_1") %> ,<%# Eval("Facilities_2") %> ,
                          <%# Eval("Facilities_3") %>
                    </li>--%>
                    <li class="list-group-item">For <%# Eval("Gender") %>
                    </li>
                    <li class="list-group-item">Status: <%# Eval("ApprovalStatus") %>
                    <li class="list-group-item bg-light border-0 text-secondary">
  <%# Eval("ApprovalStatus").ToString() == "Approved" ? "<strong>Approved By:</strong> " + Eval("ApprovedBy").ToString() : "" %>
</li>



                  </ul>
                  <div class="card-body">
                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-danger" runat="server" CommandName="DeleteProperty"
                      CommandArgument='<%# Eval("ID") %>'
                      OnClientClick="return confirm('Are you sure you want to delete this property?');">
                      Delete
                    </asp:LinkButton>
                  <%--  <a href='Edit_Property.aspx?ID=<%# Eval("ID") %>' class="btn btn-warning">Edit details</a>--%>

                      <asp:LinkButton ID="btnEdit" CssClass="btn btn-warning edit-btn" runat="server"
    OnClientClick='<%# Eval("ID", "showEditConfirmation(\"Edit_Property.aspx?ID={0}\"); return false;") %>'>
    Edit details
</asp:LinkButton>
                  </div>
                </div>
              </ItemTemplate>
            </asp:Repeater>
          </div> <!-- Closing .property-container here -->
        </div>


      </div>
    </form>

      <!-- Confirmation Modal -->
<div class="modal fade" id="editConfirmModal" tabindex="-1" aria-labelledby="editConfirmLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content shadow rounded">
      <div class="modal-header bg-warning text-dark">
        <h5 class="modal-title fw-bold" id="editConfirmLabel">Confirm Edit Action</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>
          After editing the property details, the status will change to <strong>Pending</strong> and will require admin approval again.
        </p>
        <p>Do you want to proceed?</p>
      </div>
      <div class="modal-footer justify-content-center gap-3">
  <button type="button" class="btn btn-outline-danger px-4 fw-semibold" data-bs-dismiss="modal">
    No
  </button>
  <a id="proceedEditBtn" href="#" class="btn btn-success px-4 fw-semibold">
    Yes, Proceed
  </a>
</div>
    </div>
  </div>
</div>


          <script src="../General/JavaScript/ResponsiveSidebar.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
      <script>
          function showEditConfirmation(url) {
              // Set the edit URL to the button in the modal
              document.getElementById("proceedEditBtn").href = url;

              // Show the Bootstrap modal
              var myModal = new bootstrap.Modal(document.getElementById('editConfirmModal'), {
                  keyboard: false
              });
              myModal.show();
          }
</script>

  </body>

  </html>