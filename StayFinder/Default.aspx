<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stay Finder</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="General/StyleSheets/index.css" rel="stylesheet" />
    <link href="General/StyleSheets/Navbar.css" rel="stylesheet" />
    <link href="General/StyleSheets/PageLoader.css" rel="stylesheet" />
    <style>
    .hover-dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0; /* removes animation gap */
    }

 .transition-box {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.transition-box:hover {
    transform: translateY(-10px) scale(1.03);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    cursor: pointer;
}



</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="main">
                <header class="navbar navbar-expand-lg fixed-top">
                    <div class="container">
                        <a href="Default.aspx" class="navbar-brand">Stay Finder</a>
                         <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon text-white"></span>
        </button>
                       <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
    <ul class="navbar-nav">
        <li class="nav-item"><a href="Default.aspx" class="nav-link active">Home</a></li>
        <li class="nav-item"><a href="General/FindPg_Mess.aspx" class="nav-link">Find Your Stay</a></li>

        <!-- Dropdown for Login -->
        <li class="nav-item dropdown hover-dropdown">
            <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">Login</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="User/Login.aspx">User Login</a></li>
                <li><a class="dropdown-item" href="General/PropertyOwnerLogin.aspx">Property Owner Login</a></li>
                <li><a class="dropdown-item" href="General/AdminLogin.aspx">Admin Login</a></li>
              
            </ul>
        </li>

        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
    </ul>
</div>
                    </div>

                </header>





                <!-- Hero Section -->

                <section class="hero-section d-flex align-items-center">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Left Content -->
                            <div class="col-lg-6 text-white text-center text-lg-start">
                                <h1 class="display-3 fw-bold animate__animated animate__fadeInLeft">Find Your Perfect
                                    Stay</h1>
                                <p class="lead animate__animated animate__fadeInLeft animate__delay-1s">
                                    Search and rent PGs, mess, and flats near your location easily.
                                </p>
                                <a href="FindPg_Mess.aspx"
                                    class="btn btn-lg btn-primary shadow-lg animate__animated animate__zoomIn animate__delay-2s">
                                    Find a Stay
                                </a>
                            </div>

                            <!-- Right Image -->
                            <div class="col-lg-6 text-center">
                                <img src="General/Assets/home.png" class="img-fluid animate__animated animate__fadeInRight"
                                    alt="Stay Finder">
                            </div>
                        </div>
                    </div>
                </section>


                <!-- How It Works Section -->
                <section class="container text-center my-5">
                    <h2 class="fw-bold">How It Works</h2>
                    <div class="row mt-4">
                        <div class="col-md-4">
                            <div class="info-box">
                                <img src="https://cdn-icons-png.flaticon.com/512/25/25694.png" alt="Search"
                                    class="icon">
                                <h4>Search Properties</h4>
                                <p>Find the best PGs, mess, and flats based on location and budget.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="info-box">
                                <img src="https://cdn-icons-png.flaticon.com/512/724/724715.png" alt="Contact"
                                    class="icon">
                                <h4>Connect with Owners</h4>
                                <p>Contact verified property owners to finalize your stay.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="info-box">
                                <img src="https://cdn-icons-png.flaticon.com/512/3105/3105793.png" alt="Move In"
                                    class="icon">
                                <h4>Move In</h4>
                                <p>Book your stay and move in without any hassle.</p>
                            </div>
                        </div>
                    </div>
                    <a href="PropertyOwner/AddProperty.aspx" class="btn btn-outline-primary mt-3">Add Your
                        Property</a>
                </section>


                <!-- Why Choose Stay Finder Section -->
                <section class="choose-us text-white py-5">
                    <div class="container text-center">
                        <h2 class="fw-bold">Why Choose Stay Finder?</h2>
                        <p class="lead">Find your perfect stay with ease, safety, and affordability.</p>

                        <div class="row mt-5">
                            <div class="col-md-4">
                                <div class="feature-box">
                                    <img src="https://cdn-icons-png.flaticon.com/512/2026/2026502.png"
                                        alt="Wide Listings" class="feature-icon">
                                    <h4>Wide Listings</h4>
                                    <p>Explore thousands of verified PGs, mess, and flats.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="feature-box">
                                    <img src="https://cdn-icons-png.flaticon.com/512/1035/1035675.png"
                                        alt="Safe & Secure" class="feature-icon">
                                    <h4>Safe & Secure</h4>
                                    <p>All property owners are verified to ensure your safety.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="feature-box">
                                    <img src="https://cdn-icons-png.flaticon.com/512/2983/2983191.png" alt="Easy Search"
                                        class="feature-icon">
                                    <h4>Smart Search</h4>
                                    <p>Use filters to find the perfect stay within minutes.</p>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-4">
                                <div class="feature-box">
                                    <img src="https://cdn-icons-png.flaticon.com/512/1161/1161388.png"
                                        alt="Affordable Pricing" class="feature-icon">
                                    <h4>Affordable Pricing</h4>
                                    <p>Get the best deals with no hidden charges.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="feature-box">
                                    <img src="https://cdn-icons-png.flaticon.com/512/3062/3062634.png"
                                        alt="User-Friendly" class="feature-icon">
                                    <h4>User-Friendly</h4>
                                    <p>A clean, intuitive interface for a smooth experience.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="feature-box">
                                    <img src="https://cdn-icons-png.flaticon.com/512/427/427654.png" alt="24/7 Support"
                                        class="feature-icon">
                                    <h4>24/7 Support</h4>
                                    <p>Our team is available anytime for your assistance.</p>
                                </div>
                            </div>
                        </div>

                        <div class="mt-4">
                            <a href="General/FindPg_Mess.aspx" class="btn btn-lg btn-light shadow-lg px-5">Find Your Stay</a>
                        </div>
                    </div>
                </section>

                <!-- Testimonials Section -->
                <section class="testimonials py-5">
                    <div class="container text-center">
                        <h2 class="fw-bold">What Our Users Say</h2>
                        <div class="row mt-4">
                            <div class="col-md-4">
                                <div class="testimonial-box">
                                    <p>“Stay Finder made finding a PG super easy! The listings are detailed and
                                        accurate.”</p>
                                    <h5>- Rohan Gupta</h5>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="testimonial-box">
                                    <p>“The search filters helped me find a place within my budget. Highly recommend!”
                                    </p>
                                    <h5>- Priya Sharma</h5>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="testimonial-box">
                                    <p>“The support team was very helpful in resolving my queries. Great experience!”
                                    </p>
                                    <h5>- Akash Verma</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

             <!-- Check Booking Request Status Section -->
<section class="check-status py-5 bg-primary text-white">
    <div class="container text-center">
        <h2 class="fw-bold mb-4">Check Your Booking Request Status</h2>
        <p class="lead">Track your property booking request in real-time using your Booking ID.</p>

        <div class="row justify-content-center mt-5">
            <!-- Box 1: Live Status -->
            <div class="col-md-4 mb-4">
                <div class="info-box p-4 bg-white text-dark rounded-4 shadow-sm transition-box">
                    <img src="https://cdn-icons-png.flaticon.com/512/1828/1828884.png" class="mb-3" alt="Live Status Icon" width="64" height="64">
                    <h5 class="fw-bold">Live Status</h5>
                    <p>Know whether your booking is pending, approved, or declined—updated instantly.</p>
                </div>
            </div>

            <!-- Box 2: Secure Access -->
            <div class="col-md-4 mb-4">
                <div class="info-box p-4 bg-white text-dark rounded-4 shadow-sm transition-box">
                    <img src="https://cdn-icons-png.flaticon.com/512/2889/2889676.png" class="mb-3" alt="Secure ID Icon" width="64" height="64">
                    <h5 class="fw-bold">Secure Access</h5>
                    <p>Use your unique Booking ID sent via SMS to securely access your request info.</p>
                </div>
            </div>
        </div>

        <a href="User/Home.aspx" class="btn btn-light btn-lg mt-4 shadow px-4 py-2">Check Request Status</a>
    </div>
</section>




                <!-- FAQ Section -->
                <section class="faq py-5">
                    <div class="container">
                        <h2 class="text-center fw-bold">Frequently Asked Questions</h2>
                        <div class="accordion mt-4" id="faqAccordion">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                        How do I book a property?
                                    </button>
                                </h2>
                                <div id="faq1" class="accordion-collapse collapse show">
                                    <div class="accordion-body">
                                        You can browse listings, select a property, and contact the owner for booking.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" data-bs-toggle="collapse"
                                        data-bs-target="#faq2">
                                        Are all properties verified?
                                    </button>
                                </h2>
                                <div id="faq2" class="accordion-collapse collapse">
                                    <div class="accordion-body">
                                        Yes, we verify all property owners to ensure safety and reliability.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>





                <!-- Footer -->
                <footer class="bg-dark text-white text-center py-3">
                    <p>&copy; 2025 Stay Finder. All rights reserved.</p>
                </footer>

            </div>
    </form>


       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</body>
</html>
