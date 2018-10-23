<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Attendance.aspx.vb" Inherits="Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <asp:Label ID="lblEventName" runat="server" Text="Label" Font-Bold="True" Font-Size="Larger"></asp:Label>
        <br />
        <br />
<div>Please enter the attendance below,then click the Insert button below.<br /> </div>

        <asp:Button ID="btnInsert" runat="server" Text="Insert" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COLLEAGUE_ODS %>" InsertCommandType="StoredProcedure" InsertCommand="FPUEventsInsertAttendance">
            <InsertParameters>
                <asp:SessionParameter Name="EId" SessionField="Id" />
                <asp:Parameter Name="List" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="500px" TextMode="MultiLine" Width="500px"></asp:TextBox>
    </asp:Panel>
</asp:Content>

