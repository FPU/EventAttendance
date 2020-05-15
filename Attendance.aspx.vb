
Partial Class Attendance
    Inherits System.Web.UI.Page

    Private Sub Attendance_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsNothing(Session.Item("Name")) = True Then
            Response.Redirect("default.aspx")
        Else
            If IsPostBack = False Then
                lblEventName.Text = Session.Item("Name").ToString
            End If
        End If
    End Sub
    Protected Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnInsert.Click

        SqlDataSource1.InsertParameters.Add("UploadedBy", Request.ServerVariables("LOGON_USER"))
        Me.TextBox1.Text = Me.TextBox1.Text.Replace(" ", "")
        Me.TextBox1.Text = Me.TextBox1.Text.Replace(",", vbLf)

        For Each line As String In Me.TextBox1.Text.Split(vbLf)
            If line <> "" Then
                SqlDataSource1.InsertParameters("List").DefaultValue = line.ToString
                Try
                    SqlDataSource1.Insert()
                Catch ex As Exception
                    Me.lblEventName.Text = ex.ToString
                    Exit Sub
                End Try
            End If
        Next
        Me.TextBox1.Text = ""
        Session.Clear()
        Response.Redirect("default.aspx")
    End Sub
End Class
