VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmProcChoice 
   Caption         =   "Add Test Advanced"
   ClientHeight    =   7950
   ClientLeft      =   390
   ClientTop       =   945
   ClientWidth     =   12450
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   7950
   ScaleWidth      =   12450
   Begin VB.Frame grpVar 
      Caption         =   "Var Disp Name:"
      Height          =   2415
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   6015
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid mshfxgVar 
         Height          =   2055
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   3625
         _Version        =   393216
         Cols            =   3
         FixedCols       =   0
         BackColorSel    =   -2147483643
         ForeColorSel    =   -2147483630
         FocusRect       =   0
         SelectionMode   =   1
         AllowUserResizing=   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         _NumberOfBands  =   1
         _Band(0).Cols   =   3
      End
   End
   Begin VB.Frame grpSampleProcedures 
      Caption         =   "Already requested procedures:"
      Height          =   2415
      Left            =   6600
      TabIndex        =   6
      Top             =   120
      Width           =   5775
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid mshfxgProcs 
         Height          =   2055
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   3625
         _Version        =   393216
         Cols            =   5
         FixedCols       =   0
         BackColorSel    =   -2147483643
         ForeColorSel    =   -2147483630
         FocusRect       =   0
         SelectionMode   =   1
         AllowUserResizing=   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         _NumberOfBands  =   1
         _Band(0).Cols   =   5
      End
   End
   Begin VB.Frame grpProcedures 
      Caption         =   "Select Procedures:"
      Height          =   4695
      Left            =   120
      TabIndex        =   2
      Top             =   2640
      Width           =   12255
      Begin VB.CommandButton cmdRemove 
         Caption         =   "<"
         Height          =   375
         Left            =   6000
         TabIndex        =   11
         Top             =   3000
         Width           =   495
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   ">"
         Height          =   375
         Left            =   6000
         TabIndex        =   10
         Top             =   2400
         Width           =   495
      End
      Begin VB.TextBox txtFilter 
         Height          =   350
         Left            =   1800
         TabIndex        =   5
         Text            =   "Text1"
         Top             =   240
         Width           =   2775
      End
      Begin VB.CommandButton cmdFilter 
         Caption         =   "Filter"
         Height          =   375
         Left            =   4680
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid mshfxgSpecs 
         Height          =   3855
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   6800
         _Version        =   393216
         Cols            =   5
         FixedCols       =   0
         BackColorSel    =   -2147483643
         ForeColorSel    =   -2147483630
         FocusRect       =   0
         SelectionMode   =   1
         AllowUserResizing=   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         _NumberOfBands  =   1
         _Band(0).Cols   =   5
         _Band(0).GridLinesBand=   1
         _Band(0).TextStyleBand=   0
         _Band(0).TextStyleHeader=   0
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid mshfxgRequest 
         Height          =   3855
         Left            =   6600
         TabIndex        =   13
         Top             =   720
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   6800
         _Version        =   393216
         Cols            =   5
         FixedCols       =   0
         FocusRect       =   0
         SelectionMode   =   1
         AllowUserResizing=   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         _NumberOfBands  =   1
         _Band(0).Cols   =   5
         _Band(0).GridLinesBand=   1
         _Band(0).TextStyleBand=   0
         _Band(0).TextStyleHeader=   0
      End
      Begin VB.Label Label2 
         Caption         =   "Procedure contains:"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   300
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "Procedures to request:"
         Height          =   255
         Left            =   6600
         TabIndex        =   12
         Top             =   480
         Width           =   2895
      End
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   9120
      TabIndex        =   1
      Top             =   7440
      Width           =   1575
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   10800
      TabIndex        =   0
      Top             =   7440
      Width           =   1575
   End
End
Attribute VB_Name = "frmProcChoice"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public RDOConn As Object

