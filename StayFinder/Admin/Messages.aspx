<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Admin_Messages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Messages</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
           
        <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />
        <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />
    <style>
        .main-container {
            display: flex;
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
            <a href="Admin_Home.aspx" class="nav-link text-white" aria-current="page">
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

            <li>
            <a href="Messages.aspx" class="nav-link active">
              <svg class="bi pe-none me-2" width="16" height="16"></svg>
              Messages
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
           <div class="messages container mt-4">
                <div class="nav-icon mx-2 my-3">
             <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
      <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
    </svg>
           </div>
    <h3 class="mb-4 text-center text-primary">User Messages</h3>
               <center><asp:Label ID="lblError" runat="server" CssClass="fw-bold text-danger"  Text="No message fond!" Visible="false"></asp:Label></center>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4" id="messageContainer">
        <%-- Example Card (You will loop through database messages in code-behind) --%>
        <asp:Repeater ID="rptMessages" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title text-dark"><%# Eval("Name") %></h5>
                            <h6 class="card-subtitle mb-2 text-muted"><i class="bi bi-envelope"></i> <%# Eval("Email") %></h6>
                            <p class="card-text mt-2 text-secondary"><%# Eval("Message") %></p>
                        </div>
                        <div class="card-footer bg-transparent border-0 text-end">
                            <small class="text-muted"><i class="bi bi-clock"></i> <%# Eval("Date", "{0:dd MMM yyyy hh:mm tt}") %></small>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

    </form>


     <script src="../General/JavaScript/PageLoader.js"></script>
      <script src="../General/JavaScript/ResponsiveSidebar.js"></script>


          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
