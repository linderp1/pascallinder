VERSION 5.00
Begin VB.Form frmSelect 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Select .."
   ClientHeight    =   4605
   ClientLeft      =   6480
   ClientTop       =   4980
   ClientWidth     =   5760
   Icon            =   "frmSelect.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4605
   ScaleWidth      =   5760
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtSampletype 
      Height          =   285
      Left            =   720
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   4080
      Visible         =   0   'False
      Width           =   3255
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   4320
      TabIndex        =   4
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   4080
      Width           =   1215
   End
   Begin VB.ListBox lstList 
      Height          =   3375
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   5535
   End
   Begin VB.TextBox txtSearch 
      Height          =   285
      Left            =   1920
      TabIndex        =   1
      Text            =   "*"
      Top             =   120
      Width           =   2655
   End
   Begin VB.Label lblSearch 
      Caption         =   "enter a search string .."
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1815
   End
End
Attribute VB_Name = "frmSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim flagDblClick As Integer

Private Function fillList(lSearch, ltxtSearch, Optional lSampletype)
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String
Dim lCounter As Integer ' counter for the listbox
Dim lCounterString As Integer ' counter for the string
Dim replace As String
lCounter = 0

If flagDblClick = 1 Then Exit Function

    frmSelect.MousePointer = 11

On Error GoTo fillList_Err
' check if empty
    If ltxtSearch = "" Then
        ltxtSearch = "%"
        txtSearch = "*"
    End If
' check for string *
    For lCounterString = 1 To Len(ltxtSearch)
        If Mid$(ltxtSearch, lCounterString, 1) = "*" Then
            replace = replace & "%"
        Else
            replace = replace & Mid$(ltxtSearch, lCounterString, 1)
        End If
    Next lCounterString
' delete all entries in listbox
        lstList.Clear

Select Case lSearch
    Case 1  ' search for ProductCode
        Set MyConn = gBALIConn.CreatePreparedStatement("", "")
        sqlText = "select distinct PRODUCTCODE, PRODUCTCODEDESC " _
                & "From GWLOGINKEYSADMIN where SAMPLETYPE = '" _
                & lSampletype & "' and PRODUCTCODE like '" _
                & replace & "' order by PRODUCTCODE"
        MyConn.SQL = sqlText
        Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
            While Not MyRs.EOF
                lstList.AddItem (MyRs.rdoColumns(0) & Chr$(9) & MyRs.rdoColumns(1))
                MyRs.MoveNext
            Wend
        ' close query and connection
        MyRs.Close
        MyConn.Close
    Case 2  ' search for Spec
        Set MyConn = gBALIConn.CreatePreparedStatement("", "")
        sqlText = "select distinct SPECNAME " _
            & "From GWSPECAPPROVED where SPECNAME like '" _
            & replace & "' order by SPECNAME"
        MyConn.SQL = sqlText
        Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
            While Not MyRs.EOF
                lstList.AddItem (MyRs.rdoColumns(0))
                MyRs.MoveNext
            Wend
        ' close query and connection
        MyRs.Close
        MyConn.Close
End Select
    frmSelect.MousePointer = 0


GoTo fillList_Exit

fillList_Err:
    Me.MousePointer = 0
    Call formatError("fillList")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
fillList_Exit:
End Function

Private Sub cmdCancel_Click()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       cmdCancel_Click
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       04.07.01 16:45:22
' Parameters :
' Description:       Close form if User pressed cancel
'--------------------------------------------------------------------------------
'</CSCM>
Unload Me
flagDblClick = 0
End Sub

Private Sub cmdOK_Click()
If gSearch = 1 Then
    If lstList.ListIndex <> -1 Then
        ' update textfield
        txtSearch = Mid$(lstList.Text, 1, InStr(lstList.Text, Chr$(9)) - 1)
    End If
    frmMain.txtConfProductCode = txtSearch
Else
    txtSearch = lstList.Text
    frmMain.txtConfSpecification = txtSearch
End If
flagDblClick = 0
Unload Me
End Sub

Private Sub Form_Load()
' Center form
    Me.Top = (Screen.Height - Me.Height) / 2
    Me.Left = (Screen.Width - Me.Width) / 2
' set the values
    If gSearch = 1 Then
        frmSelect.txtSearch = frmMain.txtConfProductCode
        frmSelect.txtSampletype = frmMain.cboConfSampletype.Text
        frmSelect.Caption = "Select Productcode ..."
    Else
        frmSelect.txtSearch = frmMain.txtConfSpecification
        frmSelect.Caption = "Select Specification ..."
    End If
    
    Call fillList(gSearch, txtSearch, txtSampletype)
End Sub

Private Sub lstList_DblClick()
' update textfield
flagDblClick = 1
    If gSearch = 1 Then
        txtSearch = Mid$(lstList.Text, 1, InStr(lstList.Text, Chr$(9)) - 1)
    Else
        txtSearch = lstList.Text
    End If
Call cmdOK_Click
End Sub

Private Sub txtSearch_Change()
    Call fillList(gSearch, txtSearch, txtSampletype)
End Sub

