<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Home Page" StylesheetTheme="SkinFile" %>



<asp:Content ID="content1" ContentPlaceHolderID="Holder1" runat="server">
    <div class="contenttxt">
        <asp:AdRotator runat="server" AdvertisementFile="~/ads.xml" />
    </div>
    <div class="contenttxt">******=====================================================================******</div>
    <div class="contenttxt">
        <p>Page last modified on 06/Apr/2018</p>
        <p>The site is best viewed at 1366*768 resolution.</p>
    </div>
    <div class="contenttxt">******=====================================================================******</div>
    <div class="contenttxt">
        <p><asp:HyperLink runat="server" Text="Monash Disclaimer" NavigateUrl="http://www.monash.edu/disclaimer-copyright" /></p>
        <p>Email: <a href="mailto:rqye1@student.monash.edu">Author</a></p>
        <p>Email: <a href="mailto:rqye1@student.monash.edu">Web Master</a></p>
    </div>
    <div class="contenttxt">******=====================================================================******</div>
</asp:Content>