VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Login Configuration Activator - Main"
   ClientHeight    =   7290
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10875
   LinkTopic       =   "frmMain"
   ScaleHeight     =   7290
   ScaleWidth      =   10875
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Sample Type Selection"
      Height          =   1335
      Left            =   120
      TabIndex        =   4
      Top             =   1440
      Width           =   5415
      Begin VB.ComboBox cmbSampleType 
         Height          =   315
         ItemData        =   "fMain.frx":0000
         Left            =   120
         List            =   "fMain.frx":0002
         TabIndex        =   5
         Text            =   "cmbSampleType"
         Top             =   360
         Width           =   4095
      End
   End
   Begin VB.ComboBox cmbItemNo 
      Height          =   315
      Left            =   240
      TabIndex        =   0
      Text            =   "cmbItemNo"
      ToolTipText     =   "Select the material no. from this list"
      Top             =   480
      Width           =   2895
   End
   Begin VB.Frame Frame1 
      Caption         =   "Item Selection"
      Height          =   1215
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   5415
      Begin VB.Label Label2 
         Caption         =   "n.a"
         Height          =   255
         Left            =   1560
         TabIndex        =   3
         Top             =   840
         Width           =   3615
      End
      Begin VB.Label Label1 
         Caption         =   "Activation Status:"
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   840
         Width           =   1455
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public RDOConn As Object
'Public NLSObject As Object
'Public SystemOCX As Object


Private Sub Form_Load()
    
    'On Error Resume Next
    
    MsgBox ("OK, form loaded.")
    Me.MousePointer = 1
    cmbSampleType.Clear
    cmbSampleType.AddItem ("Test1")
    cmbSampleType.AddItem ("Test2")

    ' Create ResultSet
    '*****************
    'Dim Rs As Object
    
    ' Get List of item nos
    '*********************
    
    'SQL$ = "select SAMPLETYPE from GWSMPCONF"
    'Set Rs = RDOConn.OpenResultset(SQL$)
    
    ' Load the ComboBox
    '******************
    'iCounter = 0

    'Rs.MoveFirst
    'Do While Not Rs.EOF
    '    iCounter = iCounter + 1
    '    cmbSampleType.AddItem (Rs.rdoColumns(0))
    '    'MsgBox ("Row #" & iCounter & " of " & iRowCount & " equals: " & Rs.rdoColumns(0) & " is " & Rs.Status)
    '    Rs.MoveNext
    'Loop
    
    'MsgBox ("Items found: " & iCounter)
        
    'Rs.Close
    
    
End Sub

