VERSION 5.00
Object = "{8E27C92E-1264-101C-8A2F-040224009C02}#7.0#0"; "MSCAL.OCX"
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   7065
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12585
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7065
   ScaleWidth      =   12585
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cmbSampleType 
      Height          =   315
      Left            =   240
      TabIndex        =   5
      Text            =   "cmbSampleType"
      Top             =   1080
      Width           =   6015
   End
   Begin VB.Timer timCheck 
      Interval        =   30000
      Left            =   6840
      Top             =   6000
   End
   Begin VB.CommandButton cmdSend 
      Caption         =   "Send mail"
      Height          =   375
      Left            =   10035
      TabIndex        =   3
      Top             =   5760
      Width           =   1575
   End
   Begin MSACAL.Calendar calDate 
      Height          =   2655
      Left            =   6840
      TabIndex        =   1
      Top             =   240
      Width           =   2775
      _Version        =   524288
      _ExtentX        =   4895
      _ExtentY        =   4683
      _StockProps     =   1
      BackColor       =   -2147483633
      Year            =   2002
      Month           =   2
      Day             =   11
      DayLength       =   1
      MonthLength     =   2
      DayFontColor    =   0
      FirstDay        =   1
      GridCellEffect  =   1
      GridFontColor   =   10485760
      GridLinesColor  =   -2147483632
      ShowDateSelectors=   -1  'True
      ShowDays        =   -1  'True
      ShowHorizontalGrid=   -1  'True
      ShowTitle       =   0   'False
      ShowVerticalGrid=   -1  'True
      TitleFontColor  =   10485760
      ValueIsNull     =   0   'False
      BeginProperty DayFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty GridFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.ListBox lstUser 
      Height          =   2010
      Left            =   6720
      TabIndex        =   0
      Top             =   3600
      Width           =   2055
   End
   Begin VB.Label lblLogFile 
      Height          =   255
      Left            =   10080
      TabIndex        =   4
      Top             =   3120
      Width           =   2295
   End
   Begin VB.Label lblAccounts 
      Height          =   255
      Left            =   6840
      TabIndex        =   2
      Top             =   3120
      Width           =   2895
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private WithEvents mDataCon As ADODB.Connection
Attribute mDataCon.VB_VarHelpID = -1
Private rsSampleType As ADODB.Recordset

Private bolIsRunning As Boolean ' flag if sub is running
' API declarations
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)


Private Sub cmdAdd_Click(Index As Integer)

Select Case Index
    Case 0
        calDate.NextDay
        calDate.NextDay
    Case 1
        calDate.NextWeek
    Case 2
        calDate.NextWeek
        calDate.NextWeek
    Case 3
        calDate.Today
End Select
End Sub

Private Sub cmdSend_Click()

If txtUsername = "" Or txtPassword = "" Then
    MsgBox "Please enter Username/Password"
    Exit Sub
End If
Call checkAccount

End Sub

Private Sub Command1_Click()
Dim intCounter As Integer

lstUser.Clear

lblAccounts.Caption = "This accounts will expire on: " & calDate

With rsSampleType
    .MoveFirst
    Do Until .EOF
        If Not IsNull(.Fields(3)) Then
            If CStr(Format(.Fields(3), "dd.mm.yyyy")) = CStr(Format(calDate, "dd.mm.yyyy")) Then
                lstUser.AddItem (.Fields(0))
            End If
        End If
        .MoveNext
    Loop
End With
End Sub

Private Sub Form_Load()

Set mDataCon = New ADODB.Connection
With mDataCon
    .ConnectionString = "Provider=MSDASQL.1;Password=;Persist Security Info=True;User ID=chemlms;Data Source=ARLP1PLT"
    .Properties.Item("Prompt") = adPromptCompleteRequired
    .Open
End With

'Set mDataConDAWA = New ADODB.Connection
'With mDataConDAWA
'    .ConnectionString = "Provider=MSDASQL.1;Password=bt08sdr;Persist Security Info=True;User ID=balitech;Data Source=DAWA"
'    .Properties.Item("Prompt") = adPromptComplete
'    .Open
'End With

' open recordset
Set rsSampleType = New ADODB.Recordset
Call openRecordset

