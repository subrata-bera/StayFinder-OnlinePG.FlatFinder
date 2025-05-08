<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SiteVisit_Confirmation.aspx.cs" Inherits="User_SiteVisit_Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Appointment Confirmation</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
            <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" /></head>

     <style>
        .confirmation-card {
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .confirmation-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .info-label {
            font-weight: 600;
            color: #555;
        }

        .info-value {
            font-weight: 500;
            color: #222;
        }

        .print-btn {
            margin-top: 30px;
        }

        @media print {
            .print-btn {
                display: none;
            }
        }
    </style>
<body>
    <div id="loader">
            <div class="spinner"></div>
        </div>
    <form id="form1" runat="server">
    <div class="confirmation-card">
            <div class="confirmation-header">
                <h2 class="text-success">Acknowledgement</h2>
                <p class="text-muted">Thank you for your request! Here are your site visit appointment details.</p>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="info-label">Name</div>
                    <div class="info-value"><asp:Label ID="lblUserName" runat="server" /></div>
                </div>
                <div class="col-md-6">
                    <div class="info-label">Booking Date</div>
                    <div class="info-value"><asp:Label ID="lblBookingDate" runat="server" /></div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="info-label">Request Date</div>
                    <div class="info-value"><asp:Label ID="lblRequestDate" runat="server" /></div>
                </div>
                <div class="col-md-6">
                    <div class="info-label">Booking ID</div>
                    <div class="info-value"><asp:Label ID="lblBookingID" runat="server" /></div>
                </div>
            </div>

         <div class="row mb-3">
                <div class="col-md-6">
                    <div class="info-label">Gender</div>
                    <div class="info-value"><asp:Label ID="lblGender" runat="server" /></div>
                </div>
                <div class="col-md-6">
                    <div class="info-label">Number of People</div>
                    <div class="info-value"><asp:Label ID="lblPeople" runat="server" /></div>
                </div>
            </div>

            <hr />

            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="info-label">Property Name</div>
                    <div class="info-value"><asp:Label ID="lblPropertyName" runat="server" /></div>
                </div>
                <div class="col-md-6">
                    <div class="info-label">Property Type</div>
                    <div class="info-value"><asp:Label ID="lblPropertyType" runat="server" /></div>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="info-label">Owner Name</div>
                    <div class="info-value"><asp:Label ID="lblOwnerName" runat="server" /></div>
                </div>
                <div class="col-md-6">
                    <div class="info-label">Status</div>
                    <div class="info-value"><asp:Label ID="lblStatus" runat="server" /></div>
                </div>

            </div>
       

           

            <div class="text-center print-btn">
                <asp:Button runat="server" CssClass="btn btn-danger" Text="Back" OnClick="back_Click" />
                <button type="button" class="btn btn-primary" onclick="window.print();">Print Confirmation</button>
            </div>
        </div>
    </form>


        <script src="../General/JavaScript/PageLoader.js"></script>

</body>
</html>
