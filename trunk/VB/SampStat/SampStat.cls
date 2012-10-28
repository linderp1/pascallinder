VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Launch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'<CSCC>
'--------------------------------------------------------------------------------
'    Component  : Launch
'    Project    : SampStat
'    Author     : Klaus Zinsmeister
'    Date       : 04.09.01
'    Description: Sample Status History
'                 New Version for RLP 1.3
'                 - change the Reference from RDO 1.0 to 2.0
'--------------------------------------------------------------------------------
'</CSCC>
' Project:          SampStat.dll
' Date:             29-Nov-1999
' Author:           K. Zinsmeister
'                   F. Hoffmann - La Roche, Basel
' Scope:            List all samplestati of a sample for QC-Client
'
' Version:          1.0 Initial Revision


Option Explicit

Public RDOConn As Object
Public NLSObject As Object
Public SystemOCX As Object
Public REOCX As Object
Public LoginOCX As Object
Public SampleOCX As Object
Public ProcOCX As Object
Public SampleType As String
Public RETemplateName As String
Public FolderID As Long
Public NewFolderID As Long
Public OCXLoadedUp As Boolean
Public ProcedureIDCriterion As String
Public NewProcedureIDCriterion As String
Public Mode As Integer
Public ObjectType As Integer
Public ViewCalledFrom As Integer


Function Run(Optional EventFolderID As Variant) As Boolean

' This function is called from QC-Client
' if a Folder is selected we get the FolderID
' The value we return to QCClient is False or True
' to tell if this function was successful or not

On Error GoTo Main_Err

Dim txtMldg As String       ' String for ErrorMessage
Dim i As Integer
Dim x As Long               ' get Samples from Folder
Dim DataSource              ' String for connection
Dim UserID                  ' String for UserID
Dim PassWD                  ' String for Userpassword
Dim installPath             ' string to save the installationpath
Dim test As String

i = 0


'first show hourglass
Screen.MousePointer = 11
DoEvents

DataSource = RDOConn.Name               ' get Databasename
UserID = SystemOCX.User                 ' get UserID
PassWD = SystemOCX.GetPassword(UserID)  ' get UserPasswort

' Open a connection
Set gBALIConn = rdoEnvironments(0).OpenConnection(DataSource, rdDriverNoPrompt, False, "UID=" & UserID & ";PWD=" & PassWD)
' check for Error during open
If Err <> 0 Then
    MsgBox "Unable to connect", 16, "Connection Error"
    Run = False
    Exit Function
End If

' Lock where QC-Client is installed and set the Helppath
installPath = NLSObject.GetRegValueData("Path", "QC Client")
App.HelpFile = installPath & "/help/SampleStatus.hlp"

' we have to check if this dll is called from Run Report/Event or from the
' Result Entry Template because the event sends the FolderID (if selected)
' but the result entry not

' If no Folder is submitted we get the Vartype 10 (vbError)

If VarType(EventFolderID) = 10 Then
    ' we are called from the Result Entry
    ' so set the FolderID to 0 and take
    ' the SampleName from the Resultentry to show the Status history
    FolderID = 0
    ' set the SampleName
    frmMain.txtSearch = REOCX.ResultSample
    ' set the Item property
    frmMain.lbltxtItem.Caption = getItem(frmMain.txtSearch)
    ' set the Lot property
    frmMain.lbltxtLot.Caption = getLot(frmMain.txtSearch)
    ' get all stati of the sample
    fStatusSearch (frmMain.txtSearch)
Else
    ' we are called as Event, set the FolderID
    FolderID = EventFolderID
End If

' check if a Folder is submitted
If FolderID > 0 Then
' a Folder is selected, get all samples from it
    x = NLSObject.GetSamplesFromFolder(FolderID, gSampleIDArray)
    ' get the SampleName of the first Sample in Folder
    frmMain.txtSearch = getSampleName(gSampleIDArray(0))
    ' set the Item property
    'frmMain.lbltxtItem.Caption = getItem(frmMain.txtSearch)
    ' set the Lot property
    'frmMain.lbltxtLot.Caption = getLot(frmMain.txtSearch)
    ' get all stati of the sample
    'fStatusSearch (frmMain.txtSearch)
    
    MsgBox ("This is my DLL :-)")
End If

' count Samples only if Folder was submitted
If FolderID > 0 Then
    Do While gSampleIDArray(i) <> ""
        i = i + 1
    Loop
Else
    i = 1
End If


If i = 1 Then
    ' Just one Sample in Folder - don´t show the Scrollbar
    frmMain.hsbSample.Visible = False
Else
    frmMain.hsbSample.Max = i - 1
End If

' Show Mainform
    Run = True
    Screen.MousePointer = 1
    frmMain.Show vbModal
    gBALIConn.Close
    Set gBALIConn = Nothing

GoTo Main_Exit:

Main_Err:
    txtMldg = "Error " & Str(Err.Number) & " was produced from " & Err.Source & Chr(13) & Err.Description
    Screen.MousePointer = 1
    MsgBox txtMldg, , "Error", Err.HelpFile, Err.HelpContext
    Resume Next
    
Main_Exit:

End Function

