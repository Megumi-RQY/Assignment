<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Login" StylesheetTheme="SkinFile"%>

<script runat="server">

    protected void DS1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            FormsAuthentication.RedirectFromLoginPage(Login.UserName,false);
        }
        else
        {
            Login.FailureText = "Invalid Login";
        }
    }

    protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        DS1.SelectCommand = "select * from customer where username='" + Login.UserName + "' and password = '" + Login.Password + "'";
        DS1.Select(DataSourceSelectArguments.Empty);
    }
</script>


<asp:Content ContentPlaceHolderID="Holder1" ID="content8" runat="server">
    <asp:AccessDataSource ID="DS1" runat="server" DataFile="~/login.mdb"
         OnSelected="DS1_Selected" />
    <asp:Login ID="Login" runat="server" OnAuthenticate="Login_Authenticate"
         TitleText="Please enter your username and password to login"
         UserNameLabelText="Username:"
         UserNameRequiredErrorMessage="Please input username!"
         PasswordLabelText="Password"
         PasswordRequiredErrorMessage="Please input password!"
         LoginButtonText="Login" DisplayRememberMe="false"></asp:Login>
    <div class="seperate">
        <asp:ValidationSummary Font-Names="Arial" Visible="true" runat="server"
             ValidationGroup="Login" HeaderText="Please correct the following errors:" />
    </div>
    <div>New user? <asp:HyperLink runat="server" Text="Click here to regist!" NavigateUrl="~/Registration.aspx"/></div>
</asp:Content>
