VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "Comctl32.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{157107E3-8862-101C-85AC-000000001000}#1.1#0"; "lmssysx.ocx"
Object = "{9E883861-2808-4487-913D-EA332634AC0D}#1.0#0"; "SizerOne.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "BALI Printery"
   ClientHeight    =   7500
   ClientLeft      =   1680
   ClientTop       =   1050
   ClientWidth     =   10200
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   7500
   ScaleWidth      =   10200
   Begin SizerOneLibCtl.TabOne tabReport 
      Height          =   3480
      Left            =   4050
      TabIndex        =   14
      Top             =   270
      Width           =   5640
      _cx             =   9948
      _cy             =   6138
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Enabled         =   -1  'True
      Appearance      =   2
      MousePointer    =   0
      _ConvInfo       =   1
      Version         =   700
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      FrontTabColor   =   -2147483633
      BackTabColor    =   -2147483633
      TabOutlineColor =   -2147483632
      FrontTabForeColor=   -2147483630
      Caption         =   "Single Sample|Stability Sample|Stability|Configuration|Label|Certificate"
      Align           =   0
      CurrTab         =   0
      FirstTab        =   0
      Style           =   4
      Position        =   0
      AutoSwitch      =   -1  'True
      AutoScroll      =   -1  'True
      TabPreview      =   -1  'True
      ShowFocusRect   =   -1  'True
      TabsPerPage     =   3
      BorderWidth     =   0
      BoldCurrent     =   -1  'True
      DogEars         =   0   'False
      MultiRow        =   -1  'True
      MultiRowOffset  =   0
      CaptionStyle    =   0
      TabHeight       =   0
      TabCaptionPos   =   4
      TabPicturePos   =   0
      CaptionEmpty    =   ""
      Separators      =   0   'False
      Begin SizerOneLibCtl.ElasticOne elTab 
         Height          =   2820
         Index           =   5
         Left            =   7485
         TabIndex        =   107
         TabStop         =   0   'False
         Top             =   615
         Width           =   5550
         _cx             =   9790
         _cy             =   4974
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   -1  'True
         Appearance      =   4
         MousePointer    =   0
         _ConvInfo       =   1
         Version         =   700
         BackColor       =   -2147483633
         ForeColor       =   -2147483630
         FloodColor      =   6553600
         ForeColorDisabled=   -2147483631
         Caption         =   ""
         Align           =   0
         AutoSizeChildren=   0
         BorderWidth     =   6
         ChildSpacing    =   4
         Splitter        =   0   'False
         FloodDirection  =   0
         FloodPercent    =   0
         CaptionPos      =   1
         WordWrap        =   -1  'True
         MaxChildSize    =   0
         MinChildSize    =   0
         TagWidth        =   0
         TagPosition     =   0
         Style           =   0
         TagSplit        =   2
         PicturePos      =   4
         CaptionStyle    =   0
         ResizeFonts     =   0   'False
         GridRows        =   0
         GridCols        =   0
         Frame           =   3
         FrameStyle      =   0
         FrameWidth      =   1
         FrameColor      =   -2147483628
         FrameShadow     =   -2147483632
         FloodStyle      =   1
         _GridInfo       =   ""
         Begin VB.Frame fraCertSample 
            Caption         =   " Sample "
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   2655
            Left            =   2400
            TabIndex        =   109
            Top             =   120
            Width           =   3015
            Begin VB.CommandButton cmdCertUpdate 
               Caption         =   "Update"
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
               Left            =   1440
               TabIndex        =   111
               Top             =   360
               Width           =   855
            End
            Begin VB.TextBox txtCertSample 
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
               Left            =   240
               TabIndex        =   110
               Top             =   360
               Width           =   975
            End
            Begin VB.Label lblcertStatusShow 
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
               Left            =   840
               TabIndex        =   119
               Top             =   1920
               Width           =   2055
            End
            Begin VB.Label lblCertStatus 
               Caption         =   "Status"
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
               TabIndex        =   118
               Top             =   1920
               Width           =   615
            End
            Begin VB.Label lblcertProductShow 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   615
               Left            =   840
               TabIndex        =   117
               Top             =   1320
               Width           =   2055
            End
            Begin VB.Label lblCertLotShow 
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
               Left            =   840
               TabIndex        =   116
               Top             =   1005
               Width           =   2055
            End
            Begin VB.Label lblcertproduct 
               Caption         =   "Product"
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
               TabIndex        =   115
               Top             =   1320
               Width           =   615
            End
            Begin VB.Label lblCertLot 
               Caption         =   "Lot"
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
               TabIndex        =   114
               Top             =   1005
               Width           =   615
            End
            Begin VB.Label lblCertItemShow 
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
               Left            =   840
               TabIndex        =   113
               Top             =   720
               Width           =   2055
            End
            Begin VB.Label lblCertItem 
               Caption         =   "Item"
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
               TabIndex        =   112
               Top             =   720
               Width           =   495
            End
         End
         Begin VB.Frame fraCertReport 
            Caption         =   " Certificate "
            Height          =   2655
            Left            =   0
            TabIndex        =   108
            Top             =   120
            Width           =   2295
            Begin VB.CommandButton cmdCertValues 
               Caption         =   "Define values ..."
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   405
               TabIndex        =   125
               Top             =   2205
               Width           =   1410
            End
            Begin VB.OptionButton optCertTyp 
               Caption         =   "Type Z1 Handle"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   4
               Left            =   240
               TabIndex        =   124
               Top             =   1800
               Width           =   1770
            End
            Begin VB.OptionButton optCertTyp 
               Caption         =   "Type R"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   3
               Left            =   240
               TabIndex        =   123
               Top             =   1440
               Width           =   1050
            End
            Begin VB.OptionButton optCertTyp 
               Caption         =   "Type N"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   2
               Left            =   240
               TabIndex        =   122
               Top             =   1080
               Width           =   1140
            End
            Begin VB.OptionButton optCertTyp 
               Caption         =   "Type H"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   1
               Left            =   240
               TabIndex        =   121
               Top             =   720
               Width           =   1365
            End
            Begin VB.OptionButton optCertTyp 
               Caption         =   "Type FS"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   0
               Left            =   240
               TabIndex        =   120
               Top             =   360
               Value           =   -1  'True
               Width           =   1545
            End
         End
      End
      Begin SizerOneLibCtl.ElasticOne elTab 
         Height          =   2820
         Index           =   4
         Left            =   7185
         TabIndex        =   56
         TabStop         =   0   'False
         Top             =   615
         Width           =   5550
         _cx             =   9790
         _cy             =   4974
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   -1  'True
         Appearance      =   4
         MousePointer    =   0
         _ConvInfo       =   1
         Version         =   700
         BackColor       =   -2147483633
         ForeColor       =   -2147483630
         FloodColor      =   6553600
         ForeColorDisabled=   -2147483631
         Caption         =   ""
         Align           =   0
         AutoSizeChildren=   0
         BorderWidth     =   6
         ChildSpacing    =   4
         Splitter        =   0   'False
         FloodDirection  =   0
         FloodPercent    =   0
         CaptionPos      =   1
         WordWrap        =   -1  'True
         MaxChildSize    =   0
         MinChildSize    =   0
         TagWidth        =   0
         TagPosition     =   0
         Style           =   0
         TagSplit        =   2
         PicturePos      =   4
         CaptionStyle    =   0
         ResizeFonts     =   0   'False
         GridRows        =   0
         GridCols        =   0
         Frame           =   3
         FrameStyle      =   0
         FrameWidth      =   1
         FrameColor      =   -2147483628
         FrameShadow     =   -2147483632
         FloodStyle      =   1
         _GridInfo       =   ""
         Begin VB.PictureBox picTabStrip 
            BorderStyle     =   0  'None
            Height          =   2880
            Index           =   5
            Left            =   0
            ScaleHeight     =   2880
            ScaleWidth      =   5475
            TabIndex        =   93
            Top             =   0
            Width           =   5475
            Begin VB.Frame fraLabelSample 
               Caption         =   " Sample "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   2655
               Left            =   2448
               TabIndex        =   98
               Top             =   120
               Width           =   3075
               Begin VB.CommandButton cmdLabelSetValue 
                  Caption         =   "Set label values"
                  Height          =   375
                  Left            =   225
                  TabIndex        =   135
                  Top             =   2115
                  Width           =   2220
               End
               Begin VB.TextBox txtLabelSample 
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
                  Left            =   240
                  TabIndex        =   100
                  Top             =   360
                  Width           =   975
               End
               Begin VB.CommandButton cmdLabelUpdate 
                  Caption         =   "Update"
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
                  Left            =   1440
                  TabIndex        =   99
                  Top             =   360
                  Width           =   855
               End
               Begin VB.Label lblLabelItem 
                  Caption         =   "Item"
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
                  TabIndex        =   106
                  Top             =   720
                  Width           =   615
               End
               Begin VB.Label lblLabelItemShow 
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
                  Left            =   840
                  TabIndex        =   105
                  Top             =   720
                  Width           =   2055
               End
               Begin VB.Label lblLabelLot 
                  Caption         =   "Lot"
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
                  TabIndex        =   104
                  Top             =   1005
                  Width           =   615
               End
               Begin VB.Label lblLabelProduct 
                  Caption         =   "Product"
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
                  TabIndex        =   103
                  Top             =   1320
                  Width           =   615
               End
               Begin VB.Label lblLabelLotShow 
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
                  Left            =   840
                  TabIndex        =   102
                  Top             =   1005
                  Width           =   2055
               End
               Begin VB.Label lblLabelProductShow 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   495
                  Left            =   840
                  TabIndex        =   101
                  Top             =   1320
                  Width           =   2055
               End
            End
            Begin VB.Frame fraLabelReport 
               Caption         =   " Select Label "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   2655
               Left            =   0
               TabIndex        =   94
               Top             =   120
               Width           =   2341
               Begin VB.OptionButton optLabelDevSmall 
                  Caption         =   "Development (schmal)"
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
                  Height          =   255
                  Left            =   240
                  TabIndex        =   97
                  Top             =   1080
                  Width           =   1935
               End
               Begin VB.OptionButton optLabelStabBig 
                  Caption         =   "Stability (breit)"
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
                  Height          =   255
                  Left            =   240
                  TabIndex        =   96
                  Top             =   720
                  Width           =   1815
               End
               Begin VB.OptionButton optLabelNormalBig 
                  Caption         =   "Freigabe (breit)"
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
                  Height          =   255
                  Left            =   240
                  TabIndex        =   95
                  Top             =   360
                  Width           =   1695
               End
            End
         End
      End
      Begin SizerOneLibCtl.ElasticOne elTab 
         Height          =   2820
         Index           =   3
         Left            =   6885
         TabIndex        =   55
         TabStop         =   0   'False
         Top             =   615
         Width           =   5550
         _cx             =   9790
         _cy             =   4974
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   -1  'True
         Appearance      =   0
         MousePointer    =   0
         _ConvInfo       =   1
         Version         =   700
         BackColor       =   -2147483633
         ForeColor       =   -2147483630
         FloodColor      =   6553600
         ForeColorDisabled=   -2147483631
         Caption         =   ""
         Align           =   0
         AutoSizeChildren=   0
         BorderWidth     =   6
         ChildSpacing    =   4
         Splitter        =   0   'False
         FloodDirection  =   0
         FloodPercent    =   0
         CaptionPos      =   1
         WordWrap        =   -1  'True
         MaxChildSize    =   0
         MinChildSize    =   0
         TagWidth        =   0
         TagPosition     =   0
         Style           =   0
         TagSplit        =   2
         PicturePos      =   4
         CaptionStyle    =   0
         ResizeFonts     =   0   'False
         GridRows        =   0
         GridCols        =   0
         Frame           =   3
         FrameStyle      =   0
         FrameWidth      =   1
         FrameColor      =   -2147483628
         FrameShadow     =   -2147483632
         FloodStyle      =   1
         _GridInfo       =   ""
         Begin VB.PictureBox picTabConf 
            BorderStyle     =   0  'None
            Height          =   2880
            Left            =   0
            ScaleHeight     =   2880
            ScaleWidth      =   5475
            TabIndex        =   57
            Top             =   0
            Width           =   5475
            Begin VB.Frame fraConfParameter 
               Height          =   2655
               Left            =   2400
               TabIndex        =   61
               Top             =   120
               Width           =   3015
               Begin VB.TextBox txtConfSpecification 
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
                  TabIndex        =   67
                  Top             =   1920
                  Visible         =   0   'False
                  Width           =   2655
               End
               Begin VB.TextBox txtConfProductCode 
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
                  TabIndex        =   66
                  Top             =   1080
                  Width           =   2655
               End
               Begin VB.CommandButton cmdConfSpecification 
                  Caption         =   "Browse ..."
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
                  Left            =   1440
                  TabIndex        =   65
                  Top             =   840
                  Visible         =   0   'False
                  Width           =   975
               End
               Begin VB.CommandButton cmdConfProductCode 
                  Caption         =   "Browse ..."
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
                  Left            =   120
                  TabIndex        =   64
                  Top             =   1440
                  Width           =   975
               End
               Begin VB.ComboBox cboConfSpecRev 
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
                  ItemData        =   "frmMain.frx":09BA
                  Left            =   1920
                  List            =   "frmMain.frx":09BC
                  TabIndex        =   63
                  Top             =   1440
                  Visible         =   0   'False
                  Width           =   975
               End
               Begin VB.ComboBox cboConfSampletype 
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
                  Left            =   120
                  TabIndex        =   62
                  Top             =   480
                  Width           =   2655
               End
               Begin VB.Label lblConfRevision 
                  Caption         =   "Revision"
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
                  Left            =   1080
                  TabIndex        =   71
                  Top             =   1440
                  Visible         =   0   'False
                  Width           =   735
               End
               Begin VB.Label lblConfSpecification 
                  Caption         =   "Specification"
                  Height          =   255
                  Left            =   120
                  TabIndex        =   70
                  Top             =   1560
                  Visible         =   0   'False
                  Width           =   975
               End
               Begin VB.Label lblConfProductCode 
                  Caption         =   "Product Code"
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
                  TabIndex        =   69
                  Top             =   840
                  Width           =   975
               End
               Begin VB.Label lblConfSampleType 
                  Caption         =   "Sampletype"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   120
                  TabIndex        =   68
                  Top             =   240
                  Width           =   975
               End
            End
            Begin VB.Frame fraConf 
               Caption         =   " Select Report "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   2655
               Left            =   0
               TabIndex        =   58
               Top             =   120
               Width           =   2295
               Begin VB.OptionButton optConfSpecLogin 
                  Caption         =   "Login Conf to Spec"
                  Height          =   375
                  Left            =   240
                  TabIndex        =   127
                  Top             =   1440
                  Width           =   1770
               End
               Begin VB.OptionButton optConfPSLSpec 
                  Caption         =   "PSL in Spec"
                  Height          =   375
                  Left            =   240
                  TabIndex        =   126
                  Top             =   1080
                  Width           =   1590
               End
               Begin VB.OptionButton optConfLoginconf 
                  Caption         =   "Login Configuration"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   60
                  Top             =   360
                  Value           =   -1  'True
                  Width           =   1935
               End
               Begin VB.OptionButton optConfSpec 
                  Caption         =   "Specification"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   59
                  Top             =   720
                  Width           =   1575
               End
            End
            Begin VB.Frame fraConfPSLtoSpec 
               Height          =   2625
               Left            =   2430
               TabIndex        =   128
               Top             =   135
               Width           =   3015
               Begin VB.ListBox lstConfPSLToSpecPSLName 
                  Height          =   1035
                  ItemData        =   "frmMain.frx":09BE
                  Left            =   45
                  List            =   "frmMain.frx":09C0
                  TabIndex        =   134
                  Top             =   900
                  Width           =   2895
               End
               Begin VB.ComboBox cboConfPSLToSpecRevision 
                  Height          =   315
                  Left            =   1440
                  Style           =   2  'Dropdown List
                  TabIndex        =   130
                  Top             =   2205
                  Width           =   1410
               End
               Begin VB.ComboBox cboConfPSLToSpecLibrary 
                  Height          =   315
                  Left            =   1395
                  Style           =   2  'Dropdown List
                  TabIndex        =   129
                  Top             =   225
                  Width           =   1455
               End
               Begin VB.Label lblConfPSLToSpecRevision 
                  Caption         =   "Revision"
                  Height          =   195
                  Left            =   90
                  TabIndex        =   133
                  Top             =   2250
                  Width           =   780
               End
               Begin VB.Label lblConfPSLToSpecPSL 
                  Caption         =   "PSL Name"
                  Height          =   240
                  Left            =   90
                  TabIndex        =   132
                  Top             =   585
                  Width           =   825
               End
               Begin VB.Label lblConfPSLToSpecLibrary 
                  Caption         =   "Library"
                  Height          =   240
                  Left            =   90
                  TabIndex        =   131
                  Top             =   225
                  Width           =   735
               End
            End
         End
      End
      Begin SizerOneLibCtl.ElasticOne elTab 
         Height          =   2820
         Index           =   2
         Left            =   6585
         TabIndex        =   34
         TabStop         =   0   'False
         Top             =   615
         Width           =   5550
         _cx             =   9790
         _cy             =   4974
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   -1  'True
         Appearance      =   4
         MousePointer    =   0
         _ConvInfo       =   1
         Version         =   700
         BackColor       =   -2147483633
         ForeColor       =   -2147483630
         FloodColor      =   6553600
         ForeColorDisabled=   -2147483631
         Caption         =   ""
         Align           =   0
         AutoSizeChildren=   0
         BorderWidth     =   6
         ChildSpacing    =   4
         Splitter        =   0   'False
         FloodDirection  =   0
         FloodPercent    =   0
         CaptionPos      =   1
         WordWrap        =   -1  'True
         MaxChildSize    =   0
         MinChildSize    =   0
         TagWidth        =   0
         TagPosition     =   0
         Style           =   0
         TagSplit        =   2
         PicturePos      =   4
         CaptionStyle    =   0
         ResizeFonts     =   0   'False
         GridRows        =   0
         GridCols        =   0
         Frame           =   3
         FrameStyle      =   0
         FrameWidth      =   1
         FrameColor      =   -2147483628
         FrameShadow     =   -2147483632
         FloodStyle      =   1
         _GridInfo       =   ""
         Begin VB.PictureBox picTabStrip 
            BorderStyle     =   0  'None
            Height          =   3015
            Index           =   3
            Left            =   0
            ScaleHeight     =   3015
            ScaleWidth      =   5535
            TabIndex        =   35
            Top             =   0
            Width           =   5535
            Begin VB.Frame fraStabParameter 
               Height          =   2655
               Left            =   2400
               TabIndex        =   41
               Top             =   120
               Width           =   3015
               Begin VB.ComboBox cboStabMainlab 
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
                  Left            =   1080
                  TabIndex        =   46
                  Top             =   1440
                  Visible         =   0   'False
                  Width           =   1695
               End
               Begin VB.ComboBox cboStabTimepoint 
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
                  Left            =   1800
                  TabIndex        =   45
                  Top             =   720
                  Visible         =   0   'False
                  Width           =   975
               End
               Begin VB.ComboBox cboStabPullsheet 
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
                  Left            =   1080
                  TabIndex        =   44
                  Top             =   1080
                  Visible         =   0   'False
                  Width           =   1695
               End
               Begin VB.CheckBox chkStabAudit 
                  Caption         =   "Audit"
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
                  Left            =   1080
                  TabIndex        =   43
                  Top             =   720
                  Width           =   975
               End
               Begin VB.TextBox txtStabStudy 
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
                  Left            =   1080
                  TabIndex        =   42
                  Top             =   360
                  Width           =   1695
               End
               Begin MSComCtl2.DTPicker dtpStabEndDate 
                  Height          =   315
                  Left            =   1080
                  TabIndex        =   47
                  Top             =   1800
                  Visible         =   0   'False
                  Width           =   1695
                  _ExtentX        =   2990
                  _ExtentY        =   556
                  _Version        =   393216
                  BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  CheckBox        =   -1  'True
                  DateIsNull      =   -1  'True
                  Format          =   63766529
                  CurrentDate     =   36718
               End
               Begin MSComCtl2.DTPicker dtpStabStartDate 
                  Height          =   315
                  Left            =   1080
                  TabIndex        =   48
                  Top             =   2160
                  Visible         =   0   'False
                  Width           =   1695
                  _ExtentX        =   2990
                  _ExtentY        =   556
                  _Version        =   393216
                  BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  CheckBox        =   -1  'True
                  DateIsNull      =   -1  'True
                  Format          =   63766529
                  CurrentDate     =   36718
               End
               Begin VB.Label lblStabEndDate 
                  Caption         =   "Enddate"
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
                  Left            =   120
                  TabIndex        =   54
                  Top             =   1800
                  Visible         =   0   'False
                  Width           =   855
               End
               Begin VB.Label lblStabStartDate 
                  Caption         =   "Startdate"
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
                  Left            =   120
                  TabIndex        =   53
                  Top             =   1440
                  Visible         =   0   'False
                  Width           =   975
               End
               Begin VB.Label lblStabMainlab 
                  Caption         =   "Mainlab"
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
                  TabIndex        =   52
                  Top             =   1440
                  Visible         =   0   'False
                  Width           =   975
               End
               Begin VB.Label lblStabTimepoint 
                  Caption         =   "Timepoint"
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
                  TabIndex        =   51
                  Top             =   720
                  Visible         =   0   'False
                  Width           =   855
               End
               Begin VB.Label lblStabPullsheet 
                  Caption         =   "Pullsheet"
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
                  TabIndex        =   50
                  Top             =   1080
                  Visible         =   0   'False
                  Width           =   855
               End
               Begin VB.Label lblStabStudy 
                  Caption         =   "Study"
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
                  TabIndex        =   49
                  Top             =   360
                  Width           =   855
               End
            End
            Begin VB.Frame fraStabReport 
               Caption         =   " Select Report "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   2655
               Left            =   0
               TabIndex        =   36
               Top             =   120
               Width           =   2295
               Begin VB.OptionButton optStabForecast 
                  Caption         =   "Forecastlist"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   40
                  Top             =   1440
                  Width           =   1935
               End
               Begin VB.OptionButton optStabStudyreport 
                  Caption         =   "Studyreport"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   39
                  Top             =   360
                  Value           =   -1  'True
                  Width           =   1455
               End
               Begin VB.OptionButton optStabSamplesheet 
                  Caption         =   "Stab Sample Sheet"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   38
                  Top             =   720
                  Width           =   1935
               End
               Begin VB.OptionButton optStabPullsheet 
                  Caption         =   "Pullsheet"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   37
                  Top             =   1080
                  Width           =   1815
               End
            End
         End
      End
      Begin SizerOneLibCtl.ElasticOne elTab 
         Height          =   2820
         Index           =   1
         Left            =   6285
         TabIndex        =   33
         TabStop         =   0   'False
         Top             =   615
         Width           =   5550
         _cx             =   9790
         _cy             =   4974
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   -1  'True
         Appearance      =   4
         MousePointer    =   0
         _ConvInfo       =   1
         Version         =   700
         BackColor       =   -2147483633
         ForeColor       =   -2147483630
         FloodColor      =   6553600
         ForeColorDisabled=   -2147483631
         Caption         =   ""
         Align           =   0
         AutoSizeChildren=   0
         BorderWidth     =   6
         ChildSpacing    =   4
         Splitter        =   0   'False
         FloodDirection  =   0
         FloodPercent    =   0
         CaptionPos      =   1
         WordWrap        =   -1  'True
         MaxChildSize    =   0
         MinChildSize    =   0
         TagWidth        =   0
         TagPosition     =   0
         Style           =   0
         TagSplit        =   2
         PicturePos      =   4
         CaptionStyle    =   0
         ResizeFonts     =   0   'False
         GridRows        =   0
         GridCols        =   0
         Frame           =   3
         FrameStyle      =   0
         FrameWidth      =   1
         FrameColor      =   -2147483628
         FrameShadow     =   -2147483632
         FloodStyle      =   1
         _GridInfo       =   ""
         Begin VB.PictureBox picTabStrip 
            BorderStyle     =   0  'None
            Height          =   3015
            Index           =   2
            Left            =   0
            ScaleHeight     =   3015
            ScaleWidth      =   5535
            TabIndex        =   72
            Top             =   0
            Width           =   5535
            Begin VB.Frame frmStabSamReport 
               Caption         =   " Select Report "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   2655
               Left            =   0
               TabIndex        =   88
               Top             =   120
               Width           =   2295
               Begin VB.OptionButton optStabSamWorksheet 
                  Caption         =   "Stab Worksheet"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   92
                  Top             =   360
                  Value           =   -1  'True
                  Width           =   1455
               End
               Begin VB.OptionButton optStabSamValidationSheet 
                  Caption         =   "Stab Validation Sheet"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   91
                  Top             =   720
                  Width           =   1935
               End
               Begin VB.CommandButton cmdStabStartEU 
                  Caption         =   "Start Crosstab EU"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   90
                  Top             =   1320
                  Width           =   1815
               End
               Begin VB.CommandButton cmdStabStartUS 
                  Caption         =   "Start Crosstab US"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   89
                  Top             =   1800
                  Width           =   1815
               End
            End
            Begin VB.Frame fraStabSamSample 
               Caption         =   " Sample "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   2655
               Left            =   2400
               TabIndex        =   73
               Top             =   120
               Width           =   3015
               Begin VB.CommandButton cmdStabSamUpdate 
                  Caption         =   "Update"
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
                  Left            =   1440
                  TabIndex        =   75
                  Top             =   360
                  Width           =   855
               End
               Begin VB.TextBox txtStabSamSample 
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
                  Left            =   240
                  TabIndex        =   74
                  Top             =   360
                  Width           =   975
               End
               Begin VB.Label lblStabSamProDescShow 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   840
                  TabIndex        =   87
                  Top             =   1320
                  Width           =   2055
                  WordWrap        =   -1  'True
               End
               Begin VB.Label lblStabSamLotShow 
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
                  Left            =   840
                  TabIndex        =   86
                  Top             =   1005
                  Width           =   2055
               End
               Begin VB.Label lblStabSamProDesc 
                  Caption         =   "Product"
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
                  TabIndex        =   85
                  Top             =   1320
                  Width           =   615
               End
               Begin VB.Label lblStabSamLot 
                  Caption         =   "Lot"
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
                  TabIndex        =   84
                  Top             =   1005
                  Width           =   615
               End
               Begin VB.Label lblStabSamItemShow 
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
                  Left            =   840
                  TabIndex        =   83
                  Top             =   720
                  Width           =   2055
               End
               Begin VB.Label lblStabSamItem 
                  Caption         =   "Item"
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
                  TabIndex        =   82
                  Top             =   720
                  Width           =   615
               End
               Begin VB.Label lblStabSamStudy 
                  Caption         =   "Study"
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
                  TabIndex        =   81
                  Top             =   1800
                  Width           =   615
               End
               Begin VB.Label lblStabSamStudyShow 
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
                  Left            =   840
                  TabIndex        =   80
                  Top             =   1800
                  Width           =   1455
               End
               Begin VB.Label lblStabSamPackage 
                  Caption         =   "Package"
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
                  TabIndex        =   79
                  Top             =   2280
                  Width           =   615
               End
               Begin VB.Label lblStabSamPackageShow 
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
                  Left            =   840
                  TabIndex        =   78
                  Top             =   2280
                  Width           =   2055
               End
               Begin VB.Label lblStabSamScStShow 
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
                  Left            =   840
                  TabIndex        =   77
                  Top             =   2040
                  Width           =   2055
               End
               Begin VB.Label lblStabSamScSt 
                  Caption         =   "ST/SC"
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
                  TabIndex        =   76
                  Top             =   2040
                  Width           =   615
               End
            End
         End
      End
      Begin SizerOneLibCtl.ElasticOne elTab 
         Height          =   2820
         Index           =   0
         Left            =   45
         TabIndex        =   15
         TabStop         =   0   'False
         Top             =   615
         Width           =   5550
         _cx             =   9790
         _cy             =   4974
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Enabled         =   -1  'True
         Appearance      =   4
         MousePointer    =   0
         _ConvInfo       =   1
         Version         =   700
         BackColor       =   -2147483633
         ForeColor       =   -2147483630
         FloodColor      =   6553600
         ForeColorDisabled=   -2147483631
         Caption         =   ""
         Align           =   0
         AutoSizeChildren=   0
         BorderWidth     =   6
         ChildSpacing    =   4
         Splitter        =   0   'False
         FloodDirection  =   0
         FloodPercent    =   0
         CaptionPos      =   1
         WordWrap        =   -1  'True
         MaxChildSize    =   0
         MinChildSize    =   0
         TagWidth        =   0
         TagPosition     =   0
         Style           =   0
         TagSplit        =   2
         PicturePos      =   4
         CaptionStyle    =   0
         ResizeFonts     =   0   'False
         GridRows        =   0
         GridCols        =   0
         Frame           =   3
         FrameStyle      =   0
         FrameWidth      =   1
         FrameColor      =   -2147483628
         FrameShadow     =   -2147483632
         FloodStyle      =   1
         _GridInfo       =   ""
         Begin VB.PictureBox picTabStrip 
            BorderStyle     =   0  'None
            Height          =   3015
            Index           =   1
            Left            =   0
            ScaleHeight     =   3015
            ScaleWidth      =   5535
            TabIndex        =   16
            Top             =   0
            Width           =   5535
            Begin VB.Frame fraSinSamRep 
               Caption         =   " Select Report "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   2655
               Left            =   0
               TabIndex        =   28
               Top             =   120
               Width           =   2295
               Begin VB.OptionButton optSinSamWorksheet 
                  Caption         =   "Worksheet"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   32
                  Top             =   360
                  Width           =   1455
               End
               Begin VB.OptionButton optSinSamValidationSheet 
                  Caption         =   "Validation Sheet"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   31
                  Top             =   720
                  Value           =   -1  'True
                  Width           =   1575
               End
               Begin VB.OptionButton optSinSamAnalyticalReport 
                  Caption         =   "Analytical Report"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   30
                  Top             =   1080
                  Width           =   1815
               End
               Begin VB.OptionButton optSinSamSampleSheet 
                  Caption         =   "Sample Sheet"
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Left            =   240
                  TabIndex        =   29
                  Top             =   1440
                  Width           =   1695
               End
            End
            Begin VB.Frame fraSinSamSample 
               Caption         =   " Sample "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   2655
               Left            =   2400
               TabIndex        =   17
               Top             =   120
               Width           =   3015
               Begin VB.TextBox txtSinSamSample 
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
                  Left            =   240
                  TabIndex        =   19
                  Top             =   360
                  Width           =   975
               End
               Begin VB.CommandButton cmdSinSamUpdate 
                  Caption         =   "Update"
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
                  Left            =   1440
                  TabIndex        =   18
                  Top             =   360
                  Width           =   855
               End
               Begin VB.Label lblSinSamItem 
                  Caption         =   "Item"
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
                  TabIndex        =   27
                  Top             =   720
                  Width           =   495
               End
               Begin VB.Label lblSinSamItemShow 
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
                  Left            =   840
                  TabIndex        =   26
                  Top             =   720
                  Width           =   2055
               End
               Begin VB.Label lblSinSamLot 
                  Caption         =   "Lot"
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
                  TabIndex        =   25
                  Top             =   1005
                  Width           =   615
               End
               Begin VB.Label lblSinSamProDesc 
                  Caption         =   "Product"
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
                  TabIndex        =   24
                  Top             =   1320
                  Width           =   615
               End
               Begin VB.Label lblSinSamLotShow 
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
                  Left            =   840
                  TabIndex        =   23
                  Top             =   1005
                  Width           =   2055
               End
               Begin VB.Label lblSinSamProDescShow 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   615
                  Left            =   840
                  TabIndex        =   22
                  Top             =   1320
                  Width           =   2055
               End
               Begin VB.Label lblSinSamStatus 
                  Caption         =   "Status"
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
                  TabIndex        =   21
                  Top             =   1920
                  Width           =   615
               End
               Begin VB.Label lblSinSamStatusShow 
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
                  Left            =   840
                  TabIndex        =   20
                  Top             =   1920
                  Width           =   2055
               End
            End
         End
      End
   End
   Begin LmssysxLib.LMSSYSX lmsSystem 
      Left            =   6525
      Top             =   6705
      _Version        =   65537
      _ExtentX        =   582
      _ExtentY        =   635
      _StockProps     =   0
      SpecLibrary     =   "PDBA"
      SpecVersion     =   "STD"
      LogonMode       =   1
      AppName         =   "ChemLMS"
   End
   Begin VB.Timer timMain 
      Interval        =   60000
      Left            =   4500
      Top             =   6615
   End
   Begin VB.Frame fraMode 
      Height          =   495
      Left            =   120
      TabIndex        =   10
      Top             =   5880
      Width           =   3855
      Begin VB.OptionButton optUserMode 
         Caption         =   "User Mo&de"
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
         Left            =   2040
         TabIndex        =   12
         Top             =   160
         Value           =   -1  'True
         Width           =   1455
      End
      Begin VB.OptionButton optGroupMode 
         Caption         =   "Group Mode"
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
         Left            =   240
         TabIndex        =   11
         Top             =   160
         Width           =   1575
      End
   End
   Begin VB.Frame frmStatus 
      Caption         =   "Status"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   4080
      TabIndex        =   7
      Top             =   4560
      Width           =   5535
      Begin VB.TextBox txtStatus 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Top             =   240
         Width           =   5295
      End
   End
   Begin VB.Frame frmPrinter 
      Caption         =   "Select Printer"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4080
      TabIndex        =   3
      Top             =   3840
      Width           =   5535
      Begin VB.ComboBox cboPrinter 
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
         ItemData        =   "frmMain.frx":09C2
         Left            =   3480
         List            =   "frmMain.frx":09C4
         TabIndex        =   6
         Top             =   240
         Width           =   1815
      End
      Begin VB.OptionButton optPrinter 
         Caption         =   "Printer"
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
         Left            =   2520
         TabIndex        =   5
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton optMainlab 
         Caption         =   "Mainlab"
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
         TabIndex        =   4
         Top             =   240
         Width           =   2175
      End
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
      Height          =   375
      Left            =   8280
      TabIndex        =   2
      Top             =   6000
      Width           =   1335
   End
   Begin VB.CommandButton cmdQuit 
      Caption         =   "&Quit"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6840
      TabIndex        =   1
      ToolTipText     =   "Exit BALI Printery"
      Top             =   6000
      Width           =   1335
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "&Start"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5280
      TabIndex        =   0
      ToolTipText     =   "Start the generation of report/lable"
      Top             =   6000
      Width           =   1335
   End
   Begin ComctlLib.StatusBar staBar 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   13
      Top             =   7245
      Width           =   10200
      _ExtentX        =   17992
      _ExtentY        =   450
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   4
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Style           =   6
            AutoSize        =   2
            Object.Width           =   1482
            MinWidth        =   776
            TextSave        =   "3/16/2004"
            Key             =   ""
            Object.Tag             =   ""
            Object.ToolTipText     =   "Date"
         EndProperty
         BeginProperty Panel2 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Style           =   5
            AutoSize        =   2
            Object.Width           =   1191
            MinWidth        =   776
            TextSave        =   "4:48 PM"
            Key             =   ""
            Object.Tag             =   ""
            Object.ToolTipText     =   "Time"
         EndProperty
         BeginProperty Panel3 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   2
            TextSave        =   ""
            Key             =   ""
            Object.Tag             =   ""
            Object.ToolTipText     =   "Limit of server reports "
         EndProperty
         BeginProperty Panel4 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   1
            Object.Width           =   12647
            TextSave        =   ""
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ComctlLib.TreeView treFolder 
      Height          =   5655
      Left            =   120
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   240
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   9975
      _Version        =   327682
      Indentation     =   353
      LabelEdit       =   1
      Style           =   5
      ImageList       =   "imgList"
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ComctlLib.ImageList imgList 
      Left            =   7785
      Top             =   6615
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   11
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":09C6
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":0AD8
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":0BEA
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":0CFC
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":0E0E
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":0F20
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":1032
            Key             =   "samptype.bmp"
         EndProperty
         BeginProperty ListImage8 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":12C4
            Key             =   "sample.ico"
         EndProperty
         BeginProperty ListImage9 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":15DE
            Key             =   "login.bmp"
         EndProperty
         BeginProperty ListImage10 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":1870
            Key             =   "dll.bmp"
         EndProperty
         BeginProperty ListImage11 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "frmMain.frx":1B02
            Key             =   "sample.bmp"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private intSinSamReport As Integer  'selected report in tab Single Sample