'*******************************************************************************
'* fill all specs in the given library
'*******************************************************************************
Public Sub mGetVar(psSID As String, psVarName As String)

    Dim sSQL        As String
    Dim rsVar     As rdoResultset
    Dim lArrayIx     As Long
    Dim lColIx     As Long
    
    ' --------------------------------------------------------------------------
    ' Fill the variable
    ' --------------------------------------------------------------------------
    sSQL = "select resrowix, rescolumnix, resstrval, v.dispname as varname" _
            & " from tableresult t, var v " _
            & " where sampid = " & psSID _
            & " and v.specrevid = t.specrevid " _
            & " and upper(v.name) = '" & UCase(psVarName) & "' " _
            & " order by resrowix, rescolumnix"

    Set rsVar = RDOConn.OpenResultset(sSQL, rdOpenForwardOnly, rdConcurReadOnly)
    
    ReDim Preserve gtArray(0)
    ReDim Preserve gtArray(0).sColValues(0)
    
    While Not rsVar.EOF()
        
        ' ---------------------------------------------------------------------
        ' Get the row and column where we are in the table
        ' ---------------------------------------------------------------------
        lArrayIx = rsVar!resrowix
        lColIx = rsVar!rescolumnix
        
        ' ---------------------------------------------------------------------
        ' Fetch the variable name to show
        ' ---------------------------------------------------------------------
        gsTestName = rsVar!varname
        
        ' ---------------------------------------------------------------------
        ' Redim the array to the number of rows, and the columns to the
        ' columns found
        ' ---------------------------------------------------------------------
        ReDim Preserve gtArray(lArrayIx)
        ReDim Preserve gtArray(lArrayIx).sColValues(lColIx)
        
        With gtArray(lArrayIx)
            .sColValues(lColIx) = rsVar!resstrval
        End With
        
        rsVar.MoveNext
        DoEvents
        
    Wend
    
    ' --------------------------------------------------------------------------
    ' Clean up
    ' --------------------------------------------------------------------------
    rsVar.Close
    Set rsVar = Nothing
    
End Sub



'*******************************************************************************
'* fill all procs from the given sample to the listox
'*******************************************************************************
Public Sub mGetSampleProcs(psSID As String)

    Dim sSQL        As String
    Dim rsProcs     As rdoResultset
    Dim lProcIx     As Long
    Dim sUsers      As String
    
    ' --------------------------------------------------------------------------
    ' Init
    ' --------------------------------------------------------------------------
    lProcIx = 0
    ReDim gtProcs(lProcIx)
    
    ' --------------------------------------------------------------------------
    ' Fill Proc Choice List
    ' --------------------------------------------------------------------------
    sSQL = "SELECT specname || '{' || specversion || ',' " _
            & " || libraryname || '}' as SPECHANDLE, S.DISPNAME, " _
            & " DECODE(PL.PROCSTATUS, " _
            & " 1, 'Requested', " _
            & " 2,'Released', " _
            & " 3,'Scheduled', " _
            & " 4,'ResultExists', " _
            & " 5,'Completed', " _
            & " 6,'ValidatedLevel0', " _
            & " 7,'ValidatedLevel1', " _
            & " 8,'ValidatedLevel2', " _
            & " 9,'ValidatedLevel3', " _
            & "10,'ValidatedLevel4', " _
            & "11,'ValidatedLevel5', " _
            & "16,'Validated') as PROCSTATUS " _
            & " FROM PROCLOOPSTAT PL, SPEC S " _
            & " WHERE SAMPID = " & psSID & " AND PL.SPECREVID = S.SPECREVID " _
            & " AND PL.CURRAUDITFLAG = 1 " _
            & " AND PL.SPECTYPE IN ('T','C') " _
            & " ORDER BY s.specname "
            
    Set rsProcs = RDOConn.OpenResultset(sSQL, rdOpenForwardOnly, rdConcurReadOnly)
    
    While Not rsProcs.EOF()
        
        lProcIx = lProcIx + 1
        ReDim Preserve gtProcs(lProcIx)
        With gtProcs(lProcIx)
            .sSpecHandle = rsProcs!SPECHANDLE
            .sDispName = rsProcs!DISPNAME
            .sStatus = rsProcs!PROCSTATUS
        End With
        rsProcs.MoveNext
        DoEvents
        
    Wend
    
    ' --------------------------------------------------------------------------
    ' Clean up
    ' --------------------------------------------------------------------------
    rsProcs.Close
    Set rsProcs = Nothing
    
End Sub


