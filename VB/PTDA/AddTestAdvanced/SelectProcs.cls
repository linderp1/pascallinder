VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SelectProcs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'*******************************************************************************
'*
'* Copyright (C) 2007  F. Hoffmann-La Roche, Basel
'* Written by Michael Schneider, PGSQ, 04-Sept-2007
'*
'* $Author: Schnem24 $  $Revision: 2 $ $Date: 10.04.07 9:10 $
'*
'* Module Description:
'*
'* Exported functions: Run() - to be called by QC Client as "Add Test"
'*                             Event.
'*
'* Global variables:   As defined for QC Client extensions
'*
'* $Workfile: SelectProcs.cls $
'*
'* $Log: /2003-RLP-1001-Nutley/Source/PeerProcChoice/SelectProcs.cls $
'*
'* $NoKeywords: $
'*******************************************************************************
Option Explicit

Public RDOConn As Object
Public NLSObject As Object
Public SystemOCX As Object
Public REOCX As Object
Public LoginOCX As Object
Public SampleOCX As Object
Public ProcOCX As Object
Public Sampletype As String
Public RETemplateName As String
Public FolderID As Long
Public NewFolderID As Long
Public ProcedureIDCriterion As Variant
Public NewProcedureIDCriterion As Variant
Public Mode As Integer
Public ObjectType As Variant
Public OCXLoadedUp As Variant
Public ViewCalledFrom As Integer
Public NewProcedureTypeCriterion As String

'*******************************************************************************
'* fill all rocs from the given sample to the listox
'*******************************************************************************
Private Sub mGetSampleInfo(psSID As String)

    Dim rsSample    As rdoResultset
    Dim sSQL        As String
    
    ' --------------------------------------------------------------------------
    ' Get the sample number based on the sample id
    ' --------------------------------------------------------------------------
    sSQL = "SELECT sampname " _
            & " FROM sample S " _
            & " WHERE SAMPID = " & psSID
    Set rsSample = RDOConn.OpenResultset(sSQL, rdOpenForwardOnly, rdConcurReadOnly)
    
    gsSampleName = ""
    While Not rsSample.EOF()
        
        gsSampleName = rsSample!SAMPNAME
        rsSample.MoveNext
        DoEvents
        
    Wend
    
    ' --------------------------------------------------------------------------
    ' Clean up
    ' --------------------------------------------------------------------------
    rsSample.Close
    Set rsSample = Nothing
    
End Sub


'******************************************************************************
'* Function 'Run' as defined in QC Client extension
'******************************************************************************
Public Function Run(Optional pvFolderID As Variant = 0, _
        Optional psLibrary As String = "TECHDEVPSL62", _
        Optional psVarToShow As String = "ANALYTICALREQUEST") As Boolean
    
    Dim SampleIDList    As Variant          ' List of all sample id's
    Dim sModName        As String           ' Display name of this module
    Dim bRunIt          As Boolean          ' Start review if all results
    Dim lRet As Integer
    
    On Error GoTo ErrorExit
    
    '--------------------------------------------------------------------------
    ' Init
    '--------------------------------------------------------------------------
    gbPanelResult = True
    gsLibrary = psLibrary
    Set gSystemOCX = SystemOCX

    '--------------------------------------------------------------------------
    ' Get the sample id using the folder id
    '--------------------------------------------------------------------------
    gsUser = NLSObject.User
    lRet = NLSObject.GetSamplesFromFolder(pvFolderID, SampleIDList)
    If lRet <> 0 Then
        MsgBox "A sample or folder must be selected!", _
                    vbInformation + vbOKOnly, sModName
        Run = False
        Exit Function
    End If
    gsSampleID = SampleIDList(0)
    gsSelectedProcs = ""
    
    '--------------------------------------------------------------------------
    ' Fill the list with the PSLs found in the library
    '--------------------------------------------------------------------------
    Call mGetSampleInfo(gsSampleID)
    
    sModName = "Add Test Advanced " _
            & "[Rev.: " & App.Major & "." & App.Minor & "." & App.Revision & "]"
    If gsSampleName <> "" Then
        sModName = sModName & " Sample : " & gsSampleName
    End If
    
    '--------------------------------------------------------------------------
    ' Init the panel
    '--------------------------------------------------------------------------
    Load frmProcChoice
    
    With frmProcChoice
       
Debug.Print "Start: " & Now

        '----------------------------------------------------------------------
        ' Init the grids etc.
        '----------------------------------------------------------------------
        Call .mInitForm
        
        '----------------------------------------------------------------------
        ' Fill the list with the PSLs found in the library
        ' (no filter is applied)
        '----------------------------------------------------------------------
        Set .RDOConn = RDOConn
Debug.Print "Start PSL: " & Now
        Call .mGetSpecs(gsLibrary, "")
Debug.Print "End PSL: " & Now
    
        '----------------------------------------------------------------------
        ' Fill the PSL grid
        '----------------------------------------------------------------------
        If UBound(gtSpecs) > 0 Then
            Call .mFillSpecGrid
        
Debug.Print "Start Var: " & Now
            '------------------------------------------------------------------
            ' Now fill the variable array
            '------------------------------------------------------------------
            Call .mGetVar(gsSampleID, psVarToShow)
Debug.Print "End Var: " & Now
            
            '------------------------------------------------------------------
            ' Fill Variable grid (Analytical Request)
            '------------------------------------------------------------------
            If UBound(gtArray) > 0 Then
                Call .mFillVariableGrid
            Else
                frmProcChoice.mshfxgVar.Clear
            End If
            
            '------------------------------------------------------------------
            ' Get all tests that are already in the sample
            '------------------------------------------------------------------
Debug.Print "Start Procs: " & Now
            Call .mGetSampleProcs(gsSampleID)
Debug.Print "End Procs: " & Now
        
            '------------------------------------------------------------------
            ' Fill Sample Procedures grid
            '------------------------------------------------------------------
            If UBound(gtProcs) > 0 Then
                Call .mFillSampleProcsGrid
            End If
            
            '------------------------------------------------------------------
            ' Prepare the panel and show it
            '------------------------------------------------------------------
            .Caption = sModName
            .txtFilter.Text = ""
            .grpVar.Caption = gsTestName & ":"
            
            .Show vbModal
        Else
            MsgBox "No tests were found that can be added to this sample!", _
                    vbCritical + vbOKOnly, sModName
        End If
        
    End With
    
    bRunIt = gbPanelResult
    
    '--------------------------------------------------------------------------
    ' do not continue if no procedure seleted
    '--------------------------------------------------------------------------
    If gsSelectedProcs = "" Then
        bRunIt = False
    End If
    
    GoTo Ende
    
ErrorExit:
    '--------------------------------------------------------------------------
    ' Error Handling: pop up error message, and continue with validation
    '--------------------------------------------------------------------------
    MsgBox "An unexpected error has occured: " & vbCrLf _
            & Err.Description & vbCrLf _
            & "Please contact your system administrator!", _
            vbCritical, sModName

Ende:
    '--------------------------------------------------------------------------
    ' Continue with normal approval
    '--------------------------------------------------------------------------
    Run = bRunIt

End Function