Private intStabSamReport As Integer 'selected report in tab Stability Sample
Private intStabReport As Integer    'selected report in tab Stability
Private intConf As Integer          'selected report in tab Configuration
Private intLabelReport As Integer   'selected report in tab Label

Private intNodeClick As Object      'stores the clicked node
Private intNodeExpanded As Boolean  'stores the clicked node

Private Declare Function SendMessage Lib "user32" Alias _
        "SendMessageA" (ByVal hwnd As Long, ByVal wMsg _
        As Long, ByVal wParam As Long, lParam As Any) _
        As Long
 
Const LB_SETHORIZONTAL = &H194
 
'CSEH: ErrBaliDebug
Private Sub cboConfPSLToSpecLibrary_Click()
'<EhHeader>
On Error GoTo cboConfPSLToSpecLibrary_Click_Err
g_Debug.SendOutPut dbgCTrace, "Entered: cboConfPSLToSpecLibrary_Click"
'</EhHeader>
Dim aryPSL() As String
Dim lngCounter As Long

' read all PSL's for this Library
aryPSL = getPSLforLibrary(cboConfPSLToSpecLibrary.Text)

' add all Values to list
With lstConfPSLToSpecPSLName
    .Visible = False
    .Clear
    For lngCounter = 0 To UBound(aryPSL) - 1
        .AddItem aryPSL(lngCounter)
    Next
    .Visible = True