' set actual date
'calDate.Today

'open logfile
'Open App.Path & "\passSend.log" For Append As #2


End Sub


Public Sub openRecordset()

Dim strSQL  As String
cmbSampleType.Clear



'strSQL = "select uscu.US_NM , uscu.US_STTC, db.ACCOUNT_STATUS , db.EXPIRY_DATE, db.LOCK_DATE " & _
'        "from uscu, sys.DBA_USERS db " & _
'        "where uscu.US_STTC in ('U','N') " & _
'        "and uscu.US_NM not in ('SCA','CHEMLMS','PDBA','PQCTRANS') " & _
'        "and db.USERNAME = uscu.US_NM " & _
'        "order by uscu.US_NM"
        
strSQL = "select SAMPLETYPE from GWSMPCONF"

' check if RS is open
If rsSampleType.State = adStateOpen Then
    rsSampleType.Close
End If

' Open Recordset and perform Query
With rsSampleType
    .ActiveConnection = mDataCon
    .Source = strSQL
    .Open
    ' check if there is a record
    'If Not .EOF Then
    
    .MoveFirst
    Do While Not .EOF
        'iCounter = iCounter + 1
        'cmbSampleType.AddItem (.rdoColumns(0))
        cmbSampleType.AddItem .Fields(0).Value
        'MsgBox ("Row #" & iCounter & " of " & iRowCount & " equals: " & Rs.rdoColumns(0) & " is " & Rs.Status)
        .MoveNext
    Loop
    
    'MsgBox ("Items found: " & iCounter)
        
    .Close
End With
End Sub

Public Sub checkAccount()
Dim intCounter As Integer
Dim strDate As String
Dim strDatePlus1 As String
Dim strDatePlus2 As String
Dim strDatePlus3 As String
Dim strDatePlusOneWeek As String
Dim strDatePlusTwoWeeks As String
Dim strExpiryDatePlus10 As String
Dim strExpiryDate As String

Me.MousePointer = vbHourglass

' set dates
Select Case Weekday(Now())
    Case vbFriday
        strDatePlus1 = CStr(Format(DateAdd("d", 1, Now()), "dd.mm.yyyy"))
        strDatePlus2 = CStr(Format(DateAdd("d", 2, Now()), "dd.mm.yyyy"))
        strDatePlus3 = CStr(Format(DateAdd("d", 3, Now()), "dd.mm.yyyy"))
    Case Else
        strDatePlus1 = CStr(Format(DateAdd("d", 1, Now()), "dd.mm.yyyy"))
        strDatePlus2 = CStr(Format(DateAdd("d", 2, Now()), "dd.mm.yyyy"))
        strDatePlus3 = ""
End Select

strDatePlusOneWeek = CStr(Format(DateAdd("ww", 1, Now()), "dd.mm.yyyy"))
strDatePlusTwoWeeks = CStr(Format(DateAdd("ww", 2, Now()), "dd.mm.yyyy"))



With rsSampleType
    .MoveFirst
    Do Until .EOF
        If Not IsNull(.Fields(3)) Then
            If .Fields(2) = "OPEN" Then
                strExpiryDate = CStr(Format(.Fields(3), "dd.mm.yyyy"))
                Select Case strExpiryDate
                    Case strDatePlus1
                        sendHTML "Your BALI-Password will expire in one day ! " & "Userid: " & .Fields(0), strDatePlus1, CStr(.Fields(0))
                    Case strDatePlus2
                        sendHTML "Your BALI-Password will expire in 2 days ! " & "Userid: " & .Fields(0), strDatePlus2, CStr(.Fields(0))
                    Case strDatePlus3
                        sendHTML "Your BALI-Password will expire on Monday ! " & "Userid: " & .Fields(0), strDatePlus3, CStr(.Fields(0))
                    Case strDatePlusOneWeek
                        sendHTML "Your BALI-Password will expire in one week. " & "Userid: " & .Fields(0), strDatePlusOneWeek, CStr(.Fields(0))
                    Case strDatePlusTwoWeeks
                        sendHTML "Your BALI-Password will expire in 2 weeks. " & "Userid: " & .Fields(0), strDatePlusTwoWeeks, CStr(.Fields(0))
                End Select
            End If
        End If
        .MoveNext
    Loop
