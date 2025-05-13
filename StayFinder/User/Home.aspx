<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="User_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="../General/StyleSheets/PageLoader.css" rel="stylesheet" />

    <style>
        body {
            background-color: #eef4fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-header {
            background-color: #007bff;
            color: white;
            padding: 25px 0;
            text-align: center;

        }

        .dashboard-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
        }

        footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 361px;

        }

        .table th,
        .table td {
            text-align: center;
        }

        .table-striped tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }
        .dashboard-header .btn {
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    transition: background 0.3s ease;
}

.dashboard-header .btn:hover {
    background-color: #f0f0f0;
}
        table svg:hover {
            cursor: pointer;
        }

    </style>
</head>
<body>
    <div id="loader">
            <div class="spinner"></div>
        </div>
    <form id="form1" runat="server">
   <!-- Header -->
    <div class="dashboard-header position-relative d-flex justify-content-between align-items-center px-4">
        <div>
            <h2 class="mb-1">Hi, <asp:Label runat="server" ID="lblUserName"></asp:Label></h2>
            <p class="mb-0">Check your requests details.</p>
        </div>
        <div>
            <asp:Button runat="server" CssClass="btn btn-light text-primary fw-semibold" Text="Logout" OnClick="Logout_Click" />
        </div>
    </div>

    <!-- Main Content -->
    <div class="container mt-5 w-100">
        <div class="row g-4">

            <!-- Payment History Card -->
            <div class="col-md-12">
                <div class="dashboard-card">
                    <h5>Site-Visit & Direct booking requests</h5>
                    <p>Here is the list of Site-Visit & Direct booking requests:</p>

                    <!-- Payment Table -->
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Request ID</th>
                                <th>Property Name</th>
                                <th>Request Type</th>
                                <th>Uploaded Document</th>
                                <th>Status</th>
                                <th>Download Acknowledgment</th>
                                <th></th>
                                
                            </tr>
                        </thead>
                        <tbody id="requestshistory">
                               <asp:Repeater ID="rptRequests" runat="server" OnItemCommand="rptRequests_ItemCommand">
            <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("PropertyName") %></td>
                                <td><%# Eval("RequestType") %></td>
                                <td><a class="text-primary text-decoration-none" href='ViewDocument.aspx?ID=<%#Eval("ID") %>'>View</a></td>
                                <td><%# Eval("Status") %></td>
                                 <td><a href='Acknowledgement.aspx?ID=<%#Eval("ID") %>'>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-printer-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M5 1a2 2 0 0 0-2 2v1h10V3a2 2 0 0 0-2-2zm6 8H5a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1" />
                                    <path
                                        d="M0 7a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-1v-2a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v2H2a2 2 0 0 1-2-2zm2.5 1a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1" />
                                </svg>
                                    </a></td>
                                <td><asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" 
    OnClientClick="return confirm('Are you sure you want to cancel this request?');"
    CommandName="CancelRequest" CommandArgument='<%# Eval("ID") %>'>Cancel Request</asp:LinkButton>
</td>

                                <td>
    <asp:Button ID="btnMakePayment" runat="server" 
        Text="Make Payment"
        CssClass="btn btn-success"
        CommandName="MakePayment"
        CommandArgument='<%# Eval("ID") %>'
        Enabled='<%# Eval("Status").ToString().Equals("Approved") %>' />
</td>
                               
                            </tr>
                 </ItemTemplate>
          </asp:Repeater>
                        </tbody>

                    </table>
                    <div class="alert alert-info mt-4 fw-semibold text-center" role="alert">
    🕒 <strong>Note:</strong> Please make the payment <strong>within 48 hours</strong> after your booking request is approved. Failure to do so may result in cancellation.
</div>

        <center><asp:Label runat="server" ID="lblError" Text="No request found" Visible="false" CssClass="text-danger fw-semibold"></asp:Label>
</center>

                </div>
            </div>

        </div>
    </div>

   

    </form>
        <script src="../General/JavaScript/PageLoader.js"></script>

</body>
</html>