End With


' code for display the scrollbar
' see http://www.activevb.de/tipps/vb6tipps/tipp0076.html
' Thanks !
Dim X&, Max&, Akt&, Result&, cForm As Form
Set cForm = Me
Set cForm.Font = lstConfPSLToSpecPSLName.Font

For X = 0 To lstConfPSLToSpecPSLName.ListCount - 1
  Akt = cForm.TextWidth(lstConfPSLToSpecPSLName.List(X))
  If Akt > Max Then Max = Akt
Next

Max = Max \ Screen.TwipsPerPixelX
Result = SendMessage(lstConfPSLToSpecPSLName.hwnd, LB_SETHORIZONTAL, _
                     Max, ByVal 0)

Set cForm = Nothing


'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : cboConfPSLToSpecLibrary_Click"
Exit Sub

cboConfPSLToSpecLibrary_Click_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmMain.cboConfPSLToSpecLibrary_Click"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmMain.cboConfPSLToSpecLibrary_Click ", , "Error"
     Resume Next
'</EhFooter>
End Sub

Private Sub cboPrinter_Change()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       cboPrinter_Change
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       04.07.01 15:46:15
' Parameters :
' Description:       Set the option button if the user select a printer
'--------------------------------------------------------------------------------
'</CSCM>
    
    optPrinter = True
