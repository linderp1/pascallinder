VERSION 5.00
Begin VB.Form frmRun 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CP Macro Starter"
   ClientHeight    =   1650
   ClientLeft      =   3750
   ClientTop       =   4665
   ClientWidth     =   4560
   Icon            =   "frmRun.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1650
   ScaleWidth      =   4560
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame grpField 
      Caption         =   "Please enter a XXXX :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   4335
      Begin VB.TextBox txtField 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   120
         TabIndex        =   0
         Top             =   360
         Width           =   4125
      End
   End
   Begin VB.CommandButton CANCEL 
      Caption         =   "&Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   2400
      TabIndex        =   2
      Top             =   1080
      Width           =   1485
   End
   Begin VB.CommandButton OK 
      Caption         =   "&Ok"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   840
      TabIndex        =   1
      Top             =   1080
      Width           =   1455
   End
End
Attribute VB_Name = "frmRun"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub ISOK()
'**************************************************
' Verification of
'**************************************************
    Is_ok = False
    
    If Len(Trim(txtField.Text)) = 0 Then
        MsgBox "You have to specify a " & gsFieldLabel, vbExclamation, _
                gsModuleName
        txtField.SetFocus
        Exit Sub
    End If
    
    gsFieldText = UCase(Trim(txtField.Text))
    
    Is_ok = True
    Unload Me
End Sub


Private Sub CANCEL_Click()
'**************************************************
' Traitement du boutton Cancel
'**************************************************
Debug.Print "Cancel " & KeyAscii
    Is_ok = False
    Unload Me
End Sub


Private Sub Form_Load()
    '**************************************************
    ' Set the form title using the parameter specified
    '**************************************************
    grpField.Caption = "Please enter a " & gsFieldLabel & " :"
    Me.Caption = gsModuleName
End Sub

Private Sub OK_Click()
    '**************************************************
    ' OK Button was pressed
    '**************************************************
    Call ISOK
End Sub

Private Sub OK_GotFocus()
    '**************************************************
    ' In case we are exiting the txt field with a tab
    ' (so the OK button gets the focus) and something
    ' was entered....press the OK button automatically
    '**************************************************
    If Len(Trim(txtField.Text)) > 0 Then
        Call OK_Click
    End If
End Sub

Private Sub txtField_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyBack Then
        Exit Sub
    End If
    '**************************************************
    ' If return key is hit start the same as for the OK button
    '**************************************************
    If (KeyAscii = vbKeyReturn) Then
        Call OK_Click
    End If
    If (KeyAscii = vbKeyEscape) Then
        Call CANCEL_Click
    End If
End Sub
