VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Sample Status History"
   ClientHeight    =   4560
   ClientLeft      =   4665
   ClientTop       =   4410
   ClientWidth     =   8325
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   HelpContextID   =   10
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4560
   ScaleWidth      =   8325
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdHelp 
      Caption         =   "&Help"
      Height          =   390
      Left            =   5520
      TabIndex        =   17
      Top             =   4050
      Width           =   1230
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "&Exit"
      Height          =   390
      Left            =   6960
      TabIndex        =   16
      Top             =   4050
      Width           =   1230
   End
   Begin VB.CommandButton cmdCopy 
      Caption         =   "Copy to clipboard"
      Height          =   390
      Left            =   3600
      TabIndex        =   15
      Top             =   4050
      Width           =   1695
   End
   Begin VB.HScrollBar hsbSample 
      Height          =   195
      Left            =   1350
      TabIndex        =   5
      Top             =   450
      Width           =   1065
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "&Search"
      Height          =   375
      Left            =   2625
      TabIndex        =   4
      Top             =   75
      Width           =   1215
   End
   Begin VB.ListBox lstStatus 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2535
      ItemData        =   "frmMain.frx":0442
      Left            =   150
      List            =   "frmMain.frx":0444
      TabIndex        =   2
      Top             =   1275
      Width           =   8055
   End
   Begin VB.TextBox txtSearch 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1350
      TabIndex        =   1
      Top             =   75
      Width           =   1065
   End
   Begin VB.Label lbltxtLot 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4680
      TabIndex        =   14
      Top             =   375
      Width           =   3135
   End
   Begin VB.Label lbltxtItem 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4680
      TabIndex        =   13
      Top             =   75
      Width           =   3135
   End
   Begin VB.Label lblLot 
      Caption         =   "Lot"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4125
      TabIndex        =   12
      Top             =   375
      Width           =   540
   End
   Begin VB.Label lblItem 
      Caption         =   "Item"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4125
      TabIndex        =   11
      Top             =   75
      Width           =   540
   End
   Begin VB.Label lblLstuserName 
      Caption         =   "Username"
      Height          =   240
      Left            =   6450
      TabIndex        =   10
      Top             =   1050
      Width           =   1140
   End
   Begin VB.Label lblLstUserID 
      Caption         =   "UserID"
      Height          =   240
      Left            =   5250
      TabIndex        =   9
      Top             =   1050
      Width           =   690
   End
   Begin VB.Label lblLstDate 
      Caption         =   "Date"
      Height          =   240
      Left            =   3525
      TabIndex        =   8
      Top             =   1050
      Width           =   1065
   End
   Begin VB.Label lblLstStatus 
      Caption         =   "Status"
      Height          =   240
      Left            =   1650
      TabIndex        =   7
      Top             =   1050
      Width           =   1140
   End
   Begin VB.Label lblLstSample 
      Caption         =   "Sample"
      Height          =   240
      Left            =   300
      TabIndex        =   6
      Top             =   1050
      Width           =   915
   End
   Begin VB.Label lblSample 
      Caption         =   "Sample"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   225
      TabIndex        =   3
      Top             =   150
      Width           =   1095
   End
   Begin VB.Label lblInfo 
      Caption         =   "Developed by K. Zinsmeister"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   4080
      Width           =   2175
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCopy_Click()

Dim i As Integer
Dim txtCopy As String

For i = 0 To lstStatus.ListCount - 1
    txtCopy = txtCopy & lstStatus.List(i) & Chr$(13)
Next i
Clipboard.Clear

Clipboard.SetText txtCopy

End Sub

Private Sub cmdExit_Click()

Unload Me

End Sub

Private Sub cmdHelp_Click()
Call ShowHelpTopic(Hlp_Description)
End Sub

Private Sub cmdSearch_Click()

If txtSearch = "" Then
    MsgBox "No Sample entered", 0, "Error"
Else
    ' set the srollbar unvisible
    frmMain.hsbSample.Visible = False
    frmMain.MousePointer = 11
    Call Sleep(2)
    frmMain.lbltxtItem.Caption = getItem(frmMain.txtSearch)
    frmMain.lbltxtLot.Caption = getLot(frmMain.txtSearch)
    fStatusSearch (frmMain.txtSearch)
    frmMain.MousePointer = 0
    Call Sleep(2)
End If
End Sub

Private Sub Form_Load()

' Center form
'************
Me.Top = (Screen.Height - Me.Height) / 2
Me.Left = (Screen.Width - Me.Width) / 2
' setup help
Call SetAppHelp(Me.hWnd)
Me.HelpContextID = Hlp_Description
cmdSearch.HelpContextID = Hlp_cmdSearch
cmdHelp.HelpContextID = Hlp_cmdHelp
cmdExit.HelpContextID = Hlp_cmdExit
cmdCopy.HelpContextID = Hlp_cmdCopy
' change window-titel
frmMain.Caption = frmMain.Caption & " V" & App.Major & "." & App.Minor & "." & App.Revision

End Sub

Private Sub hsbSample_Change()

' show hourglass
frmMain.MousePointer = 11
Call Sleep(2)

frmMain.txtSearch = getSampleName(gSampleIDArray(hsbSample.Value))
frmMain.lbltxtItem.Caption = getItem(frmMain.txtSearch)
frmMain.lbltxtLot.Caption = getLot(frmMain.txtSearch)
fStatusSearch (frmMain.txtSearch)
frmMain.MousePointer = 0
Call Sleep(2)
End Sub


Private Sub txtSearch_KeyPress(KeyAscii As Integer)

' If user pressed ENTER start new search
If KeyAscii = 13 Then
    cmdSearch_Click
End If
    
End Sub


Sub Form_Unload(Cancel As Integer)
End Sub