End Sub

Private Sub cboPrinter_DblClick()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       cboPrinter_DblClick
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       04.07.01 15:54:49
' Parameters :
' Description:       Show the form to change the default printer
'--------------------------------------------------------------------------------
'</CSCM>
'<Modified by: Klaus Zinsmeister at 14.05.2003-08:39:26 on machine: BALI_ZI>
' Remove possibilty to send mails, just show a mesage box
'</Modified by: Klaus Zinsmeister at 14.05.2003-08:39:26 on machine: BALI_ZI>

Dim strMsg As String

strMsg = "To change your default printer please send a E-Mail"
strMsg = strMsg & vbCrLf
strMsg = strMsg & "to BALI Helpdesk with the name of the printer"
strMsg = strMsg & vbCrLf
strMsg = strMsg & "you want to have as default printer."
strMsg = strMsg & vbCrLf

MsgBox strMsg, vbInformation + vbOKOnly, "Change Default Printer"

End Sub

Private Sub cmdCertUpdate_Click()
' update the Sampleinformation
If txtCertSample = "" Then
    AddStatusMessage ("No sample selected!")
    Exit Sub
Else
    Call UpdateInfo(txtCertSample)
End If
End Sub

'CSEH: ErrBaliDebug
Private Sub cmdCertValues_Click()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  cmdCertValues_Click
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  03.03.2003
' Parameters :
' Description:  Call form to enter CoA Parameters
'               First do some checks if the sample is in correct state
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo cmdCertValues_Click_Err
g_Debug.SendOutPut dbgCTrace, "Entered: cmdCertValues_Click"
'</EhHeader>
Dim strApproval As String

' check for Samplename
If txtCertSample = "" Then
    AddStatusMessage ("No sample selected!")
    Exit Sub
End If

' check for changed samplename
If gSelectedSample <> txtCertSample Then
    cmdCertUpdate_Click
End If

' check for testsamples with ULI 12
If Left$(gSelectedSample, 2) <> "12" Then
    ' check if Sample is "Released"
    strApproval = getApproval(gSelectedSample)
    If strApproval <> APPROVALSTRING Then
        If strApproval = "" Then
            strApproval = "<EMPTY>"
        End If
        AddStatusMessage ("ERROR: Sample not released ! Approval is = " & strApproval)
        Exit Sub
    End If
    ' check for Samplestatus
    If lblcertStatusShow = "Approved" Or lblcertStatusShow = "Archived" Then
        frmCert.Show vbModal, Me
    Else
        AddStatusMessage ("ERROR: Samplestatus is " & lblcertStatusShow)
    End If
Else
    ' we have a testsample
    ' for these samples CoA are allowed prior the status approved
    frmCert.Show vbModal, Me
End If

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : cmdCertValues_Click"
Exit Sub

cmdCertValues_Click_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmMain.cmdCertValues_Click"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmMain.cmdCertValues_Click ", , "Error"
     Resume Next
'</EhFooter>
End Sub

Private Sub cmdConfProductCode_Click()
' exit if Sampletype is empty
    If cboConfSampletype = "" Then
        MsgBox "No SampleType selected.", 48, "Missing data"
        Exit Sub
    End If
'set flag to ProductCode (=1)
gSearch = 1

frmSelect.Show vbModal


End Sub

Private Sub cmdConfSpecification_Click()
Dim intCounter As Integer
'set flag to Specification (=2)
gSearch = 2

frmSelect.Show vbModal
' after selecting the specification we need to update the revisions
' get SpecRev if a spec was found
If txtConfSpecification <> "" Then
   getAllSpecRev (txtConfSpecification)
   ' fill ComboBox
   cboConfSpecRev.Clear
   For intCounter = 0 To MAX_SPECREV
       If gSpecRev(intCounter, 0) = "" Then
           Exit For
       Else
           cboConfSpecRev.AddItem gSpecRev(intCounter, 0), gSpecRev(intCounter, 1)
           ' select the item
           cboConfSpecRev.Text = cboConfSpecRev.List(cboConfSpecRev.ListCount - 1)
       End If
   Next intCounter
End If

End Sub

'CSEH: ErrBaliDebug
Private Sub cmdHelp_Click()
' starting helpfile
'<EhHeader>
On Error GoTo cmdHelp_Click_Err
g_Debug.SendOutPut dbgCTrace, "Entered: cmdHelp_Click"
'</EhHeader>

SendKeys "{F1}"
    
        
'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : cmdHelp_Click"
Exit Sub

cmdHelp_Click_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmMain.cmdHelp_Click"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmMain.cmdHelp_Click ", , "Error"
     Resume Next
'</EhFooter>
End Sub

Private Sub cmdLabelSetValue_Click()

' show form to enter the values for the label
frmLabel.Show vbModal, Me
End Sub

Private Sub cmdLabelUpdate_Click()
' update the Sampleinformation

If txtLabelSample = "" Then
    AddStatusMessage ("No sample selected!")
    Exit Sub
Else
    Call UpdateInfo(txtLabelSample)
End If
End Sub

Private Sub cmdQuit_Click()
Unload frmMain
End Sub

Private Sub cmdSinSamUpdate_Click()
' update the Sampleinformation
If txtSinSamSample = "" Then
    AddStatusMessage ("No sample selected!")
    Exit Sub
Else
    Call UpdateInfo(txtSinSamSample)
End If
End Sub

Private Sub cmdStabSamUpdate_Click()
' update the Sampleinformation
If txtStabSamSample = "" Then
    AddStatusMessage ("No sample selected!")
    Exit Sub
Else
    Call UpdateInfo(txtStabSamSample)
End If
End Sub

'CSEH: ErrBaliDebug
Private Sub cmdStabStartEU_Click()
' start external program CrossTab with runstring
'<EhHeader>
On Error GoTo cmdStabStartEU_Click_Err
g_Debug.SendOutPut dbgCTrace, "Entered: cmdStabStartEU_Click"
'</EhHeader>
Dim strCommand As String

If lblStabSamStudyShow = "" Then
    AddStatusMessage "No Study selected !"
    Exit Sub
End If

strCommand = PATH_CROSSTAB_EU & gDataSource & " " & gUserID & " " & gPassWD & " " & lblStabSamStudyShow

Shell strCommand, vbMinimizedNoFocus

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : cmdStabStartEU_Click"
Exit Sub

cmdStabStartEU_Click_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmMain.cmdStabStartEU_Click ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmMain.cmdStabStartEU_Click"
     Resume Next
'</EhFooter>
End Sub

'CSEH: ErrBaliDebug
Private Sub cmdStabStartUS_Click()
' start external program CrossTab with runstring
'<EhHeader>
On Error GoTo cmdStabStartUS_Click_Err
g_Debug.SendOutPut dbgCTrace, "Entered: cmdStabStartUS_Click"
'</EhHeader>
Dim strCommand As String

If lblStabSamStudyShow = "" Then
    AddStatusMessage "No Study selected !"
    Exit Sub
End If

strCommand = PATH_CROSSTAB_US & gDataSource & " " & gUserID & " " & gPassWD & " " & lblStabSamStudyShow

Shell strCommand, vbMinimizedNoFocus

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : cmdStabStartUS_Click"
Exit Sub

cmdStabStartUS_Click_Err:
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmMain.cmdStabStartUS_Click ", , "Error"
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmMain.cmdStabStartUS_Click"
     Resume Next
'</EhFooter>
End Sub

Private Sub cmdStart_Click()
' main sub to print the report
Dim MacroName As String
Dim lPrinter As String ' stores the selected Printer (Mainlab?)
Dim lStatus As String
Dim strTempSpecRev As String
Dim intCounterSpecRev As Integer
Dim intCounter As Integer       ' for loops
Dim datTempStartDate As Date
Dim datTempEndDate As Date

' validate printername
' check if printer is selected
' check only if not the Tab "Label" is selected

If tabReport.CurrTab <> 4 Then
    If optPrinter = True Then
        If cboPrinter.ListIndex >= 0 Then
            lPrinter = gPrinterList(cboPrinter.ListIndex, 1)
        Else
            AddStatusMessage ("Error: No Printer selected")
            Exit Sub
        End If
    ElseIf optMainlab = True Then
        ' check if Mainlabprinter is valid (some samples have the value NONE)
        For intCounter = 0 To MAX_PRINTER
            If gPrinterList(intCounter, 0) = "" Then Exit For
            If gPrinterList(intCounter, 0) = gMainlabPrinter Then
                lPrinter = gPrinterList(intCounter, 1)
            End If
        Next intCounter
        If lPrinter = "" Then
            ' we couldn't find a valid Printername, bail and exit
            AddStatusMessage ("Error: No Printer selected")
            Exit Sub
        End If
    End If
End If

