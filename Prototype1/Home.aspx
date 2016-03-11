<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Prototype1.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1 style="color: #2b7cb2;">Efento</h1>
            <h3>a simple event management system</h3>
            <br />
            <br />
            <br />
            <p>For event administrator please click buttton below to login</p>
            <br />
            <div>
                <asp:Button ID="Login" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Login" OnClick="btnLogin_Click" />
            </div>
            <br />
            <p>To request email please click button below</p>
            <div>
                <asp:Button ID="RequestEmail" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Resend Email" OnClick="btnEmailRequest_Click" />
            </div>
        </div>
    </div>
</asp:Content>
