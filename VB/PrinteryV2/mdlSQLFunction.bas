Attribute VB_Name = "mdlSQLFunction"
'CSEH: ErrBaliDebug
'<CSCC>
'--------------------------------------------------------------------------------
'    Component  : mdlSQLFunction
'    Project    : Printery
'    Author     : Klaus Zinsmeister
'    Date       : 10.08.01
'    Description: Here we collect all function that recieve data from the database
'                 We started this project a long time ago, so this code look
'                 very urgly. Maybe we have someday the time to change it.
'
'    Author     : Klaus Zinsmeister
'    Date       : 03-Mar-2003
'                 For Version 2 we added some common functions. We didn't change
'                 the design of the functions. This redesign will be needed when
'                 we move to .NET
'--------------------------------------------------------------------------------
'</CSCC>
Option Explicit


Public Msg_Err As String    'Errormessage for MsgBox
'

Public Function getProduct(lSamplename)
' to get the productname of a sample
    '<EhHeader>
    On Error GoTo getProduct_Err
    g_Debug.SendOutPut dbgCTrace, "Enter: mdlSQLFunction.getProduct"
    '</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getProduct_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
        strSqlText = "select PRODUKT from BALI_ATTRIB_PRODUKTVW where SAMPLENAME = '" & _
                    lSamplename & "'"
        MyConn.SQL = strSqlText
        g_Debug.SendOutPut dbgCMisc, strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getProduct = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

    '<EhFooter>
    g_Debug.SendOutPut dbgCTrace, "Exit : mdlSQLFunction.getProduct"
    Exit Function

getProduct_Err:
    g_Debug.SendOutPut dbgCError, Err.Description, "Printery.mdlSQLFunction.getProduct", Erl
    '</EhFooter>
    Call formatError("getProduct")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
End Function

Public Function getItem(lSamplename)
' to get the Itemnumber of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getItem_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select ITEMNO from BALI_ATTRIB_ITEMVW where SAMPLENAME = '" & _
                lSamplename & "'"
    MyConn.SQL = strSqlText
' execute query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getItem = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connection
'*************************
    MyRs.Close
    MyConn.Close

GoTo getItem_Exit

getItem_Err:
    Call formatError("getItem")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
getItem_Exit:
End Function

Public Function getLot(lSamplename)
Dim lRS As rdoResultset
Dim lMyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
If lSamplename = "" Then
    Exit Function
End If

On Error GoTo getLot_Err
' prepare query
'*************************
Set lMyConn = gBALIConn.CreatePreparedStatement("", "")
strSqlText = "select LOTNO from BALI_ATTRIB_LOTVW where SAMPLENAME = '" _
        & lSamplename & "'"
lMyConn.SQL = strSqlText
' execute query
'*************************
Set lRS = lMyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
    While Not lRS.EOF
        If IsNull(lRS(0)) = False Then
            getLot = lRS(0)
        End If
        lRS.MoveNext
    Wend
' close query and connection
'*************************
lRS.Close
lMyConn.Close

GoTo getLot_Exit

getLot_Err:
    Call formatError("getLot")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getLot_Exit:

End Function

Public Function getSampleName(lSampleID)
' to get the Samplename from a SampleID
' e.g SampleID = 1002 -> SampleName = "07000300"
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSampleID = "" Then
        Exit Function
    End If

On Error GoTo getSampleName_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select SAMPNAME from SAMPLE where SAMPID = " & lSampleID
    MyConn.SQL = strSqlText
' execute query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getSampleName = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connection
'*************************
    MyRs.Close
    MyConn.Close

GoTo getSampleName_Exit

getSampleName_Err:
    Call formatError("getSampleName")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getSampleName_Exit:

End Function

Public Function formatError(Optional lName As Variant)
' generic function to format an error
    Msg_Err = "Error " & Str(Err.Number) & _
            " created by " & lName & Chr$(13) & Err.Source & Chr$(13) _
            & Err.Description
End Function

Public Function getSampleStatus(lSampleID)
' to get the SampleStatus of a sample
' the status will directly be translated to the string
'<EhHeader>
On Error GoTo getSampleStatus_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getSampleStatus"
'</EhHeader>
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
    If lSampleID = "" Then
        Exit Function
    End If
' prepare query

    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    
    strSqlText = "select DECODE (sampstatus, 0, 'LoggedIn', 1, 'Requested', 2, 'Released', " & _
                "3, 'Scheduled', 4, 'Result exits', 5, 'Completed', " & _
                "6, 'Validated Level 0', 7, 'Validated Level 1', 8, 'Validated Level 2', " & _
                "9, 'Validated Level 3', 10, 'Validated Level 4', 11, 'Validated Level 5', " & _
                "12, 'Validated Level 6', 16, 'Validated', 17, 'Approved', " & _
                "18, 'Archived', 19, 'Reopen', 20, 'Canceled') Status " & _
                "from SAMPLESTATMIN where SAMPID = " & lSampleID & " and CURRAUDITFLAG = '1' "
       
    MyConn.SQL = strSqlText
    ' execute query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getSampleStatus = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
    ' close query and connection
    MyRs.Close
    MyConn.Close


'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getSampleStatus"
Exit Function

getSampleStatus_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getSampleStatus ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getSampleStatus"
     Resume Next
'</EhFooter>
End Function
Public Function getUserName(lUserID)
' to get the Username of a userid
' e.g. Userid = 3110 -> Username = "Klaus Zinsmeister"
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no UserID
'*************************
    If lUserID = "" Then
        Exit Function
    End If

On Error GoTo getUserName_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select distinct FULLNAME from LMSUSER where NAME = Upper('" & lUserID & "')"
    MyConn.SQL = strSqlText
' execute query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getUserName = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connection
'*************************
    MyRs.Close
    MyConn.Close

GoTo getUserName_Exit

getUserName_Err:
    Call formatError("getUserName")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getUserName_Exit:
End Function

Public Function getAllPrinter()
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim lCounter As Integer ' counter for the array

lCounter = 0

