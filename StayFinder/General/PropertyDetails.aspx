<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PropertyDetails.aspx.cs" Inherits="General_PropertyDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Property Details</title>
    <style>
    .hover-dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0; /* removes animation gap */
    }
    .property-img {
    width: 100%;
    height: 250px; /* fixed height */
    object-fit: cover;
    object-position: center;
}
    .card-title {
    font-size: 1.5rem;
    font-weight: 600;
    border-left: 5px solid #007bff;
    padding-left: 10px;
    color: #333;
}
.card-text {
    font-size: 1.05rem;
    line-height: 1.6;
    color: #555;
}
.list-group-item {
    font-size: 1rem;
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 12px 16px;
    border: none;
    border-bottom: 1px solid #f0f0f0;
    transition: background 0.3s ease;
}

.list-group-item:hover {
    background-color: #f8f9fa;
}
.form-select {
    font-size: 1.1rem;
    border-radius: 8px;
    padding: 10px;
}
 .btn {
    padding: 10px 20px;
    border-radius: 8px;
    font-weight: 500;
    transition: all 0.3s ease;
}


.card-body h5 {
    font-weight: 600;
    font-size: 1.1rem;
    color: #444;
}
.card-body small {
    font-style: italic;
    color: #888;
}



      @media (min-width: 768px) {
    .property-img-carousel {
    height: 350px;
    object-fit: cover;
    object-position: center;
    width: 100%;
}
}



</style>

    
    <link href="StyleSheets/Navbar.css" rel="stylesheet" />
        <link href="StyleSheets/PageLoader.css" rel="stylesheet" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
     <div id="loader">
    <div class="spinner">

    </div>
</div>
    <form id="form1" runat="server">
          <header class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a href="index.aspx" class="navbar-brand">Stay Finder</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
       <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
    <ul class="navbar-nav">
        <li class="nav-item"><a href="../Default.aspx" class="nav-link active">Home</a></li>
        <li class="nav-item"><a href="FindPg_Mess.aspx" class="nav-link">Find Your Stay</a></li>

        <!-- Dropdown for Login -->
        <li class="nav-item dropdown hover-dropdown">
            <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">Login</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="../User/Login.aspx">User Login</a></li>
                <li><a class="dropdown-item" href="PropertyOwnerLogin.aspx">Property Owner Login</a></li>
                <li><a class="dropdown-item" href="AdminLogin.aspx">Admin Login</a></li>
            </ul>
        </li>

        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
    </ul>
</div>
    </div>
</header>
  <div class="main mt-5 pt-5 container">
    <div class="text-center mt-3">
        <h2><asp:Label runat="server" ID="lblName"></asp:Label></h2>
        <p class="text-muted fs-5">Listed on StayFinder</p>
    </div>

    <!-- Top Image + Description Side by Side -->
<div class="row my-4 g-4">
    <div class="col-md-6">
        <asp:Image ID="PropertyImage" runat="server" CssClass="property-img img-fluid rounded shadow" />
    </div>
     <div class="col-md-6">
        <div class="card h-100 shadow-sm border-0">
            <div class="card-body">
                <h4 class="mb-3 text-primary fw-bold">🏠 Property Overview</h4>
                <p class="text-muted"><asp:Label runat="server" ID="lblDescriptiojn"></asp:Label></p>
                
                <div class="mt-4">
                    <h5 class="text-dark fw-semibold mb-3">📋 Property Info</h5>
                    <p class="mb-2">🏢 <strong>Type:</strong> <asp:Label runat="server" id="lblType"></asp:Label></p>
                    <p class="mb-2">🚻 <strong>Suitable for:</strong> <asp:Label runat="server" id="lblGender"></asp:Label></p>
                    <p class="mb-2">🚪 <strong>Rooms:</strong> <asp:Label runat="server" id="lblNumberOfRooms"></asp:Label></p>
                    
                </div>

                <div class="mt-3">
                    <p class="fs-5 text-warning fw-semibold">
                        ⭐ Average Rating: <asp:Label ID="lblAvgRating" runat="server"></asp:Label>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


    <div class="row mt-4 g-4">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title">Facilities</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_1"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_2"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_3"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_4"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_5"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_6"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_7"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_8"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="lblFacilities_9"></asp:Label></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-body">
                    <h5 class="card-title">Restrictions</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><asp:Label runat="server" ID="rules_1"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="rules_2"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="rules_3"></asp:Label></li>
                        <li class="list-group-item"><asp:Label runat="server" ID="rules_4"></asp:Label></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

<!-- Rent Section (Single Room, Double Room, Triple Room) -->
<div class="row mt-4 g-4">
    <div class="col-md-12">
        <div class="card shadow">
            <div class="card-body">
                <h5 class="card-title">Rent Options</h5>
                <div class="btn-group w-100" role="group" aria-label="Rent Options">
                    <button type="button" class="btn btn-outline-primary w-33" onclick="showRoomDetails('single', this)">Single Room</button>
