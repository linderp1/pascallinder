Attribute VB_Name = "Declar"
'*******************************************************************************
'*
'* $Source: $
'*
'* Author:          Michael Schneider, ACC
'*                  Jens Martin, ACC
'*
'* Function:        Global module for definition of variables
'*
'* Functional Area: RLP Administration
'*
'* $Revision: 4 $
'* $Date: 22.07.04 15:47 $
'*
'* $Log: /2002-RLP-1002_RLP1.4/Source/ChangePasswd/Declar.Bas $
'*
'* 4     22.07.04 15:47 Martij62
'* Changes: If PDBA then user combo box; Disabled user long name; moved
'* "AHT" decision logic to CP macro
'*
'* 3     15.03.04 9:05 Schnem24
'* Added variable for storing the username globally
'*
'* 2     12.11.03 12:47 Schnem24
'* Cleanup of unused and old variables
'*
'* Copyright (C) 2003  ATLas Competence Center
'*
'* $NoKeywords: $
'*******************************************************************************

'**************************************************************
' Declaration of public variables
'**************************************************************

' Name of DLL
Public gsModuleName As String

' Variables for saving content of password form
Public gsUserName As String
Public gsNewPassword As String
Public gsOldPassword As String

' Type de selection de l'opérateur
Public Is_ok As Integer

Public gSystemOCX   As Object
Public gRDOConn     As rdoConnection

Public Sub mGetAllUsers(pcboBox As ComboBox)

    Dim rsUser  As rdoResultset
    Dim sSQL    As String
    Dim dStart  As Double
    
    dStart = Timer
    
    sSQL = "SELECT Name FROM LMSUser " _
        & " WHERE (state IS NULL OR state = '*') "
    pcboBox.Clear
    Set rsUser = gRDOConn.OpenResultset(sSQL, rdOpenForwardOnly, rdConcurReadOnly)
    While Not rsUser.EOF
        pcboBox.AddItem rsUser("Name")
        rsUser.MoveNext
        DoEvents
    Wend
    rsUser.Close
    Set rsUser = Nothing

    Debug.Print Timer - dStart
    
End Sub


Sub Main()

End Sub