On Error GoTo getAllPrinter_Err

    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select * From GWDESTCONF order by DEVICENAME"
    MyConn.SQL = strSqlText

    Set MyRs = MyConn.OpenResultset(rdOpenDynamic, rdConcurReadOnly)
        ' first select all normal printers
        While Not MyRs.EOF
            If Left$(MyRs.rdoColumns(0), 2) = "HP" Then
                gPrinterList(lCounter, 0) = MyRs.rdoColumns(0)
                gPrinterList(lCounter, 1) = MyRs.rdoColumns(1)
                lCounter = lCounter + 1
            End If
            MyRs.MoveNext
        Wend
        MyRs.MoveFirst
        lCounter = 0
        ' select all label printers
        While Not MyRs.EOF
            If Left$(MyRs.rdoColumns(0), 3) = "LBL" Then
                gPrinterListLabel(lCounter, 0) = MyRs.rdoColumns(0)
                gPrinterListLabel(lCounter, 1) = MyRs.rdoColumns(1)
                lCounter = lCounter + 1
            End If
            MyRs.MoveNext
        Wend
    MyRs.Close
    MyConn.Close

GoTo getAllPrinter_Exit

getAllPrinter_Err:
    Call formatError("getAllPrinter")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getAllPrinter_Exit:

End Function

Public Function getMainlab(lSamplename)
' to get the Mainlab of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getMainlab_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select MAINLAB from BALI_ATTRIB_MAINLABVW where SAMPLENAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getMainlab = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getMainlab_Exit

' errorhandling
getMainlab_Err:
    Call formatError("getMainlab")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getMainlab_Exit:

End Function

Public Sub getAllStabMainlabs()

'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getAllStabMainlabs
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  26.02.2004
' Parameters :
' Description:  load all avaible mainlabs from ChemStudy
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getAllStabMainlabs_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getAllStabMainlabs"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim intCounter As Integer


    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
        strSqlText = "select distinct MAINLAB from CS_BALI_FORECASTMAINLAB"

        MyConn.SQL = strSqlText
        g_Debug.SendOutPut dbgCMisc, strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                gStabMainlabs(intCounter) = MyRs(0)
                intCounter = intCounter + 1
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getAllStabMainlabs"
Exit Sub

getAllStabMainlabs_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getAllStabMainlabs ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getAllStabMainlabs"
     Resume Next
'</EhFooter>

End Sub

Public Function getAllPullsheet()
' gets the list of all Pullsheets
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim lCounter As Integer ' counter for the array

lCounter = 0

On Error GoTo getAllPullsheet_Err

' prepare the query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select distinct PULLSHEET_NAME From PULLSHEETNAME where " _
            & "PULLSHEET_NAME is not null order by PULLSHEET_NAME desc"
    MyConn.SQL = strSqlText
' execute the query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gPullsheetList(lCounter) = MyRs.rdoColumns(0)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
' close query and connection
'*************************
    MyRs.Close
    MyConn.Close

GoTo getAllPullsheet_Exit

getAllPullsheet_Err:
    Call formatError("getAllPullsheet")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getAllPullsheet_Exit:

End Function
Public Function getUserPrinter(lUserID)
' to get the specific user defaults like printer etc.
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lUserID = "" Then
        Exit Function
    End If

On Error GoTo getUserPrinter_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select REPDESTREPORT from GWUSERATTRIBUTES where USERNAME = '" _
            & lUserID & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getUserPrinter = MyRs(0)
                ' set also global variable
                gUserPrinter = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getUserPrinter_Exit
' errorhandling
'*************************
getUserPrinter_Err:
    Call formatError("getUserPrinter")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getUserPrinter_Exit:

End Function

Public Function getUserMode(lUserID)
' to get the specific user mode
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lUserID = "" Then
        Exit Function
    End If

On Error GoTo getUserMode_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select STARTUPMODE from GWUSERATTRIBUTES where USERNAME = '" _
            & lUserID & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getUserMode = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getUserMode_Exit
' errorhandling
'*************************
getUserMode_Err:
    Call formatError("getUserMode")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getUserMode_Exit:

End Function

Public Function getAllSampletype()
' gets the list of all Sampletypes
'<Modified by: Klaus Zinsmeister at 28.10.2003-13:06:35 on machine: BALI_ZI>
'   Use View BASTAG for a faste retriev of the Sampletypes
'</Modified by: Klaus Zinsmeister at 28.10.2003-13:06:35 on machine: BALI_ZI>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim lCounter As Integer ' counter for the array

lCounter = 0

On Error GoTo getAllSampletype_Err

' prepare the query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select SAMPTAG1 From BASTAG " _
            & "order by SAMPTAG1"
    MyConn.SQL = strSqlText
' execute the query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gSampletype(lCounter) = MyRs.rdoColumns(0)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
' close query and connection
'*************************
    MyRs.Close
    MyConn.Close

GoTo getAllSampletype_Exit

getAllSampletype_Err:
    Call formatError("getAllSampletype")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getAllSampletype_Exit:

End Function


Public Function getStudyNo(lSamplename)
' to get the Studynumber of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getStudyNo_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select STUDYNUMBER from BALI_ATTRIB_STUDYNUMBERVW where SAMPLENAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getStudyNo = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getStudyNo_Exit

' errorhandling
'*************************
getStudyNo_Err:
    Call formatError("getStudyNo")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getStudyNo_Exit:

End Function

Public Function getTimePoint(lSamplename)
' to get the TimePoint (study) of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getTimePoint_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select STORAGETIME from BALI_ATTRIB_STORAGETIMEVW where SAMPLENAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getTimePoint = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getTimePoint_Exit

' errorhandling
getTimePoint_Err:
    Call formatError("getTimePoint")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getTimePoint_Exit:

End Function

Public Function getSampletype(lSamplename)
' to get the Sampletype of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getSampletype_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select SAMPTAG1 from SAMPLE where SAMPNAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getSampletype = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getSampletype_Exit

' errorhandling
getSampletype_Err:
    Call formatError("getSampletype")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getSampletype_Exit:

End Function

