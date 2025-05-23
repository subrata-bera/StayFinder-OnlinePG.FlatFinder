<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TermsAndConditions.aspx.cs" Inherits="PropertyOwner_TermsAndConditions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Terms and Conditions - Stay Finder</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />

    <style>
        

        .card-glass {
            background: rgba(255, 255, 255, 0.85);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 750px;
            animation: fadeIn 0.8s ease;
        }

        @keyframes fadeIn {
            0% { transform: translateY(20px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        .terms-scroll {
            max-height: 250px;
            overflow-y: auto;
            padding: 5px 15px;
            background: #f8f9fa;
            border-radius: 10px;
            border: 1px solid #dee2e6;
        }

        .form-check-input {
            transform: scale(1.3);
            margin-right: 10px;
        }

        .btn-proceed {
            transition: all 0.3s ease;
            font-size: 1.1rem;
            border-radius: 10px;
        }

        .btn-proceed:disabled {
            background-color: #ccc !important;
            border-color: #ccc !important;
            cursor: not-allowed;
        }

        h2 {
            font-weight: bold;
            color: #0d6efd;
        }
    </style>    
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
             <div class="nav side-bar d-flex flex-column flex-shrink-0  text-bg-dark">
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
            <a href="TermsAndConditions.aspx" class="nav-link active">
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
            <a href="SiteView_Requests.aspx" class="nav-link text-white">
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




   <div class="card-glass content w-100 h-50 mt-5">

        <div class="nav-icon mx-2 my-3">
         <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
</svg>
       </div>
            <h2 class="text-center mb-4">Terms & Conditions</h2>

    

            <div class="terms-scroll mb-4">
                <p>Welcome to Stay Finder. Please read the terms below before listing your property:</p>
                <ul>
                    <li>All listings must represent real and owned properties.</li>
                    <li>False or misleading information may lead to account suspension.</li>
                    <li>Maintain accurate property details and respond to users promptly.</li>
                    <li>Stay Finder is not responsible for third-party activities.</li>
                    <li>Use only original photos and descriptions — no plagiarism.</li>
                    <li>Stay Finder may remove listings that violate its guidelines.</li>
                    <li>Listing approval is subject to platform verification and terms.</li>
                </ul>
            </div>

            <div class="form-check mb-4 d-flex align-items-center">
                <input class="form-check-input" type="checkbox" id="acceptCheck" onchange="toggleProceed()" />
                <label class="form-check-label ms-2" for="acceptCheck">
                    I agree to the Terms and Conditions
                </label>
            </div>

            <asp:Button ID="btnProceed" runat="server" Text="Proceed to Add Property"
                CssClass="btn btn-primary w-100 btn-lg btn-proceed" Enabled="false" OnClick="Proceed_Click"
                 />
        </div>

            </div>

       

      
    </form>

        <script src="../General/JavaScript/ResponsiveSidebar.js"></script>

      <script>
          function toggleProceed() {
              const check = document.getElementById("acceptCheck");
              const btn = document.getElementById("<%= btnProceed.ClientID %>");
                btn.disabled = !check.checked;
            }
        </script>

              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