'*******************************************************************************
'* Update grid by selection
'*******************************************************************************
Public Sub mFillSpecGrid()

    Dim lSpecIx     As Long
    Dim sInsert     As String
    Dim bShowIt     As Boolean
    Dim lColor      As Long
    Dim lindex      As Long
    
    ' --------------------------------------------------------------------------
    ' Init
    ' --------------------------------------------------------------------------
    With mshfxgSpecs
        .Clear
        .FixedCols = 0
        .FixedRows = 0
        .Cols = 3
        .Rows = 0
        .AddItem vbTab & "Procedure" & vbTab & "Testname"
        .Col = 0
        .Row = 0
        .ColWidth(0) = 250
        .ColWidth(1) = 2500
        .ColWidth(2) = 2500
        .Visible = False
    End With
    
    ' --------------------------------------------------------------------------
    ' Fill with criteria
    ' --------------------------------------------------------------------------
    For lSpecIx = 1 To UBound(gtSpecs)
        
        With gtSpecs(lSpecIx)
        
            ' ------------------------------------------------------------------
            ' prepare insert string (one line)
            ' ------------------------------------------------------------------
            sInsert = vbTab & .sSpecHandle & vbTab & .sDispName
            bShowIt = True
            lColor = vbBlack
         
            If bShowIt Then
                mshfxgSpecs.AddItem sInsert
                mshfxgSpecs.Row = mshfxgSpecs.Rows - 1
                For lindex = 0 To mshfxgSpecs.Cols - 1
                    mshfxgSpecs.Col = lindex
                    mshfxgSpecs.CellForeColor = lColor
                Next lindex
            End If
        
        End With
        
    Next
    
    If mshfxgSpecs.Rows = 1 Then
        mshfxgSpecs.Rows = 2
        mshfxgSpecs.FixedRows = 1
        mshfxgSpecs.Rows = 0
    Else
        mshfxgSpecs.FixedRows = 1
    End If
    mshfxgSpecs.Visible = True
    
End Sub

'*******************************************************************************
'* Update grid by selection
'*******************************************************************************
Public Sub mInitForm()

    Dim lSpecIx     As Long
    Dim sInsert     As String
    Dim bShowIt     As Boolean
    Dim lColor      As Long
    Dim lindex      As Long
    
    ' --------------------------------------------------------------------------
    ' Init Var Grid
    ' --------------------------------------------------------------------------
    With mshfxgVar
        .Clear
        .FixedCols = 0
        .FixedRows = 0
        .Cols = 6
        .Rows = 0
        .AddItem "Test" & vbTab & "Testdetails" & vbTab & "Comments"
        .ColWidth(0) = 2200
        .ColWidth(1) = 2000
        .ColWidth(2) = 1500
        .ColWidth(3) = 1500
        .ColWidth(4) = 1500
        .ColWidth(5) = 1500
        .ColAlignment(0) = flexAlignLeftCenter
        .ColAlignment(1) = flexAlignLeftCenter
        .ColAlignment(2) = flexAlignLeftCenter
        .ColAlignment(3) = flexAlignLeftCenter
        .ColAlignment(4) = flexAlignLeftCenter
        .ColAlignment(5) = flexAlignLeftCenter
    End With
    If mshfxgVar.Rows = 1 Then
        mshfxgVar.Rows = 2
        mshfxgVar.FixedRows = 1
    Else
        mshfxgVar.FixedRows = 1
    End If
    mshfxgVar.Visible = True
    
    ' --------------------------------------------------------------------------
    ' Init Request Proc Grid
    ' --------------------------------------------------------------------------
    With mshfxgRequest
        .Clear
        .FixedCols = 0
        .Cols = 2
        .Rows = 0
        .AddItem "Procedure" & vbTab & "Testname"
        .FixedRows = 0
        .ColWidth(0) = 2900
        .ColWidth(1) = 2500
        .Visible = False
    End With
    If mshfxgRequest.Rows = 1 Then
        mshfxgRequest.Rows = 2
        mshfxgRequest.FixedRows = 1
    Else
        mshfxgRequest.FixedRows = 1
    End If
    mshfxgRequest.Visible = True
    
End Sub