Public Function getProductcode(lSamplename)
' to get the ProductCode of a sample
' Note: This is Samptag2 - not the ItemNo
' we need this for the Login Configuration
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getProductcode_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select SAMPTAG2 from SAMPLE where SAMPNAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getProductcode = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getProductcode_Exit

' errorhandling
'*************************
getProductcode_Err:
    Call formatError("getProductcode")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getProductcode_Exit:

End Function

Public Function getSpecification(lSamplename)
' to get the Specifikation of a sample
' Note: First we try Samptag3 - because this is faster
' if SAMPTAG3 is empty (manually loggin samples) we get the
' attribute SPECID$ from sample
' we need this for the Specification Report
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getSpecification_Err
' prepare query
'*************************
Set MyConn = gBALIConn.CreatePreparedStatement("", "")
strSqlText = "select SAMPTAG3 from SAMPLE where SAMPNAME = '" _
        & lSamplename & "'"
MyConn.SQL = strSqlText
' start query
'*************************
Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
    While Not MyRs.EOF
        If IsNull(MyRs(0)) = False Then
            getSpecification = MyRs(0)
        End If
        MyRs.MoveNext
    Wend

' close query and check if we have found the Specname.
' else get the sample attribute
'*************************
MyRs.Close
If getSpecification = "" Then
    strSqlText = "select RESSTRVAL From result, Var " _
            & "where result.SPECREVID = var.SPECREVID " _
            & "and result.VARID = var.VARID " _
            & "and var.NAME = 'SPECID$' " _
            & "and result.SAMPNAME = '" & lSamplename & "'"
    MyConn.SQL = strSqlText
    ' start query
    '*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getSpecification = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
    MyRs.Close
End If
' OK close and exit
MyConn.Close

GoTo getSpecification_Exit

' errorhandling
'*************************
getSpecification_Err:
    Call formatError("getSpecification")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getSpecification_Exit:

End Function

Public Function getMainlabPrinter(lSamplename, lMainlab)
' to get the Printername from the Mainlab of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getMainlabPrinter_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select RESSTRVAL From result, Var, spec " _
            & "where result.SPECREVID = spec.SPECREVID " _
            & "and result.SPECREVID = var.SPECREVID " _
            & "and result.VARID = var.VARID " _
            & "and var.NAME = 'LABPRINTER$' " _
            & "and result.SAMPNAME = '" & lSamplename & "'" _
            & "and spec.LIBRARYNAME = '" & lMainlab & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getMainlabPrinter = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getMainlabPrinter_Exit

' errorhandling
'*************************
getMainlabPrinter_Err:
    Call formatError("getMainlabPrinter")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getMainlabPrinter_Exit:

End Function

Public Function getAllTimepoint()
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim lCounter As Integer ' counter for the array

lCounter = 0

On Error GoTo getAllTimepoint_Err

    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select SET_VALUE From DomainCurMin " _
            & "where DOMAIN_OBJECT_NUMBER = 7821 order by SET_VALUE"
    MyConn.SQL = strSqlText

    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gTimepoint(lCounter) = MyRs.rdoColumns(0)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
    
    MyRs.Close
    MyConn.Close

GoTo getAllTimepoint_Exit

getAllTimepoint_Err:
    Call formatError("getAllTimepoint")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getAllTimepoint_Exit:

End Function

Public Function getAllSpec()
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim lCounter As Integer ' counter for the array

lCounter = 0

On Error GoTo getAllSpec_Err

    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select distinct SPECNAME " _
            & "From GWSPECAPPROVED order by SPECNAME"
    MyConn.SQL = strSqlText

    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gSpec(lCounter) = MyRs.rdoColumns(0)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
    
    MyRs.Close
    MyConn.Close

GoTo getAllSpec_Exit

getAllSpec_Err:
    Call formatError("getAllSpec")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getAllSpec_Exit:

End Function

Public Function getSampleID(lSamplename)
' to get the SampleID of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getSampleID_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select SAMPID from SAMPLE where SAMPNAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getSampleID = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getSampleID_Exit

' errorhandling
getSampleID_Err:
    Call formatError("getSampleID")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getSampleID_Exit:

End Function



Public Function getAllSpecRev(lSpecName)
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim lCounter As Integer ' counter for the array
Dim I As Integer

lCounter = 0

' check if no Specname
'*************************
    If lSpecName = "" Then
        Exit Function
    End If

' clear the global variable

For I = 0 To MAX_SPECREV
    gSpecRev(I, 0) = ""
    gSpecRev(I, 1) = ""
Next I
    
On Error GoTo getAllSpecRev_Err

    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select SPECIFICATIONREVISION, " _
            & "decode (SPECIFICATIONSTATUS, 0, 'U', 1, 'A', 2, 'D') STATE " _
            & "From GWSPECAPPROVED " _
            & "where  SPECNAME = '" & lSpecName & "'" _
            & "order by SPECNAME"
    MyConn.SQL = strSqlText

    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gSpecRev(lCounter, 0) = MyRs.rdoColumns(0) & " (" & MyRs.rdoColumns(1) & ")"
            gSpecRev(lCounter, 1) = MyRs.rdoColumns(0) - 1
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
    
    MyRs.Close
    MyConn.Close

GoTo getAllSpecRev_Exit

getAllSpecRev_Err:
    Call formatError("getAllSpecRev")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getAllSpecRev_Exit:

End Function

Public Function getSpecRev(lSamplename)
' to get the specification revision of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getSpecRev_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select RESSTRVAL From result, Var " _
            & "where result.SPECREVID = var.SPECREVID " _
            & "and result.VARID = var.VARID " _
            & "and var.NAME = 'SPECREV$' " _
            & "and result.SAMPNAME = '" & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getSpecRev = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getSpecRev_Exit
' errorhandling
'*************************
getSpecRev_Err:
    Call formatError("getSpecRev")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getSpecRev_Exit:

End Function

Public Function getAllIcon()

' not finished jet

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim lCounter As Integer ' counter for the array
Dim I As Integer

