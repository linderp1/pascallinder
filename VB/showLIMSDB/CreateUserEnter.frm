VERSION 5.00
Begin VB.Form frmCreateUser 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "RLP Create User"
   ClientHeight    =   5280
   ClientLeft      =   3750
   ClientTop       =   4665
   ClientWidth     =   5415
   Icon            =   "CreateUserEnter.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5280
   ScaleWidth      =   5415
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtUserID 
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
      Left            =   2760
      TabIndex        =   1
      Text            =   "<userID>"
      Top             =   480
      Width           =   2400
   End
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
      Left            =   3800
      TabIndex        =   9
      Top             =   4800
      Width           =   1485
   End
   Begin VB.Frame Frame1 
      Caption         =   "User ChemLMS Properties"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   120
      TabIndex        =   13
      Top             =   1800
      Width           =   5175
      Begin VB.ListBox lstGroups 
         Height          =   1230
         Left            =   2640
         MultiSelect     =   2  'Extended
         TabIndex        =   6
         Top             =   1080
         Width           =   2415
      End
      Begin VB.ComboBox cboClientConfig 
         Height          =   315
         Left            =   2640
         TabIndex        =   7
         Text            =   "Combo4"
         Top             =   2400
         Width           =   2415
      End
      Begin VB.ComboBox cboCapLevel 
         Height          =   315
         Left            =   2640
         TabIndex        =   5
         Text            =   "Combo2"
         Top             =   720
         Width           =   2415
      End
      Begin VB.ComboBox cboCapAccess 
         Height          =   315
         Left            =   2640
         TabIndex        =   4
         Text            =   "Combo1"
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Copy QC CLient Config from :"
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
         TabIndex        =   17
         Top             =   2450
         Width           =   2415
      End
      Begin VB.Label lblCPAccess 
         Alignment       =   1  'Right Justify
         Caption         =   "Capability Access :"
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
         Left            =   600
         TabIndex        =   16
         Top             =   360
         Width           =   1935
      End
      Begin VB.Label lblCapabilityLevel 
         Alignment       =   1  'Right Justify
         Caption         =   "Capability Level :"
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
         Left            =   600
         TabIndex        =   15
         Top             =   720
         Width           =   1935
      End
      Begin VB.Label lblGroups 
         Alignment       =   1  'Right Justify
         Caption         =   "Groups Membership :"
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
         Left            =   600
         TabIndex        =   14
         Top             =   1080
         Width           =   1935
      End
   End
   Begin VB.Frame grpUserDetails 
      Caption         =   "User Information"
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
      TabIndex        =   10
      Top             =   120
      Width           =   5175
      Begin VB.ComboBox cboDomain 
         Height          =   315
         Left            =   2640
         TabIndex        =   3
         Text            =   "Combo1"
         Top             =   1080
         Width           =   2415
      End
      Begin VB.TextBox txtUserLongName 
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
         Left            =   2640
         TabIndex        =   2
         Text            =   "<user fullname>"
         Top             =   720
         Width           =   2400
      End
      Begin VB.Label lblDomain 
         Alignment       =   1  'Right Justify
         Caption         =   "Domain :"
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
         Left            =   1400
         TabIndex        =   18
         Top             =   1125
         Width           =   1125
      End
      Begin VB.Label lblUserLongName 
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
         Left            =   600
         TabIndex        =   12
         Top             =   765
         Width           =   1935
      End
      Begin VB.Label lblUserID 
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
         Left            =   600
         TabIndex        =   11
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
      Left            =   2000
      TabIndex        =   8
      Top             =   4800
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
      TabIndex        =   0
      Top             =   4800
      Width           =   1455
   End
End
Attribute VB_Name = "frmCreateUser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub ISOK()
'**************************************************
' Verification of
'**************************************************
    Is_ok = False
    
    If txtUserID.Text = "" Then
        MsgBox "You have to specify a UserID.", vbExclamation, _
                gsModuleName
        txtUserID.SetFocus
        Exit Sub
    End If
    If txtUserLongName.Text = "" Then
        MsgBox "You have to specify a Long Name.", vbExclamation, _
                gsModuleName
        txtUserLongName.SetFocus
        Exit Sub
    End If
    
    
    
'    If txtOldPasswd.Enabled Then
'        If Len(Trim(txtOldPasswd.Text)) = 0 Then
'            MsgBox "You have to specify the old password.", vbExclamation, _
'                    gsModuleName
'            txtOldPasswd.SetFocus
'            Exit Sub
'        End If
'    End If
'    If (UCase(txtNewPasswd.Text) <> UCase(txtConfirmNewPasswd.Text)) Then
'        MsgBox "The passwords entered doesn't match.", vbExclamation, _
'                gsModuleName
'        txtNewPasswd.Text = ""
'        txtConfirmNewPasswd.Text = ""
'        txtNewPasswd.SetFocus
'        Exit Sub
'    End If
'    If Len(Trim(txtNewPasswd.Text)) = 0 Then
'        MsgBox "You have to specify a password.", vbExclamation, _
'                gsModuleName
'        txtNewPasswd.SetFocus
'        Exit Sub
'    End If
'    If Len(Trim(txtConfirmNewPasswd.Text)) = 0 Then
'        MsgBox "You have to specify a password.", vbExclamation, _
'                gsModuleName
'        txtConfirmNewPasswd.SetFocus
'        Exit Sub
'    End If
'
    '------------------------------------------------------------------------------
    ' Check password against Roche Password Policy
    '------------------------------------------------------------------------------
 '   If Not fCheckPassword(Trim(cboName.Text), Trim(txtConfirmNewPasswd.Text)) Then
 '       Exit Sub
 '   End If
    
'    If Len(Trim(txtNewPasswd.Text)) < 8 Then
'        MsgBox "The password entered is too short." & vbCrLf & _
'                "It must be 8 characters or more.", vbExclamation, _
'                gsModuleName
'        txtNewPasswd.SetFocus
'        Exit Sub
'    End If
    
'    gsUserName = UCase(Trim(cboName.Text))
'    gsNewPassword = UCase(Trim(txtConfirmNewPasswd.Text))
'    gsOldPassword = UCase(Trim(txtOldPasswd.Text))
    
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
    MsgBox "The following information has to be provided:" & vbCrLf & vbCrLf & _
            "  - userID: the user's Roche ID (max. 8 characters)" & vbCrLf & _
            "  - user fullname (max. 240 characters)" & vbCrLf & _
            "  - capability acess" & vbCrLf & _
            "  - capability level (a number between 1 and 9)" & vbCrLf & _
            "  - list of groups the user should be member of" & vbCrLf & _
            "  - template user to copy the QC Client configuration from", vbInformation, gsModuleName
End Sub

Private Sub OK_Click()
    '**************************************************
    ' Handle OK button click
    '**************************************************
    Call ISOK
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

