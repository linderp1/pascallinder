Attribute VB_Name = "mdlMain"
'CSEH: ErrBaliDebug
'<CSCC>
'--------------------------------------------------------------------------------
'    Component  : mdlMain
'    Project    : Printery
'
'    Description: Defines global variables and procedures
'
'    Modified   : K. Zinsmeister - 08-Oct-2002
'                 Implement changes for Version 2
'<Modified by: Klaus Zinsmeister at 26-02-2004-12:45:28 on machine: BALI_ZI>
' Adding Support for new Pullforecastlist
' Reading list of mainlabs from the database
' fixing error with labelset saving
'</Modified by: Klaus Zinsmeister at 26-02-2004-12:45:28 on machine: BALI_ZI>
'<Modified by: Klaus Zinsmeister at 14.10.2004-16:36:48 on machine: BALI_ZI>
'
' Implement changes for RLP 1.4
'</Modified by: Klaus Zinsmeister at 14.10.2004-16:36:48 on machine: BALI_ZI>


'--------------------------------------------------------------------------------
'</CSCC>
Option Explicit


' API declarations
Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)


Type CoAParameter
    ID As Long
    Samplename As String
    Timestamp As Date
    Productname As String
    Productname2 As String
    ManufactureDate As String
    ReleaseDate As String
    ControlNo As String
    BatchQuantity As String
    ExpiryDate As String
    YourRef As String
    OurRef As String
    Destination As String
    RetestDate As String
    PlaceOfManufacture As String
    FertigSpezNo As String
    FooterLine1 As String
    FooterLine2 As String
    FooterLine3 As String
End Type

' set all const
Global Const MACRO_NAME_1 = "/opt/HP/app_pqc/RLP1/v14/applic/bali/macros/Printery/mPrintery.mac"
Global Const APP_SITE = "/opt/HP/app_pqc/RLP1/v14/applic/bali/macros"
Global Const PATH_CROSSTAB_EU = "C:\Program Files\CHEMLMS\QCCLIENT\rlp\XTAB\ctabv.exe "
Global Const PATH_CROSSTAB_US = "C:\Program Files\CHEMLMS\QCCLIENT\rlp\XTAB\ctabh.exe "
Global Const APPROVALSTRING = "Released"
Global Const MAX_PRINTER As Integer = 200
Global Const MAX_PULLSHEET As Integer = 500
Global Const MAX_CABINET As Integer = 30
Global Const MAX_FOLDER As Integer = 400
Global Const MAX_SAMPLE As Integer = 2000
Global Const MAX_SPEC As Integer = 6000
Global Const MAX_SPECREV As Integer = 50
Global Const MAX_SAMPLETYPE As Integer = 100
Global Const MAX_LOGINCONF As Integer = 6000
Global Const MAX_STABMAINLAB As Integer = 50
Global Const MAX_TIMEPOINT As Integer = 100
Global Const MAX_GROUP As Integer = 200
Global Const MAX_GROUPMEMBER As Integer = 300
Global Const MAX_LABELENTRY As Integer = 20
Global Const MAX_USERMODULE As Integer = 200
Global Const MAX_PRINTEDREPORTS As Integer = 10
Global Const MAX_LIBRARIES As Integer = 2000
Global Const MAX_DESTINATION As Integer = 400
Global Const MAX_MAINLAB As Integer = 200

Global gBALIConn As rdoConnection
Global g_Debug As clsDebug          ' Object for debugging