lCounter = 0


    
On Error GoTo getAllIcon_Err

    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select SAMPLETYPEICON, " _
            & "decode (SPECIFICATIONSTATUS, 0, 'U', 1, 'A', 2, 'D') STATE " _
            & "From GWSPECAPPROVED " _
            & "order by SPECNAME"
    MyConn.SQL = strSqlText

    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
    
    MyRs.Close
    MyConn.Close

GoTo getAllIcon_Exit

getAllIcon_Err:
    Call formatError("getAllIcon")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getAllIcon_Exit:

End Function


Public Function getUserNo(lUserID)
' to get the Username of a userid
' e.g. Userid = 3110 -> Username = "Klaus Zinsmeister"
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no UserID
'*************************
    If lUserID = "" Then
        Exit Function
    End If

On Error GoTo getUserNo_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select USERID from LMSUSER where NAME = Upper('" & lUserID & "')"
    MyConn.SQL = strSqlText
' execute query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getUserNo = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connection
'*************************
    MyRs.Close
    MyConn.Close

GoTo getUserNo_Exit

getUserNo_Err:
    Call formatError("getUserNo")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getUserNo_Exit:
End Function

Public Function checkStudyNo(lStudyNo As String)
'*************************************************
'Date:  12 Juli, 2000
'       to check if a Studynumber exists
'       Return >=1 if so and 0 if not
'*************************************************

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no Studynumber submitted
'*************************
    If lStudyNo = "" Then
        Exit Function
    End If

On Error GoTo checkStudyNo_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select count(*) from CS_BALI_STUDYCUR cs " _
            & "where cs.STUDY_NAME = '" & lStudyNo & "'"
    MyConn.SQL = strSqlText
' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                checkStudyNo = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo checkStudyNo_Exit

' errorhandling
'*************************
checkStudyNo_Err:
    Call formatError("checkStudyNo")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
checkStudyNo_Exit:

End Function


Public Function getStabPackage(lSamplename)
' to get the Packagename of Stabilitysample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getStabPackage_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select STABPACKAGE from BALI_ATTRIB_STABPACKAGEVW where SAMPLENAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getStabPackage = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getStabPackage_Exit

' errorhandling
getStabPackage_Err:
    Call formatError("getStabPackage")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getStabPackage_Exit:

End Function

Public Function getUserModuleLabel(lUserID)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       getUserModuleLabel
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       10.08.01 09:43:07
' Parameters :       lUserID
' Description:       Gets all Modules for a user
'--------------------------------------------------------------------------------
'<Modified by: Klaus Zinsmeister at 17.10.01-10:19:35 on machine: BALI_ZI>
' New View for RLP 1.3
' Because there are now Menu-Templates we need the new View BALI_PRINTERY_LABEL
' to get all Modules for one User.
'</Modified by: Klaus Zinsmeister at 17.10.01-10:19:35 on machine: BALI_ZI>
'<Modified by: Klaus Zinsmeister at 02.07.2003-15:14:40 on machine: BALI_ZI>
' Changed View to BALI_PRINTERY_MODULE
'</Modified by: Klaus Zinsmeister at 02.07.2003-15:14:40 on machine: BALI_ZI>

'<EhHeader>
On Error GoTo getUserModuleLabel_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getUserModuleLabel"
'</EhHeader>

'</CSCM>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim intCounter As Integer

' check if no sample
'*************************
    If lUserID = "" Then
        Exit Function
    End If

On Error GoTo getUserModuleLabel_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select EVENTNAME, TEMPLATE from BALI_PRINTERY_MODULE where USERNAME = '" _
            & lUserID & "'"
    g_Debug.SendOutPut dbgCMisc, strSqlText
    MyConn.SQL = strSqlText
    
' set default for loop
intCounter = 0

' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        Do While Not MyRs.EOF
            If intCounter = MAX_USERMODULE Then Exit Do
            gUserModule(intCounter, 0) = MyRs(0)
            gUserModule(intCounter, 1) = MyRs(1)
            intCounter = intCounter + 1
            MyRs.MoveNext
        Loop
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getUserModuleLabel"
Exit Function

getUserModuleLabel_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getUserModuleLabel ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getUserModuleLabel"
     Resume Next
'</EhFooter>
End Function


Public Function getStorageCondition(lSamplename)
' to get the Storagecondition (study) of a sample
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
'*************************
    If lSamplename = "" Then
        Exit Function
    End If

On Error GoTo getStorageCondition_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select STORAGECONDITION from BALI_ATTRIB_STORAGECONDITIONVW where SAMPLENAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getStorageCondition = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close

GoTo getStorageCondition_Exit

' errorhandling
getStorageCondition_Err:
    Call formatError("getStorageCondition")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    Exit Function
    
getStorageCondition_Exit:

End Function

Public Function checkAccount(strUser As String) As Date
'<CSCM>
'--------------------------------------------------------------------------------
' Project    :       Printery
' Procedure  :       checkAccount
' Description:       read expiry date from database for given user
' Created by :       Administrator
' Machine    :       BALI_ZI
' Date-Time  :       01.03.2002-07:12:19
'
' Parameters :
'--------------------------------------------------------------------------------
'</CSCM>


Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no user
If strUser = "" Then
    Exit Function
End If

On Error GoTo checkAccount_Err
' prepare query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select expiry_date from sys.USER_USERS where username = '" _
                & UCase(strUser) & "'"
    MyConn.SQL = strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                checkAccount = CDate(MyRs(0))
            Else
                ' no expiry date set, return one year more
                checkAccount = DateAdd("yyyy", 1, Now())
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close
    
GoTo checkAccount_Exit

' errorhandling
checkAccount_Err:
    Call formatError("checkAccount")
    MsgBox Msg_Err, , "Error", Err.HelpFile, Err.HelpContext
    'Return just one year more to prvent errors
    checkAccount = DateAdd("yyyy", 1, Now())
    Exit Function
    
checkAccount_Exit:

End Function

Public Sub getAllMainlabs()

