VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmCert 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Certificate"
   ClientHeight    =   5850
   ClientLeft      =   3195
   ClientTop       =   1245
   ClientWidth     =   9165
   Icon            =   "frmCert.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5850
   ScaleWidth      =   9165
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtItemName 
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
      Index           =   1
      Left            =   2655
      TabIndex        =   4
      Top             =   810
      Width           =   6225
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   8010
      TabIndex        =   18
      ToolTipText     =   "Close window without saving"
      Top             =   5355
      Width           =   1005
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   90
      TabIndex        =   17
      ToolTipText     =   "Save parameters and close window"
      Top             =   5355
      Width           =   1005
   End
   Begin VB.TextBox txtItemName 
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
      Index           =   0
      Left            =   2655
      TabIndex        =   3
      Top             =   450
      Width           =   6225
   End
   Begin VB.TextBox txtLot 
      BackColor       =   &H80000011&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   2
      Top             =   855
      Width           =   1545
   End
   Begin VB.TextBox txtItemNo 
      BackColor       =   &H80000011&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   1
      Top             =   450
      Width           =   1545
   End
   Begin VB.TextBox txtSample 
      BackColor       =   &H80000011&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   0
      Top             =   90
      Width           =   1545
   End
   Begin VB.Frame Frame6 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1320
      Left            =   45
      TabIndex        =   37
      Top             =   3825
      Width           =   9015
      Begin VB.TextBox txtFooter 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Index           =   2
         Left            =   1485
         TabIndex        =   16
         Top             =   990
         Width           =   7320
      End
      Begin VB.TextBox txtFooter 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Index           =   1
         Left            =   1485
         TabIndex        =   15
         Top             =   585
         Width           =   7320
      End
      Begin VB.TextBox txtFooter 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Index           =   0
         Left            =   1485
         TabIndex        =   14
         Top             =   180
         Width           =   7320
      End
      Begin VB.Label lblFooter 
         Caption         =   "Footer Line 3:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   2
         Left            =   90
         TabIndex        =   40
         Top             =   990
         Width           =   1050
      End
      Begin VB.Label lblFooter 
         Caption         =   "Footer Line 2:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   1
         Left            =   90
         TabIndex        =   39
         Top             =   585
         Width           =   1050
      End
      Begin VB.Label lblFooter 
         Caption         =   "Footer Line 1:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   0
         Left            =   90
         TabIndex        =   38
         Top             =   180
         Width           =   1050
      End
   End
   Begin VB.Frame Frame4 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   960
      Left            =   45
      TabIndex        =   34
      Top             =   2790
      Width           =   3210
      Begin VB.TextBox txtOurRef 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   1215
         TabIndex        =   11
         Top             =   585
         Width           =   1905
      End
      Begin VB.TextBox txtYourRef 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   1215
         TabIndex        =   10
         Top             =   180
         Width           =   1905
      End
      Begin VB.Label lblYourRef 
         Caption         =   "Your Ref.:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   90
         TabIndex        =   36
         Top             =   180
         Width           =   915
      End
      Begin VB.Label lblOurRev 
         Caption         =   "Our Ref.:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   90
         TabIndex        =   35
         Top             =   585
         Width           =   915
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   960
      Left            =   3285
      TabIndex        =   31
      Top             =   2790
      Width           =   5775
      Begin VB.TextBox txtManufacturPlace 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   1710
         TabIndex        =   13
         Top             =   585
         Width           =   3885
      End
      Begin VB.ComboBox cboDestination 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1710
         TabIndex        =   12
         Top             =   180
         Width           =   3930
      End
      Begin VB.Label lblDestination 
         Caption         =   "Destination:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   90
         TabIndex        =   33
         Top             =   180
         Width           =   1410
      End
      Begin VB.Label lblManufacturplace 
         Caption         =   "Place manufacture:"
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
         Left            =   90
         TabIndex        =   32
         Top             =   585
         Width           =   1455
      End
   End
   Begin VB.Frame Frame2 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1410
      Left            =   3285
      TabIndex        =   27
      Top             =   1305
      Width           =   5775
      Begin VB.TextBox txtFertigSpez 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   1710
         TabIndex        =   9
         Top             =   945
         Width           =   3885
      End
      Begin VB.TextBox txtControlNo 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   1710
         TabIndex        =   8
         Top             =   540
         Width           =   3885
      End
      Begin VB.TextBox txtQuantity 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   1710
         TabIndex        =   7
         Top             =   180
         Width           =   3885
      End
      Begin VB.Label lblFertigspezNr 
         Caption         =   "Finished Pro No.:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   90
         TabIndex        =   30
         Top             =   945
         Width           =   1320
      End
      Begin VB.Label lblControlNo 
         Caption         =   "Control No:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   90
         TabIndex        =   29
         Top             =   540
         Width           =   960
      End
      Begin VB.Label lblQuantity 
         Caption         =   "Batch Qty:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   90
         TabIndex        =   28
         Top             =   180
         Width           =   1005
      End
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1410
      Left            =   45
      TabIndex        =   24
      Top             =   1305
      Width           =   3210
      Begin MSComCtl2.UpDown switchDate 
         Height          =   330
         Index           =   0
         Left            =   1500
         TabIndex        =   19
         TabStop         =   0   'False
         Top             =   135
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   582
         _Version        =   393216
         BuddyControl    =   "lblMFD"
         BuddyDispid     =   196639
         OrigLeft        =   1305
         OrigTop         =   180
         OrigRight       =   1560
         OrigBottom      =   510
         Enabled         =   -1  'True
      End
      Begin VB.TextBox txtRetestExpiryDate 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   1800
         TabIndex        =   6
         Top             =   585
         Width           =   1320
      End
      Begin VB.TextBox txtMFD 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   1800
         TabIndex        =   5
         Top             =   180
         Width           =   1320
      End
      Begin MSComCtl2.UpDown switchDate 
         Height          =   330
         Index           =   1
         Left            =   1500
         TabIndex        =   41
         TabStop         =   0   'False
         Top             =   550
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   582
         _Version        =   393216
         BuddyControl    =   "lblMFD"
         BuddyDispid     =   196639
         OrigLeft        =   1305
         OrigTop         =   180
         OrigRight       =   1560
         OrigBottom      =   510
         Enabled         =   -1  'True
      End
      Begin VB.Label lblRetestExpiryDate 
         Caption         =   "Expiry Date:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   90
         TabIndex        =   26
         Top             =   585
         Width           =   1185
      End
      Begin VB.Label lblMFD 
         Caption         =   "Manufacturedate:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   90
         TabIndex        =   25
         Top             =   180
         Width           =   1500
      End
   End
   Begin VB.Line Line1 
      BorderWidth     =   2
      X1              =   0
      X2              =   9255
      Y1              =   5220
      Y2              =   5220
   End
   Begin VB.Label lblProductName 
      Caption         =   "Product:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2700
      TabIndex        =   23
      Top             =   90
      Width           =   780
   End
   Begin VB.Label lblLot 
      Caption         =   "Lot:"
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
      Left            =   90
      TabIndex        =   22
      Top             =   855
      Width           =   420
   End
   Begin VB.Label lblProductNo 
      Caption         =   "Material:"
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
      Left            =   90
      TabIndex        =   21
      Top             =   450
      Width           =   690
   End
   Begin VB.Label lblSamplename 
      Caption         =   "Sample:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   90
      TabIndex        =   20
      Top             =   90
      Width           =   690
   End
