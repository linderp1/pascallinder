Attribute VB_Name = "mdlCheckDublicate"
Option Explicit
' Module to check if the application is
' already running.

  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  ' Copyright ©1996-2000 VBnet, Randy Birch, All Rights Reserved.
  ' Some pages may also contain other copyrights by the author.
  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  ' You are free to use this code within your own applications,
  ' but you are expressly forbidden from selling or otherwise
  ' distributing this source code without prior written consent.
  ' This includes both posting free demo projects made from this
  ' code as well as reproducing the code in text or html format.
  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  '-------------------------------------
  'required for RestoreWindow routine
  Private Const SW_SHOWMINIMIZED = 2
  Private Const SW_SHOWNORMAL = 1
  Private Const SW_SHOWNOACTIVATE = 4
  Private Const SW_RESTORE = 9

  Private Type RECT
     Left As Long
     Top As Long
     Right As Long
     Bottom As Long
  End Type

  Private Type POINTAPI
     x As Long
     y As Long
  End Type

  Private Type WINDOWPLACEMENT
     Length As Long
     flags As Long
     showCmd As Long
     ptMinPosition As POINTAPI
     ptMaxPosition As POINTAPI
     rcNormalPosition As RECT
  End Type

  Private Declare Function FindWindow Lib "user32" _
       Alias "FindWindowA" _
      (ByVal lpClassName As String, _
       ByVal lpWindowName As String) As Long

  Private Declare Function SetWindowPlacement Lib "user32" _
      (ByVal hwnd As Long, _
       lpwndpl As WINDOWPLACEMENT) As Long

  Private Declare Function SetForegroundWindow Lib "user32" _
      (ByVal hwnd As Long) As Long

  Public Declare Function BringWindowToTop Lib "user32" _
     (ByVal hwnd As Long) As Long

  Private Declare Function GetWindowPlacement Lib "user32" _
      (ByVal hwnd As Long, _
       lpwndpl As WINDOWPLACEMENT) As Long

  'VB3 & VB4 use class name "ThunderRTForm"
  'VB5 uses class name "Thunder5Form" in design mode
    'and "ThunderRT5Form" in run mode,
  'VB6 uses class name "ThunderForm" in design mode,
  '  and "ThunderRT6FormDC" in run mode,
  '
  'Including the class name for the compiled exe class
  'prevents the routine from finding and attempting
  'to activate the project form of the same name.

  Private Sub Main()
        '<EhHeader>
        On Error GoTo Main_Err
        '</EhHeader>

         Dim origTitle As String
         Dim hPrevWin As Long

100      If App.PrevInstance Then

           'change the new instance title to prevent it
           'from being located instead of the original
           'instance.  Note however that as this is in
           'a BAS module and not the form load sub,
           'we don't want to set the Form1.Caption to
           '"...duplicate instance" because setting a
           'form's properties implicitly loads the form
102         origTitle = App.Title
104         App.Title = "...duplicate instance"

106         hPrevWin = FindWindow("ThunderRT5Main", origTitle)
108         DoEvents

110         If hPrevWin Then
112            Call RestoreWindow(hPrevWin)
            End If

            Exit Sub

         End If

        'if this far this is the only instance
        'and we can safely load the form
114     Load frmMain
        'check if during load an error
116     If gExit = False Then
118         frmMain.Show
        Else
120         Unload frmMain
        End If

        '<EhFooter>
        Exit Sub

Main_Err:
        MsgBox Err.Description & vbCrLf & _
               "in Printery.mdlCheckDublicate.Main " & _
               "at line " & Erl
        Resume Next
        '</EhFooter>
  End Sub


  Private Sub RestoreWindow(hWndToRestore As Long)
        '<EhHeader>
        On Error GoTo RestoreWindow_Err
        '</EhHeader>

         Dim currWinP As WINDOWPLACEMENT
     
        'if a window handle passed
100      If hWndToRestore Then
     
           'prepare the WINDOWPLACEMENT type
           'to receive the window coordinates
           'of the specified handle
102         currWinP.Length = Len(currWinP)
     
           'get the info...
104         If GetWindowPlacement(hWndToRestore, currWinP) > 0 Then
        
              'based on the returned info,
              'determine the window state
106            If currWinP.showCmd = SW_RESTORE Then
        
                 'it is minimized, so restore it
108               With currWinP
110                  .Length = Len(currWinP)
112                  .flags = 0&
114                  .showCmd = SW_SHOWNORMAL
                  End With
              
116               Call SetWindowPlacement(hWndToRestore, currWinP)
           
               Else
             
                 'it is on-screen, so make it visible
118               Call SetForegroundWindow(hWndToRestore)
120               Call BringWindowToTop(hWndToRestore)
           
               End If  'If currWinP.showCmd
            End If  'If GetWindowPlacement
         End If  'If hWndToRestore

        '<EhFooter>
        Exit Sub

RestoreWindow_Err:
        MsgBox Err.Description & vbCrLf & _
               "in Printery.mdlCheckDublicate.RestoreWindow " & _
               "at line " & Erl
        Resume Next
        '</EhFooter>
  End Sub

