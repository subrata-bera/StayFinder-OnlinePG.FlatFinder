<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AcceptedRequests.aspx.cs" Inherits="PropertyOwner_AcceptedRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
      body {
        background-color: #f8f9fa;
      }
      .card {
        border: none;
        border-radius: 15px;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
      }
      .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
      }
      .property-img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
      }
      .view-btn {
        background-color: #0d6efd;
        color: #fff;
        border-radius: 30px;
        padding: 8px 20px;
        transition: background-color 0.3s;
      }
      .view-btn:hover {
        background-color: #0b5ed7;
        color: #fff;
      }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="container py-5">
            <h2 class="mb-4 text-center">Accepted Requests</h2>
            <div class="row" id="requests">
                
                        <div class="col-md-4 mb-4">
                            <div class="card">
                                <img src="data:image/png;base64,<%# Convert.ToBase64String((byte[])Eval("PropertyImage")) %>" class="property-img" alt="Property">
                                <div class="card-body">
                                    <h5 class="card-title">ddddddd/h5>
                                    <p class="card-text mb-1"><strong>Tenant:</strong>ddddd</p>
                                    <p class="card-text mb-1"><strong>Booking Date:</strong>dddd</p>
                                    <p class="card-text mb-3"><strong>Rent:</strong> ₹<ddd/month</p>
                                    <a href='Request_View.aspx?ID=<%# Eval("ID") %>' class="btn view-btn w-100">View Details</a>
                                </div>
                            </div>
                        </div>
                  
            </div>
        </div>
    </form>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