'*******************************************************************************
'* Update grid by selection
'*******************************************************************************
Public Sub mFillVariableGrid()

    Dim lArrayIx    As Long
    Dim lColIx      As Long
    Dim lMaxColIx   As Long
    Dim sInsert     As String
    Dim bShowIt     As Boolean
    Dim lColor      As Long
    Dim lindex      As Long
    
    ' --------------------------------------------------------------------------
    ' Init
    ' --------------------------------------------------------------------------
    lMaxColIx = 0
    
    mshfxgVar.Rows = 1
    
    ' --------------------------------------------------------------------------
    ' Fill with variable
    ' --------------------------------------------------------------------------
    For lArrayIx = 1 To UBound(gtArray)
        
        sInsert = ""
        
        For lColIx = 1 To UBound(gtArray(lArrayIx).sColValues)
            ' ------------------------------------------------------------------
            ' Add the column value for the insert string
            ' ------------------------------------------------------------------
            sInsert = sInsert & gtArray(lArrayIx).sColValues(lColIx)
            
            ' ------------------------------------------------------------------
            ' Save the number of columns of the longest row
            ' ------------------------------------------------------------------
            If lColIx > lMaxColIx Then
                lMaxColIx = lColIx
            End If
            
            ' ------------------------------------------------------------------
            ' As long we don't have the last item, add a tab as delemiter
            ' ------------------------------------------------------------------
            If lColIx < UBound(gtArray(lArrayIx).sColValues) Then
                sInsert = sInsert & vbTab
            End If
        Next
        
        lColor = vbBlack
        mshfxgVar.AddItem sInsert
        mshfxgVar.Row = mshfxgVar.Rows - 1
        For lindex = 0 To mshfxgVar.Cols - 1
            mshfxgVar.Col = lindex
            mshfxgVar.CellForeColor = lColor
        Next lindex
        
    Next
    
    ' --------------------------------------------------------------------------
    ' Resize the grid to the number of columns of the array
    ' --------------------------------------------------------------------------
    mshfxgVar.Cols = lMaxColIx
    
    If mshfxgVar.Rows = 1 Then
        mshfxgVar.Rows = 2
        mshfxgVar.FixedRows = 1
        mshfxgVar.Rows = 0
    Else
        mshfxgVar.FixedRows = 1
    End If
    mshfxgVar.Visible = True
    
End Sub



'*******************************************************************************
'* Update grid by selection
'*******************************************************************************
Public Sub mFillSampleProcsGrid()

    Dim lProcIx     As Long
    Dim sInsert     As String
    Dim bShowIt     As Boolean
    Dim lColor      As Long
    Dim lindex      As Long
    
    ' --------------------------------------------------------------------------
    ' Init
    ' --------------------------------------------------------------------------
    With mshfxgProcs
        .Clear
        .FixedCols = 0
        .FixedRows = 0
        .Cols = 3
        .Rows = 0
        .AddItem "Procedure" & vbTab & "Testname" & vbTab & "Status"
        .Col = 0
        .Row = 0
        .ColWidth(0) = 2500
        .ColWidth(1) = 2000
        .ColWidth(2) = 2000
        .Visible = False
    End With
    
    ' --------------------------------------------------------------------------
    ' Fill with criteria
    ' --------------------------------------------------------------------------
    For lProcIx = 1 To UBound(gtProcs)
        
        With gtProcs(lProcIx)
        
            ' ------------------------------------------------------------------
            ' prepare insert string (one line)
            ' ------------------------------------------------------------------
            sInsert = .sSpecHandle & vbTab & .sDispName & vbTab & .sStatus
            lColor = vbBlack
         
            mshfxgProcs.AddItem sInsert
            mshfxgProcs.Row = mshfxgProcs.Rows - 1
            For lindex = 0 To mshfxgProcs.Cols - 1
                mshfxgProcs.Col = lindex
                mshfxgProcs.CellForeColor = lColor
            Next lindex
        End With
        
    Next
    
    If mshfxgProcs.Rows = 1 Then
        mshfxgProcs.Rows = 2
        mshfxgProcs.FixedRows = 1
        mshfxgProcs.Rows = 0
    Else
        mshfxgProcs.FixedRows = 1
    End If
    mshfxgProcs.Visible = True
    
End Sub


