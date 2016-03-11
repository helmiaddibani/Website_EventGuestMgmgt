<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="InvitationSearch.aspx.cs" Inherits="Prototype1.InvitationSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Event:</label>
                    <asp:DropDownList ID="eventDropDown" AppendDataBoundItems="true"
                        AutoPostBack="true" DataSourceID="dsEventList"
                        DataTextField="name" DataValueField="id"
                        runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsEventList" runat="server"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <label>Search by:</label>
                    <asp:TextBox ID="txtSearchFName" runat="server" CssClass="form-control" placeholder="Enter First Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtSearchLName" runat="server" CssClass="form-control" placeholder="Enter Last Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtSearchEmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtSearchPhone" runat="server" CssClass="form-control" placeholder="Enter Phone Number"></asp:TextBox>
                </div>
            </div>
        </div>

        <style type="text/css">
            table, tr, td {
                border: 2px solid #4A3C8C;
            }
        </style>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsInvitation" DataKeyNames="id" GridLines="Horizontal" OnSelecting="dsInvitation_Selecting">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="first_nm" HeaderText="First Name" SortExpression="first_nm" />
                <asp:BoundField DataField="last_nm" HeaderText="Last Name" SortExpression="last_nm" />
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                <asp:BoundField DataField="email" HeaderText="Email Address" SortExpression="email" />
                <asp:BoundField DataField="mobile_no" HeaderText="Phone Number" SortExpression="mobile_no" />
                <asp:CheckBoxField DataField="is_attend" HeaderText="Attend Status" SortExpression="is_attend" />
                <asp:CommandField ShowEditButton="True" />
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
        <br />
        <br />
        <div>
            <asp:Button ID="btnSubmitSearch" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Search" />
        </div>
        <br />  
        <div >
            <asp:Button ID="btnMainMenu" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Back To Main Menu" OnClick="btnMainMenu_Click" />
        </div>
        <%--<asp:SqlDataSource ID="dsInvitation" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>"
            UpdateCommand="UPDATE tbl_invitation SET first_nm = @first_nm, last_nm = @last_nm, address = @address, city = @city, email = @email, mobile_no = @mobile_no, is_attend = @is_attend WHERE id = @id">--%>
        <asp:SqlDataSource ID="dsInvitation" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>"
            UpdateCommand="UPDATE tbl_invitation SET last_nm = @last_nm WHERE id = @id">
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Object" />
                <asp:Parameter Name="first_nm" Type="string" />
                <asp:Parameter Name="last_nm" Type="string" />
                <asp:Parameter Name="address" Type="string" />
                <asp:Parameter Name="city" Type="string" />
                <asp:Parameter Name="email" Type="string" />
                <asp:Parameter Name="mobile_no" Type="string" />
                <asp:Parameter Name="is_attend" Type="boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