Global gSampleID As String          ' for the sampleid not the name
Global gUserID As String            ' for the UserID
Global gUserNo As Integer           ' for the usernumber
Global gPassWD As String            ' for Userpassword
Global gDataSource As String        ' for name of the database
Global gSystemOCX As Object         ' for a global referenc to this modul
Global gSearch As Integer           ' stores which search should be make (for Specs and ProductCode)
Global gPrinterList(MAX_PRINTER, 1) As String ' Array for all printers
Global gPrinterListLabel(MAX_PRINTER, 1) As String ' Array for all printers
Global gPullsheetList(MAX_PULLSHEET) As String    ' array to store all Pullsheets
Global gCabinet(MAX_CABINET, 1)        ' array for the cabinetnames and id
Global gFolderID(MAX_FOLDER, 1)        ' array for the foldernames and id
Global gSampleName(MAX_SAMPLE, 1) As String        ' array for the samplenames and icon
Global gGroup(MAX_GROUP, 1)             ' for all Groups
Global gGroupMember(MAX_GROUPMEMBER) As String              ' for all Groupsmembers
Global gNodeKey As String                ' key for the selected node
Global gSelectedSample As String               ' for the current selected sample
Global gSpec(MAX_SPEC) As String               ' for all specs
Global gSpecRev(MAX_SPECREV, 1)       ' for all specification revisions
Global gSampletype(MAX_SAMPLETYPE) As String   ' for all Sampletypes
Global gLoginconf(MAX_LOGINCONF) As String  ' for all login configurations
Global gStabMainlabs(MAX_STABMAINLAB)    ' for all requestor department (ChemStudy)
Global gTimepoint(MAX_TIMEPOINT)            ' stores all timepoints from ChemStudy
Global gLibraries(MAX_LIBRARIES) As String  ' stores all aavaible libraries
Global gMainlab As String                   ' stores the mainlab for selected sample
Global gMainlabPrinter As String            ' stores the printer of the mainlab for selected sample
Global gLabelEntry(MAX_LABELENTRY, 2)    ' saves values of label list box
Global gUserPrinter As String           ' save default printer of the user
Global gSendMail As Integer            ' flag to save if user has already send a mail
Global gUserModule(MAX_USERMODULE, 1) As String           ' all User modules, used to check for labels
Global gPrintedReports  As Integer          ' saves the value how many server reports started
Global gTimerLoop  As Integer          ' saves the value of the timer (timer is limited to 60 sec)
Global gExit As Boolean                 ' exit program
Global gDestination(MAX_DESTINATION) As String  ' for all countrys (CoA)
Global gCoASelected As String      ' store the selected CoAType
Global gCoAParameter As CoAParameter    ' stores the entered CoAParameter
Global gCoAValuesSet As Boolean     ' has the user called the CoA parameter form
Global gMainlabs(MAX_MAINLAB) As String     ' list of all Mainlabs for labelprint



Public Function StartMacro(MacroString As String, Optional count As Integer)

Dim ret As Integer
' execute the build commandline on the ChemLMS Server
'*************************

' check first if the maxium isn't reached
If count > 0 Then
    If countPrintedReports(count) = False Then
        StartMacro = False
        Exit Function
    End If
End If

    frmMain.MousePointer = 11
    ret = gSystemOCX.Command(MacroString)
    frmMain.MousePointer = 0
    If Err <> 0 Then
        StartMacro = False
        Call formatError("StartMacro")
    Else
        StartMacro = True
    End If
    
End Function

Public Function BuildMacroString(MacroName As String, Reportname As String, Printername As String, _
ReportPar1 As Variant, Optional ReportPar2 As Variant, Optional ReportPar3 As Variant)
' generates the String for the commandline
'*************************
'<EhHeader>
On Error GoTo BuildMacroString_Err
g_Debug.SendOutPut dbgCTrace, "Entered: BuildMacroString"
'</EhHeader>
Dim sHK As String ' for the character "
Dim sSep As String ' for the seperator between parameters
Dim sMacroString As String
Dim sTmp As String ' for temp strings

' fill variables
'*************************
    sHK = Chr$(34)
    sSep = Chr$(34) & "," & Chr$(34)
' get Printerstring from Printer
    

' create runstring
'*************************
    sTmp = "runmacro " & sHK & MacroName & sSep & Reportname & sSep & Printername & sSep & ReportPar1 & sHK
    If IsMissing(ReportPar2) = False Then
        sTmp = sTmp & "," & sHK & ReportPar2 & sHK
    End If
    If IsMissing(ReportPar3) = False Then
        sTmp = sTmp & "," & sHK & ReportPar3 & sHK
    End If

' send the string back
'*************************
    BuildMacroString = sTmp
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : BuildMacroString"
Exit Function

BuildMacroString_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlMain.BuildMacroString"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlMain.BuildMacroString ", , "Error"
     Resume Next
'</EhFooter>
End Function

Public Sub SetCabinett(lUserID, Optional lGroup)
' to get all cabinett for the given user
' We store the name of the cabinet in the first
' array field. This is used for the display name
' of the node. The cabinet-ID is stored in the
' second array field. It is used for the unique
' key of the node. A key must have at least one character
' and to differents the nodes we add "c" at the
' beginning of the key.
'*************************
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String
Dim lCounter As Integer ' counter for the array
Dim lLoop As Integer ' counter for loop
Dim nodX As Node