Select Case tabReport.CurrTab
    Case 0 ' Single Sample
        ' --> validate samplename
        ' check if samplename is entered
        If txtSinSamSample = "" Then
            AddStatusMessage ("No sample selected !")
            Exit Sub
        ElseIf gSelectedSample <> txtSinSamSample Then
            cmdSinSamUpdate_Click
        End If
        ' check if samplename changed since the last update
        If gSelectedSample = txtSinSamSample Then
        Select Case intSinSamReport
            Case 1 'worksheet selected
                MacroName = BuildMacroString(MACRO_NAME_1, "rowsbasel", lPrinter, txtSinSamSample)
                AddStatusMessage ("Printing Worksheet on " & lPrinter & " for sample " & txtSinSamSample)
                If saveLogEntry("rowsbasel", lPrinter, txtSinSamSample) = True Then
                    If StartMacro(MacroName, 1) = True Then
                        AddStatusMessage ("Report successfully queued. Report will be printed soon.")
                    End If
                End If
            Case 2 'Validation Sheet selected
                MacroName = BuildMacroString(MACRO_NAME_1, "rovalsheet", lPrinter, txtSinSamSample)
                AddStatusMessage ("Printing Validationsheet on " & lPrinter & " for sample " & txtSinSamSample)
                If saveLogEntry("rovalsheet", lPrinter, txtSinSamSample) = True Then
                    If StartMacro(MacroName, 1) = True Then
                        AddStatusMessage ("Report successfully queued. Report will be printed soon.")
                    End If
                End If
            Case 3 'Analytical Report selected
                ' check status of sample
                If lblSinSamStatusShow = "Approved" Or lblSinSamStatusShow = "Archived" Then
                    MacroName = BuildMacroString(MACRO_NAME_1, "roanbasel", lPrinter, txtSinSamSample)
                    If saveLogEntry("roanbasel", lPrinter, txtSinSamSample) = True Then
                        If StartMacro(MacroName) = True Then
                            AddStatusMessage ("Report successfully printed !")
                        End If
                    End If
                Else
                AddStatusMessage ("ERROR: Samplestatus is " & lblSinSamStatusShow)
                End If
            Case 4 'Sample Sheet selected
                MacroName = BuildMacroString(MACRO_NAME_1, "SingleSampleSheet", lPrinter, txtSinSamSample)
                AddStatusMessage ("Printing Samplesheet on " & lPrinter & " for sample " & txtSinSamSample)
                If saveLogEntry("SingleSampleSheet", lPrinter, txtSinSamSample) = True Then
                    If StartMacro(MacroName) = True Then
                        AddStatusMessage ("Report successfully printed !")
                    End If
                End If
        End Select
        End If
    Case 1 ' Stability Sample
        ' --> validate samplename
         ' check if samplename is entered
        If txtSinSamSample = "" Then
            AddStatusMessage ("No sample selected !")
            Exit Sub
        ElseIf gSelectedSample <> txtStabSamSample Then
            cmdSinSamUpdate_Click
        End If
        ' check if samplename changed since the last update
        If gSelectedSample = txtStabSamSample Then
        Select Case intStabSamReport
            Case 1 'worksheet selected
                MacroName = BuildMacroString(MACRO_NAME_1, "rowsheetstab", lPrinter, txtStabSamSample)
                AddStatusMessage ("Printing Worksheet on " & lPrinter & " for sample " & txtStabSamSample)
                If saveLogEntry("rowsheetstab", lPrinter, txtStabSamSample) = True Then
                    If StartMacro(MacroName, 1) = True Then
                        AddStatusMessage ("Report successfully queued. Report will be printed soon.")
                    End If
                End If
            Case 2 'Validation Sheet selected
                MacroName = BuildMacroString(MACRO_NAME_1, "rovalsheetstab", lPrinter, txtStabSamSample)
                AddStatusMessage ("Printing Validationsheet on " & lPrinter & " for sample " & txtStabSamSample)
                If saveLogEntry("rovalsheetstab", lPrinter, txtStabSamSample) = True Then
                    If StartMacro(MacroName, 1) = True Then
                        AddStatusMessage ("Report successfully queued. Report will be printed soon.")
                    End If
                End If
        End Select
        End If
    Case 2 ' Stability
        Select Case intStabReport
            Case 1 'Studyreport selected
                ' check if Study is selected
                If txtStabStudy <> "" Then
                    ' check if study exists
                    If checkStudyNo(txtStabStudy) >= 1 Then
                        MacroName = BuildMacroString(MACRO_NAME_1, "studyreport", lPrinter, txtStabStudy, chkStabAudit)
                        ' update status field
                        '*************************
                        AddStatusMessage ("Printing Studyreport on " & lPrinter & " for " & txtStabStudy & " Please wait ..... ")
                        If saveLogEntry("studyreport", lPrinter, txtStabStudy, chkStabAudit) = True Then
                            If StartMacro(MacroName, 2) = True Then
                                AddStatusMessage ("Report successfully queued. Report will be printed soon.")
                            End If
                        End If
                    Else
                        AddStatusMessage ("ERROR: Study does not exist! Please enter a valid Studynumber")
                    End If
                Else
                    AddStatusMessage ("ERROR: Study not selected ! Please enter a Studynumber")
                End If
            Case 2 'Stab Sample Sheet selected
                MacroName = BuildMacroString(MACRO_NAME_1, "stabsamplesheet", lPrinter, txtStabStudy, cboStabTimepoint)
                AddStatusMessage ("Printing Stabilitysamplesheet on " & lPrinter & " for " & txtStabStudy & " Please wait ..... ")
                If saveLogEntry("stabsamplesheet", lPrinter, txtStabStudy, cboStabTimepoint) = True Then
                    If StartMacro(MacroName) = True Then
                        AddStatusMessage ("Report successfully printed !")
                    End If
                End If
            Case 3 'Pullsheet selected
                ' check if a valid pullsheet is selected
                If cboStabPullsheet = "" Then
                    AddStatusMessage ("ERROR: No Pullsheet selected")
                    Exit Sub
                End If
                ' check for valid date
                If dtpStabStartDate >= dtpStabEndDate Then
                    AddStatusMessage "Startdate is greater or equal as Enddate , please check your entries !"
                    Exit Sub
                End If
                ' replace empty date values
                If IsNull(dtpStabStartDate) Then
                    datTempStartDate = DateAdd("d", -180, Date)
                Else
                    datTempStartDate = dtpStabStartDate
                End If
                If IsNull(dtpStabEndDate) Then
                    datTempEndDate = DateAdd("d", 180, Date)
                Else
                    datTempEndDate = dtpStabEndDate
                End If
                MacroName = BuildMacroString(MACRO_NAME_1, "Pullsheet", lPrinter, Format$(datTempStartDate, "YYYY-MM-DD"), Format$(datTempEndDate, "YYYY-MM-DD"), cboStabPullsheet)
                AddStatusMessage ("Printing Pullsheet " & cboStabPullsheet & " on " & lPrinter & " Please wait ..... ")
                If saveLogEntry("Pullsheet", lPrinter, Format(datTempStartDate, "YYYY-MM-DD"), Format$(datTempEndDate, "YYYY-MM-DD"), cboStabPullsheet) = True Then
                    If StartMacro(MacroName) = True Then
                        AddStatusMessage ("Report successfully printed !")
                    End If
                End If
            Case 4 'Forecastlist selected
                ' check if the dates are correct
                If IsNull(dtpStabStartDate) Or IsNull(dtpStabEndDate) Then
                    AddStatusMessage "Date is missing, please check your entries !"
                    Exit Sub
                ElseIf dtpStabStartDate >= dtpStabEndDate Then
                    AddStatusMessage "Startdate is greater or equal as Enddate , please check your entries !"
                    Exit Sub
                End If
                ' check if Department is empty
                If cboStabMainlab = "" Then
                    ' Loop all Departments and generated for each a report
                    For intCounter = 1 To MAX_STABMAINLAB
                        If gStabMainlabs(intCounter) = "" Then Exit For    'stop if no more Departments
                        MacroName = BuildMacroString(MACRO_NAME_1, "Pullforecastlist", lPrinter, Format(dtpStabStartDate, "YYYY-MM-DD"), Format(dtpStabEndDate, "YYYY-MM-DD"), gStabMainlabs(intCounter))
                        AddStatusMessage ("Printing Pullforecastlist on " & lPrinter & " for " & gStabMainlabs(intCounter) & " Please wait ..... ")
                        If saveLogEntry("Pullforecastlist", lPrinter, Format(dtpStabStartDate, "YYYY-MM-DD"), Format(dtpStabEndDate, "YYYY-MM-DD"), gStabMainlabs(intCounter)) = True Then
                            If StartMacro(MacroName) = True Then
                                AddStatusMessage ("Report successfully printed !")
                            End If
                        End If
                    Next intCounter
                Else
                    ' print only the selected Department
                    MacroName = BuildMacroString(MACRO_NAME_1, "Pullforecastlist", lPrinter, Format(dtpStabStartDate, "YYYY-MM-DD"), Format(dtpStabEndDate, "YYYY-MM-DD"), cboStabMainlab)
                    AddStatusMessage ("Printing Pullforecastlist on " & lPrinter & " for " & cboStabMainlab & " Please wait ..... ")
                    If saveLogEntry("Pullforecastlist", lPrinter, Format(dtpStabStartDate, "YYYY-MM-DD"), Format(dtpStabEndDate, "YYYY-MM-DD"), cboStabMainlab) = True Then
                        If StartMacro(MacroName) = True Then
                            AddStatusMessage ("Report successfully printed !")
                        End If
                    End If
                End If
            End Select
    Case 3 ' Configuration
        Select Case intConf
            Case 1  'Loginkonfiguration selected
                MacroName = BuildMacroString(MACRO_NAME_1, "LoginConfiguration", lPrinter, cboConfSampletype, txtConfProductCode)
                AddStatusMessage ("Printing Loginconfiguration on " & lPrinter & " please wait ...")
                If saveLogEntry("LoginConfiguration", lPrinter, cboConfSampletype, txtConfProductCode) = True Then
                    If StartMacro(MacroName) = True Then
                        AddStatusMessage ("Report successfully printed !")
                    End If
                End If
            Case 2 'Specification selected
                ' check for valid entrys
                If txtConfSpecification.Text = "" Or cboConfSpecRev.Text = "" Then
                    AddStatusMessage ("Error: No Specification or Revision selected !")
                    Exit Sub
                End If
                ' get SpecRev from Combobox
                For intCounterSpecRev = 1 To Len(cboConfSpecRev)
                    If Mid$(cboConfSpecRev, intCounterSpecRev, 1) <> " " Then
                        strTempSpecRev = strTempSpecRev & Mid$(cboConfSpecRev, intCounterSpecRev, 1)
                    Else
                        Exit For
                    End If
                Next intCounterSpecRev
                MacroName = BuildMacroString(MACRO_NAME_1, "Specifikation", lPrinter, txtConfSpecification, strTempSpecRev)
                AddStatusMessage ("Printing Specification " & txtConfSpecification & " on " & lPrinter & " please wait ...")
                If saveLogEntry("Specifikation", lPrinter, txtConfSpecification, strTempSpecRev) = True Then
                    If StartMacro(MacroName) = True Then
                        AddStatusMessage ("Report successfully printed !")
                    End If
                End If
            Case 3 'PSL in Spec
                ' check for valid entrys
                If cboConfPSLToSpecLibrary.Text = "" Then
                    AddStatusMessage ("Error: No Library selected !")
                    Exit Sub
                End If
                If lstConfPSLToSpecPSLName.Text = "" Then
                    AddStatusMessage ("Error: No PSL selected !")
                    Exit Sub
                End If
                If cboConfPSLToSpecRevision.Text = "" Then
                    AddStatusMessage ("Error: No Revision selected !")
                    Exit Sub
                End If
                MacroName = BuildMacroString(MACRO_NAME_1, "PSL_Spec", lPrinter, lstConfPSLToSpecPSLName, cboConfPSLToSpecLibrary, cboConfPSLToSpecRevision)
                AddStatusMessage ("Printing PSL in Spec on " & lPrinter & " please wait ...")
                If saveLogEntry("PSL_Spec", lPrinter, lstConfPSLToSpecPSLName, cboConfPSLToSpecLibrary, cboConfPSLToSpecRevision) = True Then
                    If StartMacro(MacroName) = True Then
                        AddStatusMessage ("Report successfully printed !")
                    End If
                End If
            
            Case 4 ' Spec Login
                ' check for valid entrys
                If txtConfSpecification.Text = "" Then
                    AddStatusMessage ("Error: No Specification selected !")
                    Exit Sub
                End If
                MacroName = BuildMacroString(MACRO_NAME_1, "Spec_Login", lPrinter, txtConfSpecification)
                AddStatusMessage ("Printing Specification in Login Configuration on " & lPrinter & " please wait ...")
                If saveLogEntry("Spec_Login", lPrinter, txtConfSpecification) = True Then
                    If StartMacro(MacroName) = True Then
                        AddStatusMessage ("Report successfully printed !")
                    End If
                End If
        End Select
    Case 4 ' Label
        ' check if a sample is selected
        If txtLabelSample = "" Then
            AddStatusMessage ("No sample selected !")
            Exit Sub
        End If
        Select Case intLabelReport
            Case 1 ' normal labels
            For intCounter = 0 To MAX_LABELENTRY
                If gLabelEntry(intCounter, 0) <> "" Then
                    MacroName = BuildMacroString(MACRO_NAME_1, "LabelNormal", CStr(gLabelEntry(intCounter, 1)), _
                                                txtLabelSample, gLabelEntry(intCounter, 0), gLabelEntry(intCounter, 2))
                    If saveLogEntry("LabelNormal", CStr(gLabelEntry(intCounter, 1)), txtLabelSample, gLabelEntry(intCounter, 0), gLabelEntry(intCounter, 2)) = True Then
                        If StartMacro(MacroName) = True Then
                            AddStatusMessage ("Labels successfully printed on " & gLabelEntry(intCounter, 1)) & " for Lab " & gLabelEntry(intCounter, 0)
                        End If
                    End If
                Else
                    Exit For
                End If
            Next intCounter
            Case 2 ' stability labels
            For intCounter = 0 To MAX_LABELENTRY
                If gLabelEntry(intCounter, 0) <> "" Then
                    MacroName = BuildMacroString(MACRO_NAME_1, "LabelStabBig", CStr(gLabelEntry(intCounter, 1)), _
                                                txtLabelSample, gLabelEntry(intCounter, 0), gLabelEntry(intCounter, 2))
                    If saveLogEntry("LabelStabBig", CStr(gLabelEntry(intCounter, 1)), txtLabelSample, gLabelEntry(intCounter, 0), gLabelEntry(intCounter, 2)) = True Then
                        If StartMacro(MacroName) = True Then
                            AddStatusMessage ("Labels successfully printed on " & gLabelEntry(intCounter, 1)) & " for Lab " & gLabelEntry(intCounter, 0)
                        End If
                    End If
                Else
                    Exit For
                End If
            Next intCounter
            Case 3 ' development labels
            For intCounter = 0 To MAX_LABELENTRY
                If gLabelEntry(intCounter, 0) <> "" Then
                    MacroName = BuildMacroString(MACRO_NAME_1, "LabelDevelopment", CStr(gLabelEntry(intCounter, 1)), _
                                                txtLabelSample, gLabelEntry(intCounter, 0), gLabelEntry(intCounter, 2))
                    If saveLogEntry("LabelDevelopment", CStr(gLabelEntry(intCounter, 1)), txtLabelSample, gLabelEntry(intCounter, 0), gLabelEntry(intCounter, 2)) = True Then
                        If StartMacro(MacroName) = True Then
                            AddStatusMessage ("Labels successfully printed on " & gLabelEntry(intCounter, 1)) & " for Lab " & gLabelEntry(intCounter, 0)
                        End If
                    End If
                Else
                    Exit For
                End If
            Next intCounter
        End Select
    Case 5  ' Certificate
        ' check if a sample is selected
        If txtLabelSample = "" Then
            AddStatusMessage ("No sample selected !")
            Exit Sub
        End If
        ' check if samplename changed since the last update
        If gSelectedSample = txtCertSample Then
            ' check if parameter values are filled in
            If gCoAValuesSet = False Then
                AddStatusMessage ("Please define the values for the CoA first.")
                Exit Sub
            End If
            ' here we need to write the logentry first because the sequence number is
            ' used for the report to find his parameters. After saving the log entry
            ' our global CoA Variable has the sequence number of the row in the log table
            ' the report use this number to retrieve the values for the CoA
            ' Translate selected CoA to String
            frmMain.MousePointer = 11
            If saveLogEntry("local_coa", lPrinter, gSelectedSample, gCoASelected) = True Then
                MacroName = BuildMacroString(MACRO_NAME_1, "local_coa", lPrinter, gSelectedSample, gCoASelected, gCoAParameter.ID)
                If StartMacro(MacroName) = True Then
                    AddStatusMessage ("CoA successfully printed on " & lPrinter)
                End If
            End If
            frmMain.MousePointer = 0
        Else
            AddStatusMessage ("Please fill the parameters for the CoA first.")
        End If

