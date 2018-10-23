
Partial Class Attendance
    Inherits System.Web.UI.Page

    Private Sub Attendance_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsNothing(Session.Item("Name")) = True Then
            Response.Redirect("default.aspx")
        Else
            lblEventName.Text = Session.Item("Name").ToString
        End If
    End Sub
    Protected Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnInsert.Click

        SqlDataSource1.InsertParameters.Add("UploadedBy", Request.ServerVariables("LOGON_USER"))
        For Each line As String In Me.TextBox1.Text.Split(vbLf)
            SqlDataSource1.InsertParameters("List").DefaultValue = line.ToString
            SqlDataSource1.Insert()
        Next
        Me.TextBox1.Text = ""
        Session.Clear()
        Response.Redirect("default.aspx")
    End Sub
End Class
