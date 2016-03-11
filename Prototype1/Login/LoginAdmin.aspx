<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="Prototype1.Login.LoginAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <asp:Panel ID="pnlForm" runat="server">
                    <div class="form-group">
                        <label for="exampleInputEmail">Email address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter email"></asp:TextBox>
                    </div>
                    <%if (isError)
                      {%>
                    <div class="form-group has-error">
                        <label class="control-label" for="exampleInputPassword">Password</label>
                        <%}
                      else
                      { %>
                        <div class="form-group">
                            <label for="exampleInputPassword">Password</label>
                            <%} %>
                            <asp:TextBox type="password" runat="server" ID="txtPassword" CssClass="form-control" placeholder="Password"></asp:TextBox>
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
