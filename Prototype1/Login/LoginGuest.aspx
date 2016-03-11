<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="LoginGuest.aspx.cs" Inherits="Prototype1.Login.GuestLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <asp:Panel ID="pnlForm" runat="server">
                    <div class="form-group">
                        <label for="exampleInputEmail">enter your email address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-default" Text="Submit" OnClick="btnSubmit_Click" />
                </asp:Panel>
                <asp:Panel ID="pnlSucceed" runat="server" Visible="false">
                    Login Success
                </asp:Panel>
            </div> 
        </div>
    </div>
</asp:Content>
