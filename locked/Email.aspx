<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Send Email" StylesheetTheme="SkinFile" ValidateRequest="false"%>


<script runat="server">

    protected void send_Click(object sender, EventArgs e)
    {
        MailMessage newMsg = new MailMessage();
        foreach(GridViewRow gvrow in table.Rows)
        {
            CheckBox ck = (CheckBox)gvrow.FindControl("sendcheck");
            if (ck != null && ck.Checked)
            {
                newMsg.To.Add(new MailAddress(gvrow.Cells[2].Text, gvrow.Cells[1].Text));
            }
        }
        newMsg.From = new MailAddress("megumi.ye.1017@gmail.com", "Blessing Software");
        newMsg.Subject = subject.Text;
        newMsg.Body = maintext.Text;

        try
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("megumi.ye.1017@gmail.com", "laobiao1017fo");
            smtp.Send(newMsg);
            result.Text = "Mail successfully sent!";
        }
        catch(Exception ex)
        {
            result.Text = ex.Message;
        }
        
    }
</script>



<asp:Content ID="contentEM" ContentPlaceHolderID="Holder1" runat="server">
    <asp:AccessDataSource ID="customer" DataFile="~/login.mdb" runat="server"
                 SelectCommand="select customerid, username, email from customer order by email" />
            <div class="divseperate">
                <asp:GridView runat="server" ID="table" CellPadding="5" DataSourceID="customer"
                     AutoGenerateColumns="false" DataKeyNames="CustomerID" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" />
                        <asp:BoundField DataField="username" HeaderText="Username" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="sendcheck" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
                <div class="editfield">
                <table width="450px" cellpadding="5">
                    <tr>
                        <td class="tbtitle">From: </td>
                        <td>Blessing Software</td>
                    </tr>
                    <tr>
                        <td class="tbtitle">Subject: </td>
                        <td>
                            <asp:TextBox runat="server" ID="subject" Width="374px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tbtitle">Text: </td>
                        <td>
                            <asp:TextBox runat="server" ID="maintext" TextMode="MultiLine" Height="300px" Width="374px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button runat="server" ID="send" Text="Send Email" OnClick="send_Click"/>
                        </td>
                        <td>
                            <asp:Label runat="server" ID="result" />
                        </td>
                    </tr>
                </table>
                
            
            </div>
            </asp:Content>


