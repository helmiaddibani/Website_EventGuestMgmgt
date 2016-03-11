<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="InvitationList.aspx.cs" Inherits="Prototype1.InvitationList.InvitationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:DropDownList ID="eventDropDown" AppendDataBoundItems="true"
                        AutoPostBack="true" DataSourceID="dsEventList"
                        DataTextField="name" DataValueField="id"
                        runat="server" CssClass="form-control" Height="83px">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsEventList" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>"
                        SelectCommand="SELECT * FROM [tbl_event] ORDER BY [name]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <p>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsInvitation">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="first_nm" HeaderText="First Name" SortExpression="first_nm" />
                <asp:BoundField DataField="last_nm" HeaderText="Last Name" SortExpression="last_nm" />
                <asp:BoundField DataField="address" HeaderText="Adress" SortExpression="address" />
                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                <asp:BoundField DataField="email" HeaderText="Email Address" SortExpression="email" />
                <asp:BoundField DataField="mobile_no" HeaderText="Phone Number" SortExpression="mobile_no" />
                <asp:CheckBoxField DataField="is_attend" HeaderText="Attend Status" SortExpression="is_attend" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dsInvitation" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>" SelectCommand="SELECT [first_nm], [last_nm], [address], [city], [email], [mobile_no], [is_attend] FROM [tbl_invitation] ORDER BY [first_nm]"></asp:SqlDataSource>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
