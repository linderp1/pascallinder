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

Public Sub Run(Optional pvModuleName As String = "CP Macro Starter", _
        Optional pvFieldLabel As String = "Sample ID", _
        Optional psMacroName As String = "mCPMacroName.mac", _
        Optional psParameter2 As String = "", _
        Optional psParameter3 As String = "", _
        Optional psParameter4 As String = "", _
        Optional psParameter5 As String = "")
               
    On Error GoTo errorhandler
    Dim sCommand           As String
    Dim sReturn            As String
    Dim sResult As String
    
    '------------------------------------------------------------------------------------
    ' Init global variables
    '------------------------------------------------------------------------------------
    gsModuleName = pvFormTitle
    gsFieldLabel = pvFieldLabel
    Is_ok = True
    
    Set gSystemOCX = SystemOCX
    Set gRDOConn = RDOConn
    
    While Is_ok = True
        sResult = ""
        
        '------------------------------------------------------------------------------------
        ' Open the change password form
        '------------------------------------------------------------------------------------
        frmGetTestInfo.Show vbModal
        
        '------------------------------------------------------------------------------------
        ' Input was not valid, or cancel was pressed
        '------------------------------------------------------------------------------------
        If Is_ok = False Then
            sResult = "CANCEL_PRESSED"
            Exit Sub
        End If
        
        Screen.MousePointer = vbHourglass
        
        '------------------------------------------------------------------------------------
        ' Execute macro passed as parameter
        '------------------------------------------------------------------------------------
        sCommand = "lRet$ = runmacro (""" & psMacroName & """,""" & _
                                            gsFieldText & """," & _
                                            psParameter2 & """," & _
                                            psParameter3 & """," & _
                                            psParameter4 & """," & _
                                            psParameter5 & """)"
        SystemOCX.Evaluate sCommand
        
        '------------------------------------------------------------------------------------
        ' Get results from macro (macro checks, if database is configured in config.DATA
        '------------------------------------------------------------------------------------
        sReturn = SystemOCX.GetVar("lRet$")
        
        Screen.MousePointer = vbDefault
        
        frmResult.txtResult.Text = sReturn
        
        frmResult.Show vbModal
    Wend
    
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


