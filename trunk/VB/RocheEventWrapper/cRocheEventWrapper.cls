VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cRocheEventWrapper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public SystemOCX As Object
Public RDOConn As Object
Public NLSObject As Object
Public Function Run(FolderID As Long, EventName As String) As Boolean

Dim Command As String
Dim ReturnInt As Integer

Set objRocheEventWrapper = Me

Set Me.RDOConn = RDOConn
Set Me.SystemOCX = SystemOCX
Set Me.NLSObject = NLSObject

GWFolderID = FolderID
GWEventName = EventName
SampleListFlag = True
    
If GWFolderID > 0 Then
    
    lReturnInt = NLSObject.GetSamplesFromFolder(GWFolderID, SampleList)
    
    ReDim Preserve SampleList(UBound(SampleList) - 1)
    
    If UBound(SampleList) = 0 Then
        SampleListFlag = False
        SampleID = SampleList(LBound(SampleList))
    Else
        SampleListFlag = True
    End If
    
Else
    
    SampleName = ""
    
    SampleListFlag = False
    
End If
    
frmRocheEventWrapper.Show 1
     
Set Me.RDOConn = Nothing
Set Me.SystemOCX = Nothing
Set Me.NLSObject = Nothing

Set objRocheEventWrapper = Nothing

End Function