End Select
    

End Sub

Private Sub Form_Load()
' loading Main form
'*************************

Dim bolRet As Boolean           ' saves the return code
Dim UserID                  ' String for UserID
Dim aryCommandLine() As Variant
Dim strSQL As String
Dim lngSQLRtn As Long
Dim dtaExpiry As Date
Dim bolQCClient As Boolean  ' flag if we are started from QC-Client

' initialyze Debugging Object
initDebug
' now we have the debug object and error handling can start
    
    '<EhHeader>
    On Error GoTo Form_Load_Err
    g_Debug.SendOutPut dbgCTrace, "Enter: Form_Load"
    '</EhHeader>

Me.MousePointer = vbHourglass

' show the splash form for the user
    frmLoad.Show vbNormal, Me
    frmLoad.prbStatus.Max = 12
    DoEvents

' check for command line
aryCommandLine = GetCommandLine()
Select Case UBound(aryCommandLine())
    Case 0
        ' no runtime parameters, just open chemlms
        bolRet = openChemLMS(0)
    Case 1
        ' only one ..must be debug
        If aryCommandLine(1) = "debug" Then
            startDebug
        End If
        ' open ChemLMS
        bolRet = openChemLMS(0)
    Case 6
        ' started from QC-Client
        bolRet = openChemLMS(1, CStr(aryCommandLine(1)), CStr(aryCommandLine(2)), CStr(aryCommandLine(3)), CStr(aryCommandLine(4)), CStr(aryCommandLine(5)), CStr(aryCommandLine(6)))
        bolQCClient = True
    Case 7
        ' started from QC-Client with debug
        If aryCommandLine(1) = "debug" Then
            startDebug
        End If
        ' started from QC-Client
        bolRet = openChemLMS(1, CStr(aryCommandLine(2)), CStr(aryCommandLine(3)), CStr(aryCommandLine(4)), CStr(aryCommandLine(5)), CStr(aryCommandLine(6)), CStr(aryCommandLine(7)))
        bolQCClient = True
    Case Else
        MsgBox "Wrong number of arguments!", vbCritical, "Wrong numer of Arguments"
        'exit
        GoTo Form_Load_Quit
End Select

' check for errors
If bolRet = False Then
    MsgBox "Unable to connect", vbCritical, "Connection Error"
    Unload frmLoad
    GoTo Form_Load_Quit
End If

' set a global variable for the SystemOCX so we can call
' it from everywhere
Set gSystemOCX = lmsSystem

' Open a connection and set a global variable for this connection
gDataSource = gSystemOCX.Database          ' get Databasename
gUserID = gSystemOCX.User                 ' get UserID
gPassWD = gSystemOCX.GetPassword(gUserID)  ' get UserPasswort
Set gBALIConn = rdoEnvironments(0).OpenConnection(gDataSource, rdDriverNoPrompt, False, "UID=" & gUserID & ";PWD=" & gPassWD)

' check for Error during open
If Err <> 0 Then
    MsgBox "Unable to connect", 16, "Connection Error"
    Unload frmLoad
    Unload frmMain
End If
    
' check when account expires - only when started standalone
If bolQCClient = False Then
    dtaExpiry = checkAccount(lmsSystem.User)
    If DateDiff("d", Now(), dtaExpiry) <= 14 Then
        MsgBox "Your LMS-Password will expire in " & DateDiff("d", Now(), dtaExpiry) & " day(s).", vbInformation + vbOKOnly, "Password will expire"
    End If
End If
    
' set helpfiel
App.HelpFile = App.Path & "\BALIPrintery.hlp"

' do the rest
Call InitForm
    
frmMain.MousePointer = 0
Unload frmLoad
GoTo Form_Load_Exit
    
Form_Load_Quit:
    frmMain.MousePointer = 0
    gExit = True
    Exit Sub

Form_Load_Exit:
    '<EhFooter>
    frmMain.MousePointer = 0
    g_Debug.SendOutPut dbgCTrace, "Exit : Form_Load"
    Exit Sub

Form_Load_Err:
    g_Debug.SendOutPut dbgCError, Err.Description, "Printery.frmMain.Form_Load", Erl
    Resume Next
    '</EhFooter>
End Sub


Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next

gSystemOCX.Disconnect
Set gSystemOCX = Nothing
' destroy error object
Set g_Debug = Nothing

End Sub

'CSEH: ErrBaliDebug
Private Sub lstConfPSLToSpecPSLName_Click()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  lstConfPSLToSpecPSLName_Click
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  20.01.2003
' Parameters :
' Description:  Update Combobox with Revisions of this PSL
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo lstConfPSLToSpecPSLName_Click_Err
g_Debug.SendOutPut dbgCTrace, "Entered: lstConfPSLToSpecPSLName_Click"
'</EhHeader>

Dim aryRevisions() As String
Dim intCounter As Integer

aryRevisions = getRevisionForPSL(lstConfPSLToSpecPSLName.Text, cboConfPSLToSpecLibrary.Text)


' Update Combo with all Revisions
With cboConfPSLToSpecRevision
    .Visible = False
    .Clear
    For intCounter = 0 To UBound(aryRevisions)
        .AddItem aryRevisions(intCounter)
    Next intCounter
    ' set last value as selected value
    .ListIndex = intCounter - 2
    .Visible = True
End With

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : lstConfPSLToSpecPSLName_Click"
Exit Sub

lstConfPSLToSpecPSLName_Click_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmMain.lstConfPSLToSpecPSLName_Click"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmMain.lstConfPSLToSpecPSLName_Click ", , "Error"
     Resume Next
'</EhFooter>
End Sub



Private Sub optCertTyp_Click(Index As Integer)

' set global variable to selected CoAType
' the index of the control is eaqual to the enumeration
Select Case Index
    Case 0
        gCoASelected = "FS"
    Case 1
        gCoASelected = "H"
    Case 2
        gCoASelected = "N"
    Case 3
        gCoASelected = "R"
    Case 4
        gCoASelected = "Z1"
End Select

End Sub

Private Sub optConfLoginconf_Click()
' hide the unuseful items
    lblConfSpecification.Visible = False
    lblConfRevision.Visible = False
    cboConfSpecRev.Visible = False
    txtConfSpecification.Visible = False
    cmdConfSpecification.Visible = False
    fraConfPSLtoSpec.Visible = False
    
'show the rest
    lblConfSampleType.Visible = True
    cboConfSampletype.Visible = True
    lblConfProductCode.Visible = True
    txtConfProductCode.Visible = True
    cmdConfProductCode.Top = 1440
    cmdConfProductCode.Left = 120
    cmdConfProductCode.Visible = True
' update variable
    intConf = 1

End Sub

Private Sub optConfPSLSpec_Click()

' hide all other details
    lblConfSpecification.Visible = False
    lblConfRevision.Visible = False
    cboConfSpecRev.Visible = False
    txtConfSpecification.Visible = False
    cmdConfSpecification.Visible = False

' show frame with selection criteria
    fraConfPSLtoSpec.Move 2400, 120
    fraConfPSLtoSpec.Visible = True
    fraConfPSLtoSpec.ZOrder
' update variable
    intConf = 3
End Sub

Private Sub optConfSpec_Click()
' hide the unuseful items
    lblConfSampleType.Visible = False
    cboConfSampletype.Visible = False
    lblConfProductCode.Visible = False
    txtConfProductCode.Visible = False
    cmdConfProductCode.Visible = False
    fraConfPSLtoSpec.Visible = False
    
