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
'    Project    : PrinteryStartup
'
'    Description: dll to start BALI Printery from QC-Client
'
'    Version    : 1.0 28-FEB-2003
'
'    Modified   :
'--------------------------------------------------------------------------------
'</CSCC>


Option Explicit

' objects set from QC-Client - we don't need all, just in case QC-Client will set it

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


Function Run(Optional strPath As Variant) As Boolean

' This function is called from QC-Client
' if a Folder is selected we get the FolderID
' The value we return to QCClient is False or True
' to tell if this function was successful or not

On Error GoTo Main_Err

Dim strMldg As String           ' String for ErrorMessage
Dim strDataSource As String     ' String for connection
Dim strUserID As String         ' String for UserID
Dim strPassWD As String         ' String for Userpassword
Dim strServerPwd As String      ' Serverpassword
Dim strUserServ As String       ' Serveruser
Dim strServer As String         ' Servername
Dim strInstallPath As String    ' string to save the installationpath
Dim lngProcID As Long           ' ProcessID

'first show hourglass
'Screen.MousePointer = 11
DoEvents

strDataSource = RDOConn.Name               ' get Databasename
strUserID = SystemOCX.User                 ' get UserID
strServer = SystemOCX.Server                            ' get Servername
strPassWD = SystemOCX.GetPassword(strUserID)            ' get UserPasswort
strUserServ = SystemOCX.ServerUser                      ' get Serveruser
strServerPwd = SystemOCX.GetServerPassword(strUserServ) ' get UNIX Password



' Lock where QC-Client is installed and set the path to BALI Printery
strInstallPath = NLSObject.GetRegValueData("Path", "QC Client") & strPath

' we have all information . start bali Printery
lngProcID = Shell(strInstallPath & " " & strServer & " " & strDataSource & _
                  " " & strUserID & " " & strPassWD & " " & strUserServ & _
                  " " & strServerPwd & " ", vbNormalFocus)

Run = True

GoTo Main_Exit:

Main_Err:
    strMldg = "Error " & Str(Err.Number) & " was produced from " & Err.Source & Chr(13) & Err.Description
    Screen.MousePointer = 1
    MsgBox strMldg, , "Error", Err.HelpFile, Err.HelpContext
   
Main_Exit:

End Function