'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getAllMainlabs
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  26.02.2004
' Parameters :
' Description:  load all avaible mainlabs
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getAllMainlabs_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getAllMainlabs"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim intCounter As Integer


    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
        strSqlText = "select element from V1MAINLAB"

        MyConn.SQL = strSqlText
        g_Debug.SendOutPut dbgCMisc, strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                gMainlabs(intCounter) = MyRs(0)
                intCounter = intCounter + 1
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getAllMainlabs"
Exit Sub

getAllMainlabs_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getAllMainlabs ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getAllMainlabs"
     Resume Next
'</EhFooter>

End Sub
'CSEH: ErrBaliDebug
Public Sub getAllLibraries()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getAllLibraries
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  15.01.2003
' Parameters :
' Description:  load all avaible libraries
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getAllLibraries_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getAllLibraries"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim intCounter As Integer


    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
        strSqlText = "select distinct s.libraryname from spec s " & _
                     "where s.spectype not in ('K','M','D','S','A')"

        MyConn.SQL = strSqlText
        g_Debug.SendOutPut dbgCMisc, strSqlText
' start query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                gLibraries(intCounter) = MyRs(0)
                intCounter = intCounter + 1
            End If
            MyRs.MoveNext
        Wend
' close query and connetion
'*************************
    MyRs.Close
    MyConn.Close
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getAllLibraries"
Exit Sub

getAllLibraries_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getAllLibraries ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getAllLibraries"
     Resume Next
'</EhFooter>
End Sub

'CSEH: ErrBaliDebug
Function getPSLforLibrary(strLibrary) As String()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getPSLforLibrary
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  20.01.2003
' Parameters :  strLibrary
' Description:  Read all PSL's for the given Library
'               returns an array with all PSL's
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getPSLforLibrary_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getPSLforLibrary"
'</EhHeader>
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim intCounter As Integer
Dim lngCountPSL As Long
Dim aryPSL() As String


' first we count the rows to redim our array

Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "SELECT count (distinct s.specname) from spec s " & _
                 "WHERE s.spectype NOT IN ('K','M','D','S','A') " & _
                 "AND s.LIBRARYNAME = '" & strLibrary & "'"
    MyConn.SQL = strSqlText
    g_Debug.SendOutPut dbgCMisc, strSqlText
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        If IsNull(MyRs(0)) = False Then
            lngCountPSL = MyRs(0)
        End If
    ' close query and connetion
    MyRs.Close
    MyConn.Close
' now read all PSLs
If lngCountPSL > 0 Then
    ReDim aryPSL(lngCountPSL)
Else
    ' no PSL found ..return empty array
    getPSLforLibrary = aryPSL
    Exit Function
End If

Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "SELECT distinct s.specname from spec s " & _
                 "WHERE s.spectype NOT IN ('K','M','D','S','A') " & _
                 "AND s.LIBRARYNAME = '" & strLibrary & "'"
    MyConn.SQL = strSqlText
    g_Debug.SendOutPut dbgCMisc, strSqlText
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                aryPSL(intCounter) = MyRs(0)
                intCounter = intCounter + 1
            End If
            MyRs.MoveNext
        Wend
    ' close query and connetion
    MyRs.Close
    MyConn.Close
' return array
getPSLforLibrary = aryPSL

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getPSLforLibrary"
Exit Function

getPSLforLibrary_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getPSLforLibrary ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getPSLforLibrary"
     Resume Next
'</EhFooter>
End Function

'CSEH: ErrBaliDebug
Public Function getRevisionForPSL(strPSL As String, strLibrary As String)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getRevisionForPSL
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  20.01.2003
' Parameters :  strPSL
'               strLibrary
' Description:  Get all Revisions for given PSL and Library
'               Returns an Array with all Revisions
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getRevisionForPSL_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getRevisionForPSL"
'</EhHeader>


Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim intCounter As Integer
Dim lngCountPSLRev As Long
Dim aryPSLRev() As String


' first we count the rows to redim our array

Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "SELECT distinct count(s.REVNUM) from spec s " & _
                 "WHERE s.SPECNAME = '" & strPSL & "' " & _
                 "AND s.LIBRARYNAME = '" & strLibrary & "'"
    MyConn.SQL = strSqlText
    g_Debug.SendOutPut dbgCMisc, strSqlText
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        If IsNull(MyRs(0)) = False Then
            lngCountPSLRev = MyRs(0)
        End If
    ' close query and connetion
    MyRs.Close
    MyConn.Close
' now read all PSLs
If lngCountPSLRev > 0 Then
    ReDim aryPSLRev(lngCountPSLRev)
Else
    ' no PSL found ..return empty array
    getRevisionForPSL = aryPSLRev
    Exit Function
End If

Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "SELECT s.REVNUM from spec s " & _
                 "WHERE  s.SPECNAME = '" & strPSL & "' " & _
                 "AND s.LIBRARYNAME = '" & strLibrary & "' " & _
                 "ORDER BY s.REVNUM"
    MyConn.SQL = strSqlText
    g_Debug.SendOutPut dbgCMisc, strSqlText
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                aryPSLRev(intCounter) = MyRs(0)
                intCounter = intCounter + 1
            End If
            MyRs.MoveNext
        Wend
    ' close query and connetion
    MyRs.Close
    MyConn.Close
' return array
getRevisionForPSL = aryPSLRev

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getRevisionForPSL"
Exit Function

getRevisionForPSL_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getRevisionForPSL ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getRevisionForPSL"
     Resume Next
'</EhFooter>
End Function


'CSEH: ErrBaliDebug
Public Function getAllDestination()
' gets the list of all Countrys
'<EhHeader>
On Error GoTo getAllDestination_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getAllDestination"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim lCounter As Integer ' counter for the array

lCounter = 0


' prepare the query
'*************************
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select DISTINCT COUNTRYNAME_ENGLISH " & _
                 "from COUNTRY ORDER BY COUNTRYNAME_ENGLISH ASC"
    MyConn.SQL = strSqlText
' execute the query
'*************************
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            gDestination(lCounter) = MyRs.rdoColumns(0)
            lCounter = lCounter + 1
            MyRs.MoveNext
        Wend
' close query and connection
'*************************
    MyRs.Close
    MyConn.Close

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getAllDestination"
Exit Function

