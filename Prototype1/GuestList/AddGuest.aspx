<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="AddGuest.aspx.cs" Inherits="Prototype1.GuestList.AddGuest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Select Event</label>
                    <asp:DropDownList ID="eventDropDown" AppendDataBoundItems="true"
                        AutoPostBack="true" DataSourceID="dsEventList"
                        DataTextField="name" DataValueField="id"
                        runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsEventList" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionDB %>"
                        SelectCommand="SELECT * FROM [tbl_event] WHERE admin_id = @UserID  ORDER BY [name]"></asp:SqlDataSource>
                </div>

                <div class="form-group">
                    <label>First Name</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter First Name" Width="426px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Last Name</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Enter Last Name" Width="425px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Guest Email Address" Width="425px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Phone Number </label>
&nbsp;<asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter Guest Phone Number" Width="425px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control" placeholder="Street Address" Width="425px"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                        </div>
                    </div>
                </div>
            </div>
         
        </div>
<%--    <div class="row">
        <div class="col-md-5">
            <div class="form-group">
            </div>
        </div>
           <div class="col-md-4">
                <div class="checkbox">
                    <asp:CheckBox runat="server" ID="chkPrint" class="checkbox" Text="Print Invitation" />
                </div>

            </div>
        <div class="col-md-4">
            <div class="checkbox">
                <asp:CheckBox runat="server" ID="chkEmail" class="checkbox" Text="Email Invitation" />
            </div>
        </div>
    </div>--%>
    <div>
        <br />
        <div>
            <asp:Button ID="btnAddGuest" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Send Invitation" OnClick="btnAddGuest_Click" />
        </div>
        <br />
        <div>
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Back To Main Menu" OnClick="btnSubmit_Click" />
        </div>
    </div>
    </div>
</asp:Content>
