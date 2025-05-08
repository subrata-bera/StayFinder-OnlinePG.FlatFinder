<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RequestOptions.aspx.cs" Inherits="User_RequestOptions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Select Request Type</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: #f4f7fa;
        }

        .heading {
            text-align: center;
            margin-top: 40px;
            margin-bottom: 40px;
            font-size: 2.5rem;
            font-weight: 700;
            color: #2c3e50;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card-title {
            font-weight: bold;
        }

        .btn-proceed {
            border-radius: 30px;
            padding-left: 25px;
            padding-right: 25px;
        }

        .container-center {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
  <div class="container my-5 py-5">
            <h1 class="heading">How Would You Like to Proceed?</h1>
            <div class="row g-5 justify-content-center">
                <!-- Site Visit Card -->
                <div class="col-md-5">
                    <div class="card text-center p-4">
                        <div class="card-body">
                            <h3 class="card-title text-primary">Site Visit</h3>
                            <p class="card-text">Visit the property in person, check surroundings, meet the owner, and make decisions after seeing everything directly and confidently.</p>
                            <asp:Button runat="server" CssClass="btn btn-info text-white btn-proceed" Text="Proceed" OnClick="SiteVisit_Click" />
                        </div>
                    </div>
                </div>

                <!-- Direct Booking Card -->
                <div class="col-md-5">
                    <div class="card text-center p-4">
                        <div class="card-body">
                            <h3 class="card-title text-success">Direct Booking</h3>
                            <p class="card-text">Confident about the property? Skip the visit and book directly online, saving your time with fast, secure, and simple booking.</p>
                            <asp:Button runat="server" CssClass="btn btn-success btn-proceed" Text="Proceed" OnClick="DirectBooking_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