End With

' update flag
If bolIsRunning = True Then
    Sleep (60000)
    bolIsRunning = False
End If

Me.MousePointer = vbDefault
End Sub

'CSEH: MsgBoxLine
Public Sub sendHTML(strSubject As String, dtaExpiry As String, strUserID As String)
    ' Outlook objects
        '<EhHeader>
        On Error GoTo sendHTML_Err
        '</EhHeader>

100 Dim objApp As Outlook.Application
110 Dim l_Msg As MailItem
120 Dim colAttach As Outlook.Attachments
130 Dim l_Attach As Outlook.Attachment
140 Dim oSession As MAPI.Session

    ' CDO objects

150 Dim oMsg As MAPI.Message
160 Dim oAttachs As MAPI.Attachments
170 Dim oAttach As MAPI.Attachment
180 Dim colFields As MAPI.Fields
190 Dim oField As MAPI.Field

    ' ReplyTo Variables
   Dim objAltRecip As MAPI.Recipient
   Dim g_bstrReplyToID As Variant
   Dim g_bstrReplyToName As String
   Dim FlatLength As String
   Dim StructLength As String
   
   Dim bstrFlatEntry As Variant
   Dim bstrBlob As Variant

200 Dim strEntryID As String
210 Dim strHTML As String
220 Dim strBF As String
230 Dim strEN As String
240 Dim strScript As String
250 Dim strEmail As String




    ' check if email adress is ther

260 strEmail = getEmailForUser(strUserID)

270 If strEmail = "" Then
280     Write #2, "Error finding adress for user: ", strUserID, dtaExpiry, strSubject
290     Exit Sub
300 End If



    ' create new Outlook MailItem

310 Set objApp = CreateObject("Outlook.Application")

320 Set l_Msg = objApp.CreateItem(olMailItem)

330 With l_Msg
340     .Subject = strSubject
350     With .Recipients.Add(strEmail)
360         .Type = 1 ' olTo
370         If Not .Resolve Then
                ' adress not found
                ' write to logfile
380             Write #2, "Error resolving adress for user: ", strEmail, strUserID, dtaExpiry, strSubject
390             Set l_Msg = Nothing
400             Set objApp = Nothing
410             Exit Sub
420         End If
430     End With
440 End With
    
    ' make ReplyTo Entry
    With l_Msg.Recipients.Add("pharma.atlas@roche.com")
        .Resolve
        g_bstrReplyToID = .EntryID
        g_bstrReplyToName = .Name
        ' 3. Remove the Alternate Recipient from the Recipient list (if
        '    applicable).
        .Delete
    End With

     ' 4. Hash the ID into a BSTR that looks like a FLATENTRYLIST structure
     ' Calculate the length of a string converted Hex representation of the
     ' alt recips EntryID.
     ' Divide this value by to to calculate how long this will appear to
     ' MAPI when it views it as a numeric value rather than as a string (or
     ' more appropriately char.)
     FlatLength = CStr(Hex(Len(g_bstrReplyToID) / 2))

     ' Concatenate members of the FLATENTRY stucture: A) Length of entire
     ' FLATENTRY
     ' structure, B) Padding, C) ENTRYID of Alt Recip
     bstrFlatEntry = FlatLength & "000000" & g_bstrReplyToID

     ' Now calculate the length of the entire FLATENTRY structure as a
     ' string and again divide by 2 to determine length when viewed as a
     ' numeric value.
     StructLength = Hex(Len(bstrFlatEntry) / 2)

     ' Assemble the components of the FLATENTRYLIST structure: A)
     ' "01000000" ' defines how many FLATENTRY structures there are in
     ' the FLATENTRYLIST (plus padding) -
     ' There is only 1 in this sample, B) the length of the first (and
     ' only) FLATENTRY array member, C) more padding, D) the EntryID of the
     ' Alt Recip (as a string)
     bstrBlob = "01000000" & StructLength & "000000" & bstrFlatEntry

 
    
    ' add graphic as attachment to Outlook message
    ' change path to graphic as needed

450 Set colAttach = l_Msg.Attachments
460 Set l_Attach = colAttach.Add(App.Path & "\password.jpg")

