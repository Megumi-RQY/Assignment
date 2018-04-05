<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Search Users" StylesheetTheme="SkinFile"%>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        int id;
        Boolean idnull = int.TryParse(CusID.Text,out id);
        String name = UName.Text;
        String EM = EA.Text;
        if (!idnull && name == null && EM == null)
        {
            label1.Visible = true;
            label1.Text = "Please fill at least one box!";
        }
        else
        {
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\Monash\MIT\FIT5032 Internet Applications Dev\D task\login.mdb";
            try
            {
                String sql = "select customerid,username,gender,email,state,format([birthday],\"dd/mm/yyyy\") as birthday from customer where customerid=" + id + " or username like '" + name + "' or email like '" + EM + "'";
                OleDbDataAdapter da = new OleDbDataAdapter(sql, conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                SearchGV.DataSource = ds;
                SearchGV.DataBind();
            }
            catch (Exception ex)
            {
                label1.Text = ex.Message;
                label1.Visible = true;
            }
            finally
            {
                conn.Close();
            }
            CusID.Text = "";
            EA.Text = "";
            UName.Text = "";
        }
    }
</script>


<asp:Content ID="contentSearch" ContentPlaceHolderID="Holder1" runat="server">
    <div class="divseperate">
        <div>Please input the Customer ID, Username or Email Address:</div>
        <div>Customer ID: <asp:TextBox runat="server" ID="CusID" /></div>
        <div>Username: <asp:TextBox runat="server" ID="UName" /></div>
        <div>Email Address: <asp:TextBox runat="server" ID="EA" /><asp:Label runat="server" ID="label1" Visible="false" ForeColor="Red" /></div>
    </div>
    <asp:Button runat="server" Text="Search" ID="SearchButton" OnClick="SearchButton_Click" />
    <div class="divseperate">
        <asp:GridView runat="server" ID="SearchGV" CellPadding="5" AutoGenerateColumns="false" CssClass="table">
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