lCounter = 0
lLoop = 0

frmMain.MousePointer = 11

' check if no userid submitted
'*************************
    If lUserID = "" Then
        Exit Sub
    End If
' start error handling
'*************************
    On Error GoTo SetCabinet_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    sqlText = "select CABINETNAME , CABINETID from GWCABINET where CABINETOWNER = '" _
            & lUserID & "' order by CABINETTYPE, CABINETNAME"
    MyConn.SQL = sqlText
' execute the query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gCabinet(lCounter, 0) = MyRs.rdoColumns(0)
            gCabinet(lCounter, 1) = MyRs.rdoColumns(1)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
' close query and connetion
    MyRs.Close
    MyConn.Close


' fill the founded cabinetts to the nodes
'*************************
    For lLoop = 0 To lCounter - 1
        Set nodX = frmMain.treFolder.Nodes.Add(lGroup, tvwChild)
        nodX.Text = gCabinet(lLoop, 0)
        nodX.Key = "c" & gCabinet(lLoop, 1)
        Select Case lLoop
            Case 0 ' In-Tray
                nodX.Image = 3
            Case 1 ' Out-Tray
                nodX.Image = 4
            Case Else ' the rest
                nodX.Image = 5
        End Select
    Next lLoop
' expand the node
'*************************
    frmMain.treFolder.Nodes.Item(lGroup).Expanded = True

GoTo SetCabinet_Exit
' errorhandling
'*************************
SetCabinet_Err:
    Call formatError("SetCabinett")
    frmMain.MousePointer = 0
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Sub
    
SetCabinet_Exit:
frmMain.MousePointer = 0
End Sub

Public Sub SetFolder(lnodeKey As String)
' to get all folders for the given cabinett
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String
Dim lCounter As Integer ' counter for the array
Dim lLoop As Integer ' counter for loop
Dim lCabinetID As Long
Dim lNode As Node

lCounter = 0
lLoop = 0

' get ID of Cabinet
'*************************
    lCabinetID = Mid(lnodeKey, 2)
' set up error handling
'*************************
    On Error GoTo SetFolder_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    sqlText = "select FOLDERNAME, FOLDERID from GWFOLDER where CABINETID = " _
            & lCabinetID & " or ASSIGNEDTOCABINETID = " & lCabinetID _
            & " and FOLDERTYPE <> 0 order by FOLDERTYPE, FOLDERNAME"
    MyConn.SQL = sqlText
' execute the query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gFolderID(lCounter, 0) = MyRs.rdoColumns(0)
            gFolderID(lCounter, 1) = MyRs.rdoColumns(1)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close
' fill the nodelist with the founded folders
'*************************
    If lCounter > 0 Then
        For lLoop = 0 To lCounter - 1
            Set lNode = frmMain.treFolder.Nodes.Add(lnodeKey, tvwChild)
            lNode.Text = gFolderID(lLoop, 0)
            lNode.Key = "f" & gFolderID(lLoop, 1)
            lNode.Image = 6
        Next lLoop
    End If
' expand the node
'*************************
    frmMain.treFolder.Nodes.Item(lnodeKey).Expanded = True

GoTo SetFolder_Exit
' errorhandling
'*************************
SetFolder_Err:
    Call formatError("SetFolder")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Sub
    
SetFolder_Exit:

End Sub
Public Sub SetGroup(lUserNo As Integer)
' to get all folders for the given cabinett
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String
Dim lCounter As Integer ' counter for the array
Dim lLoop As Integer ' counter for loop
Dim lCabinetID As Long
Dim lNode As Node

lCounter = 0
lLoop = 0

frmMain.MousePointer = 11
' set up error handling
'*************************
    On Error GoTo SetGroup_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    sqlText = "Select LmsGroup.Name,LmsGroup.GroupId " _
            & "From LmsGroup,GroupMember where GroupMember.UserId = " _
            & lUserNo & " And GroupMember.GroupID = LmsGroup.GroupID " _
            & "And (GroupMember.State = '*' or GroupMember.State is null) " _
            & "And (LmsGroup.State = '*' or LmsGroup.State is null)" _
            & "Order By LmsGroup.Name"
    MyConn.SQL = sqlText
