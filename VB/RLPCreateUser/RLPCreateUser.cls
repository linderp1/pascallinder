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
'Public properties
'*****************
Public NLSObject As Object
Public RDOConn As Object
Public hInstance As Long
Public SystemOCX As Object
Public sResult As String


Public Sub Run()

    On Error Resume Next
    
    Dim lDatabase           As String
    Dim lUsername           As String
    Dim lUsertype           As String
    Dim lCPVersion          As String
    Dim lServerName         As String
        
    '------------------------------------------------------------------------------------
    ' Init global variables
    '------------------------------------------------------------------------------------
    gsModuleName = "RLP Create User"
    
    ' Declare resultsets
    '*******************
    Dim rsServer As Object
    Dim rsUsers As Object
    Dim rsGroups As Object
    
    lDatabase = SystemOCX.GetVar("_DATABASE$")
    lUsername = SystemOCX.GetVar("_USERNAME$")
    lUsertype = SystemOCX.GetVar("_USERTYPE$")
    lCPVersion = SystemOCX.GetVar("_CPVersion$")

    ' get information about servername
    '*********************************
    SQL$ = "select SERVHOST from CHEMLMS.DBVW"
           
    Set rsServer = RDOConn.OpenResultset(SQL$)
    lServerName = rsServer.rdoColumns("SERVHOST").Value
           
    rsServer.Close
    Set rsServer = Nothing
       
    MsgBox "Hello " & lUsername & " (" & lUsertype & ") , you are connect on " & lServerName & vbCrLf & vbCrLf & _
            "Database name is: " & lDatabase & vbCrLf & vbCrLf & _
            "This is a " & lCPVersion & " system.", vbInformation
    
    '------------------------------------------------------------------------------------
    ' Set form properties before opening it
    '------------------------------------------------------------------------------------
    ' Set Form caption
    frmCreateUser.Caption = "RLP Create User (1.0.0)"
    ' Empty text boxes
    frmCreateUser.txtUserID.Text = ""
    frmCreateUser.txtUserLongName.Text = ""
    ' Clear and fill domain combo
    frmCreateUser.cboDomain.Clear
    frmCreateUser.cboDomain.AddItem "BUILT-IN"
    frmCreateUser.cboDomain.AddItem "EMEA.ROCHE.COM"
    frmCreateUser.cboDomain.AddItem "ASIA.ROCHE.COM"
    frmCreateUser.cboDomain.AddItem "EXBP.ROCHE.COM"
    frmCreateUser.cboDomain.AddItem "NALA.ROCHE.COM"
    frmCreateUser.cboDomain.AddItem "WINDOWS.GENE.COM"
    frmCreateUser.cboDomain.AddItem "VENTANA.VENTANAMED.COM"
    ' Clear and fill Cap Access combo
    frmCreateUser.cboCapAccess.Clear
    frmCreateUser.cboCapAccess.AddItem "*"
    frmCreateUser.cboCapAccess.AddItem "ADMINCRT"
    frmCreateUser.cboCapAccess.AddItem "SPECMGR"
    frmCreateUser.cboCapAccess.AddItem "RSLTENTRY"
    frmCreateUser.cboCapAccess.AddItem "VALIDAPPR"
    frmCreateUser.cboCapAccess.AddItem "REOPEN"
    frmCreateUser.cboCapAccess.AddItem "ARCHIVE"
    frmCreateUser.cboCapAccess.AddItem "DELETE"
    frmCreateUser.cboCapAccess.AddItem "LOGIN"
    frmCreateUser.cboCapAccess.AddItem "DATAMAP"
    frmCreateUser.cboCapAccess.AddItem "WKLSGEN"
    frmCreateUser.cboCapAccess.AddItem "CANCEL"
    ' Clear and fill Cap Level combo
    frmCreateUser.cboCapLevel.Clear
    frmCreateUser.cboCapLevel.AddItem "1"
    frmCreateUser.cboCapLevel.AddItem "2"
    frmCreateUser.cboCapLevel.AddItem "3"
    frmCreateUser.cboCapLevel.AddItem "4"
    frmCreateUser.cboCapLevel.AddItem "5"
    frmCreateUser.cboCapLevel.AddItem "6"
    frmCreateUser.cboCapLevel.AddItem "7"
    frmCreateUser.cboCapLevel.AddItem "8"
    frmCreateUser.cboCapLevel.AddItem "9"
 
    ' Fill Groups listbox
    sSQL = "SELECT Name FROM LMSgroup " _
        & " WHERE (state IS NULL OR state = '*') "
    Set rsGroups = RDOConn.OpenResultset(sSQL, rdOpenForwardOnly, rdConcurReadOnly)
    While Not rsGroups.EOF
        frmCreateUser.lstGroups.AddItem rsGroups("Name")
        rsGroups.MoveNext
        DoEvents
    Wend
    
    ' Clear and fill QC Client config from User combo
    frmCreateUser.cboClientConfig.Clear
    sSQL = "SELECT Name FROM LMSUser " _
        & " WHERE (state IS NULL OR state = '*') "
    cboClientConfig.Clear
    Set rsUsers = RDOConn.OpenResultset(sSQL, rdOpenForwardOnly, rdConcurReadOnly)
    While Not rsUsers.EOF
        frmCreateUser.cboClientConfig.AddItem rsUsers("Name")
        rsUsers.MoveNext
        DoEvents
    Wend
    rsUsers.Close
    Set rsUsers = Nothing
    
    '------------------------------------------------------------------------------------
    ' Open the create user form
    '------------------------------------------------------------------------------------
    frmCreateUser.Show vbModal
    
    GoTo End_Label
    
End_Label:
    
    'Normal Exit
    '***********
    'Run = True

End Sub
