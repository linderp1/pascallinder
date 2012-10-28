Attribute VB_Name = "modGlob"
Option Explicit

Public Type tSpecType
    sSpecHandle     As String
    sDispName       As String
    sStatus         As String
End Type

Public Type tCols
    sColValues()     As String
End Type

Public gSystemOCX As Object
Public gbPanelResult    As Boolean
Public gtProcs()        As tSpecType
Public gtSpecs()        As tSpecType
Public gtArray()        As tCols
Public gsLibrary        As String
Public gsUser           As String
Public gsSampleID       As String
Public gsSampleName     As String
Public gsSelectedProcs  As String
Public gsTestName       As String

Public Sub Main()

    ' Do nothing
    
End Sub


