VERSION 5.00
Begin VB.Form frmPasswd 
   Caption         =   "RLP Change Password"
   ClientHeight    =   3645
   ClientLeft      =   3765
   ClientTop       =   4680
   ClientWidth     =   4965
   Icon            =   "PasswdEnter.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3645
   ScaleWidth      =   4965
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdHelp 
      Caption         =   "&Help"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   3360
      TabIndex        =   7
      Top             =   3120
      Width           =   1485
   End
   Begin VB.Frame Frame1 
      Caption         =   "Specify the new password"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   120
      TabIndex        =   11
      Top             =   1440
      Width           =   4695
      Begin VB.TextBox txtOldPasswd 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   2160
         PasswordChar    =   "*"
         TabIndex        =   2
         Top             =   360
         Width           =   2325
      End
      Begin VB.TextBox txtNewPasswd 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   2160
         PasswordChar    =   "*"
         TabIndex        =   3
         Top             =   720
         Width           =   2325
      End
      Begin VB.TextBox txtConfirmNewPasswd 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   2160
         PasswordChar    =   "*"
         TabIndex        =   4
         Top             =   1080
         Width           =   2325
      End
      Begin VB.Label lblOldPwd 
         Alignment       =   1  'Right Justify
         Caption         =   "Old Password :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   360
         Width           =   1935
      End
      Begin VB.Label lblNewPwd 
         Alignment       =   1  'Right Justify
         Caption         =   "New Password :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   1935
      End
      Begin VB.Label lblConfirmNewPwd 
         Alignment       =   1  'Right Justify
         Caption         =   "Confirm New Password :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   1080
         Width           =   1935
      End
   End
   Begin VB.Frame grpUserDetails 
      Caption         =   "Password for the following user will be changed"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   4695
      Begin VB.ComboBox cboName 
         Height          =   315
         Left            =   2160
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   360
         Width           =   2325
      End
      Begin VB.TextBox txtLongName 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000003&
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   2160
         TabIndex        =   1
         Text            =   "User Test"
         Top             =   720
         Width           =   2325
      End
      Begin VB.Label lblLongName 
         Alignment       =   1  'Right Justify
         Caption         =   "Long Name :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   10
         Top             =   765
         Width           =   1935
      End
      Begin VB.Label lblName 
         Alignment       =   1  'Right Justify
         Caption         =   "UserID :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   9
         Top             =   405
         Width           =   1935
      End
   End
   Begin VB.CommandButton CANCEL 
      Caption         =   "&Cancel"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   1725
      TabIndex        =   6
      Top             =   3120
      Width           =   1485
   End
   Begin VB.CommandButton OK 
      Caption         =   "&Ok"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   120
      TabIndex        =   5
      Top             =   3120
      Width           =   1455
   End
End
Attribute VB_Name = "frmPasswd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub ISOK()
'**************************************************
' Verification of
'**************************************************
    Is_ok = False
    
    If txtLongName.Text = "" Then
        MsgBox "The entered user ID does not exist" & vbCrLf & _
                "Please enter another one", vbExclamation, _
                gsModuleName
        txtName.SetFocus
        Exit Sub
    End If
    If txtOldPasswd.Enabled Then
        If Len(Trim(txtOldPasswd.Text)) = 0 Then
            MsgBox "You have to specify the old password.", vbExclamation, _
                    gsModuleName
            txtOldPasswd.SetFocus
            Exit Sub
        End If
    End If
    If (UCase(txtNewPasswd.Text) <> UCase(txtConfirmNewPasswd.Text)) Then
        MsgBox "The passwords entered doesn't match.", vbExclamation, _
                gsModuleName
        txtNewPasswd.Text = ""
        txtConfirmNewPasswd.Text = ""
        txtNewPasswd.SetFocus
        Exit Sub
    End If
    If Len(Trim(txtNewPasswd.Text)) = 0 Then
        MsgBox "You have to specify a password.", vbExclamation, _
                gsModuleName
        txtNewPasswd.SetFocus
        Exit Sub
    End If
    If Len(Trim(txtConfirmNewPasswd.Text)) = 0 Then
        MsgBox "You have to specify a password.", vbExclamation, _
                gsModuleName
        txtConfirmNewPasswd.SetFocus
        Exit Sub
    End If
    
    '------------------------------------------------------------------------------
    ' Check password against Roche Password Policy
    '------------------------------------------------------------------------------
    If Not fCheckPassword(Trim(cboName.Text), Trim(txtConfirmNewPasswd.Text)) Then
        Exit Sub
    End If
    
