<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="GuestMenu.aspx.cs" Inherits="Prototype1.GuestMenu.GuestMainMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
        <asp:TextBox ID="txtSearchEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
    </div>
    <style type="text/css">
        table, tr, td {
            border: 2px solid #4A3C8C;
        }
    </style>
    <script type="text/javascript">
<!--
    function Check_Click(objRef) {
        //Get the Row based on checkbox
        var row = objRef.parentNode.parentNode;

        //Get the reference of GridView
        var GridView = row.parentNode;

        //Get all input elements in Gridview
        var inputList = GridView.getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            //The First element is the Header Checkbox
            var headerCheckBox = inputList[0];

            //Based on all or none checkboxes
            //are checked check/uncheck Header Checkbox
            var checked = true;
            if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                if (!inputList[i].checked) {
                    checked = false;
                    break;
                }
            }
        }
        headerCheckBox.checked = checked;

    }
    function checkAll(objRef) {
        var GridView = objRef.parentNode.parentNode.parentNode;
        var inputList = GridView.getElementsByTagName("input");
        for (var i = 0; i < inputList.length; i++) {
            var row = inputList[i].parentNode.parentNode;
            if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                if (objRef.checked) {
                    inputList[i].checked = true;
                }
                else {
                    if (row.rowIndex % 2 == 0) {
                        row.style.backgroundColor = "#F7F7F7";
                    }
                    else {
                        row.style.backgroundColor = "#E7E7FF";
                    }
                    inputList[i].checked = false;
                }
            }
        }
    }
    //-->
    </script>
    <script type="text/javascript">
        function ConfirmDelete() {
            var count = document.getElementById("<%=hfCount.ClientID %>").value;
            var gv = document.getElementById("<%=GridView1.ClientID%>");
            var chk = gv.getElementsByTagName("input");
            for (var i = 0; i < chk.length; i++) {
                if (chk[i].checked && chk[i].id.indexOf("chkAll") == -1) {
                    count++;
                }
            }
            if (count == 0) {
                alert("No invitation to resend.");
                return false;
            }
            else {
                return confirm("Do you want to resend " + count + " invitation(s).");
            }
        }
    </script>
    <asp:HiddenField ID="hfCount" runat="server" Value="0" />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
        BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
        BorderWidth="10px" CellPadding="1000" CellSpacing="2" GridLines="Horizontal" DataKeyNames = "inv_id" OnPageIndexChanging = "OnPaging" PageSize = "100">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="chkAll" runat="server"
                        onclick="checkAll(this);" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="chk" runat="server"
                        onclick="Check_Click(this)" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="first_nm" HeaderText="First Name" SortExpression="first_nm" />
            <asp:BoundField DataField="last_nm" HeaderText="Last Name" SortExpression="last_nm" />
            <asp:BoundField DataField="name" HeaderText="Event Name" SortExpression="mobile_no" />
            <asp:BoundField DataField="start_dt" HeaderText="Event Date" SortExpression="guest_address" DataFormatString="{0:d MMMM yyyy}" />
            <asp:BoundField DataField="start_dt" HeaderText="Time" SortExpression="guest_address" DataFormatString="{0:HH:mm}" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsInvitation" runat="server"></asp:SqlDataSource>

    <asp:Button ID="btnResend" runat="server" Text="Resend Invitation"
        OnClientClick="return ConfirmDelete();" OnClick="btnResend_Click" />
    <br />
    <br />
    <br />
    <div>
        <asp:Button ID="btnMainMenu" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Back To Home Page" OnClick="btnMainMenu_Click" />
    </div>
</asp:Content>
