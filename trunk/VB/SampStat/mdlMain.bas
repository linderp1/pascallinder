Attribute VB_Name = "mdlMain"
Option Explicit
' API declarations
Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)


Global gUser As String
Global gBALIConn As rdoConnection
Global gSampleIDArray As Variant
Global gNLSObject As Object

Sub main()

End Sub


Public Sub fStatusSearch(lSampleName As String)

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String
Dim txtAdd As String
Dim txtStatus As String
Dim i As Integer


If lSampleName = "" Then
    'MsgBox "No Sample submitted"
    Exit Sub
End If

On Error GoTo Err_StatusSearch

Set MyConn = gBALIConn.CreatePreparedStatement("", "")

sqlText = "select * from BALI_SAMPLEHISTORYVW where SAMPLENAME = '" & lSampleName & "'" & " order by change"
    
MyConn.SQL = sqlText
' clear the ListBox
Do While (frmMain.lstStatus.ListCount) > 0
    frmMain.lstStatus.RemoveItem 0
Loop

Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            For i = 0 To 4
                If i = 1 Then
                    ' we need to format the Status to a fixed lenght
                    txtStatus = MyRs.rdoColumns(i)
                    Do While Len(txtStatus) < 18
                        txtStatus = txtStatus & " "
                    Loop
                    txtAdd = txtAdd & txtStatus
                ElseIf i = 3 Then
                    ' we need to format the UserName to a fixed lenght
                    txtStatus = MyRs.rdoColumns(i)
                    Do While Len(txtStatus) < 9
                        txtStatus = txtStatus & " "
                    Loop
                    txtAdd = txtAdd & txtStatus
                Else
                    txtAdd = txtAdd & MyRs.rdoColumns(i) & " "
                End If
            Next i
            frmMain.lstStatus.AddItem txtAdd
            txtAdd = ""
            MyRs.MoveNext
        Wend
    MyRs.Close
MyConn.Close

GoTo Exit_StatusSearch

Err_StatusSearch:

    MsgBox "Error in function StatusSearch"
    Exit Sub
    
Exit_StatusSearch:

End Sub

Public Function getSampleName(lSampleID)
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String

If lSampleID = "" Then
    'MsgBox "No Sample submitted"
    Exit Function
End If

On Error GoTo Err_getSampleName

Set MyConn = gBALIConn.CreatePreparedStatement("", "")

sqlText = "select SAMPNAME from SAMPLE where SAMPID = " & lSampleID

MyConn.SQL = sqlText

Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getSampleName = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
    MyRs.Close
MyConn.Close

GoTo Exit_getSampleName

Err_getSampleName:

    MsgBox "Error in function getSampleName"
    Exit Function
    
Exit_getSampleName:

End Function

Public Function getItem(lSampleName)
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String

If lSampleName = "" Then
    'MsgBox "No Sample submitted"
    Exit Function
End If

On Error GoTo Err_getItem

Set MyConn = gBALIConn.CreatePreparedStatement("", "")

sqlText = "select ITEMNO from BALI_ATTRIB_ITEMVW where SAMPLENAME = '" & lSampleName & "'"
    
MyConn.SQL = sqlText

Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getItem = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
    MyRs.Close
MyConn.Close

GoTo Exit_getItem

Err_getItem:
    MsgBox "Error in function getItem"
    Exit Function
    
Exit_getItem:

End Function

Public Function getLot(lSampleName)
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String

If lSampleName = "" Then
    'MsgBox "No Sample submitted"
    Exit Function
End If

On Error GoTo Err_getLot

Set MyConn = gBALIConn.CreatePreparedStatement("", "")

sqlText = "select LOTNO from BALI_ATTRIB_LOTVW where SAMPLENAME = '" & lSampleName & "'"
    
MyConn.SQL = sqlText

Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getLot = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
    MyRs.Close
MyConn.Close

GoTo Exit_getLot

Err_getLot:
    MsgBox "Error in function getLot"
    Exit Function
    
Exit_getLot:

End Function