' show and move the rest
    lblConfSpecification.Top = 240
    lblConfSpecification.Visible = True
    txtConfSpecification.Top = 480
    txtConfSpecification.Visible = True
    lblConfRevision.Top = 1320
    lblConfRevision.Left = 120
    lblConfRevision.Visible = True
    cboConfSpecRev.Top = 1220
    cboConfSpecRev.Left = 1320
    cboConfSpecRev.Visible = True
    cmdConfSpecification.Top = 800
    cmdConfSpecification.Left = 120
    cmdConfSpecification.Visible = True
'update variable
intConf = 2

End Sub

Private Sub optConfSpecLogin_Click()
' hide the unuseful items
    lblConfSampleType.Visible = False
    cboConfSampletype.Visible = False
    lblConfProductCode.Visible = False
    txtConfProductCode.Visible = False
    cmdConfProductCode.Visible = False
    fraConfPSLtoSpec.Visible = False
    lblConfRevision.Visible = False
    cboConfSpecRev.Visible = False
    
' show and move the rest
    lblConfSpecification.Top = 240
    lblConfSpecification.Visible = True
    txtConfSpecification.Top = 480
    txtConfSpecification.Visible = True
    cmdConfSpecification.Top = 800
    cmdConfSpecification.Left = 120
    cmdConfSpecification.Visible = True
' update variable
    intConf = 4
End Sub

Private Sub optGroupMode_Click()
' delete all nodes and add groups
treFolder.Visible = False
treFolder.Nodes.Clear
treFolder.Visible = True
' add all Groups
Call SetGroup(gUserNo)

End Sub

Private Sub optLabelDevSmall_Click()
intLabelReport = 3
End Sub

Private Sub optLabelNormalBig_Click()
intLabelReport = 1
End Sub

Private Sub optLabelStabBig_Click()
intLabelReport = 2
End Sub

Private Sub optPrinter_DblClick()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       optPrinter_DblClick
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       04.07.01 16:03:35
' Parameters :
' Description:       Shows the Printerform to select a default printer
'--------------------------------------------------------------------------------
'</CSCM>
    '<EhHeader>
    On Error GoTo optPrinter_DblClick_Err
    g_Debug.SendOutPut dbgCTrace, "Enter: frmMain.optPrinter_DblClick"
    '</EhHeader>

'</CSCM>
'<Modified by: Klaus Zinsmeister at 14.05.2003-08:39:26 on machine: BALI_ZI>
' Remove possibilty to send mails, just show a mesage box
'</Modified by: Klaus Zinsmeister at 14.05.2003-08:39:26 on machine: BALI_ZI>

Dim strMsg As String

strMsg = "To change your default printer please send a E-Mail"
strMsg = strMsg & vbCrLf
strMsg = strMsg & "to BALI Helpdesk with the name of the printer"
strMsg = strMsg & vbCrLf
strMsg = strMsg & "you want to have as default printer."
strMsg = strMsg & vbCrLf

MsgBox strMsg, vbInformation + vbOKOnly, "Change Default Printer"


    '<EhFooter>
    g_Debug.SendOutPut dbgCTrace, "Exit : frmMain.optPrinter_DblClick"
    Exit Sub

optPrinter_DblClick_Err:
    g_Debug.SendOutPut dbgCError, Err.Description, "Printery.frmMain.optPrinter_DblClick", Erl
    Resume Next
    '</EhFooter>
End Sub

Private Sub optSinSamAnalyticalReport_Click()
'enable option for Mainlab if disabled
'*************************
    optMainlab.Enabled = True
    intSinSamReport = 3
End Sub

Private Sub optSinSamSampleSheet_Click()
'disable option for Mainlab. Not useful for this report
    If optSinSamSampleSheet Then
        optPrinter = True
        optMainlab.Enabled = False
    Else
        optMainlab.Enabled = True
    End If
'update variable for selected report
    intSinSamReport = 4
End Sub

Private Sub optSinSamValidationSheet_Click()
'enable option for Mainlab if disabled
optMainlab.Enabled = True
'update variable for selected report
intSinSamReport = 2

End Sub

Private Sub optSinSamWorksheet_Click()

'enable option for Mainlab if disabled
    optMainlab.Enabled = True
'update variable for selected report
    intSinSamReport = 1
End Sub

Private Sub optStabForecast_Click()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       optStabForecast_Click
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       10.08.01 09:19:35
' Parameters :
' Description:       Make some resizing and show only useful items
'--------------------------------------------------------------------------------
'</CSCM>
    '<EhHeader>
    On Error GoTo optStabForecast_Click_Err
    g_Debug.SendOutPut dbgCTrace, "Enter: frmMain.optStabForecast_Click"
    '</EhHeader>


lblStabStudy.Visible = False
txtStabStudy.Visible = False
lblStabTimepoint.Visible = False
cboStabTimepoint.Visible = False
chkStabAudit.Visible = False
cboStabPullsheet.Visible = False
lblStabPullsheet.Visible = False

dtpStabStartDate.Top = 1440
dtpStabStartDate.Visible = True
dtpStabEndDate.Top = 1800
dtpStabEndDate.Visible = True

cboStabMainlab.Top = 1080
cboStabMainlab.Visible = True

lblStabMainlab.Top = 1080
lblStabMainlab.Visible = True

lblStabEndDate.Visible = True
lblStabStartDate.Visible = True

' set variable
intStabReport = 4

    '<EhFooter>
    g_Debug.SendOutPut dbgCTrace, "Exit : frmMain.optStabForecast_Click"
    Exit Sub

optStabForecast_Click_Err:
    g_Debug.SendOutPut dbgCError, Err.Description, "Printery.frmMain.optStabForecast_Click", Erl
    Resume Next
    '</EhFooter>
End Sub

Private Sub optStabPullsheet_Click()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       optStabPullsheet_Click
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       10.08.01 09:23:43
' Parameters :
' Description:       Make some Resize, moving and show only useful items.
'--------------------------------------------------------------------------------
'</CSCM>
    '<EhHeader>
    On Error GoTo optStabPullsheet_Click_Err
    g_Debug.SendOutPut dbgCTrace, "Enter: frmMain.optStabPullsheet_Click"
    '</EhHeader>

cboStabPullsheet.Visible = True
lblStabPullsheet.Visible = True
chkStabAudit.Visible = False

lblStabStudy.Visible = False
txtStabStudy.Visible = False
lblStabTimepoint.Visible = False
cboStabTimepoint.Visible = False

cboStabMainlab.Visible = False
lblStabMainlab.Visible = False

dtpStabStartDate.Top = 1440
dtpStabStartDate.Visible = True
dtpStabEndDate.Top = 1800
dtpStabEndDate.Visible = True

lblStabEndDate.Visible = True
lblStabStartDate.Visible = True


' set variable
intStabReport = 3


    '<EhFooter>
    g_Debug.SendOutPut dbgCTrace, "Exit : frmMain.optStabPullsheet_Click"
    Exit Sub

optStabPullsheet_Click_Err:
    g_Debug.SendOutPut dbgCError, Err.Description, "Printery.frmMain.optStabPullsheet_Click", Erl
    Resume Next
    '</EhFooter>
End Sub

Private Sub optStabSamplesheet_Click()
' show only the usefull controls

cboStabPullsheet.Visible = False
lblStabPullsheet.Visible = False
chkStabAudit.Visible = False

cboStabMainlab.Visible = False
lblStabMainlab.Visible = False

dtpStabStartDate.Visible = False
dtpStabEndDate.Visible = False

lblStabStudy.Visible = True
txtStabStudy.Visible = True
lblStabTimepoint.Visible = True
cboStabTimepoint.Visible = True

lblStabEndDate.Visible = False
lblStabStartDate.Visible = False


' set variable
intStabReport = 2

End Sub

Private Sub optStabSamValidationSheet_Click()
'enable option for Mainlab if disabled
'*************************
    optMainlab.Enabled = True
'update variable for selected report
'*************************
    intStabSamReport = 2
End Sub

Private Sub optStabSamWorksheet_Click()
'enable option for Mainlab if disabled
'*************************
    optMainlab.Enabled = True
'update variable for selected report
'*************************
    intStabSamReport = 1
End Sub

Private Sub optStabStudyreport_Click()
' show only the usefull controls
'*************************
    cboStabPullsheet.Visible = False
    cboStabTimepoint.Visible = False
    lblStabPullsheet.Visible = False
    lblStabTimepoint.Visible = False
    cboStabMainlab.Visible = False
    lblStabMainlab.Visible = False
    
    dtpStabStartDate.Visible = False
    dtpStabEndDate.Visible = False
    lblStabStartDate.Visible = False
    lblStabEndDate.Visible = False
    
    chkStabAudit.Visible = True
    lblStabStudy.Visible = True
    txtStabStudy.Visible = True
' set variable
intStabReport = 1
End Sub

Private Sub optUserMode_Click()
Dim nodX As Node

' delete all nodes and add groups
' disable update for timing
treFolder.Visible = False
treFolder.Nodes.Clear
' show treeview
treFolder.Visible = True
' add all Cabinetts
' create nodes
Set nodX = frmMain.treFolder.Nodes.Add()
    nodX.Text = gUserID
    nodX.Key = "u" & gUserID
    nodX.Image = 2
Call SetCabinett(gUserID, "u" & gUserID)

End Sub

Private Sub tabReport_Switch(OldTab As Integer, NewTab As Integer, Cancel As Integer)

If NewTab = 4 Then
    optMainlab.Enabled = False
    optPrinter.Enabled = False
    cboPrinter.Enabled = False
Else
    optMainlab.Enabled = True
    optPrinter.Enabled = True
    cboPrinter.Enabled = True
End If


End Sub

'*************************************************************
'Procedure:    Private Method timMain_Timer
'Created on:   15 August, 2000 / Klaus Zinsmeister
'Module:       frmMain
'Project:      Printery
'Parameters:
'
'Comment:
'Reset the global variables.
'Interval is 60000 = 1 Minute
' - gTimerLoop is used to reset only after 10 Minutes
'*************************************************************
Private Sub timMain_Timer()
Dim intRandom As Integer
Dim timExit As Date
If gTimerLoop = 10 Then
    gSendMail = 0
    gPrintedReports = MAX_PRINTEDREPORTS
    ' update statusbar
    frmMain.staBar.Panels.Item(3).Text = "Reports left: " & gPrintedReports
    gTimerLoop = 0
Else
    gTimerLoop = gTimerLoop + 1
End If
End Sub

Private Sub treFolder_DblClick()
' we have to look which node is clicked
' - Group:
' - Cabinett:   if it is a cabinett, delete all folders
'               and get all folders from the database
' - Folder:     if it is a folder, delete all samples
'               and get all samples from the database
' - Sample:     get all the samplevalues from the
'               database to fill in the labels
' - User:       delete all cabinetts and retrieve a new
'               list from the database
'*************************
Dim NodeType As String      ' stores the type of the node (first character)
Dim iCounter As Integer
Dim strSamplename As String
Dim lNode As Node

' stores the given node in a global variable
'*************************
    gNodeKey = intNodeClick.Key
' get type of Node
'*************************
    NodeType = Left$(intNodeClick.Key, 1)
' exit if node is already expanded
    If intNodeExpanded = True Then
        Exit Sub
    End If
' delete nodes if it is a cabinet or folder
' nodes with samples don't have any childs
'*************************
    If intNodeClick.Children > 0 Then
        For iCounter = 1 To intNodeClick.Children
            Set lNode = intNodeClick.Child
            treFolder.Nodes.Remove (lNode.Key)
        Next iCounter
    End If
' do the work for the selected node
'*************************
Select Case NodeType
    Case "c"    'node is a cabinet - get folders
        SetFolder (gNodeKey)
    Case "f"    'node is a folder - get samples
        SetSample (gNodeKey)
    Case "s"    'node is a sample - update labels
        ' set sample name
        strSamplename = Mid$(intNodeClick.Key, 2, 8)
        Call UpdateInfo(strSamplename)
    Case "g"    'node is a group
         Call SetCabinett(intNodeClick.Text, intNodeClick.Key)
        SetGroupMember (gNodeKey)
    Case "u"    'node is a user
        Call SetCabinett(intNodeClick.Text, intNodeClick.Key)
End Select

End Sub