<button type="button" class="btn btn-outline-primary w-33" onclick="showRoomDetails('double', this)">Double Room</button>
<button type="button" class="btn btn-outline-primary w-33" onclick="showRoomDetails('triple', this)">Triple Room</button>

                </div>
                <!-- Single Room Details -->
                <div id="singleRoomDetails" class="room-details mt-3" style="display: none;">
                    <p><strong>Rent:</strong><asp:Label runat="server" ID="lblSingleRoomRent"></asp:Label></p>
                    <p><strong>Size:</strong> <asp:Label runat="server" ID="lblSingleRoomSize"></asp:Label></p>
                </div>
                <!-- Double Room Details -->
                <div id="doubleRoomDetails" class="room-details mt-3" style="display: none;">
                    <p><strong>Rent:</strong> <asp:Label runat="server" ID="lblDoubleRoomRent"></asp:Label></p>
                    <p><strong>Size:</strong> <asp:Label runat="server" ID="lblDoubleRoomSize"></asp:Label></p>
                </div>
                <!-- Triple Room Details -->
                <div id="tripleRoomDetails" class="room-details mt-3" style="display: none;">
                    <p><strong>Rent:</strong><asp:Label runat="server" ID="lblTripleRoomRent"></asp:Label></p>
                    <p><strong>Size:</strong><asp:Label runat="server" ID="lblTripleRoomSize"></asp:Label></p>
                </div>
            </div>
        </div>
    </div>
</div>
   

    <!-- Location & Owner -->
    <div class="card mt-4 shadow">
        <div class="card-body">
            <h5 class="card-title">Location & Owner Contact</h5>
            <p class="mb-1"><i class="bi bi-geo-alt-fill"></i> <asp:Label runat="server" id="lblAddress"></asp:Label></p>
            <p class="mb-1"><i class="bi bi-person-fill"></i> Owner: <asp:Label runat="server" id="lblOwnerName"></asp:Label></p>
            <p class="mb-1"><i class="bi bi-telephone-fill"></i> Contact: <asp:Label runat="server" id="lblContact"></asp:Label></p>
        </div>
    </div>

    <!-- Carousel of images -->
    <div id="propertyCarousel" class="carousel slide mt-5 shadow-sm" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
    <asp:Image ID="PropertyImage1" runat="server" CssClass="d-block w-100 property-img-carousel rounded" />
</div>
<div class="carousel-item">
    <asp:Image ID="PropertyImage2" runat="server" CssClass="d-block w-100 property-img-carousel rounded" />
</div>
<div class="carousel-item">
    <asp:Image ID="PropertyImage3" runat="server" CssClass="d-block w-100 property-img-carousel rounded" />
</div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#propertyCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#propertyCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>

    <!-- Action buttons -->
    <div class="text-center my-4">
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger mx-2" Text="Back" OnClick="back_Click" />
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-success mx-2" Text="Book now" OnClick="BookingClick" />
        <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary mx-2" Text="Chat with us" />
    </div>

    <!-- Review submission -->
    <div class="card shadow-sm my-5 p-4">
        <h4 class="mb-4">Rate this Property</h4>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control mb-3" Placeholder="Your name"></asp:TextBox>
        <asp:DropDownList ID="ddlRating" runat="server" CssClass="form-select mb-3">
            <asp:ListItem Text="Select Rating" Value="0" />
            <asp:ListItem Text="⭐" Value="1" />
            <asp:ListItem Text="⭐⭐" Value="2" />
            <asp:ListItem Text="⭐⭐⭐" Value="3" />
            <asp:ListItem Text="⭐⭐⭐⭐" Value="4" />
            <asp:ListItem Text="⭐⭐⭐⭐⭐" Value="5" />
        </asp:DropDownList>
        <asp:TextBox ID="txtReview" runat="server" CssClass="form-control mb-3" TextMode="MultiLine" Rows="4" Placeholder="Write your review"></asp:TextBox>
        <asp:Button ID="btnSubmitReview" runat="server" CssClass="btn btn-primary" Text="Submit Review" OnClick="btnSubmitReview_Click" />
    </div>

    <!-- Display reviews -->
    <div class="my-4">
        <h4 class="mb-3">User Reviews</h4>
        <asp:Repeater ID="rptReviews" runat="server">
            <ItemTemplate>
                <div class="card mb-3 shadow-sm">
                    <div class="card-body">
                        <h5><%# Eval("UserName") %> - <%# new String('⭐', Convert.ToInt32(Eval("Rating"))) %></h5>
                        <p><%# Eval("ReviewText") %></p>
                        <small class="text-muted"><%# Eval("ReviewDate", "{0:MMM dd, yyyy}") %></small>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>



    </form>
    <script src="JavaScript/PropertyDetails.js"></script>
        <script src="JavaScript/PageLoader.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
