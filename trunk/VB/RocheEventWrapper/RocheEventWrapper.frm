VERSION 5.00
Begin VB.Form frmRocheEventWrapper 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "This is the Name of the Event"
   ClientHeight    =   1905
   ClientLeft      =   5040
   ClientTop       =   3330
   ClientWidth     =   5790
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1905
   ScaleMode       =   0  'User
   ScaleWidth      =   5790
   Begin VB.ComboBox cboSampleIDs 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   2640
      TabIndex        =   5
      Top             =   120
      Visible         =   0   'False
      Width           =   2895
   End
   Begin VB.CommandButton btnHelp 
      Caption         =   "&Help"
      Height          =   375
      Left            =   4440
      TabIndex        =   4
      Top             =   840
      Width           =   1095
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2880
      TabIndex        =   3
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   1440
      TabIndex        =   2
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox txtLabelContent 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Index           =   0
      Left            =   2640
      TabIndex        =   1
      Top             =   120
      Width           =   2895
   End
   Begin VB.Label lblLabel 
      Caption         =   " Sample ID"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   2175
   End
End
Attribute VB_Name = "frmRocheEventWrapper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub btnCancel_Click()
    SampleName = ""
    Unload Me
End Sub

Private Sub btnHelp_Click()
    MsgBox "Here you see some Help-Message"
End Sub

Private Sub btnOK_Click()

Dim Command As String
Dim InfoString As String
Dim ParameterListe As String
Dim ParameterIndex As Integer

    If SampleListFlag = True Then
        SampleName = cboSampleIDs.Text
        LabelContent(LBound(LabelContent, 1)) = SampleName
    Else
        LabelContent(LBound(LabelContent, 1)) = txtLabelContent(0).Text
        SampleName = txtLabelContent(0).Text
        txtLabelContent(0).SelStart = 0
        txtLabelContent(0).SelLength = 8
        txtLabelContent(0).SetFocus
    End If
    
    ParameterListe = "('"
        
    For ParameterIndex = LBound(LabelContent, 1) To UBound(LabelContent, 1)
        If ParameterIndex = 0 Then
            ParameterListe = ParameterListe & LabelContent(ParameterIndex)
        Else
            ParameterListe = ParameterListe & "','" & LabelContent(ParameterIndex)
        End If
    Next ParameterIndex
      
    ParameterListe = ParameterListe & "')"

    Command = "Macro '" & MacroFile & "'; lReturn$ = " & MacroName & ParameterListe
    objRocheEventWrapper.SystemOCX.Evaluate (Command)
    
    InfoString = objRocheEventWrapper.SystemOCX.GetVar("lReturn$")
    
    If InStr(InfoString, "StartTime mapped") > 0 Then
        MsgBox InfoString, vbInformation, "Macro execution successful"
    Else
        MsgBox InfoString, vbCritical, "Error in macro execution"
    End If
    
    If SampleListFlag = True Then
        If SampleIndex < UBound(SampleList) Then
           cboSampleIDs.Text = cboSampleIDs.List(SampleIndex + 1)
        Else
            MsgBox "Last sample reached in list!", vbInformation, "Remark"
        End If
    End If
    
    objRocheEventWrapper.SystemOCX.Evaluate ("Remove lReturn$")
    
    If SampleListFlag = False Then

    End If
    
End Sub


Private Sub cboSampleIDs_Change()

    If SampleIndex < 0 Then
        SampleIndex = 0
    End If
    
    If SampleIndex < UBound(SampleList) Then
        SampleIndex = SampleIndex + 1
        cboSampleIDs.ListIndex = SampleIndex
    End If
    
End Sub

Private Sub cboSampleIDs_Click()
    SampleIndex = cboSampleIDs.ListIndex
End Sub

Public Sub Form_Load()

Dim Command As String
Dim EventParameterRS As rdoResultset
Dim Offset As Integer
Dim SQL1 As String
Dim SQL2 As String

Dim LabelText() As String
Dim TextProperty() As Integer

SQL1 = "select UserPrompt, DefaultValue, Modifiable " & _
       "  from GWEVENTPARAMETER" & _
       " where EVENTNAME = '" & GWEventName & "'" & _
       " order by PARAMETERID"
               
SQL2 = "select PROGRAM " & _
       "  from GWEVENT" & _
       " where EVENTNAME = '" & GWEventName & "'" & _
       "   and EVENTTYPE = 1"
               
Screen.MousePointer = vbHourglass
            
Set EventParameterRS = objRocheEventWrapper.RDOConn.OpenResultset(SQL1, rdOpenForwardOnly, rdConcurReadOnly)

