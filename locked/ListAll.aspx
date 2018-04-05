<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="List All Users" StylesheetTheme="SkinFile" %>

<asp:Content ID="contentLA" ContentPlaceHolderID="Holder1" runat="server">
            <asp:AccessDataSource ID="customer" runat="server" DataFile="~/login.mdb"
                 SelectCommand='select customerid,username,gender,email,state,format([birthday],"dd/mm/yyyy") as birthday from customer order by email' />
            <div class="divseperate">
                <asp:GridView ID="gvCus" runat="server" CellPadding="5" DataSourceID="customer" AutoGenerateColumns="false"
                     CssClass="table" DataKeyNames="CustomerID">
                    <Columns>
                        <asp:BoundField HeaderText="Customer ID" DataField="CustomerID" />
                        <asp:BoundField HeaderText="Username" DataField="username" />
                        <asp:BoundField HeaderText="Gender" DataField="gender" />
                        <asp:BoundField HeaderText="Email" DataField="email" />
                        <asp:BoundField HeaderText="State" DataField="state" />
                        <asp:BoundField HeaderText="Birthday" DataField="birthday" />
                    </Columns>
                </asp:GridView>
            </div>
</asp:Content>