Private Sub cmdAdd_Click()

    Dim sInsert As String
    Dim bProcFound As Boolean
    Dim lindex As Long
    Dim lIndex2 As Long
    Dim sProcToAdd As String
    Dim lColor      As Long
    
    '--------------------------------------------------------------------
    ' Check if this is the first line to add
    ' In this case remove the blank line that we have after loading
    '--------------------------------------------------------------------
    mshfxgRequest.Visible = False
    
    mshfxgRequest.Row = 1
    mshfxgRequest.Col = 0
    If mshfxgRequest.Text = "" Then
        mshfxgRequest.Rows = 1
    End If
    
    bProcFound = True
    
    For lindex = 1 To mshfxgSpecs.Rows - 1
    
        mshfxgSpecs.Row = lindex
        mshfxgSpecs.Col = 0
        If mshfxgSpecs.Text = "R" Then
        
            '--------------------------------------------------------------------
            ' Get the current procedure name
            '--------------------------------------------------------------------
            bProcFound = False
            mshfxgSpecs.Col = 1
            sProcToAdd = mshfxgSpecs.Text
            
            '--------------------------------------------------------------------
            ' Check if the procedure is already in the list
            '--------------------------------------------------------------------
            For lIndex2 = 1 To mshfxgRequest.Rows - 1
                mshfxgRequest.Row = lIndex2
                mshfxgRequest.Col = 0
                If sProcToAdd = mshfxgRequest.Text Then
                    bProcFound = True
                End If
            Next lIndex2
            
            '--------------------------------------------------------------------
            ' Check if the procedure is already attached to the sample
            '--------------------------------------------------------------------
            For lIndex2 = 1 To mshfxgProcs.Rows - 1
                mshfxgProcs.Row = lIndex2
                mshfxgProcs.Col = 0
                If sProcToAdd = mshfxgProcs.Text Then
                    bProcFound = True
                End If
            Next lIndex2
            
            '--------------------------------------------------------------------
            ' If the proc is not already there, add it
            '--------------------------------------------------------------------
            lColor = vbBlack
            If bProcFound = False Then
                sInsert = ""
                mshfxgSpecs.Col = 1
                sInsert = sInsert & mshfxgSpecs.Text & vbTab
                mshfxgSpecs.Col = 2
                sInsert = sInsert & mshfxgSpecs.Text & vbTab
            
                mshfxgRequest.AddItem sInsert
                mshfxgRequest.Row = mshfxgRequest.Rows - 1
                For lIndex2 = 0 To mshfxgRequest.Cols - 1
                    mshfxgRequest.Col = lIndex2
                    mshfxgRequest.CellForeColor = lColor
                Next lIndex2
            End If
            
            '---------------------------------------------------------------------
            ' Remove the R in the first column
            '---------------------------------------------------------------------
            mshfxgSpecs.Col = 0
            mshfxgSpecs.Text = ""
            
        End If
    Next lindex
    
    If mshfxgRequest.Rows = 1 Then
        mshfxgRequest.Rows = 2
        mshfxgRequest.FixedRows = 1
    Else
        mshfxgRequest.FixedRows = 1
    End If
    
    mshfxgRequest.Visible = True

End Sub

'            bShowIt = False
'            lColor = vbBlack
'
'
'            If bShowIt Then
'                mshfxgProcs.AddItem sInsert
'                mshfxgProcs.Row = mshfxgProcs.Rows - 1
'                For lIndex = 0 To mshfxgProcs.Cols - 1
'                    mshfxgProcs.Col = lIndex
'                    mshfxgProcs.CellForeColor = lColor
'                Next lIndex
'            End If
'
'        End With
'
'    Next
'
'    If mshfxgProcs.Rows = 1 Then
'        mshfxgProcs.Rows = 2
'        mshfxgProcs.FixedRows = 1
'        mshfxgProcs.Rows = 0
'    Else
'        mshfxgProcs.FixedRows = 1
'    End If
'    mshfxgProcs.Visible = True
'
'End Sub
'
'Private Sub chkShowAll_Click()
'
'    Call mUpdateGrid(lstLab, gsUser, chkShowIncomplete, chkShowNotAllowed)
'
'End Sub
'
'Private Sub chkShowIncomplete_Click()
'
'    Call mUpdateGrid(lstLab, gsUser, chkShowIncomplete, chkShowNotAllowed)
'
'End Sub
'
'Private Sub chkShowNotAllowed_Click()
'
'    Call mUpdateGrid(lstLab, gsUser, chkShowIncomplete, chkShowNotAllowed)
'
'End Sub
'
Private Sub cmdCancel_Click()

    gsSelectedProcs = ""
    gbPanelResult = False
    Unload Me
    
End Sub

Private Sub cmdFilter_Click()

    Call mGetSpecs(gsLibrary, txtFilter.Text)
    
    frmProcChoice.mFillSpecGrid
    
End Sub

