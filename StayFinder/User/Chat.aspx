<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="User_Chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Chat Page UI -->
<div class="chat-box">
    <asp:Repeater ID="rptMessages" runat="server">
        <ItemTemplate>
            <div class='<%# Eval("IsOwner").ToString() == "1" ? "owner-msg" : "user-msg" %>'>
                <strong><%# Eval("IsOwner").ToString() == "1" ? "Owner" : "You" %>:</strong>
                <p><%# Eval("MessageText") %></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:TextBox ID="txtMessage" runat="server" CssClass="msg-input" />
    <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" />
</div>

    </form>
</body>
</html>