470 l_Msg.Close olSave

480 strEntryID = l_Msg.EntryID

490 Set l_Msg = Nothing

    ' *** POSITION CRITICAL *** you must dereference the
    ' attachment objects before changing their properties
    ' via CDO

500 Set colAttach = Nothing
510 Set l_Attach = Nothing

    ' initialize CDO session

    'On Error Resume Next

520 Set oSession = CreateObject("MAPI.Session")
530 oSession.Logon txtUsername, txtPassword, True, True



    ' get the message created earlier
540 Set oMsg = oSession.GetMessage(strEntryID)

    ' set properties of the attached graphic that make
    ' it embedded and give it an ID for use in an <IMG> tag

550 Set oAttachs = oMsg.Attachments
560 Set oAttach = oAttachs.Item(1)
570 Set colFields = oAttach.Fields
580 Set oField = colFields.Add(CdoPR_ATTACH_MIME_TAG, "image/jpeg")
590 Set oField = colFields.Add(&H3712001E, "myident")

600 oMsg.Fields.Add "{0820060000000000C000000000000046}0x8514", 11, True

     ' Write the values (ReplyTo) to the fields
     oMsg.Fields.Add CdoPR_REPLY_RECIPIENT_NAMES, g_bstrReplyToName
     oMsg.Fields.Add CdoPR_REPLY_RECIPIENT_ENTRIES, bstrBlob
     
610 oMsg.Update



    ' get the Outlook MailItem again

620 Set l_Msg = objApp.GetNamespace("MAPI").GetItemFromID(strEntryID)



630 strBF = "<p style=" & Chr(34) & "line-height: 100%; margin-top: 0; margin-bottom: 0" & Chr(34) & "><font face=" & Chr(34) & "Arial" & Chr(34) & " size = " & Chr(34) & "2" & Chr(34) & ">"
640 strEN = "</font></p>"

650 strHTML = strHTML & strBF & "Sehr geehrte Benutzerin/Benutzer" & strEN & vbCrLf
660 strHTML = strHTML & strBF & "Ihr BALI-Passwort (LMS-Password) wird am <b><DATEEXPIRE></b> ablaufen." & strEN & vbCrLf
670 strHTML = strHTML & strBF & "Bitte ändern Sie es rechtzeitig vor diesem Datum." & strEN & vbCrLf
680 strHTML = strHTML & strBF & "Im BALI durch einen Klick auf das Icon:" & strEN & vbCrLf
690 strHTML = strHTML & "<IMG align=baseline border=0 hspace=0 src=cid:myident>" & vbCrLf
700 strHTML = strHTML & strBF & "&nbsp;" & strEN & vbCrLf
710 strHTML = strHTML & strBF & "Hilfe zum Ändern des Passwort finden Sie im Benutzerhandbuch." & strEN & vbCrLf
730 strHTML = strHTML & strBF & "&nbsp;" & strEN & vbCrLf
740 strHTML = strHTML & strBF & "Mit freundlichem Gruss," & strEN & vbCrLf
750 strHTML = strHTML & strBF & "ATLas Pharma Helpdesk" & strEN & vbCrLf
760 strHTML = strHTML & strBF & "Tel: 72626" & strEN & vbCrLf
770 strHTML = strHTML & strBF & "-------------------------------------------------------------------------------------------------" & strEN & vbCrLf
780 strHTML = strHTML & strBF & "Cher(e) utilisateur(trice)" & strEN & vbCrLf
790 strHTML = strHTML & strBF & "Votre mot de passe BALI (LMS-Password) arrive à expiration le <b><DATEEXPIRE></b>." & strEN & vbCrLf
800 strHTML = strHTML & strBF & "Veuillez s'il vous plait le changer avant cette date." & strEN & vbCrLf
810 strHTML = strHTML & strBF & "Dans le BALI en cliquant sur l'icone:" & strEN & vbCrLf
820 strHTML = strHTML & "<IMG align=baseline border=0 hspace=0 src=cid:myident>" & vbCrLf
830 strHTML = strHTML & strBF & "&nbsp;" & strEN & vbCrLf
840 strHTML = strHTML & strBF & "Les étapes nécéssaires pour changer le mot de passe sont décrites dans le guide utilisateur." & vbCrLf
870 strHTML = strHTML & strBF & "&nbsp;" & strEN & vbCrLf
880 strHTML = strHTML & strBF & "Sincères salutations," & strEN & vbCrLf
890 strHTML = strHTML & strBF & "ATLas Pharma Helpdesk" & strEN & vbCrLf
900 strHTML = strHTML & strBF & "Tel: 72626" & strEN & vbCrLf
910 strHTML = strHTML & strBF & "-------------------------------------------------------------------------------------------------" & strEN & vbCrLf
920 strHTML = strHTML & strBF & "Dear User" & strEN & vbCrLf
930 strHTML = strHTML & strBF & "Your BALI-Password (LMS-Password) will expire on <b><DATEEXPIRE> </b>." & strEN & vbCrLf
940 strHTML = strHTML & strBF & "Please change your password before this date." & strEN & vbCrLf
950 strHTML = strHTML & strBF & "Use this icon in BALI to change your password:" & strEN & vbCrLf
960 strHTML = strHTML & "<IMG align=baseline border=0 hspace=0 src=cid:myident>" & vbCrLf
970 strHTML = strHTML & strBF & "&nbsp;" & strEN & vbCrLf
980 strHTML = strHTML & strBF & "See your user manual for help on how to change your password." & strEN & vbCrLf
1000 strHTML = strHTML & strBF & "&nbsp;" & strEN & vbCrLf
1010 strHTML = strHTML & strBF & "Kind regards," & strEN & vbCrLf
1020 strHTML = strHTML & strBF & "ATLas Pharma Helpdesk" & strEN & vbCrLf
1030 strHTML = strHTML & strBF & "Tel: 72626" & strEN & vbCrLf


