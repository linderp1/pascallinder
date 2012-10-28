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

Option Explicit
Option Compare Text

Public NLSObject As Object
Public RDOConn As Object
Public hInstance As Long
Public SystemOCX As Object
Public sResult As String

Public Sub Run()
               
    On Error GoTo errorhandler
    Dim sCommand                As String
    Dim retour                  As Variant
    Dim lUserID                 As String
    Dim lLongName               As String
    Dim sErrorReturn            As String
    Dim lTestDBConfigured       As Integer
    Dim lHistoricalDBConfigured As Integer
    Dim lActiveDBChanged        As Integer
    Dim lTestDBChanged          As Integer
    Dim lHistoricalDBChanged    As Integer
    
    '------------------------------------------------------------------------------------
    ' Init global variables
    '------------------------------------------------------------------------------------
    gsModuleName = "RLP Change Password"
    sResult = "PASSWORD_NOT_CHANGED"
    Is_ok = 0
    
    '------------------------------------------------------------------------------------
    ' Get Username from system OCX
    '------------------------------------------------------------------------------------
    lUserID = UCase(SystemOCX.User)
    
    Set gSystemOCX = SystemOCX
    Set gRDOConn = RDOConn
    
    '------------------------------------------------------------------------------------
    ' Get User Longname
    '------------------------------------------------------------------------------------
    SystemOCX.Evaluate "lUserLongName$ = """""
    SystemOCX.Evaluate "sqlExec ""SELECT fullname INTO :lUserLongName$ FROM lmsuser " & _
                        "WHERE name  = '" & lUserID & "' " & _
                        "AND (state IS NULL OR state = '*')"""
    lLongName = SystemOCX.GetVar("lUserLongName$")
    
    '------------------------------------------------------------------------------------
    ' Set values in password change form
    '------------------------------------------------------------------------------------
    frmPasswd.txtLongName = lLongName
    frmPasswd.txtLongName.Enabled = False
    If (UCase(lUserID) = "CHEMLMS" Or UCase(lUserID) = "PDBA") Then
        frmPasswd.txtOldPasswd.Enabled = False
        frmPasswd.lblOldPwd.ForeColor = &H80000003
        frmPasswd.txtOldPasswd.BackColor = &H8000000F
        Call mGetAllUsers(frmPasswd.cboName)
    Else
        frmPasswd.cboName.Clear
        frmPasswd.cboName.AddItem UCase(lUserID)
    End If
    frmPasswd.cboName = lUserID
    
    '------------------------------------------------------------------------------------
    ' User PDBA can change password of other users -> enable user field
    '------------------------------------------------------------------------------------
    If UCase(lUserID) = "PDBA" Then
        frmPasswd.cboName.Enabled = True
        frmPasswd.cboName.ForeColor = &H80000008
    Else
        frmPasswd.cboName.Enabled = False
        frmPasswd.cboName.ForeColor = &H80000003
    End If
    
    '------------------------------------------------------------------------------------
    ' Open the change password form
    '------------------------------------------------------------------------------------
    frmPasswd.Show vbModal
    
    '------------------------------------------------------------------------------------
    ' Password change for user pdba and chemlms is not possible via dll
    '------------------------------------------------------------------------------------
    If (UCase(gsUserName) = "CHEMLMS" Or UCase(gsUserName) = "PDBA") Then
        MsgBox "Password for user '" & gsUserName & "' can not be changed via this module." & _
                vbCrLf & "Please refer to the 'RLP changing passwords manual' therefore.", _
                vbCritical, gsModuleName
        Exit Sub
    End If
    
    '------------------------------------------------------------------------------------
    ' Input was not valid, or cancel was pressed
    '------------------------------------------------------------------------------------
    If Is_ok = False Then
        sResult = "CANCEL_PRESSED"
        Exit Sub
    End If
    
    Screen.MousePointer = vbHourglass
    
    '------------------------------------------------------------------------------------
    ' Execute change password macro
    '------------------------------------------------------------------------------------
    sCommand = "lRet$ = runmacro (""Utilities/mChangePassword.mac"",""" & _
                    gsUserName & """,""" & gsOldPassword & """,""" & _
                    gsNewPassword & """)"
    SystemOCX.Evaluate sCommand
    
    '------------------------------------------------------------------------------------
    ' Get results from macro (macro checks, if database is configured in config.DATA
    '------------------------------------------------------------------------------------
    sErrorReturn = SystemOCX.GetVar("lRet$")
    lTestDBConfigured = SystemOCX.GetVar("gTestConfigured")
    lHistoricalDBConfigured = SystemOCX.GetVar("gHistConfigured")
    lActiveDBChanged = SystemOCX.GetVar("gPWDChangedA")
    lTestDBChanged = SystemOCX.GetVar("gPWDChangedT")
    lHistoricalDBChanged = SystemOCX.GetVar("gPWDChangedH")
    
    Screen.MousePointer = vbDefault
    
    '------------------------------------------------------------------------------------
    ' Show results: Active DB: always configured
    '------------------------------------------------------------------------------------
    If lActiveDBChanged = 1 Then
        frmResult.lblActiveDBChanged.Caption = "password changed"
        frmResult.lblActiveDBChanged.BackColor = &HFF00&
        sResult = "CHANGED_ON_ACTIVEDB"
    Else
        frmResult.lblActiveDBChanged.Caption = "password not changed"
        frmResult.lblActiveDBChanged.BackColor = &H8080FF
    End If
    
    '------------------------------------------------------------------------------------
    ' Show results: Historical DB: only if configured in config.DATA
    '------------------------------------------------------------------------------------
    If lHistoricalDBConfigured = 1 Then
        If lHistoricalDBChanged Then
            frmResult.lblHistoricalDBChanged.Caption = "password changed"
            frmResult.lblHistoricalDBChanged.BackColor = &HFF00&
        Else
            frmResult.lblHistoricalDBChanged.Caption = "password not changed"
            frmResult.lblHistoricalDBChanged.BackColor = &H8080FF
        End If
    Else  ' Nont configured in config.DATA: Hide Test Database
        frmResult.lblHistoricalDB.Visible = False
        frmResult.lblHistoricalDBChanged.Visible = False
    End If
    
    '------------------------------------------------------------------------------------
    ' Show results: Test DB: only if configured in config.DATA
    '------------------------------------------------------------------------------------
    If lTestDBConfigured = 1 Then
        If lTestDBChanged = 1 Then
            frmResult.lblTestDBChanged.Caption = "password changed"
            frmResult.lblTestDBChanged.BackColor = &HFF00&
        Else
            frmResult.lblTestDBChanged.Caption = "password not changed"
            frmResult.lblTestDBChanged.BackColor = &H8080FF
        End If
    Else ' Nont configured in config.DATA: Hide Test Database
        frmResult.lblTestDB.Visible = False
        frmResult.lblTestDBChanged.Visible = False
    End If
    
    frmResult.txtResult.Text = sErrorReturn
    
    frmResult.Show vbModal
    
    Exit Sub
    
errorhandler:
    Screen.MousePointer = vbDefault
    MsgBox Err.Description, vbCritical, gsModuleName

End Sub

'**************************************************
' Recupération du password du user qui a effectue
' la connexion avec QCClient
'**************************************************
' comment out, doesn't work any more in A.04.01
'gsOldPassword = UCase(SystemOCX.GetPassword(SystemOCX.User))


