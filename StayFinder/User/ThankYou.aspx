<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThankYou.aspx.cs" Inherits="User_ThankYou" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">

    <style>
        *{
    margin: 0;
  padding: 0;
  box-sizing: border-box;
}
  
    body {
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
      background-color: #ffffff;
      color: #222;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }

    .container {
      max-width: 500px;
      padding: 40px 30px;
      /*background-color: #f4f4f4;*/
      border-radius: 16px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      /*border-left: 6px solid #00bfa6;*/
    }



    .checkmark {
      width: 120px;
      margin: 20px auto;
      display: block;
    }

  
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    <h1 class="fs-1 text-primary">Thank You!</h1>
    <p class="fs-5 mt-3">Your message has been sent successfully.<br>We will get back to you shortly.</p>
    <img src="../General/Assets/check.png" alt="Checkmark" class="checkmark" />
    <asp:Button runat="server" CssClass="btn btn-primary" Text="Print Acknowledgement" OnClick="Print_Click"  />
         <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" OnClick="home_Click" Text="Home"  />
  </div>

    </form>
</body>
</html>