End
Attribute VB_Name = "frmCert"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'CSEH: ErrBaliDebug
Option Explicit

Private strShortMonth(1 To 12) As String    ' fixed array for the month format

'CSEH: ErrResumeNext
Private Sub cmdCancel_Click()
'<EhHeader>
On Error Resume Next
'</EhHeader>

Unload Me
End Sub

Private Sub cmdOK_Click()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  cmdOK_Click
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  13.03.2003
' Parameters :
' Description:  Set CoAValuesFlag, global CoA Parameter and close form
'--------------------------------------------------------------------------------
'</CSCM>

' fill global CoAParametertype
Call fillCoAParameter
' save parameter set to DB
If saveCoAParameter() = True Then
    AddStatusMessage "CoA Parameters successfully saved."
Else
    MsgBox "Could not save CoA Parameters. Please try again or contact your System Administrator.", vbCritical + vbOKOnly, "Saving CoA Parameters"
    Exit Sub
End If

' set flag
gCoAValuesSet = True
' close
Unload Me


End Sub

Private Sub cmdSave_Click()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  cmdSave_Click
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :
' Description:  Save entered values to the DB
'               First we fill the global variable and then call the save method
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo cmdSave_Click_Err
g_Debug.SendOutPut dbgCTrace, "Entered: cmdSave_Click"
'</EhHeader>

