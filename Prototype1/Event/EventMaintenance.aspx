<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Home.Master" AutoEventWireup="true" CodeBehind="EventMaintenance.aspx.cs" Inherits="Prototype1.Event.EventMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../Script/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Script/moment.js" type="text/javascript"></script>
    <script src="../Script/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="../Style/bootstrap-datetimepicker.css" />
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Event Name</label>

                <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" placeholder="Enter event name" Width="301px"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>Event Type</label>
                <asp:TextBox ID="txtEventType" runat="server" CssClass="form-control" placeholder="What is the type of this event?" Width="300px"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <label>Event Address</label>
                <asp:TextBox ID="txtEventAddress" runat="server" CssClass="form-control" placeholder="Enter event address" Width="551px"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label>City</label>
                <asp:TextBox ID="txtEventCity" runat="server" CssClass="form-control" placeholder="City location of the event"> </asp:TextBox>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label>Start Date and Time</label>
                <div class='input-group date' id='CalendarDateStart'>
                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" placeholder="Start Date"> </asp:TextBox>
                    <%--<input type='text' class="form-control" />--%>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <label>End Date and Time</label>
                <div class='input-group date' id='CalendarDateEnd'>
                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" placeholder="End Date"> </asp:TextBox>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <div>
        <div class="col-md-6">
            <asp:Button ID="btnCreateEvent" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Save" OnClick="btnCreateEvent_Click" />
        </div>
        <div class="col-md-6">
            <asp:Button ID="btnModifyEvent" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Event List" OnClick="btnModifyEvent_Click" />
        </div>
    </div>
    <br />
    <br />
    <br />

    <div>
        <asp:Button ID="btnMainMenu" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Back To Main Menu" OnClick="btnMainMenu_Click" />
    </div>
    <script type="text/javascript">
        $(function () {
            $('#CalendarDateStart').datetimepicker();
            $('#CalendarDateEnd').datetimepicker();
        });
    </script>
</asp:Content>
