VERSION 5.00
Begin VB.Form frmLoad 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   4755
   ClientLeft      =   5145
   ClientTop       =   2925
   ClientWidth     =   6015
   Icon            =   "frmLoad.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4755
   ScaleWidth      =   6015
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4515
      Left            =   0
      Picture         =   "frmLoad.frx":000C
      ScaleHeight     =   301
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   401
      TabIndex        =   0
      Top             =   0
      Width           =   6015
   End
   Begin Printery.ProgBar prbStatus 
      Height          =   240
      Left            =   0
      Top             =   4500
      Width           =   6000
      _ExtentX        =   10583
      _ExtentY        =   423
      Value           =   0
      BorderStyle     =   0
   End
End
Attribute VB_Name = "frmLoad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub Form_Load()

Me.MousePointer = vbHourglass
DoEvents

On Error Resume Next

End Sub

Private Sub Form_Unload(Cancel As Integer)

Me.MousePointer = vbNormal
End Sub
