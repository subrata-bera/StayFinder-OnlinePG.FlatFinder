<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageOwners.aspx.cs" Inherits="Admin_ManageOwners" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Manage Owners</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
            <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />
        <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />
       <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        .main-container {
            display:flex;
        }
         .table {
            background-color: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table td {
            vertical-align: middle;
        }

        .action-btns button {
            margin-right: 8px;
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
            <a href="ManageOwners.aspx" class="nav-link active">
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
            <a href="Messages.aspx" class="nav-link text-white">
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






         <div class="container mt-3">
              <h2 class="section-title text-center">Manage Property Owners</h2>

            <!-- Users Table -->
            <div class="table-responsive mt-3">
                <table class="table table-bordered text-center">
                    <thead>
                        <tr>
                             <th>Owner ID</th>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                     <asp:Repeater runat="server" ID="rptOwners">
                         <ItemTemplate>
                                <tr>
                                    <td><%#Eval("ID") %></td>
<td>
    <img src='<%# Eval("ProfilePic") == DBNull.Value || Eval("ProfilePic") == null || string.IsNullOrEmpty(Eval("ProfilePic").ToString()) ? "../General/Assets/DefaultProfileImage.png" : "data:image/png;base64," + Convert.ToBase64String((byte[])Eval("ProfilePic")) %>' width="50" height="50" class="rounded-circle" />
</td>

                            <td><%#Eval("Name") %></td>
                            <td><%#Eval("Email") %></td>
                            <td>+91-<%#Eval("Contact") %></td>
                            <td class="action-btns">
                             <a class="btn btn-sm btn-warning" href='Owner_View.aspx?ID=<%#Eval("ID") %>'><i class="bi bi-eye"></i></a>
 
                                <button class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>
                         </ItemTemplate>
                     </asp:Repeater>
                        
                        <!-- Additional rows can be bound via code-behind -->
                    </tbody>
                </table>

               <center> <asp:Label runat="server" ID="lblNoOwner" CssClass="text-danger fw-bold text-center" Text="No owner found!"></asp:Label></center>
            </div>


        </div>
   </div>
    </form>
        <script src="../General/JavaScript/PageLoader.js"></script>
      <script src="../General/JavaScript/ResponsiveSidebar.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>

</body>
</html>