'    If Len(Trim(txtNewPasswd.Text)) < 8 Then
'        MsgBox "The password entered is too short." & vbCrLf & _
'                "It must be 8 characters or more.", vbExclamation, _
'                gsModuleName
'        txtNewPasswd.SetFocus
'        Exit Sub
'    End If
    
    gsUserName = UCase(Trim(cboName.Text))
    gsNewPassword = UCase(Trim(txtConfirmNewPasswd.Text))
    gsOldPassword = UCase(Trim(txtOldPasswd.Text))
    
    Is_ok = True
    Unload Me
End Sub


Private Sub CANCEL_Click()
'**************************************************
' Traitement du boutton Cancel
'**************************************************
    Is_ok = False
    Unload Me
End Sub


Private Sub cmdHelp_Click()
    MsgBox "Your new password must comply to the following rules:" & vbCrLf & vbCrLf & _
            "  - be at least 8 characters long" & vbCrLf & _
            "  - contain at least one upper case character" & vbCrLf & _
            "  - contain at least one lower case character" & vbCrLf & _
            "  - contain at least one numerical digit" & vbCrLf & _
            "  - not repeat a character more than four times" & vbCrLf & _
            "  - not contain a portion of the userid longer than four characters" & vbCrLf & _
            "  - not start with a number" & vbCrLf & _
            "  - must not be equal to a previous or older password" _
            , vbInformation, gsModuleName
End Sub

Private Sub OK_Click()
    '**************************************************
    ' Traitement du boutton Ok
    '**************************************************
    Call ISOK
End Sub

Private Sub cboName_Click()
    '------------------------------------------------------------------------------------
    ' Get User Longname
    '------------------------------------------------------------------------------------
    gSystemOCX.Evaluate "lUserLongName$ = """""
    gSystemOCX.Evaluate "sqlExec ""SELECT fullname INTO :lUserLongName$ FROM lmsuser " & _
                        "WHERE name  = '" & UCase(cboName.Text) & "' " & _
                        "AND (state IS NULL OR state = '*')"""
    txtLongName.Text = gSystemOCX.GetVar("lUserLongName$")
End Sub

Private Sub txtOldPassWD_KeyPress(KeyAscii As Integer)
'**************************************************
' Verification sur les divers code saisie par
' l'operateur
'**************************************************
If KeyAscii = vbKeyBack Then
    Exit Sub
End If
If (KeyAscii = vbKeyReturn) Or (KeyAscii = vbKeyTab) Then
    ' commented out because Psssword_AIC is not available any more in A.04.01
    ' If UCase(Trim(txtOldPassWD.Text)) <> gsOldPassword Then
    '      MsgBox "Incorrect password: please type it again", 4112, "Warning", " ", 1000
    '      txtOldPassWD.Text = ""
    '      Exit Sub
    ' End If
    txtNewPasswd.SetFocus
End If

End Sub


Private Sub txtNewPasswd_KeyPress(KeyAscii As Integer)
'**************************************************
' Verification sur les divers code saisie par
' l'operateur
'**************************************************
If KeyAscii = vbKeyBack Then
    Exit Sub
End If
If (KeyAscii = vbKeyReturn) Or (KeyAscii = vbKeyTab) Then
    txtConfirmNewPasswd.SetFocus
End If
'Begin #0001
If ((KeyAscii > 47) And (KeyAscii < 123)) Then
    If ((KeyAscii > 57) And (KeyAscii < 65)) Then
        KeyAscii = 0
        Exit Sub
    ElseIf ((KeyAscii > 90) And (KeyAscii < 97)) Then
        KeyAscii = 0
    Else
        Exit Sub
    End If
Else
    KeyAscii = 0
End If
'End #0001
End Sub


Private Sub txtConfirmNewPasswd_KeyPress(KeyAscii As Integer)
'**************************************************
' Verification sur les divers code saisie par
' l'operateur
'**************************************************
If KeyAscii = vbKeyBack Then
    Exit Sub
End If
If KeyAscii = vbKeyReturn Then
    Call ISOK
End If
' Begin #0001
If ((KeyAscii > 47) And (KeyAscii < 123)) Then
    If ((KeyAscii > 57) And (KeyAscii < 65)) Then
        KeyAscii = 0
        Exit Sub
    ElseIf ((KeyAscii > 90) And (KeyAscii < 97)) Then
        KeyAscii = 0
    Else
        Exit Sub
    End If
