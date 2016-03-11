<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Prototype1.Guest.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="form-group">
                    <label>Enter Your Password</label>
                    <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
    <br />
     <div class="form-group">
                    <label>Enter Your New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
       <br />
      <div class="form-group">
                    <label>Re-enter Your New Password</label>
                    <asp:TextBox ID="txtNewPassword2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
    <br />
    <br />
    <br />
    <br />    
    <br />

         <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Submit" OnClick="btnSubmit_Click" />
</asp:Content>
