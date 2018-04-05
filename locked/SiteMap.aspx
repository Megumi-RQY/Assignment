<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Site Map" StylesheetTheme="SkinFile" %>

<asp:Content runat="server" ID="content3" ContentPlaceHolderID="Holder1">
    <div class="contenttxt">
        <asp:SiteMapDataSource runat="server" ID="source1" />
        <asp:TreeView runat="server" ShowLines="true" DataSourceID="source1" />
    </div>
</asp:Content>