' fill global CoAParametertype
Call fillCoAParameter


'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : cmdSave_Click"
Exit Sub

cmdSave_Click_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmCert.cmdSave_Click ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmCert.cmdSave_Click"
     Resume Next
'</EhFooter>
End Sub

Private Sub Form_Load()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  Form_Load
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :
' Description:  Initial the form with the Sampleparameters
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo Form_Load_Err
g_Debug.SendOutPut dbgCTrace, "Entered: Form_Load"
'</EhHeader>

Dim intCounter As Integer
Dim response As VbMsgBoxResult

' init array with Monthsvalues
strShortMonth(1) = "Jan"
strShortMonth(2) = "Feb"
strShortMonth(3) = "Mar"
strShortMonth(4) = "Apr"
strShortMonth(5) = "May"
strShortMonth(6) = "Jun"
strShortMonth(7) = "Jul"
strShortMonth(8) = "Aug"
strShortMonth(9) = "Sep"
strShortMonth(10) = "Oct"
strShortMonth(11) = "Nov"
strShortMonth(12) = "Dec"
    
' Read all destinations from DB and fill Combo-Box
Call getAllDestination
For intCounter = 0 To MAX_DESTINATION
    If gDestination(intCounter) = "" Then Exit For
    cboDestination.AddItem (gDestination(intCounter))
Next intCounter

' fill controls with already existing values
txtSample = gSelectedSample
txtItemNo = frmMain.lblSinSamItemShow
txtItemName(0) = frmMain.lblSinSamProDescShow
txtLot = frmMain.lblSinSamLotShow

' read additional default values from DB
txtMFD = convertMFD()
txtQuantity = getLotQuantityUnit(gSelectedSample)
' depending on the Coa type read different dates
Select Case gCoASelected
    Case "FS"
        txtRetestExpiryDate.Text = convertExpiryDate
    Case "H"
        txtRetestExpiryDate.Text = convertExpiryDate
    Case "N"
        txtRetestExpiryDate.Text = convertRetestDate
    Case "R"
        txtRetestExpiryDate.Text = convertRetestDate
    Case "Z1"
        txtRetestExpiryDate.Text = convertExpiryDate
End Select



' check if we have saved sampleparameters
If getCoAParameter(gSelectedSample) = True Then
    ' we have a saved value - ask if we should load
    response = MsgBox("There are saved values for this Sample. Would you like to load this values ?", vbQuestion + vbYesNo, "Load CoA Parameters")
    If response = vbYes Then
        ' set controls with values
        Call setCoAParameter
    Else
        ' clear the global parameter
        Call clearCoAParameter
    End If
End If

' initial controls
Call setControls

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : Form_Load"
Exit Sub

Form_Load_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmCert.Form_Load ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmCert.Form_Load"
     Resume Next
'</EhFooter>
End Sub


Private Sub setControls()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  setControls
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :
' Description:  enable and disable controls on the form depending
'               on which type of CoA the user has selected
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo setControls_Err
g_Debug.SendOutPut dbgCTrace, "Entered: setControls"
'</EhHeader>

