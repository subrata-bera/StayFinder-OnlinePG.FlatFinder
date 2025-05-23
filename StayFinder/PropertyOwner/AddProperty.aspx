<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProperty.aspx.cs" Inherits="PropertyOwner_AddProperty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Property</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
   

   <style>
        body {
            background: linear-gradient(135deg, #f3f4f6, #e5e7eb);
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            max-width: 850px;
           
        }
        .btn-add {
          margin-left: 42vw;

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
                    <div class="step"><div class="circle">3</div><div class="label">Rooms</div></div>

                    <div class="step"><div class="circle">4</div><div class="label">Facilities</div></div>
                    <div class="step"><div class="circle">5</div><div class="label">Photos</div></div>
                </div>

                <!-- Step 1 -->
                <div class="form-step active">
                    <div class="mb-3">
                        <label>Property Name</label>
                        <asp:TextBox ID="txtPropertyName" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="mb-3">
                        <label>Property Type</label>
                        <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-select" required>
                            <asp:ListItem Text="PG" />
                            <asp:ListItem Text="Mess" />
                            <asp:ListItem Text="Flat" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label>Tenant Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select" required>
                            <asp:ListItem Text="Male" />
                            <asp:ListItem Text="Female" />
                            <asp:ListItem Text="Any" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label>Owner Contact</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="mb-3">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control" required />
                    </div>
                    <button type="button" class="btn btn-primary btn-next float-end">Next</button>
                </div>

                <!-- Step 2 -->
                <div class="form-step">
                    <div class="mb-3">
                        <label>Full Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" required />
                    </div>
                    <div class="mb-3">
                        <label>City</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="mb-3">
                        <label>Landmark</label>
                        <asp:TextBox ID="txtLandmark" runat="server" CssClass="form-control" required />   <%-- new added--%>
                    </div>
                    <div class="mb-3">
                        <label>Pin code</label>
                        <asp:TextBox ID="txtpin" runat="server" CssClass="form-control" required />         <%-- new added--%>
                    </div>
                   
                    <div class="mb-3">
                        <label>Number of Rooms</label>
                        <asp:TextBox ID="txtRooms" runat="server" CssClass="form-control" TextMode="Number" required/>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary btn-prev">Previous</button>
                        <button type="button" class="btn btn-primary btn-next">Next</button>
                    </div>
                </div>


                <%----------------Rooms details------------------%>

                 <div class="form-step">
                     <p>Single Room</p>
                     <hr />
                    <div class="row mb-3">
                        <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtSingleRoomUnit" CssClass="form-control" placeholder="Enter Unit"></asp:TextBox>
                        </div>
                        <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtSingleRoomRent" CssClass="form-control" TextMode="Number" placeholder="Rent"></asp:TextBox>
                        </div>
                        <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtSingleRoomSize" CssClass="form-control" TextMode="Number" placeholder="Size (in sqft)"></asp:TextBox>
                        </div>
                    </div>
                     <p>Double Room</p>
                     <hr />
                       <div class="row mb-3">
                        <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtDoubleRoomUnit" CssClass="form-control" placeholder="Enter Unit"></asp:TextBox>
                        </div>
                        <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtDoubleRoomRent" CssClass="form-control" placeholder="Rent"></asp:TextBox>
                        </div>
                            <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtDoubleRoomSize" CssClass="form-control" TextMode="Number" placeholder="Size (in sqft)"></asp:TextBox>
                        </div>
                    </div>
                     <p>Triple Room</p>
                     <hr />
                       <div class="row mb-3">
                        <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtTripleRoomUnit" CssClass="form-control" placeholder="Enter Unit"></asp:TextBox>
                        </div>
                        <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtTripleRoomRent" CssClass="form-control" placeholder="Rent"></asp:TextBox>
                        </div>
                            <div class="col-md-4 mb-3">
                            <asp:TextBox runat="server" ID="txtTripleRoomSize" CssClass="form-control" TextMode="Number" placeholder="Size (in sqft)"></asp:TextBox>
                        </div>
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
        <div class="col"><asp:CheckBox ID="chkWater" runat="server" Text="Water Purifier" CssClass="form-check me-1" /></div>
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
                        <asp:FileUpload ID="PropertyImage" runat="server" AllowMultiple="true" CssClass="form-control" required accept=".jpg,.jpeg,.png" />
                    </div>
                       <div class="mb-3">
                        <label>Upload Photos</label>
                        <asp:FileUpload ID="PropertyImage_2" runat="server" AllowMultiple="true" CssClass="form-control" required accept=".jpg,.jpeg,.png"  />
                    </div>
                       <div class="mb-3">
                        <label>Upload Photos</label>
                        <asp:FileUpload ID="PropertyImage_3" runat="server" AllowMultiple="true" CssClass="form-control" required accept=".jpg,.jpeg,.png" />
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="button" class="btn btn-secondary btn-prev">Previous</button>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit Property" CssClass="btn btn-success" required OnClick="Submit_Click" />
                    </div>
                </div>
            </div>
        </div>











    </form>
    <script src="../General/JavaScript/PageLoader.js"></script>
              <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   




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