' execute the query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gGroup(lCounter, 0) = MyRs.rdoColumns(0)
            gGroup(lCounter, 1) = MyRs.rdoColumns(1)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close
' fill the nodelist with the founded folders
'*************************
    If lCounter > 0 Then
        For lLoop = 0 To lCounter - 1
            Set lNode = frmMain.treFolder.Nodes.Add()
            lNode.Text = gGroup(lLoop, 0)
            lNode.Key = "g" & gGroup(lLoop, 1)
            lNode.Image = 1
        Next lLoop
    End If

GoTo SetGroup_Exit
' errorhandling
'*************************
SetGroup_Err:
    Call formatError("SetGroup")
    frmMain.MousePointer = 0
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Sub
    
SetGroup_Exit:
frmMain.MousePointer = 0
End Sub

Public Sub SetSample(lnodeKey As String)
' to get all samples for the given node
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String
Dim lCounter As Integer ' counter for the array
Dim lLoop As Integer ' counter for loop
Dim lFolderID As Long
Dim lNode As Node

lCounter = 0
lLoop = 0

frmMain.MousePointer = 11

' get ID of Folder
'*************************
    lFolderID = Mid(lnodeKey, 2)
' set up error handling
'*************************
    On Error GoTo SetSample_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    sqlText = "select SAMPNAME, SAMPLETYPEICON " _
            & "from SAMPLE, GWSAMPLEINFOLDER, GWSMPCONF where " _
            & "GWSAMPLEINFOLDER.SAMPLEID = SAMPLE.SAMPID " _
            & "and GWSMPCONF.SAMPLETYPE = SAMPLE.SAMPTAG1 " _
            & " and FOLDERID = " & lFolderID & " order by SAMPNAME"
    MyConn.SQL = sqlText
' execute the query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gSampleName(lCounter, 0) = MyRs.rdoColumns(0)
            gSampleName(lCounter, 1) = MyRs.rdoColumns(1)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close
' add founded sample to the nodelist
'*************************
    If lCounter > 0 Then
        For lLoop = 0 To lCounter - 1
            Set lNode = frmMain.treFolder.Nodes.Add(lnodeKey, tvwChild)
            lNode.Text = gSampleName(lLoop, 0)
            ' we use the folderID as additional key because it is
            ' possible that the same sample is in different folders
            lNode.Key = "s" & gSampleName(lLoop, 0) & "_" & lFolderID
            lNode.Image = gSampleName(lLoop, 1)
        Next lLoop
    End If
' expand the node
'*************************
    frmMain.treFolder.Nodes.Item(lnodeKey).Expanded = True

GoTo SetSample_Exit
' errorhandling
'*************************
SetSample_Err:
    Call formatError("SetSample")
    frmMain.MousePointer = 0
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Sub
    
SetSample_Exit:
frmMain.MousePointer = 0

End Sub

Public Function UpdateInfo(lSamplename)
' Updates all label for the given sample
Dim progress As Integer
Dim I As Integer
Dim strTempSpecRev As String

On Error GoTo UpdateInfo_Err

I = 0
progress = 0

frmWait.prbStatus.Value = 0
frmWait.prbStatus.Max = 14
frmWait.Show vbModeless, frmMain
frmWait.MousePointer = 11
DoEvents
' set global variables
gSelectedSample = lSamplename
gSampleID = getSampleID(lSamplename)
' reset CoA Settings Flag
gCoAValuesSet = False

' check if sample exits
If gSampleID = "" Then
    AddStatusMessage ("Sample doesn't exits !")
    GoTo UpdateInfo_Exit
End If
progress = progress + 1
frmWait.prbStatus.Value = progress

