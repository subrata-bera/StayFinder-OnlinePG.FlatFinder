<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="PropertyOwner_AddProperty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Property</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   <%-- <link href="../General/StyleSheets/AddProperty.css" rel="stylesheet" />--%>
     <%--<link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />--%>
    <%--<style>
        .spinner {
            margin-right: 200px;
        }

    </style>--%>

   <style>
        body {
            background: linear-gradient(135deg, #f3f4f6, #e5e7eb);
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            max-width: 850px;
        }

        .stepper {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            position: relative;
        }

        .stepper::before {
            content: "";
            position: absolute;
            top: 14px;
            left: 0;
            right: 0;
            height: 3px;
            background: #dee2e6;
            z-index: 0;
        }

        .step {
            z-index: 1;
            position: relative;
            text-align: center;
            flex: 1;
        }

        .step .circle {
            height: 32px;
            width: 32px;
            line-height: 32px;
            background: #dee2e6;
            color: white;
            font-weight: bold;
            border-radius: 50%;
            margin: 0 auto;
            transition: 0.3s;
        }

        .step.active .circle {
            background: linear-gradient(to right, #4f46e5, #6366f1);
        }

        .step .label {
            margin-top: 5px;
            font-size: 13px;
            color: #6c757d;
        }

        .step.active .label {
            color: #4f46e5;
            font-weight: 500;
        }

        .form-step {
            display: none;
            animation: fadeIn 0.4s ease-in-out;
        }

        .form-step.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card {
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(6px);
            border: 1px solid #e2e8f0;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 10px 12px;
        }

        .btn {
            border-radius: 10px;
            padding: 10px 20px;
        }

        .btn-next, .btn-prev {
            min-width: 120px;
        }

        .btn-primary {
            background: linear-gradient(to right, #4f46e5, #6366f1);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #4338ca, #4f46e5);
        }

        .btn-success {
            background: #10b981;
            border: none;
        }

        .btn-success:hover {
            background: #059669;
        }   
    </style>
</head>
<body>
 
    <form id="form1" runat="server">
       <div class="container my-5">
            <div class="card p-4">
                <h2 class="text-center mb-4 fw-bold text-primary">List Your Property</h2>
<p class="text-center text-muted mb-4">Fill in the details below to publish your property for rent. Complete all steps to proceed.</p>

                <div class="stepper mb-4">
                    <div class="step active"><div class="circle">1</div><div class="label">Basic</div></div>
                    <div class="step"><div class="circle">2</div><div class="label">Location</div></div>
                    <div class="step"><div class="circle">3</div><div class="label">Facilities</div></div>
                    <div class="step"><div class="circle">4</div><div class="label">Photos</div></div>
                </div>

                <!-- Step 1 -->
                <div class="form-step active">
                    <div class="mb-3">
                        <label>Property Name</label>
                        <asp:TextBox ID="txtPropertyName" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Property Type</label>
                        <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-select">
                            <asp:ListItem Text="PG" />
                            <asp:ListItem Text="Mess" />
                            <asp:ListItem Text="Flat" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label>Tenant Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Male" />
                            <asp:ListItem Text="Female" />
                            <asp:ListItem Text="Any" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label>Owner Contact</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
                    </div>
                    <button type="button" class="btn btn-primary btn-next float-end">Next</button>
                </div>

                <!-- Step 2 -->
                <div class="form-step">
                    <div class="mb-3">
                        <label>Full Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" />
                    </div>
                    <div class="mb-3">
                        <label>City</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Landmark</label>
                        <asp:TextBox ID="txtLandmark" runat="server" CssClass="form-control" />   <%-- new added--%>
                    </div>
                    <div class="mb-3">
                        <label>Pin code</label>
                        <asp:TextBox ID="txtpin" runat="server" CssClass="form-control" />         <%-- new added--%>
                    </div>
                    <div class="mb-3">
                        <label>Rent</label>
                        <asp:TextBox ID="txtRent" runat="server" CssClass="form-control" TextMode="Number" min="0" />
                    </div>
                    <div class="mb-3">
                        <label>Number of Rooms</label>
                        <asp:TextBox ID="txtRooms" runat="server" CssClass="form-control" TextMode="Number" />
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary btn-prev">Previous</button>
                        <button type="button" class="btn btn-primary btn-next">Next</button>
                    </div>
                </div>

                <!-- Step 3 -->
                <div class="form-step">
                   <div class="mb-4">
    <label class="form-label fw-semibold fs-5 text-primary">Facilities</label>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-2">
        <div class="col"><asp:CheckBox ID="chkWifi" runat="server" Text="Wi-Fi" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkParking" runat="server" Text="Parking" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkPower" runat="server" Text="Power Backup" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="ChkWashingMachine" runat="server" Text="Washing Machine" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkGeyser" runat="server" Text="Geyser" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkCCTV" runat="server" Text="CCTV" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkSecurity" runat="server" Text="Security Guard" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkAC" runat="server" Text="AC / Fan" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkWater" runat="server" Text="Water Purifier" CssClass="form-check-input me-1" /></div>
    </div>
</div>


                     <!-- Rules / Restrictions Section -->
<div class="mb-4">
    <label class="form-label fw-semibold fs-5 text-primary">Rules & Restrictions</label>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-2">
        <div class="col"><asp:CheckBox ID="chkSmoking" runat="server" Text="No Smoking" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkAlcohol" runat="server" Text="No Alcohol" CssClass="form-check me-1" /></div>
        <div class="col"><asp:CheckBox ID="chkPets" runat="server" Text="No Pets" CssClass="form-check me-1" /></div>
        <div class="col-12"><asp:CheckBox ID="chkStudent" runat="server" Text="Only Students" CssClass="form-check me-1" /></div>
    </div>
</div>


                    <div class="mb-3">
                        <label>Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control" />
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary btn-prev">Previous</button>
                        <button type="button" class="btn btn-primary btn-next">Next</button>
                    </div>
                </div>

                <!-- Step 4 -->
                <div class="form-step">
                    <div class="mb-3">
                        <label>Upload Photos</label>
                        <asp:FileUpload ID="PropertyImage" runat="server" AllowMultiple="true" CssClass="form-control" />
                    </div>
                       <div class="mb-3">
                        <label>Upload Photos</label>
                        <asp:FileUpload ID="PropertyImage_2" runat="server" AllowMultiple="true" CssClass="form-control" />
                    </div>
                       <div class="mb-3">
                        <label>Upload Photos</label>
                        <asp:FileUpload ID="PropertyImage_3" runat="server" AllowMultiple="true" CssClass="form-control" />
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary btn-prev">Previous</button>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit Property" CssClass="btn btn-success" OnClick="Submit_Click" />
                    </div>
                </div>
            </div>
        </div>











        <%--<div class="main">
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
            <a href="AddProperty.aspx" class="nav-link active">
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
              <asp:HyperLink runat="server" CssClass="dropdown-item" Text="Sign out" NavigateUrl="../General/PropertyOwnerLogin.aspx"></asp:HyperLink>
          </ul>
        </div>
      </div> 

            <div class="content w-100" style=" font-family: 'Poppins', sans-serif;">
                    <div id="loader">
            <div class="spinner">

            </div>
        </div>
                <div class="container">
    <div class="property-form-card">
        <h2>Add New Property</h2>
            
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
                <asp:Button runat="server" CssClass="btn btn-primary btn-lg" Text="Add property" OnClick="addproperty_Click" />
            </div>
    </div>
</div>
            </div>

            </div>--%>
    </form>
    <script src="../General/JavaScript/PageLoader.js"></script>
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <%-- <script>
         document.addEventListener("DOMContentLoaded", function () {
             var fileInput = document.getElementById('<%= PropertyImage.ClientID %>');
            if (fileInput) {
                fileInput.setAttribute("accept", ".jpg,.jpeg"); // Restrict to JPG and JPEG
            }
        });
</script>--%>





   <script>
        const steps = document.querySelectorAll('.form-step');
        const indicators = document.querySelectorAll('.stepper .step');
       let step = 0;

       function showStep(index) {
           steps.forEach((s, i) => {
               s.classList.toggle('active', i === index);
           indicators[i].classList.toggle('active', i <= index);
       });
       }

       document.querySelectorAll('.btn-next').forEach(btn =>
           btn.addEventListener('click', () => {
               if (step < steps.length - 1) step++;
       showStep(step);
       })
        );

       document.querySelectorAll('.btn-prev').forEach(btn =>
           btn.addEventListener('click', () => {
               if (step > 0) step--;
       showStep(step);
       })
        );
    </script>

</body>
</html>
