VERSION 5.00
Begin VB.Form frmResult 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Test Info"
   ClientHeight    =   7800
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9225
   Icon            =   "frmResult.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7800
   ScaleWidth      =   9225
   StartUpPosition =   1  'CenterOwner
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
      Left            =   3600
      TabIndex        =   1
      Top             =   7320
      Width           =   1710
   End
   Begin VB.Frame Frame1 
      Caption         =   "Message"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7095
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   9015
      Begin VB.TextBox txtResult 
         BeginProperty Font 
            Name            =   "Courier"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   6765
         IMEMode         =   3  'DISABLE
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   0
         Top             =   240
         Width           =   8805
      End
   End
End
Attribute VB_Name = "frmResult"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Me.Caption = gsModuleName
End Sub

Private Sub OK_Click()
    Unload Me
End Sub

Private Sub txtResult_KeyPress(KeyAscii As Integer)
    If (KeyAscii = vbKeyEscape) Then
        Call OK_Click
    End If
End Sub