'*******************************************************************************
'* fill all specs in the given library
'*******************************************************************************
Public Sub mGetSpecs(psLibrary As String, psFilter As String)

    Dim sSQL        As String
    Dim rsSpecs     As rdoResultset
    Dim lSpecIx     As Long
    
    ' --------------------------------------------------------------------------
    ' Init
    ' --------------------------------------------------------------------------
    lSpecIx = 0
    ReDim gtSpecs(lSpecIx)
    
    ' --------------------------------------------------------------------------
    ' Fill Proc Choice List
    ' --------------------------------------------------------------------------
    sSQL = "SELECT specname || '{' || specversion || ',' || " _
            & " libraryname || '}' as SPECHANDLE, " _
            & " DISPNAME " _
            & " FROM spec " _
            & " WHERE upper(libraryname) = '" & UCase(psLibrary) & "'  "
            If psFilter <> "" Then
                sSQL = sSQL & " AND upper(specname) like '%" & UCase(psFilter) & "%'  "
            End If
            sSQL = sSQL & " AND approvedflag = 1 " _
                    & " ORDER BY specname "
            
    Set rsSpecs = RDOConn.OpenResultset(sSQL, rdOpenForwardOnly, rdConcurReadOnly)
    
    While Not rsSpecs.EOF()
        
        lSpecIx = lSpecIx + 1
        ReDim Preserve gtSpecs(lSpecIx)
        With gtSpecs(lSpecIx)
            .sSpecHandle = rsSpecs!SPECHANDLE
            .sDispName = rsSpecs!DISPNAME
        End With
        rsSpecs.MoveNext
        DoEvents
        
    Wend
    
    ' --------------------------------------------------------------------------
    ' Clean up
    ' --------------------------------------------------------------------------
    rsSpecs.Close
    Set rsSpecs = Nothing
    
End Sub

Private Sub cmdOK_Click()
    
    Dim sReturn As String
    Dim lindex As Long
    
    gsSelectedProcs = ""
    For lindex = 1 To mshfxgRequest.Rows - 1
        mshfxgRequest.Row = lindex
        mshfxgRequest.Col = 0
        If gsSelectedProcs <> "" Then
            gsSelectedProcs = gsSelectedProcs & ","
        End If
        If mshfxgRequest.Text <> "" Then
            gsSelectedProcs = gsSelectedProcs & mshfxgRequest.Text
        End If
    Next lindex
    
    If gsSelectedProcs = "" Then
        MsgBox "No procedures requested!", _
            vbInformation + vbOKOnly, frmProcChoice.Caption
    Else
        gSystemOCX.Command "runmacro 'DB:QCCLIENT{STD,SYSTEM}'"
        gSystemOCX.Command "lRet$ = ''"
        gSystemOCX.Command "lRet$ = runmacro ('mAddTestAdvanced.mac','" & gsSampleName & "','" & gsSelectedProcs & "')"
        sReturn = gSystemOCX.GetVar("lRet$")
        
        If sReturn = "" Then
            MsgBox "Procedures were successfully requested.", _
                    vbInformation + vbOKOnly, frmProcChoice.Caption
        Else
            MsgBox "Error during procedure request: " & vbCrLf & sReturn, _
                    vbCritical + vbOKOnly, frmProcChoice.Caption
        End If
End If
    
    
    Unload Me
    
End Sub


Private Sub cmdRemove_Click()

'    Dim lindex As Long
'
'    For lindex = 1 To mshfxgRequest.Rows - 1
'        mshfxgRequest.Row = lindex
'        mshfxgRequest.Col = 0
'
'        Debug.Print mshfxgRequest.RowSel
'
'    Next lindex
    If mshfxgRequest.Rows > 2 Then
        mshfxgRequest.RemoveItem (mshfxgRequest.Row)
    Else
        mshfxgRequest.Row = 1
        mshfxgRequest.Col = 0
        mshfxgRequest.Text = ""
        mshfxgRequest.Col = 1
        mshfxgRequest.Text = ""
    End If
        
    
End Sub

Private Sub mshfxgSpecs_Click()

    If mshfxgSpecs.Rows > 0 Then
    
        ' ----------------------------------------------------------------------
        ' At least some lines are visible
        ' ----------------------------------------------------------------------
        mshfxgSpecs.Col = 0
        If mshfxgSpecs.CellForeColor = vbGrayText Then
            Beep
        Else
            If mshfxgSpecs.Text = "R" Then
                mshfxgSpecs.Text = ""
            Else
                mshfxgSpecs.Text = "R"
            End If
        End If
    
    Else
        
        ' ----------------------------------------------------------------------
        ' No lines are visible: All entered or all wrong state
        ' ----------------------------------------------------------------------
        Beep
    
    End If
    
End Sub

