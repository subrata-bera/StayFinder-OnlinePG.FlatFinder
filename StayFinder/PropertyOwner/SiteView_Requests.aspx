<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SiteView_Requests.aspx.cs" Inherits="PropertyOwner_SiteView_Requests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Site View Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />
    <link href="../General/StyleSheets/BookingRequestsList.css" rel="stylesheet" />
    
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
              <asp:HyperLink ID="HyperLink1" runat="server" CssClass="dropdown-item" Text="Sign out"
                NavigateUrl="../General/PropertyOwnerLogin.aspx"></asp:HyperLink>
            </ul>
          </div>
        </div>



        <div class="booking-requests">
             
          <asp:Repeater ID="rptBookingRequest" runat="server">
            <ItemTemplate>
              <div class="container">

                <div class="top">
                  <div class="picture">
                    <img src="data:image/png;base64,<%# Convert.ToBase64String((byte[])Eval(" PropertyImage")) %>"
                    alt="">
                  </div>
                  <div class="property-name">
                    <h3>
                      <%# Eval("PropertyName") %>
                    </h3>
                  </div>
                </div>
                <hr>

                <div class="down">

                  <div class="down-details">

                    <div class="name">
                      <p class="label">Name</p>
                      <p>
                        <%# Eval("UserName") %>
                      </p>
                    </div>


                    <div class="date">
                      <p class="label">Booking date</p>
                      <p>
                        <%# Eval("BookingDate", "{0:dd.MM.yyyy}" ) %>
                      </p>
                    </div>

                    <!-- <div class="booking-id">
                    <p><%# Eval("ID") %></p>
                  </div> -->

                    <div class="price">
                      <p class="label">Rent</p>
                      <p>
                        <%# Eval("Rent") %>/month
                      </p>
                    </div>

                  </div>

                  <div class="buttons">
                    <!-- <button class="btn btn-danger">Reject</button> -->
                    <a href='Request_View.aspx?ID=<%# Eval("ID")%>' class="btn btn-primary">View</a>
                    
                  </div>

                </div>



              </div>
            </ItemTemplate>
          </asp:Repeater>
        </div>
      </div>
    </form>

     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
</body>
</html>