Private Sub treFolder_NodeClick(ByVal Node As Node)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       treFolder_NodeClick
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       10.08.01 09:33:30
' Parameters :       Node
' Description:       we have to look which node is clicked
'                    - Cabinett:   if it is a cabinett, do nothing
'                    perhaps its a double click
'                    - Folder:     if it is a folder, do nothing
'                                  perhaps its a double click
'                    - Sample:     get all the samplevalues from the
'                                  database to fill in the labels
'                    - User:       delete all cabinetts and retrieve a new
'                                  list from the database
'--------------------------------------------------------------------------------
'</CSCM>
    '<EhHeader>
    On Error GoTo treFolder_NodeClick_Err
    g_Debug.SendOutPut dbgCTrace, "Enter: frmMain.treFolder_NodeClick"
    '</EhHeader>

Dim NodeType As String      ' stores the type of the node (first character)
Dim iCounter As Integer
Dim lSamplename As String
Dim lNode As Node
' first set the private variable if we transfer this event to double_click
    Set intNodeClick = Node
    intNodeExpanded = Node.Expanded
' stores the given node in a global variable
    gNodeKey = intNodeClick.Key
' get type of Node
    NodeType = Left$(intNodeClick.Key, 1)
' do the work for the selected node
    Select Case NodeType
        Case "s"    'node is a sample - update labels
            ' set sample name
            lSamplename = Mid$(intNodeClick.Key, 2, 8)
            Call UpdateInfo(lSamplename)
    End Select
    '<EhFooter>
    g_Debug.SendOutPut dbgCTrace, "Exit : frmMain.treFolder_NodeClick"
    Exit Sub

treFolder_NodeClick_Err:
    g_Debug.SendOutPut dbgCError, Err.Description, "Printery.frmMain.treFolder_NodeClick", Erl
    Resume Next
    '</EhFooter>
End Sub

'CSEH: ErrResumeNext
Private Sub txtCertSample_KeyPress(KeyAscii As Integer)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  txtCertSample_KeyPress
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  21.05.2003
' Parameters :  KeyAscii
' Description:  if the user press ENTER in the textfield do
'               the same like click on Update
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error Resume Next
'</EhHeader>

    If KeyAscii = 13 Then
        KeyAscii = 0
        cmdCertUpdate_Click
    End If
End Sub


'CSEH: ErrResumeNext
Private Sub txtLabelSample_KeyPress(KeyAscii As Integer)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       txtLabelSample_KeyPress
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       04.07.01 17:00:45
' Parameters :       KeyAscii
' Description:       if the user press ENTER in the textfield do
'                    the same like click on Update
'--------------------------------------------------------------------------------
'</CSCM>
    '<EhHeader>
    On Error Resume Next
    '</EhHeader>

    If KeyAscii = 13 Then
        KeyAscii = 0
        cmdLabelUpdate_Click
    End If
End Sub

'CSEH: ErrResumeNext
Private Sub txtSinSamSample_KeyPress(KeyAscii As Integer)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       txtSinSamSample_KeyPress
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       04.07.01 16:59:39
' Parameters :       KeyAscii
' Description:       if the user press ENTER in the textfield do
'                    the same like click on Update
'--------------------------------------------------------------------------------
'</CSCM>
    '<EhHeader>
    On Error Resume Next
    '</EhHeader>

    If KeyAscii = 13 Then
        KeyAscii = 0
        cmdSinSamUpdate_Click
    End If
End Sub

'CSEH: ErrResumeNext
Private Sub txtStabSamSample_KeyPress(KeyAscii As Integer)
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :       txtStabSamSample_KeyPress
' Created by :       Klaus Zinsmeister
' Machine    :       BALI_ZI
' Date-Time  :       04.07.01 16:58:50
' Parameters :       KeyAscii
' Description:       if the user press ENTER in the textfield do
'                    the same like click on Update
'--------------------------------------------------------------------------------
'</CSCM>
    '<EhHeader>
    On Error Resume Next
    '</EhHeader>
    
    If KeyAscii = 13 Then
        KeyAscii = 0
        cmdStabSamUpdate_Click
    End If
End Sub

Private Sub InitForm()
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  InitForm
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  14.01.2003
' Parameters :
' Description:  Sub to load all default values and set starting values
'               Its a own sub because the code within the Load Event was too much
'--------------------------------------------------------------------------------
'</CSCM>

Dim intProgressStatus As Integer    ' Counter for progressbar
Dim strUserFullName As String
Dim intCounter As Integer
Dim nodX As Node                    ' for the TreeControl

intProgressStatus = 0
' set global variable for report counter
gPrintedReports = MAX_PRINTEDREPORTS
' global variable for CoAType
gCoASelected = "FS"

' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
' resize the main form
'*************************
    Me.Height = 7220
    Me.Width = 9800
' Center form
'*************************
    Me.Top = (Screen.Height - Me.Height) / 2
    Me.Left = (Screen.Width - Me.Width) / 2

'update variable for selected report
'*************************
    intSinSamReport = 2
    intStabSamReport = 1
    intStabReport = 1
    intConf = 1
    intLabelReport = 1
    
' set titelbar
'*************************
    Me.Caption = "BALI Printery " & "Version " & App.Major & "." & App.Minor & "." & App.Revision & "  " & gUserID & "@" & gDataSource
' get the Username
'*************************
    strUserFullName = getUserName(gUserID)
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
' get the Usernumber
'*************************
    gUserNo = getUserNo(gUserID)
' update label
'*************************
    AddStatusMessage ("Welcome " & strUserFullName)
    frmMain.MousePointer = 11
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
' check if user has module to print labels and certificates
' if not, remove tab with labels/certificate
Call getUserModuleLabel(gUserID)
For intCounter = 0 To MAX_USERMODULE
    If gUserModule(intCounter, 0) = "" Then Exit For
    Select Case gUserModule(intCounter, 0)
        Case "BALI SAMPLER LABEL"
            optLabelNormalBig.Enabled = True
        Case "BALI DEVELOPMENT LABEL"
            optLabelDevSmall.Enabled = True
        Case "BALI DEVELOPMENT LABEL PRINTER CHOICE"
            optLabelDevSmall.Enabled = True
        Case "BALI STAB SAMPLER LABEL"
            optLabelStabBig.Enabled = True
    End Select
Next intCounter

' check for CoA
' disable CoA Tab
tabReport.TabEnabled(5) = False
Select Case getUserMenuTemplate(gUserID)
    Case "USER_COA"
        tabReport.TabEnabled(5) = True
    Case "USER_LABELS_COA"
        tabReport.TabEnabled(5) = True
    Case "USER_ADMIN"
        tabReport.TabEnabled(5) = True
End Select

' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus

' get printer list
'*************************
    Call getAllPrinter
    ' fill ComboBox
    For intCounter = 0 To MAX_PRINTER
        If gPrinterList(intCounter, 0) = "" Then
            Exit For
        Else
            cboPrinter.AddItem gPrinterList(intCounter, 0)
        End If
    Next intCounter

' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
    
' read all mainlabs
    Call getAllMainlabs
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
    
' get user printer
'*************************
    cboPrinter.Text = getUserPrinter(gUserID)

    For intCounter = 0 To MAX_PRINTER
        If cboPrinter.Text = gPrinterList(intCounter, 0) Then
            cboPrinter.ListIndex = intCounter
        End If
    Next intCounter

' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
' get all Sampletype
'*************************
    Call getAllSampletype
    ' fill ComboBox
    For intCounter = 0 To MAX_SAMPLETYPE
        If gSampletype(intCounter) = "" Then
            Exit For
        Else
            cboConfSampletype.AddItem gSampletype(intCounter)
        End If
    Next intCounter
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
' get pullsheet list
'*************************
    Call getAllPullsheet
    ' fill ComboBox
    For intCounter = 0 To MAX_PULLSHEET
        If gPullsheetList(intCounter) = "" Then
            Exit For
        Else
            cboStabPullsheet.AddItem gPullsheetList(intCounter)
        End If
    Next intCounter
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
' get timepoint list
'*************************
    Call getAllTimepoint
    ' fill ComboBox
    For intCounter = 0 To MAX_TIMEPOINT
        If gTimepoint(intCounter) = "" Then
            Exit For
        Else
            cboStabTimepoint.AddItem gTimepoint(intCounter)
        End If
    Next intCounter
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
' get all mainlabs from ChemStudy for StudyForecastlist
'*************************
    Call getAllStabMainlabs
    ' fill ComboBox
    For intCounter = 0 To MAX_STABMAINLAB
        If gStabMainlabs(intCounter) = "" Then
            Exit For
        Else
            cboStabMainlab.AddItem gStabMainlabs(intCounter)
        End If
    Next intCounter
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus

' get all libraries
'*************************
    Call getAllLibraries
    ' fill ComboBox
    For intCounter = 0 To MAX_LIBRARIES
        If gLibraries(intCounter) = "" Then
            Exit For
        Else
            cboConfPSLToSpecLibrary.AddItem gLibraries(intCounter)
        End If
    Next intCounter
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus

' get user mode
'*************************
    If getUserMode(gUserID) = 0 Then
        ' Usermode
        ' create nodes
        Set nodX = frmMain.treFolder.Nodes.Add()
            nodX.Text = gUserID
            nodX.Key = "u" & gUserID
            nodX.Image = 2
        Call SetCabinett(gUserID, "u" & gUserID)
    Else
        ' Groupmode
        Call SetGroup(gUserNo)
        'set OptionButton
        optGroupMode = True
    End If
' Update progress bar
'*************************
    intProgressStatus = intProgressStatus + 1
    frmLoad.prbStatus.Value = intProgressStatus
' update statusbar
    frmMain.staBar.Panels.Item(3).Text = "Reports left: " & gPrintedReports
' finshed ... now show main form
'*************************

End Sub


'CSEH: ErrBaliDebug
Private Function openChemLMS(intMode As Integer, _
                             Optional strServer As String, Optional strDatabase As String, _
                             Optional strUsername As String, Optional strDBPasswd As String, _
                             Optional strServerUser As String, Optional strServerPasswd As String) As Boolean
'<CSCM>
'--------------------------------------------------------------------------------
' Procedure  :  openChemLMS
' Created by :  Klaus Zinsmeister
' Machine    :  BALI_ZI
' Date       :  21.03.2003
' Parameters :  intMode     0 = manually 1 = auto
'               strServer
'               strDatabase
'               strUsername
'               strDBPasswd
'               strServerUser
'               strServerPasswd
' Description:  Make a connection to the ChemLMS server
'               Either manually (show LognPanel) or with the given parameter
'               Returns True if connection was succesfull
'--------------------------------------------------------------------------------
'</CSCM>
'<EhHeader>
On Error GoTo openChemLMS_Err
g_Debug.SendOutPut dbgCTrace, "Entered: openChemLMS"
'</EhHeader>

If intMode = 0 Then
    ' manually
    lmsSystem.ShowLogonDialog ("BALI Printery")
    If Err <> 0 Then
        MsgBox "Unable to connect", 16, "Connection Error"
        'exit
        openChemLMS = False
        Exit Function
    End If
    ' check if user is on the correct Database (ARLP1BAP)
    If lmsSystem.LoggedOn = True Then
        If lmsSystem.Database <> "ARLP1BAP" Then
            MsgBox "Wrong database ! Please connect only to database ARLP1BAP", vbCritical
            openChemLMS = False
            Exit Function
        End If
    Else
        openChemLMS = False
        Exit Function
    End If
Else
    ' first we need to connect to the server
    lmsSystem.Connect (strServer)
    ' logon with the given credential
    lmsSystem.Logon strDatabase, strUsername, strDBPasswd, strServerUser, strServerPasswd
End If

' check if we are connected

If lmsSystem.LoggedOn = True Then
    openChemLMS = True
Else
    openChemLMS = False
End If

'<EhFooter>
g_Debug.SendOutPut dbgCTrace, "Exited : openChemLMS"
Exit Function

openChemLMS_Err:
     g_Debug.SendOutPut dbgCError, Err.Number, Err.Description, "Printery.frmMain.openChemLMS"
     MsgBox Err.Number & vbCrLf & Err.Description & vbCrLf & "in Printery.frmMain.openChemLMS ", , "Error"
     openChemLMS = False
'</EhFooter>
End Function