getAllDestination_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getAllDestination ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getAllDestination"
     Resume Next
'</EhFooter>
End Function



Public Function getMFD(lSamplename) As String
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getMFD
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :  lSampleName
' Description:  Returns the Manufacturdate from DB
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getMFD_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getMFD"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

    ' check if no sample
    If lSamplename = "" Then
        Exit Function
    End If

    ' prepare query
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select DATEMANUFACTURING from BALI_ATTRIB_DATEMANUFACTVW where SAMPLENAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
    g_Debug.SendOutPut dbgCMisc, strSqlText
    
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        If Not MyRs.EOF Then
            If IsNull(MyRs(0)) = False Then
                getMFD = MyRs(0)
            End If
        End If
    ' close query and connetion
    MyRs.Close
    MyConn.Close

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getMFD"
Exit Function

getMFD_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getMFD ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getMFD"
     Resume Next
'</EhFooter>
End Function


Public Function getExpiryDate(lSamplename As String) As String
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getExpiryDate
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :  lSampleName as String
' Description:  Returns the Expiry Date from DB
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getExpiryDate_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getExpiryDate"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

    ' check if no sample
    If lSamplename = "" Then
        Exit Function
    End If

    ' prepare query
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select DATEEXPIRY from BALI_ATTRIB_DATEEXPIRYVW where SAMPLENAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
    g_Debug.SendOutPut dbgCMisc, strSqlText
    
    
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        If Not MyRs.EOF Then
            If IsNull(MyRs(0)) = False Then
                getExpiryDate = MyRs(0)
            End If
        End If
    ' close query and connetion
    MyRs.Close
    MyConn.Close
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getExpiryDate"
Exit Function

getExpiryDate_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getExpiryDate ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getExpiryDate"
     Resume Next
'</EhFooter>
End Function


Public Function getRetestDate(lSamplename As String) As String
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getRetestDate
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :  lSamplename
' Description:  return the Date of Retest
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getRetestDate_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getRetestDate"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

    ' check if no sample
    If lSamplename = "" Then
        Exit Function
    End If

    ' prepare query
    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select DATEOFRETEST from BALI_ATTRIB_DATEOFRETESTVW where SAMPLENAME = '" _
            & lSamplename & "'"
    MyConn.SQL = strSqlText
    g_Debug.SendOutPut dbgCMisc, strSqlText
    
    
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        If Not MyRs.EOF Then
            If IsNull(MyRs(0)) = False Then
                getRetestDate = MyRs(0)
            End If
        End If
    ' close query and connetion
    MyRs.Close
    MyConn.Close
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getRetestDate"
Exit Function

getRetestDate_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getRetestDate ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getRetestDate"
     Resume Next
'</EhFooter>
End Function


Public Function saveLabelSet(lUsername, lSetNo)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  saveLabelSet
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  12.03.2003
' Parameters :  lUsername
'               lSetNo
' Description:  Save a specific set of Labels to the DB
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo saveLabelSet_Err
g_Debug.SendOutPut dbgCTrace, "Entered: saveLabelSet"
'</EhHeader>

Dim strSqlText As String
Dim oQuery As rdoQuery
Dim intCounter As Integer

    ' check if no user
    If lUsername = "" Then
        Exit Function
    End If
    ' delete rows for given user and labelset
    ' prepare stored procedure with parameter
    strSqlText = "{call CHEMLMS.BALI_PRINTERY.DELETELABELSET(?)}"
    Set oQuery = gBALIConn.CreateQuery("", strSqlText)
        ' set parameter labelset
        oQuery(0) = CInt(lSetNo)
        oQuery.Execute
        ' check if delete was successfull
        ' labelset is declared as IN OUT parameter in stored procedure
        ' and returns 0 if successfull or -1 if failed.
        If CInt(oQuery(0)) <> 0 Then
            saveLabelSet = False
            AddStatusMessage ("Error ! Unable to delete Label Set. Please contact your System Administrator")
            Exit Function
        Else
            ' successfull
            saveLabelSet = True
        End If
        oQuery.Close

    ' insert rows
    For intCounter = 0 To MAX_LABELENTRY
        If gLabelEntry(intCounter, 0) <> "" Then
            strSqlText = "{call CHEMLMS.BALI_PRINTERY.SAVELABELSET(?,?,?,?)}"
            Set oQuery = gBALIConn.CreateQuery("", strSqlText)
                ' set parameter labelset
                oQuery(0) = CInt(lSetNo)
                oQuery(1) = CStr(gLabelEntry(intCounter, 0))
                oQuery(2) = CStr(gLabelEntry(intCounter, 1))
                oQuery(3) = CStr(gLabelEntry(intCounter, 2))
                ' run stored procedure
                oQuery.Execute
                ' labelset is declared as IN OUT parameter in stored procedure
                ' and returns 0 if successfull or -1 if failed.
                If CInt(oQuery(0)) <> 0 Then
                    saveLabelSet = False
                    AddStatusMessage ("Error ! Unable to save label set. Please contact your System Administrator")
                    Exit Function
                Else
                    ' successfull
                    saveLabelSet = True
                End If
                oQuery.Close
        End If
    Next intCounter

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : saveLabelSet"
Exit Function

saveLabelSet_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.saveLabelSet ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.saveLabelSet"
     Resume Next
'</EhFooter>
End Function


Public Function saveCoAParameter() As Boolean
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  saveCoAParameter
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  12.03.2003
' Parameters :
' Description:  Save Parameters for a CoA to DB. Because of security reason we
'               call a stored Procedure, so we don^t need to grant update for the
'               parameter table to all. Just grant execute
'               to the stored procedure.
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo saveCoAParameter_Err
g_Debug.SendOutPut dbgCTrace, "Entered: saveCoAParameter"
'</EhHeader>
Dim oQuery As rdoQuery
Dim strSqlText As String