1040 strHTML = Replace(strHTML, "<DATEEXPIRE>", dtaExpiry)


1050 l_Msg.HTMLBody = strHTML
1060 l_Msg.Close (olSave)
1070 l_Msg.Send

1080 If Err = 0 Then
         ' write message to logfile
1090     Write #2, "Success ", strUserID, dtaExpiry, strSubject
1100 Else
1110     Write #2, "Error in sending Mail to: ", strUserID, Err.Number, Err.Description, dtaExpiry, strSubject
1120 End If


     ' clean up objects

1130 Set oField = Nothing
1140 Set colFields = Nothing
1150 Set oMsg = Nothing

1160 oSession.Logoff

1170 Set oSession = Nothing
1180 Set objApp = Nothing
1190 Set l_Msg = Nothing


         '<EhFooter>
         Exit Sub

sendHTML_Err:
         MsgBox Err.Description & vbCrLf & _
                "in PassMail.frmMain.sendHTML " & _
                "at line " & Erl
    
         '</EhFooter>
End Sub

Private Sub Form_Unload(Cancel As Integer)

On Error Resume Next

Close #1
Close #2
End Sub

Private Sub timCheck_Timer()

' check time and start sub

If bolIsRunning = True Then
    Exit Sub
Else
    If Hour(Now) = "6" And Minute(Now()) = "0" Then
        ' start sub
        bolIsRunning = True
        checkAccount
    End If
End If
End Sub

Public Function getEmailForUser(strUserID) As String
' get email adresse from ITDAWA

Dim strSQL As String

If strUserID = "" Then
    getEmailForUser = ""
    Exit Function
End If

' open recorset
Set rsDawa = New ADODB.Recordset

' build sql

strSQL = "select p.INTERNETADDRESS from ITDAWA.TPERSON1_VERTRAG p " & _
         "where p.USERID = '" & UCase(strUserID) & "' " & _
         "and p.ANSTELLUNGS_STATUS_TXT = 'aktiv' and p.PRIMAER_VERTRAG = 'Y'"

' Open Recordset and perform Query
With rsDawa
    .ActiveConnection = mDataConDAWA
    .Source = strSQL
    .Open
    If .EOF Then
        ' no user found return empty string
        getEmailForUser = ""
    Else
        If IsNull(.Fields(0).Value) = False Then
            getEmailForUser = .Fields(0).Value
        Else
            getEmailForUser = ""
        End If
    End If
    .Close
End With
End Function
