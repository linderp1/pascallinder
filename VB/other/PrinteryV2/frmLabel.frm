VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "Comctl32.ocx"
Begin VB.Form frmLabel 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Choose the labels to print ..."
   ClientHeight    =   4095
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5280
   Icon            =   "frmLabel.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4095
   ScaleWidth      =   5280
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdModify 
      Caption         =   "Modify"
      Height          =   375
      Left            =   2085
      TabIndex        =   14
      Top             =   1575
      Width           =   1215
   End
   Begin VB.CommandButton cmdSaveSet 
      Caption         =   "Save Set"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4050
      TabIndex        =   13
      Top             =   270
      Width           =   1215
   End
   Begin VB.CommandButton cmdLoadSet 
      Caption         =   "Load Set"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2745
      TabIndex        =   12
      Top             =   270
      Width           =   1215
   End
   Begin VB.Frame fraSelectSet 
      Caption         =   "Select Set"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   45
      TabIndex        =   8
      Top             =   90
      Width           =   2655
      Begin VB.OptionButton optSelectSet 
         Caption         =   "Set 3"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   1800
         TabIndex        =   11
         Top             =   240
         Width           =   735
      End
      Begin VB.OptionButton optSelectSet 
         Caption         =   "Set 2"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   960
         TabIndex        =   10
         Top             =   240
         Width           =   735
      End
      Begin VB.OptionButton optSelectSet 
         Caption         =   "Set 1"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Value           =   -1  'True
         Width           =   735
      End
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4005
      TabIndex        =   7
      Top             =   1575
      Width           =   1095
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   285
      TabIndex        =   6
      Top             =   1575
      Width           =   1095
   End
   Begin VB.ComboBox cboCount 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "frmLabel.frx":030A
      Left            =   4125
      List            =   "frmLabel.frx":034A
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   1095
      Width           =   1095
   End
   Begin VB.ComboBox cboPrinter 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "frmLabel.frx":0395
      Left            =   2085
      List            =   "frmLabel.frx":0397
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1095
      Width           =   1935
   End
   Begin VB.ComboBox cboLab 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "frmLabel.frx":0399
      Left            =   165
      List            =   "frmLabel.frx":039B
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1095
      Width           =   1815
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1005
      TabIndex        =   2
      Top             =   3615
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
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
      Height          =   375
      Left            =   3045
      TabIndex        =   1
      Top             =   3615
      Width           =   1455
   End
   Begin ComctlLib.ListView lviLabel 
      Height          =   1455
      Left            =   165
      TabIndex        =   0
      Top             =   2055
      Width           =   5055
      _ExtentX        =   8916
      _ExtentY        =   2566
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   0   'False
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   3
      BeginProperty ColumnHeader(1) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Labname"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(2) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   1
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Labelprinter"
         Object.Width           =   2999
      EndProperty
      BeginProperty ColumnHeader(3) {0713E8C7-850A-101B-AFC0-4210102A8DA7} 
         SubItemIndex    =   2
         Key             =   ""
         Object.Tag             =   ""
         Text            =   "Count"
         Object.Width           =   882
      EndProperty
   End
   Begin VB.Label lblCount 
      Caption         =   "No of label"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4125
      TabIndex        =   17
      Top             =   855
      Width           =   975
   End
   Begin VB.Label lblLabelPrinter 
      Caption         =   "Labelprinter"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2085
      TabIndex        =   16
      Top             =   855
      Width           =   975
   End
   Begin VB.Label lblLabname 
      Caption         =   "Labname"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   165
      TabIndex        =   15
      Top             =   855
      Width           =   975
   End
   Begin VB.Line Line1 
      X1              =   45
      X2              =   5205
      Y1              =   720
      Y2              =   735
   End
End
Attribute VB_Name = "frmLabel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAdd_Click()

Dim lstItem As listItem
Dim intCounter As Integer

' check for valid data
If cboLab = "" Or cboPrinter = "" Or cboCount = "" Then
    MsgBox "Please select Labname, Printer and Labels", vbExclamation
    Exit Sub
End If
' check if Labname is already in list

For intCounter = 1 To lviLabel.ListItems.count
    If lviLabel.ListItems(intCounter) = cboLab Then
        MsgBox "Already in list, please modify the entry", vbExclamation
        Exit Sub
    End If
Next intCounter

'check for maximum of 20 entrya

If lviLabel.ListItems.count = 20 Then
    MsgBox "Maxium of 20 entry reached !", vbCritical
    Exit Sub
End If

' everything seams OK .. add the entry
Set lstItem = lviLabel.ListItems.Add(, , cboLab)
lstItem.SubItems(1) = cboPrinter
lstItem.SubItems(2) = cboCount


End Sub

Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Sub cmdDelete_Click()
' delete an selected listentry

If lviLabel.ListItems.count > 0 Then
    If lviLabel.SelectedItem.Selected = False Then
        MsgBox "No entry selected, please select a Lab to delete", vbExclamation
    Else
        lviLabel.ListItems.Remove (lviLabel.SelectedItem.Index)
    End If
End If

End Sub



