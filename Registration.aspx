<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Registration" StylesheetTheme="SkinFile"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">

    protected void Birthday_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        DateTime birthdate;
        try
        {
            birthdate = DateTime.Parse(Bday.Text); 
            if(birthdate>DateTime.Today)
            {
                BV.ErrorMessage = "You cannot enter a date later than today!";
            }
            else
            {
                args.IsValid = true;
            }
        }
        catch (Exception e)
        {
            BV.ErrorMessage = "Please input a valid date!For example: 09/20/1995";
        }
        
    }
    
    protected void Page_Load(object sender,EventArgs e)
    {
        BVR.MaximumValue = DateTime.Today.ToString();
    }


    protected void button1_Click(object sender, EventArgs e)
    {
        if(!Page.IsValid)
        {
            return;
        }
        Style s1 = new Style();
        s1.CssClass = "RPanel1";
        Result.ApplyStyle(s1);
        label1.Text = "Welcome! Your username is " + username.Text+". Your password is "+PSW.Text+".";
        label2.Text = "Email: " + Email.Text + " Birthday: " + Bday.Text;
        OleDbConnection conn = new OleDbConnection();
        conn.ConnectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\Monash\MIT\FIT5032 Internet Applications Dev\D task\login.mdb";
        try
        {
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "insert into customer ([username],[password],[gender],[email],[state],[birthday]) values (@username,@password,@gender,@email,@state,@birthday)";
            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@password", PSW.Text);
            cmd.Parameters.AddWithValue("@gender", gender.Text);
            cmd.Parameters.AddWithValue("@email", Email.Text);
            cmd.Parameters.AddWithValue("@state", state.Text);
            cmd.Parameters.AddWithValue("@birthday", DateTime.Parse(Bday.Text));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            label3.Text = "Regist Successful!";
        }
        catch (OleDbException eex)
        {
            label1.Text = null;
            label2.Text = null;
            label3.Text = "This username has been used! Please change a username";
        }
        catch (Exception ex)
        {
            label1.Text = null;
            label2.Text = null;
            label3.Text = ex.Message;
        }
        finally
        {
            conn.Close();
        }
    }

    
</script>


<asp:Content runat="server" ID="content2" ContentPlaceHolderID="Holder1">
    
        <div class="registdiv">
            Username: <asp:TextBox ID="username" runat="server" />
            <asp:RequiredFieldValidator ControlToValidate="username" runat="server" ForeColor="Red" ErrorMessage="Please enter username!" />
        </div>
        <div class="registdiv">
            Password: <asp:TextBox ID="PSW" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ControlToValidate="PSW" runat="server" ForeColor="Red" ErrorMessage="Please enter password!" />
        </div>
        <div class="registdiv">
            Re-enter Password: <asp:TextBox runat="server" ID="RePSW" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="RePSW" ForeColor="Red" ErrorMessage="Please re-enter your password!" />
            <div><asp:CompareValidator runat="server" ControlToValidate="RePSW" ControlToCompare="PSW" ForeColor="Red" ErrorMessage="Please enter the same password!" /></div>
        </div>
        <div class="registdiv">
            Gender:<asp:RadioButtonList runat="server" ID="gender" RepeatDirection="Horizontal" TextAlign="Left">
                <asp:ListItem>Male</asp:ListItem><asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
        </div>
        <div class="registdiv">
            Email: <asp:TextBox runat="server" ID="Email" Width="223px" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" ForeColor="Red" ErrorMessage="Please enter an email address!" />
            <div><asp:RegularExpressionValidator runat="server" ControlToValidate="Email" ForeColor="Red" ErrorMessage="Please enter a valid email address!"
                 ValidationExpression=".*@.*\..*" /></div>
        </div>
        <div class="registdiv">
            State: <asp:DropDownList runat="server" ID="state">
                <asp:ListItem>VIC</asp:ListItem>
                <asp:ListItem>NSW</asp:ListItem>
                <asp:ListItem>ACT</asp:ListItem>
                <asp:ListItem>TAS</asp:ListItem>
                <asp:ListItem>QLD</asp:ListItem>
                <asp:ListItem>WA</asp:ListItem>
                <asp:ListItem>SA</asp:ListItem>
                <asp:ListItem>NT</asp:ListItem>
                   </asp:DropDownList>
        </div>
        <div class="registdiv">
            Birthday(mm/dd/yyyy): <asp:TextBox ID="Bday" runat="server" />
            <asp:CustomValidator ID="BV" runat="server" ControlToValidate="Bday" OnServerValidate="Birthday_ServerValidate" ForeColor="Red" />
            <div><asp:RangeValidator ID="BVR" runat="server" ControlToValidate="Bday" ForeColor="Red" ErrorMessage="You cannot enter a date later than today!" /></div>
        </div>
    <div class="seperate">
        <asp:CheckBox runat="server" ID="agree" Text="I agree with the user agreement." TextAlign="Right"/>
        <asp:HyperLink runat="server" Text="Link" NavigateUrl="http://moodle.vle.monash.edu/mod/page/view.php?id=3321999" />
    </div>
    <div class="seperate">
        <asp:Button runat="server" ID="button1" Text="Submit" OnClick="button1_Click"/>
    </div>
    <asp:Panel runat="server" CssClass="RPanel" ID="Result">
        <div class="seperate"><asp:Label runat="server" ID="label1" /></div>
        <div class="seperate"><asp:Label runat="server" ID="label2" /></div>
        <asp:Label runat="server" ID="label3" />
    </asp:Panel>
    <asp:HyperLink runat="server" Text="Click to show all users" NavigateUrl="~/locked/ListAll.aspx" />
    <asp:HyperLink runat="server" Text="Search" NavigateUrl="~/locked/Search.aspx" />
</asp:Content>