Select Case gCoASelected

    Case "FS"
        txtMFD.Enabled = True
        txtMFD.BackColor = vbWindowBackground
        txtControlNo.Enabled = True
        txtControlNo.BackColor = vbWindowBackground
        txtQuantity.Enabled = True
        txtQuantity.BackColor = vbWindowBackground
        ' default is expiry date
        txtRetestExpiryDate.Enabled = True
        txtRetestExpiryDate.BackColor = vbWindowBackground
        lblRetestExpiryDate.Caption = "Expiry Date:"
        ' check if we have a Retest Value (load from DB) if so set reset the value
        If gCoAParameter.RetestDate <> "" Then
            txtRetestExpiryDate.Text = ""
        End If
        ' no change possible
        switchDate(1).Visible = False
        txtFooter(0).Enabled = True
        txtFooter(0).BackColor = vbWindowBackground
        txtFooter(1).Enabled = True
        txtFooter(1).BackColor = vbWindowBackground
        txtFooter(2).Enabled = True
        txtFooter(2).BackColor = vbWindowBackground
        ' empty all other
        txtYourRef.Text = ""
        txtOurRef.Text = ""
        txtFertigSpez.Text = ""
        cboDestination.Text = ""
        txtManufacturPlace = ""
        switchDate(0).Visible = False
        
    Case "H"
        txtQuantity.Enabled = True
        txtQuantity.BackColor = vbWindowBackground
        ' default is expiry date
        txtRetestExpiryDate.Enabled = True
        txtRetestExpiryDate.BackColor = vbWindowBackground
        lblRetestExpiryDate.Caption = "Expiry Date:"
        ' check if we have a Retest Value (load from DB) if so set reset the value
        If gCoAParameter.RetestDate <> "" Then
            txtRetestExpiryDate.Text = ""
        End If
        ' no change possible
        switchDate(1).Visible = False
        ' empty all other
        txtMFD.Text = ""
        txtYourRef.Text = ""
        txtOurRef.Text = ""
        txtFooter(0).Text = ""
        txtFooter(1).Text = ""
        txtFooter(2).Text = ""
        txtControlNo.Text = ""
        txtFertigSpez.Text = ""
        cboDestination.Text = ""
        txtManufacturPlace = ""
        switchDate(0).Visible = False
    
    Case "N"
        txtYourRef.Enabled = True
        txtYourRef.BackColor = vbWindowBackground
        txtOurRef.Enabled = True
        txtOurRef.BackColor = vbWindowBackground
        cboDestination.Enabled = True
        cboDestination.BackColor = vbWindowBackground
        txtMFD.Enabled = True
        txtMFD.BackColor = vbWindowBackground
        ' default is Retest Date
        txtRetestExpiryDate.Enabled = True
        txtRetestExpiryDate.BackColor = vbWindowBackground
        lblRetestExpiryDate.Caption = "Retest Date:"
        ' check if there are parameters (load from DB) and set the value correct
        If gCoAParameter.ExpiryDate <> "" Then
            txtRetestExpiryDate.Text = ""
        End If
            
        ' no switch possible
        switchDate(1).Visible = False
        txtFooter(0).Enabled = True
        txtFooter(0).BackColor = vbWindowBackground
        txtFooter(1).Enabled = True
        txtFooter(1).BackColor = vbWindowBackground
        txtFooter(2).Enabled = True
        txtFooter(2).BackColor = vbWindowBackground
        ' empty all other
        txtControlNo.Text = ""
        txtFertigSpez.Text = ""
        txtManufacturPlace = ""
        txtQuantity.Text = ""
        
    Case "R"
        lblControlNo.Caption = "Codification No:"
        txtControlNo.Enabled = True
        txtControlNo.BackColor = vbWindowBackground
        lblQuantity.Caption = "Batch Size:"
        txtQuantity.Enabled = True
        txtQuantity.BackColor = vbWindowBackground
        txtMFD.Enabled = True
        txtMFD.BackColor = vbWindowBackground
        ' default is Retest Date
        txtRetestExpiryDate.Enabled = True
        txtRetestExpiryDate.BackColor = vbWindowBackground
        lblRetestExpiryDate.Caption = "Retest Date:"
        ' change possible
        switchDate(1).Visible = True
        ' check if we have a calue (from DB) for Expiry Date ..if so switch the label back
        If gCoAParameter.ExpiryDate <> "" Then
            lblRetestExpiryDate.Caption = "Expiry Date:"
        End If
        txtManufacturPlace.Enabled = True
        txtManufacturPlace.BackColor = vbWindowBackground
        ' empty all other
        txtYourRef.Text = ""
        txtOurRef.Text = ""
        txtFooter(0).Text = ""
        txtFooter(1).Text = ""
        txtFooter(2).Text = ""
        txtFertigSpez.Text = ""
        cboDestination.Text = ""
        switchDate(0).Visible = False
        
    Case "Z1"
        lblMFD.Caption = "Manufacturing Date:"
        txtMFD.Enabled = True
        txtMFD.BackColor = vbWindowBackground
        txtQuantity.Enabled = True
        txtQuantity.BackColor = vbWindowBackground
        ' default is Expiry Date
        txtRetestExpiryDate.Enabled = True
        txtRetestExpiryDate.BackColor = vbWindowBackground
        lblRetestExpiryDate.Caption = "Expiry Date:"
        ' check if we have a Retest Value (load from DB) if so set reset the value
        If gCoAParameter.RetestDate <> "" Then
            txtRetestExpiryDate.Text = ""
        End If
        ' no switching possible
        switchDate(1).Visible = False
        txtFertigSpez.Enabled = True
        txtFertigSpez.BackColor = vbWindowBackground
        txtManufacturPlace.Enabled = True
        txtManufacturPlace.BackColor = vbWindowBackground
        txtFooter(0).Enabled = True
        txtFooter(0).BackColor = vbWindowBackground
        txtFooter(1).Enabled = True
        txtFooter(1).BackColor = vbWindowBackground
        txtFooter(2).Enabled = True
        txtFooter(2).BackColor = vbWindowBackground
        ' empty all other
        txtYourRef.Text = ""
        txtOurRef.Text = ""
        txtControlNo.Text = ""
        cboDestination.Text = ""
        switchDate(0).Visible = False