'CSEH: ErrBaliDebug
Private Sub cmdLoadSet_Click()
' load a saved set from database
'<EhHeader>
On Error GoTo cmdLoadSet_Click_Err
g_Debug.SendOutPut dbgCTrace, "Entered: cmdLoadSet_Click"
'</EhHeader>
Dim intCounter As Integer
Dim lstItem As listItem

For intCounter = 0 To 2
    If optSelectSet(intCounter) = True Then
        Call getLabelSet(gUserID, intCounter + 1)
    End If
Next intCounter

' delete listview
lviLabel.ListItems.Clear
' add loaded items
For intCounter = 0 To MAX_LABELENTRY
    If gLabelEntry(intCounter, 0) <> "" Then
        Set lstItem = lviLabel.ListItems.Add(, , gLabelEntry(intCounter, 0))
        lstItem.SubItems(1) = gLabelEntry(intCounter, 1)
        lstItem.SubItems(2) = gLabelEntry(intCounter, 2)
    End If
Next intCounter

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : cmdLoadSet_Click"
Exit Sub

cmdLoadSet_Click_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmLabel.cmdLoadSet_Click"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmLabel.cmdLoadSet_Click ", , "Error"
     Resume Next
'</EhFooter>
End Sub

Private Sub cmdModify_Click()
' modify an entry in the listview
Dim listItem As listItem

Set listItem = lviLabel.FindItem(cboLab)

If listItem Is Nothing Then
    Exit Sub
Else
    With listItem
        .SubItems(1) = cboPrinter
        .SubItems(2) = cboCount
    End With
End If
End Sub

Private Sub cmdOK_Click()

Dim intCounter As Integer

' save entry of the listbox
For intCounter = 0 To MAX_LABELENTRY
    If intCounter < lviLabel.ListItems.count Then
        gLabelEntry(intCounter, 0) = lviLabel.ListItems(intCounter + 1).Text
        gLabelEntry(intCounter, 1) = lviLabel.ListItems(intCounter + 1).SubItems(1)
        gLabelEntry(intCounter, 2) = lviLabel.ListItems(intCounter + 1).SubItems(2)
    Else
        gLabelEntry(intCounter, 0) = ""
        gLabelEntry(intCounter, 1) = ""
        gLabelEntry(intCounter, 2) = ""
    End If
Next intCounter

' close form

Unload Me

End Sub

Private Sub cmdSaveSet_Click()
' save set
Dim intCounter As Integer

' save entry of the listbox
For intCounter = 0 To MAX_LABELENTRY
    If intCounter < lviLabel.ListItems.count Then
        gLabelEntry(intCounter, 0) = lviLabel.ListItems(intCounter + 1).Text
        gLabelEntry(intCounter, 1) = lviLabel.ListItems(intCounter + 1).SubItems(1)
        gLabelEntry(intCounter, 2) = lviLabel.ListItems(intCounter + 1).SubItems(2)
    Else
        gLabelEntry(intCounter, 0) = ""
        gLabelEntry(intCounter, 1) = ""
        gLabelEntry(intCounter, 2) = ""
    End If
Next intCounter

For intCounter = 0 To 2
    If optSelectSet(intCounter) = True Then
        Call saveLabelSet(gUserID, intCounter + 1)
    End If
Next intCounter

End Sub

'CSEH: ErrBaliDebug
Private Sub Form_Load()
'<EhHeader>
On Error GoTo Form_Load_Err
g_Debug.SendOutPut dbgCTrace, "Entered: Form_Load"
'</EhHeader>
Dim intCounter As Integer
Dim lstItem As listItem

' Center form
'*************************
    Me.Top = (Screen.Height - Me.Height) / 2
    Me.Left = (Screen.Width - Me.Width) / 2

' fill listbox for labelprinter
For intCounter = 0 To MAX_PRINTER
    If gPrinterListLabel(intCounter, 0) = "" Then
        Exit For
    Else
        cboPrinter.AddItem gPrinterListLabel(intCounter, 0)
    End If
Next intCounter

' fill listbox for Mainlab
For intCounter = 0 To MAX_MAINLAB
    If gMainlabs(intCounter) = "" Then
        Exit For
    Else
        cboLab.AddItem gMainlabs(intCounter)
    End If
Next intCounter

' fill listview if values exists
' first check if the array is already filled
' if no load default set 1
If gLabelEntry(0, 0) = "" Then
    Call getLabelSet(gUserID, 1)
End If

For intCounter = 0 To MAX_LABELENTRY
    If gLabelEntry(intCounter, 0) <> "" Then
        Set lstItem = lviLabel.ListItems.Add(, , gLabelEntry(intCounter, 0))
        lstItem.SubItems(1) = gLabelEntry(intCounter, 1)
        lstItem.SubItems(2) = gLabelEntry(intCounter, 2)
    End If
Next intCounter


'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : Form_Load"
Exit Sub

Form_Load_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmLabel.Form_Load"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmLabel.Form_Load ", , "Error"
     Resume Next
'</EhFooter>
End Sub


Private Sub lviLabel_ItemClick(ByVal Item As ComctlLib.listItem)
' push selected Item into Comboboxes to modify them

cboLab = Item.Text
cboPrinter = Item.SubItems(1)
cboCount = Item.SubItems(2)

End Sub

Private Sub optSelectSet_DblClick(Index As Integer)
Call cmdLoadSet_Click
End Sub
