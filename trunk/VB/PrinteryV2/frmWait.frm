VERSION 5.00
Begin VB.Form frmWait 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "BALI Printery"
   ClientHeight    =   885
   ClientLeft      =   5190
   ClientTop       =   3255
   ClientWidth     =   3570
   Icon            =   "frmWait.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   885
   ScaleWidth      =   3570
   Begin Printery.ProgBar prbStatus 
      Height          =   240
      Left            =   75
      Top             =   75
      Width           =   3390
      _ExtentX        =   5980
      _ExtentY        =   423
   End
   Begin VB.Label lblPlease 
      Alignment       =   2  'Center
      Caption         =   "updating sample information ... please wait"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   450
      Width           =   3375
   End
End
Attribute VB_Name = "frmWait"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
' Center form
'*************************
    Me.Top = (Screen.Height - Me.Height) / 2
    Me.Left = (Screen.Width - Me.Width) / 2
End Sub

Private Sub Form_Paint()
'    Dim lngY As Long
'    Dim lngScaleHeight As Long
'    Dim lngScaleWidth As Long
'    ScaleMode = vbPixels
'    lngScaleHeight = ScaleHeight
'    lngScaleWidth = ScaleWidth
'    DrawStyle = vbInvisible
'    FillStyle = vbFSSolid
'    For lngY = 0 To lngScaleHeight
'        FillColor = RGB(0, 0, 255 - (lngY * 255) \ lngScaleHeight)
'        Line (-1, lngY - 1)-(lngScaleWidth, lngY + 1), , B
'    Next lngY
End Sub