End Select

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : setControls"
Exit Sub

setControls_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmCert.setControls ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmCert.setControls"
     Resume Next
'</EhFooter>
End Sub


Private Function convertMFD() As String
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  convertMFD
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :
' Description:  Read Manufacture Date from DB and convert it depending
'               on the CoA type to "Mon, YYYY" or "Mon dd, YYYY"
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo convertMFD_Err
g_Debug.SendOutPut dbgCTrace, "Entered: convertMFD"
'</EhHeader>

Dim strMFD As String

strMFD = getMFD(gSelectedSample)
' format of QC-Client is YYYY-MM-DD
If strMFD = "" Then
    convertMFD = ""
Else
    If gCoASelected = "R" Then
        ' convert to dd-Mon-YYYY
        convertMFD = Mid$(strMFD, 9, 2) & "-" & strShortMonth(CInt(Mid$(strMFD, 6, 2))) & "-" & Mid$(strMFD, 1, 4)
    Else
        ' convert to Mon YYYY
        convertMFD = strShortMonth(CInt(Mid$(strMFD, 6, 2))) & " " & Mid$(strMFD, 1, 4)
    End If
End If

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : convertMFD"
Exit Function

convertMFD_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmCert.convertMFD ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmCert.convertMFD"
     Resume Next
'</EhFooter>
End Function

Private Function convertExpiryDate() As String
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  convertExpiryDate
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  09.05.2003
' Parameters :
' Description:  Read the Retestdate from DB and convert it into format "Mon, YYYY"
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo convertExpiryDate_Err
g_Debug.SendOutPut dbgCTrace, "Entered: convertExpiryDate"
'</EhHeader>

Dim strExpiryDate

' call function to read from DB
strExpiryDate = getExpiryDate(gSelectedSample)

' format of QC-Client is YYYY-MM-DD
If strExpiryDate = "" Then
    convertExpiryDate = ""
Else
    convertExpiryDate = strShortMonth(CInt(Mid$(strExpiryDate, 6, 2))) & " " & Mid$(strExpiryDate, 1, 4)
End If

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : convertExpiryDate"
Exit Function

convertExpiryDate_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmCert.convertExpiryDate ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmCert.convertExpiryDate"
     Resume Next
'</EhFooter>
End Function

Private Function convertRetestDate() As String
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  convertRetestDate
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :
' Description:  Read the Retestdate from DB and convert it into format "Mon, YYYY"
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo convertRetestDate_Err
g_Debug.SendOutPut dbgCTrace, "Entered: convertRetestDate"
'</EhHeader>

Dim strRetestDate

' call function to read from DB
strRetestDate = getRetestDate(gSelectedSample)

' format of QC-Client is YYYY-MM-DD
If strRetestDate = "" Then
    convertRetestDate = ""
