VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "XKOCR Sample Program"
   ClientHeight    =   1095
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3135
   LinkTopic       =   "frmMain"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1095
   ScaleWidth      =   3135
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdLoad 
      Caption         =   "Load"
      Default         =   -1  'True
      Height          =   495
      Left            =   2040
      TabIndex        =   2
      Top             =   120
      Width           =   975
   End
   Begin MSComDlg.CommonDialog dlgFileOpen 
      Left            =   120
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.PictureBox picCaptcha 
      BackColor       =   &H00FFFFFF&
      Height          =   495
      Left            =   120
      ScaleHeight     =   435
      ScaleWidth      =   1155
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label lblResult 
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   2895
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function ocr_jpeg Lib "xkocr.dll" (Buf As Any, ByVal BufLen As Long, ByVal Result As String) As Long

Private Sub Load_Captcha()
    Dim FileBuffer(1 To 4096) As Byte
    Dim Ptr As Long, FileLen As Long
    Dim Result As String
    Dim MaxDiff As Long
    
    On Error GoTo ErrHandler
    
    dlgFileOpen.CancelError = True
    dlgFileOpen.Filter = "JPEG Image File (*.jpg)|*.jpg|All Files (*.*)|*.*"
    dlgFileOpen.ShowOpen
    
    picCaptcha.Picture = LoadPicture(dlgFileOpen.FileName)
    
    Open dlgFileOpen.FileName For Binary As #1
    Ptr = 0
    Do While Not EOF(1)
        Ptr = Ptr + 1
        Get #1, Ptr, FileBuffer(Ptr)
    Loop
    Close #1
    FileLen = Ptr - 1
    
    Result = String(4, "?")
    MaxDiff = ocr_jpeg(FileBuffer(1), FileLen, Result)
    lblResult.Caption = "Result = " & Result & ", MaxDiff = " & MaxDiff
    
    Exit Sub
ErrHandler:
    lblResult.Caption = Err.Description
    Close
End Sub

Private Sub cmdLoad_Click()
    Load_Captcha
End Sub

