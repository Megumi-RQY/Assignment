<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="About Us" StylesheetTheme="SkinFile" %>

<asp:Content runat="server" ID="content4" ContentPlaceHolderID="Holder1">
    <div class="contenttxt">
        <p>Organisation Name: Blessing Software</p>
        <p>Author: Ruiqing Ye <a href="mailto:rqye1@student.monash.edu">Contact me</a></p>
        <p>Website Master: Ruiqing Ye</p>
    </div>
    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/locked/History.aspx" Text="Our History" />
    </div>
    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/locked/FAQ.aspx" Text="FAQ" />
    </div>
</asp:Content>