Else
    convertRetestDate = strShortMonth(CInt(Mid$(strRetestDate, 6, 2))) & " " & Mid$(strRetestDate, 1, 4)
End If

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : convertRetestDate"
Exit Function

convertRetestDate_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmCert.convertRetestDate ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmCert.convertRetestDate"
     Resume Next
'</EhFooter>
End Function

Private Sub fillCoAParameter()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  fillCoAParameter
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :
' Description:  Reade the values from the form and save it to the global variable
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo fillCoAParameter_Err
g_Debug.SendOutPut dbgCTrace, "Entered: fillCoAParameter"
'</EhHeader>


With gCoAParameter
    .BatchQuantity = txtQuantity
    .ControlNo = txtControlNo
    .Destination = cboDestination
    .FertigSpezNo = txtFertigSpez
    .FooterLine1 = txtFooter(0)
    .FooterLine2 = txtFooter(1)
    .FooterLine3 = txtFooter(2)
    .ManufactureDate = txtMFD
    .OurRef = txtOurRef
    .PlaceOfManufacture = txtManufacturPlace
    .Productname = txtItemName(0)
    .Productname2 = txtItemName(1)
    .Samplename = txtSample
    .YourRef = txtYourRef
    If lblMFD.Caption = "Date of Release:" Then
        .ReleaseDate = txtMFD
        .ManufactureDate = ""
    Else
        .ReleaseDate = ""
    End If
    If lblRetestExpiryDate.Caption = "Retest Date:" Then
        .RetestDate = txtRetestExpiryDate
        .ExpiryDate = ""
    ElseIf lblRetestExpiryDate.Caption = "Expiry Date:" Then
        .ExpiryDate = txtRetestExpiryDate
        .RetestDate = ""
    End If
    
End With


'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : fillCoAParameter"
Exit Sub

fillCoAParameter_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmCert.fillCoAParameter ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmCert.fillCoAParameter"
     Resume Next
'</EhFooter>
End Sub

Private Sub setCoAParameter()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  setCoAParameter
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  12.03.2003
' Parameters :
' Description:  Set the values of the control with the saved CoA Parameters
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo setCoAParameter_Err
g_Debug.SendOutPut dbgCTrace, "Entered: setCoAParameter"
'</EhHeader>


With gCoAParameter
    txtQuantity = .BatchQuantity
    txtControlNo = .ControlNo
    cboDestination = .Destination
    txtFertigSpez = .FertigSpezNo
    txtFooter(0) = .FooterLine1
    txtFooter(1) = .FooterLine2
    txtFooter(2) = .FooterLine3
    txtMFD = .ManufactureDate
    If .ReleaseDate <> "" Then
        txtMFD.Text = .ReleaseDate
        lblMFD.Caption = "Date of Release:"
    End If
    txtOurRef = .OurRef
    txtManufacturPlace = .PlaceOfManufacture
    txtItemName(0) = .Productname
    txtItemName(1) = .Productname2
    txtYourRef = .YourRef
    If .ExpiryDate <> "" Then
        txtRetestExpiryDate = .ExpiryDate
        lblRetestExpiryDate.Caption = "Expiry Date:"
    End If
    If .RetestDate <> "" Then
        txtRetestExpiryDate = .RetestDate
        lblRetestExpiryDate.Caption = "Retest Date:"
    End If
End With


'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : setCoAParameter"
Exit Sub

setCoAParameter_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmCert.setCoAParameter ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmCert.setCoAParameter"
     Resume Next
'</EhFooter>
End Sub




Private Sub switchDate_Change(Index As Integer)

Select Case Index
    Case 0
        If lblMFD.Caption = "Manufacturedate:" Then
            lblMFD.Caption = "Date of Release:"
        Else
            lblMFD.Caption = "Manufacturedate:"
        End If
    Case 1
        If lblRetestExpiryDate.Caption = "Expiry Date:" Then
            lblRetestExpiryDate.Caption = "Retest Date:"
        Else
            lblRetestExpiryDate.Caption = "Expiry Date:"
        End If
    End Select

End Sub

Private Sub txtControlNo_Change()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtControlNo_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.06.2003
' Parameters :
' Description:  Limit text to 30 characters
'               Code is from www.aboutvb.de
'--------------------------------------------------------------------------------
'</CSCM>
    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtControlNo
        If Len(.Text) <= 30 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 30
        End If
    End With
    sInProc = False