ParameterIndex = 0

Do Until EventParameterRS.EOF

      ReDim Preserve LabelText(0 To ParameterIndex)
      ReDim Preserve LabelContent(0 To ParameterIndex)
      ReDim Preserve TextProperty(0 To ParameterIndex)
                 
      If IsNull(EventParameterRS!UserPrompt) = 0 Then
          LabelText(ParameterIndex) = EventParameterRS!UserPrompt
      Else
          LabelText(ParameterIndex) = "None"
      End If
         
      If IsNull(EventParameterRS!DefaultValue) = 0 Then
         LabelContent(ParameterIndex) = EventParameterRS!DefaultValue
      Else
         LabelContent(ParameterIndex) = ""
      End If
         
      TextProperty(ParameterIndex) = EventParameterRS!Modifiable
         
      ParameterIndex = ParameterIndex + 1
         
      EventParameterRS.MoveNext
      
Loop
   
EventParameterRS.Close
objRocheEventWrapper.NLSObject.RDOFlush

Set EventParameterRS = objRocheEventWrapper.RDOConn.OpenResultset(SQL2, rdOpenForwardOnly, rdConcurReadOnly)

MacroFile = EventParameterRS!PROGRAM
MacroName = Left(MacroFile, Len(MacroFile) - 4)

EventParameterRS.Close
objRocheEventWrapper.NLSObject.RDOFlush

frmRocheEventWrapper.Caption = GWEventName

LabelIndex = 0

If SampleListFlag = True Then

    txtLabelContent(Index).Visible = False
    
    cboSampleIDs.Enabled = True
    cboSampleIDs.Visible = True
    
    For SampleIndex = LBound(SampleList) To UBound(SampleList)
    
        SampleID = SampleList(SampleIndex)
        
        Set SampleRS = objRocheEventWrapper.RDOConn.OpenResultset("SELECT SAMPNAME FROM SAMPLE WHERE SAMPID  = " & SampleID)
        cboSampleIDs.AddItem SampleRS("SAMPNAME")

        cboSampleIDs.ItemData(cboSampleIDs.NewIndex) = SampleIndex
        SampleRS.Close
        objRocheEventWrapper.NLSObject.RDOFlush

    Next SampleIndex
    
    SampleIndex = -1
    cboSampleIDs.ListIndex = 0
    cboSampleIDs.Text = cboSampleIDs.List(cboSampleIDs.ListIndex)
    
    SampleIndex = cboSampleIDs.ListIndex
                
ElseIf IsEmpty(SampleID) = 0 And SampleID > 0 Then

    Set SampleRS = objRocheEventWrapper.RDOConn.OpenResultset("SELECT SAMPNAME FROM SAMPLE WHERE SAMPID  = " & SampleID)
    SampleName = SampleRS("SAMPNAME")
    SampleRS.Close
    objRocheEventWrapper.NLSObject.RDOFlush

    txtLabelContent(LabelIndex).Text = SampleName

Else

    txtLabelContent(LabelIndex).Text = ""
    
End If

lblLabel(LabelIndex).Caption = LabelText(LabelIndex)

Offset = lblLabel(LabelIndex).Height + 130

For LabelIndex = 1 To UBound(LabelText)

    Load lblLabel(LabelIndex)
    Load txtLabelContent(LabelIndex)
    txtLabelContent(LabelIndex).Visible = True
    
    If TextProperty(LabelIndex) = 0 Then
        
        txtLabelContent(LabelIndex).Enabled = False
        lblLabel(LabelIndex).Visible = False
        txtLabelContent(LabelIndex).Visible = False
    
    Else
        
        txtLabelContent(LabelIndex).Enabled = True
        lblLabel(LabelIndex).Visible = True
        txtLabelContent(LabelIndex).Visible = True
    
        frmRocheEventWrapper.Height = frmRocheEventWrapper.Height + Offset
    
        lblLabel(LabelIndex).Top = lblLabel(LabelIndex - 1).Top + Offset
        txtLabelContent(LabelIndex).Top = txtLabelContent(LabelIndex - 1).Top + Offset
    
        btnOK.Top = btnOK.Top + Offset
        btnCancel.Top = btnCancel.Top + Offset
        btnHelp.Top = btnHelp.Top + Offset

    End If
        
    lblLabel(LabelIndex).Caption = LabelText(LabelIndex)
    txtLabelContent(LabelIndex).Text = LabelContent(LabelIndex)
    
Next LabelIndex

Screen.MousePointer = vbDefault

DoEvents

End Sub

