VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Class1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'Public properties
'*****************
'Public RDOConn As Object
Public NLSObject As Object
Public SystemOCX As Object

'Private constants
'*****************


Public Function Run() As Boolean

    On Error Resume Next
    
    MsgBox "Welcome to the BALI Login Configuration Activator.", vbInformation
    
    frmMain.Show
    
    ' Create ResultSet
    '*****************
    'Dim Rs As Object
    
    ' Get List of item nos
    '*********************
    
    'SQL$ = "select SAMPLETYPE from GWSMPCONF"
    'Set Rs = RDOConn.OpenResultset(SQL$)
    
    ' Load the ComboBox
    '******************
    'iCounter = 0

    'Rs.MoveFirst
    'Do While Not Rs.EOF
    '    iCounter = iCounter + 1
    '    cmbSampleType.AddItem (Rs.rdoColumns(0))
    '    'MsgBox ("Row #" & iCounter & " of " & iRowCount & " equals: " & Rs.rdoColumns(0) & " is " & Rs.Status)
    '    Rs.MoveNext
    'Loop
    
    'MsgBox ("Items found: " & iCounter)
        
    'Rs.Close
    
    'frmMain.Show vbModal, Me
    
    ' Generate Error Msg if there is no sample selected
    '**************************************************
    'If pFolderID = 0 Then
    '    MsgBox LoadResString(1501), vbCritical, LoadResString(1001)
    '    Run = False
    '    Exit Function
    'End If
    
    ' Get Name of selected sample
    '****************************
    'SQL$ = "select SAMPNAME from SAMPLE, GWSAMPLEINFOLDER" & _
    '       " where GWSAMPLEINFOLDER.FOLDERID = " & pFolderID & _
    '       " and SAMPLE.SAMPID = GWSAMPLEINFOLDER.SAMPLEID"
           
    'Set Rs = RDOConn.OpenResultset(SQL$)
           
    'MsgBox "The sample name is: " + Rs.rdoColumns("SAMPNAME").Value
    
    

    
    'If Err <> 0 Then
    '    MsgBox LoadResString(1504), vbCritical, LoadResString(1001)
    '    Run = False
    '    Exit Function
    'End If
    
    ' If there is more than one sample in folder...
    '**********************************************
    'If Rs.RowCount <> 1 Then
    '    MsgBox LoadResString(1502), vbCritical, LoadResString(1001)
    '    Run = False
    '    Exit Function
    'End If
    
    'MsgBox "Hello", vbCritical, LoadResString(1001)
    
    ' Insert row in SCA table
    '************************
    'SQL$ = "INSERT INTO " & gTableName & " " _
    '     & "(ZEITSTEMPEL, ANALYSE_NR, AKTION, AUFRUFENDER_EVENT) " _
    '     & "VALUES (SYSDATE, '" & Rs.rdoColumns("SAMPNAME").Value & "', 1, -1)"
    
    'RDOConn.Execute SQL$
    'If Err <> 0 Then
    '    MsgBox Err.Description, vbCritical, LoadResString(1001)
    '    RDOConn.Execute "ROLLBACK"
    '    MsgBox LoadResString(1503), vbCritical, LoadResString(1001)
    '    Run = False
    '    Exit Function
    'Else
    '    RDOConn.Execute "COMMIT"
    '    Msg$ = LoadResString(1505)
    '    pos = InStr(1, Msg$, "<SAMPLE>")
    '    If pos > 0 Then
    '        Msg$ = Left$(Msg$, pos - 1) & Rs.rdoColumns("SAMPNAME").Value & _
    '          Right$(Msg$, Len(Msg$) - (pos + 7))
    '    End If
        
    '    MsgBox Msg$, 64, LoadResString(1001)
        
    'End If
      
    ' Close BALI Resultset
    '*********************
    'Rs.Close
    
    'Normal Exit
    '***********
    DoEvents
    
    Run = True

End Function