End Sub



Private Sub txtFertigSpez_Change()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtFertigSpez_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.05.2003
' Parameters :
' Description:  Check for maxium 30 character
'               Code is from www.aboutvb.de
'--------------------------------------------------------------------------------
'</CSCM>

    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtFertigSpez
        If Len(.Text) <= 30 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 30
        End If
    End With
    sInProc = False

End Sub
Private Sub txtFooter_Change(Index As Integer)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtFooter_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.05.2003
' Parameters :  Index
' Description:  Limit the entry to 120 characters
'               Code is from www.aboutvb.de
'--------------------------------------------------------------------------------
'</CSCM>
    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtFooter(Index)
        If Len(.Text) <= 120 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 120
        End If
    End With
    sInProc = False

End Sub

Private Sub txtItemName_Change(Index As Integer)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtItemName_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.05.2003
' Parameters :
' Description:  Limit the entry to 90 characters
'               Code is from www.aboutvb.de
'--------------------------------------------------------------------------------
'</CSCM>
    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtItemName(Index)
        If Len(.Text) <= 90 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 90
        End If
    End With
    sInProc = False

End Sub



Private Sub txtManufacturPlace_Change()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtManufacturPlace_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.06.2003
' Parameters :
' Description:  Limit to 50 characters
'--------------------------------------------------------------------------------
'</CSCM>

    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtManufacturPlace()
        If Len(.Text) <= 50 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 50
        End If
    End With
    sInProc = False
End Sub

Private Sub txtMFD_Change()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtMFD_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.06.2003
' Parameters :
' Description:  Limit to 15 characters
'--------------------------------------------------------------------------------
'</CSCM>

    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtMFD
        If Len(.Text) <= 15 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 15
        End If
    End With
    sInProc = False
End Sub

Private Sub txtOurRef_Change()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtOurRef_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.06.2003
' Parameters :
' Description:  Limit to 20 characters
'--------------------------------------------------------------------------------
'</CSCM>

    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtOurRef
        If Len(.Text) <= 20 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 20
        End If
    End With
    sInProc = False
End Sub

Private Sub txtQuantity_Change()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtQuantity_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.06.2003
' Parameters :
' Description:  Limit to 20 characters
'--------------------------------------------------------------------------------
'</CSCM>

    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtQuantity
        If Len(.Text) <= 30 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 30
        End If
    End With
    sInProc = False
End Sub

Private Sub txtRetestExpiryDate_Change()
'--------------------------------------------------------------------------------
' Procedure  :  txtRetestExpiryDate_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.06.2003
' Parameters :
' Description:  Limit to 15 characters
'--------------------------------------------------------------------------------
'</CSCM>
    
    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtRetestExpiryDate
        If Len(.Text) <= 15 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 15
        End If
    End With
    sInProc = False
End Sub

Private Sub txtYourRef_Change()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtYourRef_Change
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  23.06.2003
' Parameters :
' Description:  Limit to 20 characters
'--------------------------------------------------------------------------------
'</CSCM>

    Static sLastText As String
    Static sInProc As Boolean
  
    If sInProc Then
        Exit Sub
    Else
        sInProc = True
    End If
    With txtYourRef
        If Len(.Text) <= 20 Then
            sLastText = .Text
        Else
            Beep
            .Text = sLastText
            .SelStart = 20
        End If
    End With
    sInProc = False
End Sub

Public Sub clearCoAParameter()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  clearCoAParameter
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  06.10.2003
' Parameters :
' Description:  Clear the global CoA Parameter Variable
'--------------------------------------------------------------------------------
'</CSCM>
With gCoAParameter
    .BatchQuantity = ""
    .ControlNo = ""
    .Destination = ""
     .FertigSpezNo = ""
    .FooterLine1 = ""
    .FooterLine2 = ""
    .FooterLine3 = ""
    .ManufactureDate = ""
    .ReleaseDate = ""
    .OurRef = ""
    .PlaceOfManufacture = ""
    .Productname = ""
    .Productname2 = ""
    .YourRef = ""
    .ExpiryDate = ""
    .RetestDate = ""
End With
End Sub