' prepare stored procedure with all parameters
strSqlText = "{call CHEMLMS.BALI_PRINTERY.SAVECOAPARA(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}"
Set oQuery = gBALIConn.CreateQuery("", strSqlText)
    ' set parameters - first standard parameters
    oQuery(0) = CStr(gSelectedSample)
    ' set coaParameters
    oQuery(1) = CStr(gCoAParameter.Productname)
    oQuery(2) = CStr(gCoAParameter.Productname2)
    oQuery(3) = CStr(gCoAParameter.ManufactureDate)
    oQuery(4) = CStr(gCoAParameter.ReleaseDate)
    oQuery(5) = CStr(gCoAParameter.ControlNo)
    oQuery(6) = CStr(gCoAParameter.BatchQuantity)
    oQuery(7) = CStr(gCoAParameter.ExpiryDate)
    oQuery(8) = CStr(gCoAParameter.YourRef)
    oQuery(9) = CStr(gCoAParameter.OurRef)
    oQuery(10) = CStr(gCoAParameter.Destination)
    oQuery(11) = CStr(gCoAParameter.RetestDate)
    oQuery(12) = CStr(gCoAParameter.PlaceOfManufacture)
    oQuery(13) = CStr(gCoAParameter.FertigSpezNo)
    oQuery(14) = CStr(gCoAParameter.FooterLine1)
    oQuery(15) = CStr(gCoAParameter.FooterLine2)
    oQuery(16) = CStr(gCoAParameter.FooterLine3)
     
    oQuery.Execute
    ' check if insert was successfull
    ' SampleName is declared as IN OUT parameter in stored procedure
    ' and returns the samplename or -1 if failed.
    If CStr(oQuery(0)) <> gSelectedSample Then
        saveCoAParameter = False
        AddStatusMessage ("Error ! Unable to save CoA Parameters. Please contact your System Administrator")
    Else
        ' successfull
        saveCoAParameter = True
    End If
    oQuery.Close

    
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : saveCoAParameter"
Exit Function

saveCoAParameter_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.saveCoAParameter ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.saveCoAParameter"
     saveCoAParameter = False
'</EhFooter>
End Function

Public Function saveLogEntry(strReportname As String, strPrinter As String, _
                             Par1 As Variant, Optional Par2 As Variant, _
                             Optional Par3 As Variant) As Boolean
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  saveLogEntry
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  08.05.2003
' Parameters :  strReportname
'               strPrinter
'               Par1
'               Par2
'               Par3
' Description:  Function to save a entry for the log table
'               Because of security reason we call a stored Procedure, so we
'               don^t need to grant update for the log table to all. Just grant execute
'               to the stored procedure.
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo saveLogEntry_Err
g_Debug.SendOutPut dbgCTrace, "Entered: saveLogEntry"
'</EhHeader>

Dim oQuery As rdoQuery
Dim strSqlText As String

Dim strPara2 As String
Dim strPara3 As String

' replace unset values of optional parameters with ""
If IsMissing(Par2) = True Then
    strPara2 = ""
Else
    strPara2 = CStr(Par2)
End If
If IsMissing(Par3) = True Then
    strPara3 = ""
Else
    strPara3 = CStr(Par3)
End If
' prepare stored procedure with all parameters
strSqlText = "{call CHEMLMS.BALI_PRINTERY.INSERTLOG(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}"
Set oQuery = gBALIConn.CreateQuery("", strSqlText)
    ' set parameters - first standard parameters
    oQuery(0) = strReportname
    oQuery(1) = strPrinter
    oQuery(2) = CStr(Par1)
    oQuery(3) = strPara2
    oQuery(4) = strPara3
    ' set coaParameters
    oQuery(5) = CStr(gCoAParameter.Productname)
    oQuery(6) = CStr(gCoAParameter.Productname2)
    oQuery(7) = CStr(gCoAParameter.ManufactureDate)
    oQuery(8) = CStr(gCoAParameter.ReleaseDate)
    oQuery(9) = CStr(gCoAParameter.ControlNo)
    oQuery(10) = CStr(gCoAParameter.BatchQuantity)
    oQuery(11) = CStr(gCoAParameter.ExpiryDate)
    oQuery(12) = CStr(gCoAParameter.YourRef)
    oQuery(13) = CStr(gCoAParameter.OurRef)
    oQuery(14) = CStr(gCoAParameter.Destination)
    oQuery(15) = CStr(gCoAParameter.RetestDate)
    oQuery(16) = CStr(gCoAParameter.PlaceOfManufacture)
    oQuery(17) = CStr(gCoAParameter.FertigSpezNo)
    oQuery(18) = CStr(gCoAParameter.FooterLine1)
    oQuery(19) = CStr(gCoAParameter.FooterLine2)
    oQuery(20) = CStr(gCoAParameter.FooterLine3)
     
    oQuery.Execute
    ' check if insert was successfull
    ' par1 is declared as IN OUT parameter in stored procedure
    ' and returns the sequence number of the inerted record
    ' or -1 if failed.
    '
    ' CR20050310_312 K. Zinsmeister 10-Mar-2005
    ' changed from CInt to CLng
    If CLng(oQuery(2)) > 1 Then
        ' successfull - save sequence number to CoA Parameter
        gCoAParameter.ID = CLng(oQuery(2))
        saveLogEntry = True
    Else
        saveLogEntry = False
        AddStatusMessage ("Error ! Unable to save CoA log entry. Please contact your System Administrator")
    End If
    oQuery.Close

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : saveLogEntry"
Exit Function

saveLogEntry_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.saveLogEntry ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.saveLogEntry"
     Resume Next
'</EhFooter>
End Function

Public Function getCoAParameter(strSamplename As String) As Boolean
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getCoAParameter
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  08.05.2003
' Parameters :  strSamplename
' Description:  Function to read a saved set of CoA Parameters for the given Samplename
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getCoAParameter_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getCoAParameter"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

                 
Set MyConn = gBALIConn.CreatePreparedStatement("", "")
strSqlText = "select * from T_PRINTERY_COA_PARA " & _
             "where SAMPLENAME = '" & strSamplename & "'"

MyConn.SQL = strSqlText
g_Debug.SendOutPut dbgCMisc, strSqlText

