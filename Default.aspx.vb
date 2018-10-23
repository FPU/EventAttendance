
Partial Class _Default
    Inherits Page
    Dim Search As Integer = 0
    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Label1.Text = Request.ServerVariables("LOGON_USER")
        'Label1.Text = Request.ServerVariables("LOGON_USER")

        SqlDataSource1.SelectParameters.Clear()
        SqlDataSource1.SelectParameters.Add("Username", Request.ServerVariables("LOGON_USER"))
        SqlDataSource1.DataBind()
        SqlDataSource2.SelectParameters.Clear()
        SqlDataSource2.SelectParameters.Add("Username", Request.ServerVariables("LOGON_USER"))
        SqlDataSource2.DataBind()
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        If GridView1.SelectedDataKey(1).ToString <> "" Then
            Me.txtName.Text = GridView1.SelectedDataKey(1).ToString
        Else
            Me.txtName.Text = ""
        End If
        If GridView1.SelectedDataKey(2).ToString <> "" Then
            Me.txtDesc.Text = GridView1.SelectedDataKey(2).ToString
        Else
            Me.txtDesc.Text = ""
        End If
        If GridView1.SelectedDataKey(3).ToString <> "" Then
            Me.txtStartDate.Text = GridView1.SelectedDataKey(3).ToString.Replace(" 12:00:00 AM", "")
        Else
            Me.txtStartDate.Text = ""
        End If
        If GridView1.SelectedDataKey(4).ToString <> "" Then
            Me.txtEndDate.Text = GridView1.SelectedDataKey(4).ToString.Replace(" 12:00:00 AM", "")
        Else
            Me.txtEndDate.Text = ""
        End If
        If GridView1.SelectedDataKey(5).ToString <> "" Then
            ddDept.SelectedValue = GridView1.SelectedDataKey(5).ToString
        Else
            ddDept.SelectedIndex = 0
        End If
        If GridView1.SelectedDataKey(6).ToString <> "" Then
            ddStartTime.SelectedValue = GridView1.SelectedDataKey(6).ToString
        Else
            ddStartTime.SelectedIndex = 0
        End If
        If GridView1.SelectedDataKey(7).ToString <> "" Then
            ddEndTime.SelectedValue = GridView1.SelectedDataKey(7).ToString
        Else
            ddEndTime.SelectedIndex = 0
        End If

    End Sub

    Private Sub ddDept_DataBound(sender As Object, e As EventArgs) Handles ddDept.DataBound
        If ddDept.Items.Count < 1 Then
            lblMSG.Visible = True
            lblMSG.Text = "You have no departments available to you. If you believe this is a mistake please contact your supervisor to request departments be added for you."
        End If
        If ddDept.Items.Count = 1 Then
            lblMSG.Visible = False
            ddDept.SelectedIndex = 0
        End If
        If ddDept.Items.Count > 1 Then
            lblMSG.Visible = False
            If ddDept.Items.FindByValue("---SELECT---") Is Nothing Then
                ddDept.Items.Insert(0, "---SELECT---")
                ddDept.SelectedIndex = 0
            End If
        End If
    End Sub
    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Me.SqlDataSource1.SelectParameters.Clear()
        Me.SqlDataSource1.SelectCommand = "FPUEventsSearch"
        Dim Username, Name, Desc, StartDate, StartTime, EndDate, EndTime, Dept As String
        SqlDataSource1.SelectParameters.Clear()
        SqlDataSource1.SelectParameters.Add("Username", Request.ServerVariables("LOGON_USER"))
        Username = Request.ServerVariables("LOGON_USER")
        If txtName.Text.Trim() <> "" Then
            SqlDataSource1.SelectParameters.Add("Name", txtName.Text)
            Name = txtName.Text
        Else
            SqlDataSource1.SelectParameters.Add("Name", "None")
            Name = "None"
        End If
        If txtDesc.Text.Trim() <> "" Then
            SqlDataSource1.SelectParameters.Add("Desc", txtDesc.Text)
            Desc = txtDesc.Text
        Else
            SqlDataSource1.SelectParameters.Add("Desc", "None")
            Desc = "None"
        End If
        If txtStartDate.Text.Trim() <> "" Then
            SqlDataSource1.SelectParameters.Add("StartDate", txtStartDate.Text)
            StartDate = txtStartDate.Text
        Else
            SqlDataSource1.SelectParameters.Add("StartDate", "None")
            StartDate = "None"
        End If
        If ddStartTime.SelectedIndex > 0 Then
            SqlDataSource1.SelectParameters.Add("StartTime", ddStartTime.SelectedValue)
            StartTime = ddStartTime.SelectedValue
        Else
            SqlDataSource1.SelectParameters.Add("StartTime", "None")
            StartTime = "None"
        End If
        If txtEndDate.Text.Trim() <> "" Then
            SqlDataSource1.SelectParameters.Add("EndDate", txtEndDate.Text)
            EndDate = txtEndDate.Text
        Else
            SqlDataSource1.SelectParameters.Add("EndDate", "None")
            EndDate = "None"
        End If
        If ddEndTime.SelectedIndex > 0 Then
            SqlDataSource1.SelectParameters.Add("EndTime", ddEndTime.SelectedValue)
            EndTime = ddEndTime.SelectedValue
        Else
            SqlDataSource1.SelectParameters.Add("EndTime", "None")
            EndTime = "None"
        End If
        If (ddDept.SelectedIndex > 0 And ddDept.Items.Count > 1) Or (ddDept.SelectedIndex = 0 And ddDept.Items.Count = 1) Then
            SqlDataSource1.SelectParameters.Add("DepartmentId", ddDept.SelectedValue)
            Dept = ddDept.SelectedValue
        Else
            SqlDataSource1.SelectParameters.Add("DepartmentId", "None")
            Dept = "None"
        End If
        Try
            SqlDataSource1.DataBind()
        Catch ex As Exception
            txtDesc.Text = ex.ToString
        End Try
        GridView1.DataBind()
        GridView1.SelectedIndex = -1
        Search = 1
    End Sub
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim Count As Integer
        Count = Me.GridView1.Rows.Count
        If Me.txtName.Text = "" Then
            Me.lblMSG.Text = "Please enter an event name."
        Else
            Me.lblMSG.Text = ""
        End If
        If Me.txtStartDate.Text = "" Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter a start date."
            Else
                Me.lblMSG.Text = "Please enter a start date."
            End If
        End If
        If Me.ddStartTime.SelectedIndex < 1 Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter a start time."
            Else
                Me.lblMSG.Text = "Please enter a start time."
            End If
        End If
        If Me.txtEndDate.Text = "" Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter an end date."
            Else
                Me.lblMSG.Text = "Please enter an end date."
            End If
        End If
        If Me.ddEndTime.SelectedIndex < 1 Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter an end time."
            Else
                Me.lblMSG.Text = "Please enter an end time."
            End If
        End If
        If (Me.ddDept.Items.Count > 1 And Me.ddDept.SelectedIndex < 1) Or (Me.ddDept.Items.Count = 1 And Me.ddDept.SelectedIndex < 0) Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter a department."
            Else
                Me.lblMSG.Text = "Please enter a department."
            End If
        End If
        If Me.txtDesc.Text = "" Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter a description."
            Else
                Me.lblMSG.Text = "Please enter a description."
            End If
        End If
        If lblMSG.Text <> "" Then
            Me.lblMSG.Visible = True
            Me.lblMSG.Font.Bold = True
            Me.lblMSG.ForeColor = Drawing.Color.Red
            Exit Sub
        End If
        Me.SqlDataSource1.UpdateParameters("UpdatedBy").DefaultValue = Request.ServerVariables("LOGON_USER").ToString
        If Me.GridView1.SelectedIndex < 0 Then
            lblMSG.Text = "Please select an event to update by clicking the select button next to the row you want to update."
            lblMSG.Visible = True
            Me.lblMSG.Font.Bold = True
            Me.lblMSG.ForeColor = Drawing.Color.Red
            Exit Sub
        End If
        Try
            Me.SqlDataSource1.Update()
        Catch ex As Exception
            lblMSG.Text = "An error occured while trying to update your event. Please verify all data is in the correct format. if this continues contact the system administrator."
            lblMSG.Visible = True
            Me.lblMSG.Font.Bold = True
            Me.lblMSG.ForeColor = Drawing.Color.Red
            Exit Sub
        End Try
        Me.SqlDataSource1.SelectCommand = "FPUEventsGetEventsByUsername"
        SqlDataSource1.SelectParameters.Clear()
        SqlDataSource1.SelectParameters.Add("Username", Request.ServerVariables("LOGON_USER"))
        Me.SqlDataSource1.DataBind()
        Me.GridView1.DataBind()
        Me.txtName.Text = ""
        Me.txtStartDate.Text = ""
        Me.ddStartTime.SelectedIndex = 0
        Me.txtEndDate.Text = ""
        Me.ddEndTime.SelectedIndex = 0
        Me.ddDept.SelectedIndex = 0
        Me.txtDesc.Text = ""
        lblMSG.Visible = False
        Me.lblMSG.Font.Bold = False
        Me.lblMSG.ForeColor = Drawing.Color.Black
        GridView1.SelectedIndex = -1
        Search = 0

    End Sub
    Protected Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        Dim Count As Integer
        Count = Me.GridView1.Rows.Count
        If Me.txtName.Text = "" Then
            Me.lblMSG.Text = "Please enter an event name."
        Else
            Me.lblMSG.Text = ""
        End If
        If Me.txtStartDate.Text = "" Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter a start date."
            Else
                Me.lblMSG.Text = "Please enter a start date."
            End If
        End If
        If Me.ddStartTime.SelectedIndex < 1 Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter a start time."
            Else
                Me.lblMSG.Text = "Please enter a start time."
            End If
        End If
        If Me.txtEndDate.Text = "" Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter an end date."
            Else
                Me.lblMSG.Text = "Please enter an end date."
            End If
        End If
        If Me.ddEndTime.SelectedIndex < 1 Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter an end time."
            Else
                Me.lblMSG.Text = "Please enter an end time."
            End If
        End If
        If (Me.ddDept.Items.Count > 1 And Me.ddDept.SelectedIndex < 1) Or (Me.ddDept.Items.Count = 1 And Me.ddDept.SelectedIndex < 0) Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter a department."
            Else
                Me.lblMSG.Text = "Please enter a department."
            End If
        End If
        If Me.txtDesc.Text = "" Then
            If Me.lblMSG.Text.Contains("Please enter") Then
                Me.lblMSG.Text = Me.lblMSG.Text & " Please enter a description."
            Else
                Me.lblMSG.Text = "Please enter a description."
            End If
        End If
        If lblMSG.Text <> "" Then
            Me.lblMSG.Visible = True
            Me.lblMSG.Font.Bold = True
            Me.lblMSG.ForeColor = Drawing.Color.Red
            Exit Sub
        End If
        Me.SqlDataSource1.InsertParameters("CreatedBy").DefaultValue = Request.ServerVariables("LOGON_USER").ToString
        Try
            Me.SqlDataSource1.Insert()
        Catch ex As Exception
            lblMSG.Text = "An error occured while trying to insert your event. Please verify all data is in the correct format. if this continues contact the system administrator."
            lblMSG.Visible = True
            Me.lblMSG.Font.Bold = True
            Me.lblMSG.ForeColor = Drawing.Color.Red
            Exit Sub
        End Try
        If Count = Me.GridView1.Rows.Count Then
            Me.lblMSG.Text = "Your event could not be entered. This could be due to an event scheduled with the same name on the same day and time for your department already. Please verify your event information and try again."
            Me.lblMSG.Visible = True
            Me.lblMSG.Font.Bold = True
            Me.lblMSG.ForeColor = Drawing.Color.Red
            Exit Sub
        End If
        Me.SqlDataSource1.SelectCommand = "FPUEventsGetEventsByUsername"
        SqlDataSource1.SelectParameters.Clear()
        SqlDataSource1.SelectParameters.Add("Username", Request.ServerVariables("LOGON_USER"))
        Me.SqlDataSource1.DataBind()
        Me.GridView1.DataBind()
        Me.txtName.Text = ""
        Me.txtStartDate.Text = ""
        Me.ddStartTime.SelectedIndex = 0
        Me.txtEndDate.Text = ""
        Me.ddEndTime.SelectedIndex = 0
        Me.ddDept.SelectedIndex = 0
        Me.txtDesc.Text = ""
        lblMSG.Visible = False
        Me.lblMSG.Font.Bold = False
        Me.lblMSG.ForeColor = Drawing.Color.Black
        GridView1.SelectedIndex = -1
        Search = 0
    End Sub
    Protected Sub GridView1_PageIndexChanged(sender As Object, e As EventArgs) Handles GridView1.PageIndexChanged
        If Search = 1 Then
            Me.SqlDataSource1.SelectParameters.Clear()
            Me.SqlDataSource1.SelectCommand = "FPUEventsSearch"
            SqlDataSource1.SelectParameters.Clear()
            SqlDataSource1.SelectParameters.Add("Username", Request.ServerVariables("LOGON_USER"))
            SqlDataSource1.SelectParameters.Add("Name", txtName.Text)
            SqlDataSource1.SelectParameters.Add("Desc", txtDesc.Text)
            SqlDataSource1.SelectParameters.Add("StartDate", txtStartDate.Text)
            SqlDataSource1.SelectParameters.Add("StartTime", ddStartTime.SelectedValue)
            SqlDataSource1.SelectParameters.Add("EndDate", txtEndDate.Text)
            SqlDataSource1.SelectParameters.Add("EndTime", ddEndTime.SelectedValue)
            SqlDataSource1.SelectParameters.Add("DepartmentId", ddDept.SelectedValue)
            SqlDataSource1.DataBind()
            GridView1.DataBind()
            GridView1.SelectedIndex = -1
        End If
    End Sub
    Protected Sub GridView1_Sorted(sender As Object, e As EventArgs) Handles GridView1.Sorted
        If Search = 1 Then
            Me.SqlDataSource1.SelectParameters.Clear()
            Me.SqlDataSource1.SelectCommand = "FPUEventsSearch"
            SqlDataSource1.SelectParameters.Clear()
            SqlDataSource1.SelectParameters.Add("Username", Request.ServerVariables("LOGON_USER"))
            SqlDataSource1.SelectParameters.Add("Name", txtName.Text)
            SqlDataSource1.SelectParameters.Add("Desc", txtDesc.Text)
            SqlDataSource1.SelectParameters.Add("StartDate", txtStartDate.Text)
            SqlDataSource1.SelectParameters.Add("StartTime", ddStartTime.SelectedValue)
            SqlDataSource1.SelectParameters.Add("EndDate", txtEndDate.Text)
            SqlDataSource1.SelectParameters.Add("EndTime", ddEndTime.SelectedValue)
            SqlDataSource1.SelectParameters.Add("DepartmentId", ddDept.SelectedValue)
            SqlDataSource1.DataBind()
            GridView1.DataBind()
            GridView1.SelectedIndex = -1
        End If
    End Sub


    Protected Sub GridView1_DataBinding(sender As Object, e As EventArgs) Handles GridView1.DataBinding
        Dim x As Integer
        x = GridView1.Rows.Count
    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "TakeAttendance" Then
            GridView1.SelectedIndex = e.CommandArgument
            Session.Clear()
            Session.Add("Name", GridView1.SelectedDataKey(1).ToString)
            Session.Add("Id", GridView1.SelectedDataKey(0).ToString)
            Response.Redirect("Attendance.aspx")
        End If
    End Sub
End Class