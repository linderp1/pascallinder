Attribute VB_Name = "modRocheEventMapper"

Option Explicit

Public SystemOCX As Object
Public RDOConn As Object
Public NLSObject As Object

Public GWEventName As String
Public GWFolderID As Long
Public LabelIndex As Integer
Public LabelContent() As String
Public MacroFile As String
Public MacroName As String
Public SampleID As Integer
Public SampleActualIndex As Integer
Public SampleIndex As Integer
Public SampleList As Variant
Public SampleListFlag As Boolean
Public SampleName As Variant
Public SampleRS As rdoResultset

Public objRocheEventWrapper As Object

Sub Main()

End Sub
