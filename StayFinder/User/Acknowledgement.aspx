<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Acknowledgement.aspx.cs" Inherits="User_Acknowledgement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Print Acknowledgement</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
                <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />

    <style>
        @media print {
            .no-print {
                display: none;
            }
        }
        body {
            font-family: 'Segoe UI', sans-serif;
        }
        .form-box {
            border: 1px solid #ccc;
            padding: 30px;
            border-radius: 10px;
            max-width: 800px;
            margin: auto;
            background-color: #f9f9f9;
        }
        .form-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #333;
        }
        .label {
            font-weight: 500;
            color: #555;
        }
        .value {
            font-weight: 600;
            color: #000;
        }
    </style>
</head>
<body>
    <div id="loader">
            <div class="spinner"></div>
        </div>
    <form id="form1" runat="server">
  <div class="container py-5">
            <div class="form-box shadow">
                <div class="text-center form-title">Site Visit Acknowledgment Form</div>
                <hr />

                <div class="row mb-3">
                    <div class="col-md-6"><span class="label">Request ID:</span> <asp:Label runat="server" ID="lblId"></asp:Label></div>
                    <div class="col-md-6"><span class="label">Request Date:</span> <asp:Label runat="server" ID="lblRequestDate"></asp:Label></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6"><span class="label">Property Name:</span> <asp:Label runat="server" ID="lblPropertyName"></asp:Label></div>
                <div class="col-md-6"><span class="label">Status:</span> <asp:Label runat="server" ID="lblStatus"></asp:Label></div>
                </div>
               
                <div class="row mb-3">
                     <div class="col-md-6"><span class="label">Property Address:</span> <asp:Label runat="server" ID="lblAddress"></asp:Label></div>
                <div class="col-md-6"><span class="label">Visit Date:</span> <asp:Label runat="server" ID="lblVisitdate"></asp:Label></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6"><span class="label">Property Owner:</span> <asp:Label runat="server" ID="lblPropertyOwnerName"></asp:Label></div>
                    <div class="col-md-6"><span class="label">Property Type:</span> <asp:Label runat="server" ID="lblType"></asp:Label></div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6"><span class="label">Visitor Name:</span> <asp:Label runat="server" ID="lblVisitorName"></asp:Label></div>
                <div class="col-md-6"><span class="label">Visitor Contact:</span> <asp:Label runat="server" ID="lblVisitorContact"></asp:Label></div>
                    <div class="mt-3"><span class="label">Gender:</span> <asp:Label runat="server" ID="lblGender"></asp:Label></div>
                </div>

                <hr />

                <div class="mt-4">
                    <div class="d-flex justify-content-between">
                        <div class="text-start">
                            <p class="label">Visitor Signature:</p>
                            <div style="height: 50px; border-bottom: 1px solid #000;"></div>
                        </div>
                        <div class="text-end">
                            <p class="label">Owner Signature:</p>
                            <div style="height: 50px; border-bottom: 1px solid #000;"></div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-4 no-print">
                    <button type="button" class="btn btn-success" onclick="window.print()">Print Acknowledgment</button>
                    <a href="Home.aspx" class="btn btn-secondary">Back</a>
                </div>
            </div>
        </div>
    </form>

            <script src="../General/JavaScript/PageLoader.js"></script>

</body>
</html>