' start query
Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
    If Not MyRs.EOF Then
        ' set CoA Parameter variable
        With gCoAParameter
            .Productname = replaceNULLValue(MyRs(3))
            .Productname2 = replaceNULLValue(MyRs(4))
            .ManufactureDate = replaceNULLValue(MyRs(5))
            .ReleaseDate = replaceNULLValue(MyRs(6))
            .ControlNo = replaceNULLValue(MyRs(7))
            .BatchQuantity = replaceNULLValue(MyRs(8))
            .ExpiryDate = replaceNULLValue(MyRs(9))
            .YourRef = replaceNULLValue(MyRs(10))
            .OurRef = replaceNULLValue(MyRs(11))
            .Destination = replaceNULLValue(MyRs(12))
            .RetestDate = replaceNULLValue(MyRs(13))
            .PlaceOfManufacture = replaceNULLValue(MyRs(14))
            .FertigSpezNo = replaceNULLValue(MyRs(15))
            .FooterLine1 = replaceNULLValue(MyRs(16))
            .FooterLine2 = replaceNULLValue(MyRs(17))
            .FooterLine3 = replaceNULLValue(MyRs(18))
        End With
        getCoAParameter = True
    Else
        ' no record found
        getCoAParameter = False
    End If
' close query and connection
MyRs.Close
MyConn.Close


'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getCoAParameter"
Exit Function

getCoAParameter_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getCoAParameter ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getCoAParameter"
     Resume Next
'</EhFooter>
End Function


Public Function replaceNULLValue(varValue, Optional retValue = "") As Variant
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       replaceNULLValue
' Created by :       Klaus Zinsmeister
' Machine    :       ZI_HOME
' Date-Time  :       30.01.2002
' Parameters :       varValue (Variant)
'                    retValue (Variant)
' Description:       Replace database values NULL with given string
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo replaceNULLValue_Err
g_Debug.SendOutPut dbgCTrace, "Entered: replaceNULLValue"
'</EhHeader>

If IsNull(varValue) Then
    replaceNULLValue = retValue
Else
    replaceNULLValue = varValue
End If

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : replaceNULLValue"
Exit Function

replaceNULLValue_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.replaceNULLValue ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.replaceNULLValue"
     Resume Next
'</EhFooter>
End Function

Public Function getApproval(strSamplename As String) As String
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getApproval
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  20.03.2003
' Parameters :  strSamplename
' Description:  Returns the value of the Attribute "APPROVAL$" for the given sample
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getApproval_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getApproval"
'</EhHeader>
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

' check if no sample
If strSamplename = "" Then
    Exit Function
End If

' prepare query
Set MyConn = gBALIConn.CreatePreparedStatement("", "")
strSqlText = "select APPROVAL from BALI_ATTRIB_APPROVALVW where SAMPLENAME = '" _
        & strSamplename & "'"
MyConn.SQL = strSqlText
g_Debug.SendOutPut dbgCMisc, strSqlText

' start query
Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
    If Not MyRs.EOF Then
        If IsNull(MyRs(0)) = False Then
            getApproval = MyRs(0)
        End If
    End If
' close query and connetion
MyRs.Close
MyConn.Close
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getApproval"
Exit Function

getApproval_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getApproval ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getApproval"
     Resume Next
'</EhFooter>
End Function


Public Function getUserMenuTemplate(lUserID)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getUserMenuTemplate
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  22.07.2003
' Parameters :  lUserID
' Description:  Read the name of the Menutemplate for the given User
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getUserMenuTemplate_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getUserMenuTemplate"
'</EhHeader>
Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String

If lUserID = "" Then
    Exit Function
End If

    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select MENUTEMPLATENAME from GWUSERATTRIBUTES where USERNAME = '" _
            & lUserID & "'"
    MyConn.SQL = strSqlText
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        While Not MyRs.EOF
            If IsNull(MyRs(0)) = False Then
                getUserMenuTemplate = MyRs(0)
            End If
            MyRs.MoveNext
        Wend
    ' close query and connetion
    MyRs.Close
    MyConn.Close

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getUserMenuTemplate"
Exit Function

getUserMenuTemplate_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getUserMenuTemplate ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getUserMenuTemplate"
     Resume Next
'</EhFooter>
End Function

Public Function getLotQuantityUnit(strSamplename As String) As String
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  getLotQuantityUnit
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  05.08.2003
' Parameters :  strSamplename
' Description:  Return LotQuantity concatenate with LotQuantityUnit
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo getLotQuantityUnit_Err
g_Debug.SendOutPut dbgCTrace, "Entered: getLotQuantityUnit"
'</EhHeader>

Dim MyRs As rdoResultset
Dim MyConn As rdoPreparedStatement
Dim strSqlText As String
Dim strReturn As String

If strSamplename = "" Then
    Exit Function
End If

    Set MyConn = gBALIConn.CreatePreparedStatement("", "")
    strSqlText = "select LOTQUANTITY from BALI_ATTRIB_LOTQUANTITYVW where SAMPLENAME = '" _
            & strSamplename & "'"
    MyConn.SQL = strSqlText
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        If IsNull(MyRs(0)) = False Then
            strReturn = MyRs(0) & " "
        End If
    ' close query
    MyRs.Close
    ' next query will retrieve the units
    strSqlText = "select LOTQUANTITYUNIT from BALI_ATTRIB_LOTQUANTITYUNITVW where SAMPLENAME = '" _
            & strSamplename & "'"
    MyConn.SQL = strSqlText
    ' start query
    Set MyRs = MyConn.OpenResultset(rdOpenForwardOnly, rdConcurReadOnly)
        If IsNull(MyRs(0)) = False Then
            strReturn = strReturn & MyRs(0)
        End If
    ' close query
    MyRs.Close
    MyConn.Close
    ' return value
    getLotQuantityUnit = strReturn
    
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : getLotQuantityUnit"
Exit Function

getLotQuantityUnit_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.mdlSQLFunction.getLotQuantityUnit ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.mdlSQLFunction.getLotQuantityUnit"
     Resume Next
'</EhFooter>
End Function

