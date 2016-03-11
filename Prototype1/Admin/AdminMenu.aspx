<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="Prototype1.Admin.AdminMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnCreateEvent" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Create an Event" OnClick="btnCreateEvent_Click" />
    <br />
    <asp:Button ID="btnModifyEvent" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="See Event List" OnClick="btnModifyEvent_Click" />
    <br />
     <asp:Button ID="btnGuestList" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Send Invitation" OnClick="btnGuestList_Click" />
    <br />
    <asp:Button ID="btnInvitationList" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Invitation List" OnClick="btnInvitationList_Click" />
    <br />
</asp:Content>
