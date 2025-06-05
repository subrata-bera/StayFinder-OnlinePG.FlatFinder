<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="User_Payment" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Secure Payment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="../General/StyleSheets/Payment.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>Complete Your Payment</h1>
                <p>Secure & Encrypted</p>
            </div>

            <div class="payment-methods">
                <h2>Select a Payment Method</h2>

                <div class="payment-option" onclick="selectPayment('upi')">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/e/e1/UPI-Logo-vector.svg" class="payment-icon" />
                    <div class="payment-details">
                        <h3>UPI Payment</h3>
                    </div>
                </div>
                <div class="method-box" id="upi-box">
                    <div class="form-group">
                        <label for="upiId">UPI ID</label>
                        <asp:TextBox runat="server" ID="upiId" placeholder="example@upi"></asp:TextBox>
                    </div>
                </div>

                <div class="payment-option" onclick="selectPayment('card')">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/b/b7/MasterCard_Logo.svg" class="payment-icon" />
                    <div class="payment-details">
                        <h3>Credit/Debit Card</h3>
                    </div>
                </div>
                <div class="method-box" id="card-box">
                    <div class="form-group">
                        <label>Card Number</label>
                        <asp:TextBox runat="server" ID="txtCardNumber" placeholder="1234 5678 9012 3456"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Name on Card</label>
                        <asp:TextBox runat="server" ID="txtName" placeholder="Full Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Expiry</label>
                        <asp:TextBox runat="server" ID="txtExpire" placeholder="MM/YY"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>CVV</label>
                        <asp:TextBox runat="server" ID="txtCVV" placeholder="123"></asp:TextBox>
                    </div>
                </div>

                <div class="payment-option" onclick="selectPayment('netbanking')">
                    <i class="fa-solid fa-building-columns payment-icon"></i>
                    <div class="payment-details">
                        <h3>Net Banking</h3>
                    </div>
                </div>
                <div class="method-box" id="netbanking-box">
                    <div class="form-group">
                        <label>Choose Bank</label>
                        <asp:DropDownList ID="ddlBank" runat="server">
    <asp:ListItem Text="--Select--" Value="" />
    <asp:ListItem Text="SBI" Value="SBI" />
    <asp:ListItem Text="HDFC" Value="HDFC" />
    <asp:ListItem Text="ICICI" Value="ICICI" />
    <asp:ListItem Text="Axis Bank" Value="Axis Bank" />
</asp:DropDownList>

                    </div>
                </div>

                <div class="payment-option" onclick="selectPayment('wallet')">
                    <i class="fa-solid fa-wallet payment-icon"></i>
                    <div class="payment-details">
                        <h3>Wallet</h3>
                    </div>
                </div>
                <div class="method-box" id="wallet-box">
                    <div class="form-group">
                        <label>Mobile Number</label>
                        <asp:TextBox runat="server" ID="txtWallet" placeholder="Enter Wallet Number"></asp:TextBox>
                    </div>
                </div>
            </div>

            <asp:Button runat="server" CssClass="pay-button" ID="btnPay" OnClick="btnPay_Click" />
            <div class="secure-payment">
                <i class="fa-solid fa-lock"></i> 100% Secure & Encrypted Payment
            </div>
            <div class="footer">
                By continuing, you agree to our Terms & Conditions.
            </div>
        </div>
    </form>
    <script src="../General/JavaScript/Payment.js"></script>
</body>
</html>
