<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceholder1" runat="server" >
    <asp:Panel ID="Panel1" runat="server" CssClass="topmargindown" ><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:COLLEAGUE_ODS %>" SelectCommand="FPUEventsGetEventsByUsername" SelectCommandType="StoredProcedure" InsertCommand="FPUEventsInsert" InsertCommandType="StoredProcedure" UpdateCommand="FPUEventsUpdate" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:ControlParameter Name="Name" ControlID="txtName" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="Desc" ControlID="txtDesc" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="StartDate" ControlID="txtStartDate" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="StartTime" ControlID="ddStartTime" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter Name="EndDate" ControlID="txtEndDate" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="EndTime" ControlID="ddEndTime" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter Name="DepartmentId" ControlID="ddDept" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter Name="TermCode" ControlID="ddTerms" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="CreatedBy" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="Anonymous" Name="Username" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView1" Name="EId" PropertyName="SelectedValue" />
            <asp:ControlParameter Name="Name" ControlID="txtName" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="Desc" ControlID="txtDesc" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="StartDate" ControlID="txtStartDate" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="StartTime" ControlID="ddStartTime" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter Name="EndDate" ControlID="txtEndDate" PropertyName="Text" Type="String" />
            <asp:ControlParameter Name="EndTime" ControlID="ddEndTime" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter Name="DepartmentId" ControlID="ddDept" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="UpdatedBy" />
            <asp:ControlParameter ControlID="ddTerms" Name="Term" PropertyName="SelectedValue" />
        </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:COLLEAGUE_ODS %>" SelectCommand="GetEventDepartmentsByUsername" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:Label ID="lblMSG" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:COLLEAGUE_ODS %>" SelectCommand="GetEventAttendanceTerms" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        
        
        <asp:HiddenField ID="hfDefaultTerm" runat="server" />
        
        
        <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label8" runat="server" Text="Event Name"></asp:Label></asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Label ID="Label9" runat="server" Text="Term"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                    <asp:TableCell runat="server"><asp:TextBox ID="txtName" runat="server" Height="25px" Width="150px"></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:DropDownList ID="ddTerms" runat="server" DataSourceID="SqlDataSource3" DataTextField="record_ID" DataValueField="record_ID"></asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label2" runat="server" Text="Start Date<br />(10/03/2018)"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Label ID="Label3" runat="server" Text="Start Time"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Label ID="Label5" runat="server" Text="End Date<br />(10/03/2018)"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Label ID="Label6" runat="server" Text="End Time"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"><asp:TextBox ID="txtStartDate" runat="server" Height="25px" Width="150px"></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:DropDownList ID="ddStartTime" runat="server">
                        <asp:ListItem Text="---SELECT---" Value="---SELECT---"></asp:ListItem>
                        <asp:ListItem Text="7:00 AM" Value="07:00:00"></asp:ListItem>
                        <asp:ListItem Text="7:30 AM" Value="07:30:00"></asp:ListItem>
                        <asp:ListItem Text="8:00 AM" Value="08:00:00"></asp:ListItem>
                        <asp:ListItem Text="8:30 AM" Value="08:30:00"></asp:ListItem>
                        <asp:ListItem Text="9:00 AM" Value="09:00:00"></asp:ListItem>
                        <asp:ListItem Text="9:30 AM" Value="09:30:00"></asp:ListItem>
                        <asp:ListItem Text="10:00 AM" Value="10:00:00"></asp:ListItem>
                        <asp:ListItem Text="10:30 AM" Value="10:30:00"></asp:ListItem>
                        <asp:ListItem Text="11:00 AM" Value="11:00:00"></asp:ListItem>
                        <asp:ListItem Text="11:30 AM" Value="11:30:00"></asp:ListItem>
                        <asp:ListItem Text="12:00 PM" Value="12:00:00"></asp:ListItem>
                        <asp:ListItem Text="12:30 PM" Value="12:30:00"></asp:ListItem>
                        <asp:ListItem Text="1:00 PM" Value="13:00:00"></asp:ListItem>
                        <asp:ListItem Text="1:30 PM" Value="13:30:00"></asp:ListItem>
                        <asp:ListItem Text="2:00 PM" Value="14:00:00"></asp:ListItem>
                        <asp:ListItem Text="2:30 PM" Value="14:30:00"></asp:ListItem>
                        <asp:ListItem Text="3:00 PM" Value="15:00:00"></asp:ListItem>
                        <asp:ListItem Text="3:30 PM" Value="15:30:00"></asp:ListItem>
                        <asp:ListItem Text="4:00 PM" Value="16:00:00"></asp:ListItem>
                        <asp:ListItem Text="4:30 PM" Value="16:30:00"></asp:ListItem>
                        <asp:ListItem Text="5:00 PM" Value="17:00:00"></asp:ListItem>
                        <asp:ListItem Text="5:30 PM" Value="17:30:00"></asp:ListItem>
                        <asp:ListItem Text="6:00 PM" Value="18:00:00"></asp:ListItem>
                        <asp:ListItem Text="6:30 PM" Value="18:30:00"></asp:ListItem>
                        <asp:ListItem Text="7:00 PM" Value="19:00:00"></asp:ListItem>
                        <asp:ListItem Text="7:30 PM" Value="19:30:00"></asp:ListItem>
                        <asp:ListItem Text="8:00 PM" Value="20:00:00"></asp:ListItem>
                        <asp:ListItem Text="8:30 PM" Value="20:30:00"></asp:ListItem>
                        <asp:ListItem Text="9:00 PM" Value="21:00:00"></asp:ListItem>
                        <asp:ListItem Text="9:30 PM" Value="21:30:00"></asp:ListItem>
                        <asp:ListItem Text="10:00 PM" Value="22:00:00"></asp:ListItem>
                        <asp:ListItem Text="10:30 PM" Value="22:30:00"></asp:ListItem>
                        <asp:ListItem Text="11:00 PM" Value="23:00:00"></asp:ListItem>
                        <asp:ListItem Text="11:30 PM" Value="23:30:00"></asp:ListItem>
                        <asp:ListItem Text="12:00 AM" Value="00:00:00"></asp:ListItem>
                        <asp:ListItem Text="12:30 AM" Value="00:30:00"></asp:ListItem>
                        <asp:ListItem Text="1:00 AM" Value="01:00:00"></asp:ListItem>
                        <asp:ListItem Text="1:30 AM" Value="01:30:00"></asp:ListItem>
                        <asp:ListItem Text="2:00 AM" Value="02:00:00"></asp:ListItem>
                        <asp:ListItem Text="2:30 AM" Value="02:30:00"></asp:ListItem>
                        <asp:ListItem Text="3:00 AM" Value="03:00:00"></asp:ListItem>
                        <asp:ListItem Text="3:30 AM" Value="03:30:00"></asp:ListItem>
                        <asp:ListItem Text="4:00 AM" Value="04:00:00"></asp:ListItem>
                        <asp:ListItem Text="4:30 AM" Value="04:30:00"></asp:ListItem>
                        <asp:ListItem Text="5:00 AM" Value="05:00:00"></asp:ListItem>
                        <asp:ListItem Text="5:30 AM" Value="05:30:00"></asp:ListItem>
                        <asp:ListItem Text="6:00 AM" Value="06:00:00"></asp:ListItem>
                        <asp:ListItem Text="6:30 AM" Value="06:30:00"></asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:TextBox ID="txtEndDate" runat="server" Height="25px" Width="150px"></asp:TextBox></asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:DropDownList ID="ddEndTime" runat="server">
                        <asp:ListItem Text="---SELECT---" Value="---SELECT---"></asp:ListItem>
                        <asp:ListItem Text="7:00 AM" Value="07:00:00"></asp:ListItem>
                        <asp:ListItem Text="7:30 AM" Value="07:30:00"></asp:ListItem>
                        <asp:ListItem Text="8:00 AM" Value="08:00:00"></asp:ListItem>
                        <asp:ListItem Text="8:30 AM" Value="08:30:00"></asp:ListItem>
                        <asp:ListItem Text="9:00 AM" Value="09:00:00"></asp:ListItem>
                        <asp:ListItem Text="9:30 AM" Value="09:30:00"></asp:ListItem>
                        <asp:ListItem Text="10:00 AM" Value="10:00:00"></asp:ListItem>
                        <asp:ListItem Text="10:30 AM" Value="10:30:00"></asp:ListItem>
                        <asp:ListItem Text="11:00 AM" Value="11:00:00"></asp:ListItem>
                        <asp:ListItem Text="11:30 AM" Value="11:30:00"></asp:ListItem>
                        <asp:ListItem Text="12:00 PM" Value="12:00:00"></asp:ListItem>
                        <asp:ListItem Text="12:30 PM" Value="12:30:00"></asp:ListItem>
                        <asp:ListItem Text="1:00 PM" Value="13:00:00"></asp:ListItem>
                        <asp:ListItem Text="1:30 PM" Value="13:30:00"></asp:ListItem>
                        <asp:ListItem Text="2:00 PM" Value="14:00:00"></asp:ListItem>
                        <asp:ListItem Text="2:30 PM" Value="14:30:00"></asp:ListItem>
                        <asp:ListItem Text="3:00 PM" Value="15:00:00"></asp:ListItem>
                        <asp:ListItem Text="3:30 PM" Value="15:30:00"></asp:ListItem>
                        <asp:ListItem Text="4:00 PM" Value="16:00:00"></asp:ListItem>
                        <asp:ListItem Text="4:30 PM" Value="16:30:00"></asp:ListItem>
                        <asp:ListItem Text="5:00 PM" Value="17:00:00"></asp:ListItem>
                        <asp:ListItem Text="5:30 PM" Value="17:30:00"></asp:ListItem>
                        <asp:ListItem Text="6:00 PM" Value="18:00:00"></asp:ListItem>
                        <asp:ListItem Text="6:30 PM" Value="18:30:00"></asp:ListItem>
                        <asp:ListItem Text="7:00 PM" Value="19:00:00"></asp:ListItem>
                        <asp:ListItem Text="7:30 PM" Value="19:30:00"></asp:ListItem>
                        <asp:ListItem Text="8:00 PM" Value="20:00:00"></asp:ListItem>
                        <asp:ListItem Text="8:30 PM" Value="20:30:00"></asp:ListItem>
                        <asp:ListItem Text="9:00 PM" Value="21:00:00"></asp:ListItem>
                        <asp:ListItem Text="9:30 PM" Value="21:30:00"></asp:ListItem>
                        <asp:ListItem Text="10:00 PM" Value="22:00:00"></asp:ListItem>
                        <asp:ListItem Text="10:30 PM" Value="22:30:00"></asp:ListItem>
                        <asp:ListItem Text="11:00 PM" Value="23:00:00"></asp:ListItem>
                        <asp:ListItem Text="11:30 PM" Value="23:30:00"></asp:ListItem>
                        <asp:ListItem Text="12:00 AM" Value="00:00:00"></asp:ListItem>
                        <asp:ListItem Text="12:30 AM" Value="00:30:00"></asp:ListItem>
                        <asp:ListItem Text="1:00 AM" Value="01:00:00"></asp:ListItem>
                        <asp:ListItem Text="1:30 AM" Value="01:30:00"></asp:ListItem>
                        <asp:ListItem Text="2:00 AM" Value="02:00:00"></asp:ListItem>
                        <asp:ListItem Text="2:30 AM" Value="02:30:00"></asp:ListItem>
                        <asp:ListItem Text="3:00 AM" Value="03:00:00"></asp:ListItem>
                        <asp:ListItem Text="3:30 AM" Value="03:30:00"></asp:ListItem>
                        <asp:ListItem Text="4:00 AM" Value="04:00:00"></asp:ListItem>
                        <asp:ListItem Text="4:30 AM" Value="04:30:00"></asp:ListItem>
                        <asp:ListItem Text="5:00 AM" Value="05:00:00"></asp:ListItem>
                        <asp:ListItem Text="5:30 AM" Value="05:30:00"></asp:ListItem>
                        <asp:ListItem Text="6:00 AM" Value="06:00:00"></asp:ListItem>
                        <asp:ListItem Text="6:30 AM" Value="06:30:00"></asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
                <asp:TableCell runat="server"><asp:DropDownList ID="ddDept" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="DepartmentId" Height="25px" Width="150px"></asp:DropDownList></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" ColumnSpan="6"><asp:Label ID="Label7" runat="server" Text="Comments"></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" ColumnSpan="6"><asp:TextBox ID="txtDesc" runat="server" Height="100px" TextMode="MultiLine" Width="975px"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" ColumnSpan="1" HorizontalAlign="Center">
                    <asp:Button ID="btnSearch" runat="server" Text="Search for Event" />
                </asp:TableCell>
                <asp:TableCell runat="server" ColumnSpan="1" HorizontalAlign="Center">
                    <asp:Button ID="btnClear" runat="server" Text="Clear Screen" />
                </asp:TableCell>
                <asp:TableCell runat="server" ColumnSpan="2" HorizontalAlign="Center">
                   
                </asp:TableCell>
                <asp:TableCell runat="server" ColumnSpan="1" HorizontalAlign="Center">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Selected Event" />
                </asp:TableCell>
                <asp:TableCell runat="server" ColumnSpan="1" HorizontalAlign="Center">
                    <asp:Button ID="btnAdd" runat="server" Text="New Event" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                
            </asp:TableRow>
        </asp:Table>
        
        
        
<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" CellPadding="4" CellSpacing="5" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" DataKeyNames="EventId,EventName,Description,StartDate,EndDate,DepartmentId,StartTime,EndTime,Term">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="EventId" HeaderText="EventId" InsertVisible="False" ReadOnly="True" SortExpression="EventId" Visible="False" />
        <asp:BoundField DataField="EventName" HeaderText="Event" SortExpression="EventName" />
        <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" DataFormatString="{0:M/dd/yyyy}" />
        <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="Starttime" />
        <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" DataFormatString="{0:M/dd/yyyy}" />
        <asp:BoundField DataField="EndTime" HeaderText="End time" SortExpression="EndTime" />
        <asp:BoundField DataField="Name" HeaderText="Department" SortExpression="Name" />
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        <asp:BoundField DataField="AttendanceCount" HeaderText="Attendance Count" SortExpression="AttendanceCount" />
        <asp:ButtonField ButtonType="Button" CommandName="TakeAttendance" Text="Enter Attendance" />
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Width="50px" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView></asp:Panel>
    

</asp:Content>
