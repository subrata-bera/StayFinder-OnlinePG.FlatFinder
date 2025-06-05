<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit_Property.aspx.cs" Inherits="PropertyOwner_Edit_Property" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Edit Property - StayFinder</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <style>
        body {
            background: linear-gradient(135deg, #f3f9ff, #e0f7fa);
            padding: 30px;
        }
        .card {
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
        .form-check-label {
            margin-left: 10px;
        }
        .section-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin-top: 20px;
            color: #0077b6;
        }
         .checkbox-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
        gap: 15px;
        margin-top: 10px;
    }

    .check-item {
        background-color: #e3f2fd;
        border: 2px solid #90caf9;
        border-radius: 12px;
        padding: 10px 12px;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .check-item:hover {
        background-color: #bbdefb;
        cursor: pointer;
        transform: scale(1.03);
    }

    .check-item input[type="checkbox"] {
        margin-right: 10px;
        transform: scale(1.2);
    }

    .section-title i {
        margin-right: 6px;
        color: #1976d2;
    }
          @media(max-width:650px) {
              body
          {
              padding: 10px 2px;
          }
          }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="container">
            <div class="card p-4">
                <h2 class="text-center text-primary mb-4">Edit Property Details</h2>
                
                <!-- Basic Property Info -->
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="txtPropertyName" class="form-label">Property Name</label>
                        <asp:TextBox ID="txtPropertyName" runat="server" CssClass="form-control" required />
                    </div>

                    <div class="col-md-6">
                        <label for="ddlPropertyType" class="form-label">Property Type</label>
                        <asp:DropDownList ID="ddlPropertyType" runat="server" CssClass="form-select" required>
                            <asp:ListItem Text="Mess" />
                            <asp:ListItem Text="PG" />
                            <asp:ListItem Text="Flat" />
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <label for="ddlTenantGender" class="form-label">Tenant Gender</label>
                        <asp:DropDownList ID="ddlTenantGender" runat="server" CssClass="form-select" required>
                            <asp:ListItem Text="Male" />
                            <asp:ListItem Text="Female" />
                            <asp:ListItem Text="Other" />
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <label for="txtEmail" class="form-label">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required />
                    </div>

                    <div class="col-md-12">
                        <label for="txtAddress" class="form-label">Full Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" required />
                    </div>

                    <div class="col-md-4">
                        <label for="txtCity" class="form-label">City</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" required />
                    </div>

                    <div class="col-md-4">
                        <label for="txtLandmark" class="form-label">Landmark</label>
                        <asp:TextBox ID="txtLandmark" runat="server" CssClass="form-control" required/>
                    </div>

                    <div class="col-md-4">
                        <label for="txtPincode" class="form-label">Pin Code</label>
                        <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" required />
                    </div>

                    <div class="col-md-6">
                        <label for="txtRooms" class="form-label">Number of Rooms</label>
                        <asp:TextBox ID="txtRooms" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="col-md-6">
                        <label for="txtContact" class="form-label">Contact</label>
                        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" required />
                    </div>
                </div>

                <!-- Room Details -->
                <div class="section-title">Room Details</div>
                <div class="row g-3">
                    <div class="col-md-12 fw-bold">Single Room</div>
                    <div class="col-md-4">
                        <label for="txtSingleUnit" class="form-label">Unit</label>
                        <asp:TextBox ID="txtSingleUnit" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="col-md-4">
                        <label for="txtSingleRent" class="form-label">Rent</label>
                        <asp:TextBox ID="txtSingleRent" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="col-md-4">
                        <label for="txtSingleSize" class="form-label">Size (sqft)</label>
                        <asp:TextBox ID="txtSingleSize" runat="server" CssClass="form-control" required/>
                    </div>

                    <div class="col-md-12 fw-bold">Double Room</div>
                    <div class="col-md-4">
                        <label for="txtDoubleUnit" class="form-label">Unit</label>
                        <asp:TextBox ID="txtDoubleUnit" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="col-md-4">
                        <label for="txtDoubleRent" class="form-label">Rent</label>
                        <asp:TextBox ID="txtDoubleRent" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="col-md-4">
                        <label for="txtDoubleSize" class="form-label">Size (sqft)</label>
                        <asp:TextBox ID="txtDoubleSize" runat="server" CssClass="form-control" required />
                    </div>

                    <div class="col-md-12 fw-bold">Triple Room</div>
                    <div class="col-md-4">
                        <label for="txtTripleUnit" class="form-label">Unit</label>
                        <asp:TextBox ID="txtTripleUnit" runat="server" CssClass="form-control" required />
                    </div>
                    <div class="col-md-4">
                        <label for="txtTripleRent" class="form-label">Rent</label>
                        <asp:TextBox ID="txtTripleRent" runat="server" CssClass="form-control" required/>
                    </div>
                    <div class="col-md-4">
                        <label for="txtTripleSize" class="form-label">Size (sqft)</label>
                        <asp:TextBox ID="txtTripleSize" runat="server" CssClass="form-control" required />
                    </div>
                </div>

                <!-- Facilities -->
              <div class="section-title"><i class="bi bi-tools"></i>Facilities</div>
<div class="checkbox-grid">
    <label class="check-item"><asp:CheckBox ID="chkWifi" runat="server" Text="Wi-Fi" /></label>
    <label class="check-item"><asp:CheckBox ID="chkParking" runat="server" Text="Parking" /></label>
    <label class="check-item"><asp:CheckBox ID="chkPower" runat="server" Text="Power Backup" /></label>
    <label class="check-item"><asp:CheckBox ID="chkWashingMachine" runat="server" Text="Washing Machine" /></label>
    <label class="check-item"><asp:CheckBox ID="chkGeyser" runat="server" Text="Geyser" /></label>
    <label class="check-item"><asp:CheckBox ID="chkCCTV" runat="server" Text="CCTV" /></label>
    <label class="check-item"><asp:CheckBox ID="chkSecurity" runat="server" Text="Security Guard" /></label>
    <label class="check-item"><asp:CheckBox ID="chkAC" runat="server" Text="AC / Fan" /></label>
    <label class="check-item"><asp:CheckBox ID="chkWater" runat="server" Text="Water Purifier" /></label>
</div>

                <!-- Rules -->
               <div class="section-title"><i class="bi bi-exclamation-triangle-fill"></i>Rules & Restrictions</div>
<div class="checkbox-grid">
    <label class="check-item"><asp:CheckBox ID="chkSmoking" runat="server" Text="No Smoking" /></label>
    <label class="check-item"><asp:CheckBox ID="chkAlcohol" runat="server" Text="No Alcohol" /></label>
    <label class="check-item"><asp:CheckBox ID="chkPets" runat="server" Text="No Pets" /></label>
    <label class="check-item"><asp:CheckBox ID="chkStudent" runat="server" Text="Only Students" /></label>
</div>

                <!-- Description -->
                <div class="section-title">Description</div>
                <div class="mb-3">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" required/>
                </div>

                <!-- Photos -->
                <div class="section-title">Upload Photos</div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="filePhoto1" class="form-label">Photo 1</label>
                        <asp:FileUpload ID="PropertyImage" runat="server" CssClass="form-control"/>
                    </div>
                    <div class="col-md-4">
                        <label for="filePhoto2" class="form-label">Photo 2</label>
                        <asp:FileUpload ID="PropertyImage_2" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <label for="filePhoto3" class="form-label">Photo 3</label>
                        <asp:FileUpload ID="PropertyImage_3" runat="server" CssClass="form-control" />
                    </div>
                </div>

                <!-- Submit -->
                <div class="text-center mt-4">
                     <asp:Button ID="Button1" runat="server" Text="Back" CssClass="btn btn-danger px-4 py-2" OnClick="back_Click" />
                    <asp:Button ID="btnSubmit" runat="server" Text="Save Property" CssClass="btn btn-primary px-4 py-2" OnClick="btnSave_Click" />
                   
                </div>
            </div>
        </div>
    </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