'*******************************************************************************
'* Set the tool tip text in the grid
'*******************************************************************************
Private Sub mshfxgVar_MouseMove(Button As Integer, Shift As Integer, _
                                    x As Single, y As Single)
    
    Call mSetToolTipText(mshfxgVar, x, y)

End Sub

'*******************************************************************************
'* Set the tool tip text in the grid
'*******************************************************************************
Private Sub mshfxgProcs_MouseMove(Button As Integer, Shift As Integer, _
                                    x As Single, y As Single)
    
    Call mSetToolTipText(mshfxgProcs, x, y)
    
End Sub

'*******************************************************************************
'* Set the tool tip text in the grid
'*******************************************************************************
Private Sub mshfxgSpecs_MouseMove(Button As Integer, Shift As Integer, _
                                    x As Single, y As Single)
    
    Call mSetToolTipText(mshfxgSpecs, x, y)
    
End Sub


'*******************************************************************************
'* Set the tool tip text based on a given grid and the mouse coordinates
'*******************************************************************************
Private Sub mSetToolTipText(grid As MSHFlexGrid, x As Single, y As Single)
    Dim lRow As Long
    Dim lCol As Long
    
    lCol = -1
    lRow = -1
    
    '--------------------------------------------------------------------------
    ' Get the currently selected grid row and column
    '--------------------------------------------------------------------------
    lCol = mGetCurrentCol(grid, x)
    lRow = mGetCurrentRow(grid, y)
    
    '--------------------------------------------------------------------------
    ' If a column and row is selected, set the text as tool tip text
    '--------------------------------------------------------------------------
    If (lRow > 0) And (lCol >= 0) Then
        grid.Row = lRow
        grid.Col = lCol
        grid.ToolTipText = grid.Text
    Else
        grid.ToolTipText = ""
    End If
    
End Sub

'*******************************************************************************
'* Get the row selected for a given grid and the y coordinate
'*******************************************************************************
Private Function mGetCurrentRow(grid As MSHFlexGrid, y As Single) As Long
    
    Dim lRowHeight As Long
    Dim lCurRowHeight As Long
    Dim lCurRow As Long
    
    lCurRow = -1
    lRowHeight = 0
    lCurRowHeight = 0
    
    '--------------------------------------------------------------------------
    ' Start searching for a row if we have more than the header line
    '--------------------------------------------------------------------------
    If grid.Rows > 1 Then
        '----------------------------------------------------------------------
        ' The current row is the top row - 1 as we can scroll in the grid
        '----------------------------------------------------------------------
        lCurRow = grid.TopRow - 1
        
        '----------------------------------------------------------------------
        ' Now search till we found the line
        '----------------------------------------------------------------------
        lRowHeight = grid.RowHeight(lCurRow)
        While (lRowHeight < y) And (lCurRow < (grid.Rows - 1))
            lCurRow = lCurRow + 1
            lCurRowHeight = grid.RowHeight(lCurRow)
            lRowHeight = lRowHeight + lCurRowHeight
        Wend
    End If
    
    '--------------------------------------------------------------------------
    ' Check if we are something in the grid where no line are anymore
    '--------------------------------------------------------------------------
    If (lCurRow = (grid.Rows - 1)) And (y > lRowHeight) Then
        lCurRow = -1
    End If
    mGetCurrentRow = lCurRow
    
End Function

'*******************************************************************************
'* Get the col selected for a given grid and the x coordinate
'*******************************************************************************
Private Function mGetCurrentCol(grid As MSHFlexGrid, x As Single) As Long
    
    Dim lColWidth As Long
    Dim lCurColWidth As Long
    Dim lCurCol As Long
    
    lCurCol = -1
    lColWidth = 0
    lCurColWidth = 0
    
    If grid.Cols > 1 Then
        lCurCol = 0
        lColWidth = grid.ColWidth(lCurCol)
        '----------------------------------------------------------------------
        ' Now search till we found the column
        '----------------------------------------------------------------------
        While (lColWidth < x) And (lCurCol < (grid.Cols - 1))
            lCurCol = lCurCol + 1
            lCurColWidth = grid.ColWidth(lCurCol)
            lColWidth = lColWidth + lCurColWidth
        Wend
    End If
    
    '--------------------------------------------------------------------------
    ' Check if we are something in the grid where no columns are anymore
    '--------------------------------------------------------------------------
    If (lCurCol = (grid.Cols - 1)) And (x > lColWidth) Then
        lCurCol = -1
    End If
    mGetCurrentCol = lCurCol
    
End Function


