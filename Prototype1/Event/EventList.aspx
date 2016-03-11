<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="Prototype1.Event.EventList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        table, tr, td {
            border: 2px solid #4A3C8C;
        }
    </style>
    <asp:GridView ID="gvEventList" runat="server" DataSourceID="dsEventList" AutoGenerateColumns="False"
        AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None"
        BorderWidth="10px" CellPadding="1000" CellSpacing="2" DataKeyNames="id" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="name" HeaderText="Event" SortExpression="name" />
            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
            <asp:BoundField DataField="start_dt" HeaderText="Start Date" SortExpression="start_dt" DataFormatString="{0:ddd, dd MMM yyyy hh:mm tt}" />
            <asp:BoundField DataField="end_dt" HeaderText="End Date" SortExpression="end_dt" DataFormatString="{0:ddd, dd MMM yyyy hh:mm tt}" />
            
            <%--<asp:CommandField ShowInsertButton="true" />--%>
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
    <%--<asp:SqlDataSource ID="dsEventList" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>"
        SelectCommand="SELECT [EventID], [UserID], [EName], [EType], [EStartDate], [EEndDate], [ETime], [EAddress], [ECity] FROM [Event] ORDER BY [EName]">
    </asp:SqlDataSource>--%>
    <asp:SqlDataSource ID="dsEventList" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>"
        SelectCommand="SELECT * FROM [tbl_event] WHERE admin_id = @UserID ORDER BY [name]"
        DeleteCommand="DELETE FROM tbl_event WHERE id = @id"
        UpdateCommand="UPDATE tbl_event SET name = @name, type=@type, address= @address, start_dt = @start_dt, end_dt = @end_dt WHERE id = @id" OnSelecting="dsEventList_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Object" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Object" />
            <asp:Parameter Name="name" Type="string" />
            <asp:Parameter Name="type" Type="string" />
            <asp:Parameter Name="address" Type="string" />
            <asp:Parameter Name="start_dt" Type="string" />
            <asp:Parameter Name="end_dt" Type="string" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div>
        <asp:Button ID="btnGoToAddEvent" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Add Event" OnClick="btnGoToAddEvent_Click" />
    </div>
    <br />
    <div>
        <asp:Button ID="btnGoToMenu" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Back to main menu" OnClick="btnGoToMenu_Click" />
    </div>
</asp:Content>