Else
    KeyAscii = 0
End If
' End #0001
End Sub


'*******************************************************************************
'*
'* Description:
'*   Routine to check RLP User password following rules defined in:
'*     - prj000433.doc paragraph 3.14 Password Change
'*     - password aging in not handled by the routine.
'*
'* Scope:
'*   Project Global.
'*
'* Input/Output:
'*   output: Returns True if password satisfy all rules
'*                   False if password fails at least one rule
'*
'*******************************************************************************
Public Function fCheckPassword(ByVal sUserID As String, sPassword As String) As Boolean

    ' ----------------------------------------------------------------------
    'Define Local variables
    ' ----------------------------------------------------------------------
    Dim sChar As String
    Dim iPos As Integer
    Dim iPos2 As Integer
    Dim iRepeats As Integer
    
    ' ----------------------------------------------------------------------
    ' Assume password is not valid
    ' ----------------------------------------------------------------------
    fCheckPassword = False
    
    ' ----------------------------------------------------------------------
    ' Check length of provided password
    ' ----------------------------------------------------------------------
    If Len(sPassword) < 8 Then
        MsgBox "Password must be at least 8 characters long!" & vbCrLf & _
                "See help for a summary of the password rules.", _
                vbExclamation, gsModuleName
        Exit Function
    End If
    
    ' ----------------------------------------------------------------------
    'Check if first char is not a number
    ' ----------------------------------------------------------------------
    sChar = Mid(sPassword, 1, 1)
    If IsNumeric(sChar) Then
        MsgBox "Password cannot start with a number!" & vbCrLf & _
                "See help for a summary of the password rules.", _
                vbExclamation, gsModuleName
        Exit Function
    End If
    
    ' ----------------------------------------------------------------------
    'Check if password contain at least one upper case
    ' ----------------------------------------------------------------------
    If StrComp(sPassword, LCase(sPassword), vbBinaryCompare) = 0 Then
        MsgBox "Password must contain at least one upper case character!" & vbCrLf & _
                "See help for a summary of the password rules.", _
                vbExclamation, gsModuleName
        Exit Function
    End If
    
    ' ----------------------------------------------------------------------
    'Check if password contains at least one lower case
    ' ----------------------------------------------------------------------
    If StrComp(sPassword, UCase(sPassword), vbBinaryCompare) = 0 Then
        MsgBox "Password must contain at least one lower case character!" & vbCrLf & _
                "See help for a summary of the password rules.", _
                vbExclamation, gsModuleName
        Exit Function
    End If
    
    ' ----------------------------------------------------------------------
    'Check if the password contains at least one numerical character.
    ' ----------------------------------------------------------------------
    iPos = 1
    Do While Not IsNumeric(Mid(sPassword, iPos, 1)) And iPos <= Len(sPassword)
        iPos = iPos + 1
    Loop
    
    If iPos > Len(sPassword) Then
        MsgBox "Password must contain at least one numerical character!" & vbCrLf & _
                "See help for a summary of the password rules.", _
                vbExclamation, gsModuleName
        Exit Function
    End If
    
    
    'Check character repeat
    For iPos = 1 To Len(sPassword)
        iRepeats = 1
        sChar = Mid(sPassword, iPos, 1)
        For iPos2 = iPos + 1 To Len(sPassword)
            If StrComp(sChar, Mid(sPassword, iPos2, 1), vbTextCompare) = 0 Then
                iRepeats = iRepeats + 1
            End If
        Next iPos2
        If iRepeats > 4 Then
            MsgBox "Password cannot contain '" & sChar & "' more than 4 times!" & vbCrLf & _
                    "See help for a summary of the password rules.", _
                    vbExclamation, gsModuleName
            Exit Function
        End If
    Next iPos
    
    'Check if password does not contain a substring of userID greater than 4 chars
    If Len(sUserID) > 4 Then
        For iPos = 1 To Len(sUserID)
            If iPos + 5 > Len(sUserID) Then Exit For
            If InStr(1, LCase(sPassword), LCase(Mid(sUserID, iPos, 5)), vbTextCompare) > 0 Then
                MsgBox "Password cannot contain substring of the user name!" & vbCrLf & _
                        "See help for a summary of the password rules.", _
                        vbExclamation, gsModuleName
                Exit Function
            End If
        Next iPos
    End If
    
    fCheckPassword = True

End Function