With frmMain
    .txtSinSamSample = lSamplename
    .txtStabSamSample = lSamplename
    .txtLabelSample = lSamplename
    .txtCertSample = lSamplename
    
    .lblSinSamItemShow = getItem(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .lblSinSamLotShow = getLot(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .lblSinSamProDescShow = getProduct(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .lblSinSamStatusShow = getSampleStatus(gSampleID)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .lblStabSamItemShow = .lblSinSamItemShow
    .lblStabSamLotShow = .lblSinSamLotShow
    .lblStabSamProDescShow = .lblSinSamProDescShow
    .lblLabelItemShow = .lblSinSamItemShow
    .lblLabelLotShow = .lblSinSamLotShow
    .lblLabelProductShow = .lblSinSamProDescShow
    .lblCertItemShow = .lblSinSamItemShow
    .lblCertLotShow = .lblSinSamLotShow
    .lblcertProductShow = .lblSinSamProDescShow
    .lblcertStatusShow = .lblSinSamStatusShow
    
    .txtStabStudy = getStudyNo(lSamplename)
    .lblStabSamStudyShow = .txtStabStudy
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .cboStabTimepoint = getTimePoint(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .lblStabSamScStShow = .cboStabTimepoint & " " & getStorageCondition(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .lblStabSamPackageShow = getStabPackage(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .cboConfSampletype = getSampletype(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .txtConfProductCode = getProductcode(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
    .txtConfSpecification = getSpecification(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
     ' get SpecRev if a spec was found
     If .txtConfSpecification <> "" Then
        getAllSpecRev (.txtConfSpecification)
        ' fill ComboBox
        .cboConfSpecRev.Clear
        For I = 0 To MAX_SPECREV
            If gSpecRev(I, 0) = "" Then
                Exit For
            Else
                .cboConfSpecRev.AddItem gSpecRev(I, 0), gSpecRev(I, 1)
            End If
        Next I
        strTempSpecRev = getSpecRev(lSamplename)
        progress = progress + 1
        frmWait.prbStatus.Value = progress
        .cboConfSpecRev.ListIndex = (CLng(strTempSpecRev) - 1)
    End If
       
    gMainlab = getMainlab(lSamplename)
    gMainlabPrinter = getMainlabPrinter(lSamplename, gMainlab)
    .optMainlab.Caption = "Mainlab " & gMainlabPrinter
        progress = progress + 1
        frmWait.prbStatus.Value = progress
End With

GoTo UpdateInfo_Exit

UpdateInfo_Err:
    Call formatError(UpdateInfo)
    frmWait.MousePointer = 0
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    GoTo UpdateInfo_Exit

UpdateInfo_Exit:
frmWait.MousePointer = 0
Unload frmWait

End Function

Public Function AddStatusMessage(strNewMessage)
On Error GoTo AddStatusMessage_Err

With frmMain.txtStatus
    .SelStart = Len(.Text)
    .SelText = vbCrLf & strNewMessage
End With

GoTo AddStatusMessage_Exit

AddStatusMessage_Err:
    ' We really don't know if a overflow of the textbox could happen
    ' just in case delete all text and add only the new one
    frmMain.txtStatus.Text = strNewMessage
    Exit Function
AddStatusMessage_Exit:

End Function

Public Sub SetGroupMember(lnodeKey As String)
' to get all members for the given group
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String
Dim lCounter As Integer ' counter for the array
Dim lLoop As Integer ' counter for loop
Dim lGroupID As Long
Dim lNode As Node


lCounter = 0
lLoop = 0

frmMain.MousePointer = 11
' get ID of Group
'*************************
    lGroupID = Mid(lnodeKey, 2)
' set up error handling
'*************************
    On Error GoTo SetGroupMember_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    sqlText = "Select unique LmsUser.Name From LmsUser where " _
            & "LmsUser.UserId in (select GroupMember.UserID from " _
            & "GroupMember where GroupMember.GroupID = " _
            & lGroupID & " And (GroupMember.State is null or " _
            & "GroupMember.State = '*'))"
    MyConn.SQL = sqlText
' execute the query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gGroupMember(lCounter) = MyRs.rdoColumns(0)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close
' fill the nodelist with the founded folders
'*************************
    If lCounter > 0 Then
        For lLoop = 0 To lCounter - 1
            Set lNode = frmMain.treFolder.Nodes.Add(lnodeKey, tvwChild)
            lNode.Text = gGroupMember(lLoop)
            lNode.Key = "u" & gGroupMember(lLoop) & "*" & lGroupID
            lNode.Image = 2
        Next lLoop
    End If
' expand the node
'*************************
    frmMain.treFolder.Nodes.Item(lnodeKey).Expanded = True

GoTo SetGroupMember_Exit
' errorhandling
'*************************
SetGroupMember_Err:
    Call formatError("SetGroupMember")
    frmMain.MousePointer = 0
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Sub
    
SetGroupMember_Exit:
frmMain.MousePointer = 0
End Sub

Public Function getLabelSet(lUsername, lSetNo)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getLabelSet
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  21.05.2003
' Parameters :  lUsername
'               lSetNo
' Description:  to get set of labels for a specified username
'--------------------------------------------------------------------------------
'</CSCM>

'<EhHeader>
On Error GoTo getLabelSet_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getLabelSet"
'</EhHeader>
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim sqlText As String
Dim intCounter As Integer
Dim intRows As Integer

' check if no sample
'*************************
    If lUsername = "" Then
        Exit Function
    End If

On Error GoTo getLabelSet_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    sqlText = "select LABNAME, LABELPRINTER, NOOFLABEL from T_PRINTERY_LABEL " _
            & "where USERNAME = '" & lUsername & "'" & " and SETNO = " _
            & lSetNo & " order by LABNAME"
            
    MyConn.SQL = sqlText
' start query
'*************************
intCounter = 0
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gLabelEntry(intCounter, 0) = MyRs.rdoColumns(0)
            gLabelEntry(intCounter, 1) = MyRs.rdoColumns(1)
            gLabelEntry(intCounter, 2) = MyRs.rdoColumns(2)
            MyRs.MoveNext
            intCounter = intCounter + 1
        Wend
    ' there is a little problem with rowcount
    ' sometimes it returns -1 and sometime 0 if no records where found
    intRows = intCounter
    ' delete rest of array
intCounter = 0
    For intCounter = intRows To MAX_LABELENTRY
        gLabelEntry(intCounter, 0) = ""
        gLabelEntry(intCounter, 1) = ""
        gLabelEntry(intCounter, 2) = ""
    Next intCounter
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close


'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getLabelSet"
Exit Function

getLabelSet_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlMain.getLabelSet"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlMain.getLabelSet ", , "Error"
     Resume Next
'</EhFooter>
End Function


Public Function countPrintedReports(lCount)
' check if the user has reached the maxium of server reports

If lCount = "" Then Exit Function

If gPrintedReports - lCount < 0 Then
    AddStatusMessage ("ERROR: Maxium of reports reached! Please wait a while and try it again.")
    countPrintedReports = False
Else
    countPrintedReports = True
    gPrintedReports = gPrintedReports - lCount
End If

' update statusbar
    frmMain.staBar.Panels.Item(3).Text = "Reports left: " & gPrintedReports

End Function
Function GetCommandLine(Optional MaxArgs)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       GetCommandLine
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       10.08.01 08:01:33
' Parameters :       MaxArgs
' Description:       Function from VB Help to read the comman line arguments
'--------------------------------------------------------------------------------
'</CSCM>
   
   'Declare variables.
   Dim C, CmdLine, CmdLnLen, InArg, I, NumArgs
   'See if MaxArgs was provided.
   If IsMissing(MaxArgs) Then MaxArgs = 10
   'Make array of the correct size.
   ReDim ArgArray(MaxArgs)
   NumArgs = 0: InArg = False
   'Get command line arguments.
   CmdLine = Command()
   CmdLnLen = Len(CmdLine)
   'Go thru command line one character
   'at a time.
   For I = 1 To CmdLnLen
      C = Mid(CmdLine, I, 1)
      'Test for space or tab.
      If (C <> " " And C <> vbTab) Then
         'Neither space nor tab.
         'Test if already in argument.
         If Not InArg Then
         'New argument begins.
         'Test for too many arguments.
            If NumArgs = MaxArgs Then Exit For
            NumArgs = NumArgs + 1
            InArg = True
         End If
         'Concatenate character to current argument.
         ArgArray(NumArgs) = ArgArray(NumArgs) & C
      Else
         'Found a space or tab.
         'Set InArg flag to False.
         InArg = False
      End If
   Next I
   'Resize array just enough to hold arguments.
   ReDim Preserve ArgArray(NumArgs)
   'Return Array in Function name.
   GetCommandLine = ArgArray()
End Function


Function startDebug() As Boolean

With g_Debug
    .OutTo = dbgOutToWindow
    .OutToWindowTitel = "Debug for Printery"
    .WindowPosition = dbgWindowLeftTop
    .AutoSave = True
    .OpenOut
End With
    
End Function

Function initDebug() As Boolean
Set g_Debug = New clsDebug
End Function
