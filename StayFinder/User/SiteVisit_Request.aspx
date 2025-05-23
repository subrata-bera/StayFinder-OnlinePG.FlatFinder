<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SiteVisit_Request.aspx.cs" Inherits="User_SiteVisit_Request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Appointment request</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
        <link href="../General/StyleSheets/Navbar.css" rel="stylesheet" />
        <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />
        <link href="../General/StyleSheets/SiteVisitRequest.css" rel="stylesheet" />
</head>
<body>
    
     <div id="loader">
            <div class="spinner"></div>
        </div>
    <form id="form1" runat="server">
    <div class="main">
                <h3>hi  <asp:Label runat="server" ID="lblUserName"></asp:Label>, Fillup the booking request form</h3>
                <div class="form">
                    <div class="left-side px-3">
                        <div class="input my-3">
                            <label for="txtName">Enter name</label>
                            <asp:TextBox CssClass="form-control mt-1" runat="server" ID="txtName" placeholder="Enter Name"></asp:TextBox>
                        </div>
                       
                        <div class="input my-3">
                            <label for="txtMobile">Enter mobile number</label>

                      <asp:TextBox CssClass="form-control mt-1" runat="server" ID="txtNumber" placeholder="Enter Mobile Number" ></asp:TextBox>

                        </div>
                          <div class="input my-3">
                            <label for="txtAddress">Enter address</label>
                             <asp:TextBox CssClass="form-control mt-1" runat="server" ID="txtAddress" placeholder="Enter Address" ></asp:TextBox>

                        </div>
                    </div>
                    <div class="right-side px-3">
                         
                         <div class="input my-3">
                            <label for="roomtype">Select Room Type</label>
                           <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="form-control" >
                                     <asp:ListItem Text="-- Select Your Room Type --" Value="" />
                                     <asp:ListItem Text="Single Room" Value="Single Room" />
                                     <asp:ListItem Text="Double Room" Value="Double Room" />
                                  
                            </asp:DropDownList>

                        </div> 


                        <div class="input my-3">
                            <label for="txtNumber">Number of people</label>
                            <asp:TextBox TextMode="number" CssClass="form-control mt-1" runat="server" ID="txtNumberOfPeople" ></asp:TextBox>
                        </div>

                        <div class="input" my-3>
                            <label>Enter Booking Date</label>
                            <asp:TextBox runat="server" CssClass="form-control mt-1" ID="txtDate" TextMode="date"></asp:TextBox>
                        </div>

                         <div class="input my-3">
                            <label for="gender">Select Your Gender</label>
                           <asp:DropDownList ID="gender" runat="server" CssClass="form-control" >
                                     <asp:ListItem Text="-- Select Your Gender --" Value="" />
                                     <asp:ListItem Text="Male" Value="Male" />
                                     <asp:ListItem Text="Female" Value="Female" />
                                  
                            </asp:DropDownList>

                        </div>

                        <div class="input my-3">
                            <label for="documentSelect">Document type</label>
                           <asp:DropDownList ID="ddlDocument" runat="server" CssClass="form-control" >
                                     <asp:ListItem Text="-- Select Document Type --" Value="" />
                                     <asp:ListItem Text="Aadhar Card" Value="Aadhar Card" />
                                     <asp:ListItem Text="PAN Card" Value="Pan Card" />
                                     <asp:ListItem Text="Voter Id" Value="Voter Id" />
                                     <asp:ListItem Text="Driving License" Value="Driving License" />
                            </asp:DropDownList>

                        </div>

                        <!-- Document Fields (Initially Hidden) -->
                        <div class="doc-field my-3" id="aadharField" style="display: none;">
                            <label>Aadhar number</label>
                            <asp:TextBox runat="server" ID="txtAadhar" CssClass="form-control mt-1" placeholder="Enter Aadhar Number" ></asp:TextBox>
                        </div>

                        <div class="doc-field my-3" id="panField" style="display: none;">
                            <label>PAN number</label>
                             <asp:TextBox runat="server" ID="txtPan" CssClass="form-control mt-1" placeholder="Enter PAN Number" ></asp:TextBox>
                        </div>

                        <div class="doc-field my-3" id="voterIdField" style="display: none;">
                            <label>Voter ID number</label>
                             <asp:TextBox runat="server" ID="txtVoterId" CssClass="form-control mt-1" placeholder="Enter Voter Id Number" ></asp:TextBox>
                        </div>

                        <div class="doc-field my-3" id="drivingField" style="display: none;">
                            <label>Driving license number</label>
                             <asp:TextBox runat="server" ID="txtDrivingLicense" CssClass="form-control mt-1" placeholder="Enter Driving License Number" ></asp:TextBox>
                        </div>
                        <div class="upload-document my-3">
                            <label for="">Uplaod document</label>
                            <asp:FileUpload ID="DocumentPhoto" runat="server" CssClass="form-control my-1" accept=".jpg, .jpeg, .pdf" required />
                        </div>

                    </div>
                    
                </div>
                <center><asp:Label runat="server" ID="lblError"></asp:Label></center>

                <div class="buttons px-3">
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="Clear" />
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="submit_Click" />
                </div>
            </div>
    </form>


     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
            crossorigin="anonymous"></script>
        <script src="../General/JavaScript/PageLoader.js"></script>

       <script>
           window.addEventListener('DOMContentLoaded', function () {
               const ddl = document.getElementById('<%= ddlDocument.ClientID %>');

        const docFieldMap = {
            'Aadhar Card': 'aadharField',
            'Pan Card': 'panField',
            'Voter Id': 'voterIdField',
            'Driving License': 'drivingField'
        };

               ddl.addEventListener('change', function () {
                   // Hide all fields first
                   document.querySelectorAll('.doc-field').forEach(field => {
                       field.style.display = 'none';
               });

            const selected = ddl.value;
            const targetId = docFieldMap[selected];

               if (targetId) {
                   const selectedField = document.getElementById(targetId);
                   if (selectedField) {
                       selectedField.style.display = 'block';
                   }
               }
           });
           });
</script>
</body>
</html>
