VERSION 5.00
Object = "{0A88E1AB-6D17-47DB-BEF1-A42C251F27C1}#1.0#0"; "gIIEPad.ocx"
Begin VB.Form Form1 
   Caption         =   "Generic ePad Interface Demo"
   ClientHeight    =   5640
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5640
   ScaleWidth      =   9000
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Reset Selection"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3840
      TabIndex        =   6
      Top             =   1800
      Width           =   2295
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Clear"
      Height          =   375
      Left            =   600
      TabIndex        =   4
      Top             =   1800
      Width           =   975
   End
   Begin VB.ComboBox Combo2 
      Enabled         =   0   'False
      Height          =   315
      Left            =   7440
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Select Provider"
      Height          =   375
      Left            =   6360
      TabIndex        =   2
      Top             =   1800
      Width           =   2295
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   600
      Width           =   8535
   End
   Begin VB.PictureBox Picture1 
      Height          =   2175
      Left            =   600
      ScaleHeight     =   2115
      ScaleWidth      =   2955
      TabIndex        =   0
      Top             =   2400
      Width           =   3015
   End
   Begin GIIEPADLib.GIIEPad GIIEPad1 
      Left            =   120
      Top             =   4680
      _Version        =   65536
      _ExtentX        =   423
      _ExtentY        =   397
      _StockProps     =   0
   End
   Begin VB.Label Label1 
      Caption         =   "Info area"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   1080
      Width           =   3495
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim g_fConnected As Boolean
Dim g_fOpened As Boolean
Dim g_xMin As Long
Dim g_xMax As Long
Dim g_yMin As Long
Dim g_yMax As Long
Dim g_fFirstTouch As Boolean
Dim g_lastX As Long
Dim g_lastY As Long



Private Sub Command1_Click()
    If (g_fConnected) And (g_fOpened) Then
        GIIEPad1.CloseConnection
        GIIEPad1.CloseProvider
        
        Picture1.Cls
        g_fConnected = False
        g_fOpened = False
        Combo1.Enabled = True
        Combo2.Clear
        Command1.Caption = "Select Provider"
        Combo1.Enabled = True
        Combo2.Enabled = False
        Command1.Enabled = True
        Command2.Enabled = False
        Command3.Enabled = False
        Label1.Caption = ""
    Else
        If (g_fConnected) Then
            Command1.Enabled = False
            Dim iDevNum As Integer
            iDevNum = Combo2.ListIndex
            If (iDevNum <> -1) Then
                If (GIIEPad1.OpenConnection(iDevNum)) Then
                    g_xMin = GIIEPad1.ConnGetDataRangeMinX
                    g_xMax = GIIEPad1.ConnGetDataRangeMaxX
                    g_yMin = GIIEPad1.ConnGetDataRangeMinY
                    g_yMax = GIIEPad1.ConnGetDataRangeMaxY
                    g_fOpened = True
                    Combo1.Enabled = False
                    Command1.Caption = "---"
                    Dim strInfo As String
                    strInfo = "Device is" + Str$(Int(GIIEPad1.ConnGetPhysicalX() * 100) / 100) + " inches by"
                    strInfo = strInfo + Str$(Int(GIIEPad1.ConnGetPhysicalY() * 100) / 100) + " inches"
                    Label1.Caption = strInfo
                    Form_Resize
                    Combo2.Enabled = False
                Else
                    Command1.Enabled = False
                End If
            Else
                Command1.Enabled = True
            End If
        Else
            If (Combo1.ListIndex <> -1) Then
                Dim strGUID As String
                strGUID = Combo1.Text
                If (GIIEPad1.OpenProvider(strGUID)) Then
                    Dim iNumDev As Integer
                    Dim k As Integer
                    
                    iNumDev = GIIEPad1.GetNumDevices
                    Combo2.Clear
                    For k = 0 To iNumDev - 1
                        Combo2.AddItem ("Dev -" + Str$(k))
                    Next k
                    If (iNumDev > 0) Then
                        g_fConnected = True
                        Combo1.Enabled = False
                        Command2.Enabled = True
                        Command3.Enabled = True
                        Combo2.ListIndex = 0
                        Combo2.Enabled = True
                        Command1.Caption = "Open Device"
                    Else
                        GIIEPad1.CloseProvider
                    End If
                End If
            End If
        End If
    End If
End Sub

Private Sub Command2_Click()
    Picture1.Cls
End Sub

Private Sub Command3_Click()
    g_fConnected = True
    g_fOpened = True
    
    Command1_Click
    
End Sub

Private Sub Form_Load()
    Dim iNumProviders As Integer
    
    g_fConnected = False
    g_fOpened = False
    g_fFirstTouch = True
    
    Combo1.Clear
    Combo2.Clear
    Command2.Enabled = False
    
    iNumProviders = GIIEPad1.GetNumProviders
    Dim i As Integer
    For i = 0 To iNumProviders - 1
        Dim strClassID As String
        strClassID = GIIEPad1.GetProviderClassID(i)
        Dim strProviderDesc As String
        strProviderDesc = GIIEPad1.GetProviderDescription(strClassID)
        Combo1.AddItem (strClassID + " - " + strProviderDesc)
    Next i
    If (iNumProviders > 0) Then
        Combo1.ListIndex = 0
    End If
End Sub

Private Sub Form_Resize()
    If (g_fConnected) And (g_fOpened) Then
        Dim xSize As Double
        Dim ySize As Double
        xSize = GIIEPad1.ConnGetPhysicalX
        ySize = GIIEPad1.ConnGetPhysicalY
        If (xSize * ySize <> 0) Then
            Picture1.Width = Form1.Width / 2
            Picture1.Height = (Picture1.Width * ySize) / xSize
        End If
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
        If (g_fOpened) Then
            GIIEPad1.CloseConnection
        End If
        If (g_fConnected) Then
            GIIEPad1.CloseProvider
        End If
End Sub

Private Sub GIIEPad1_PadData(ByVal abs_x As Long, ByVal abs_y As Long, ByVal abs_z As Long, ByVal fTouch As Boolean, ByVal fTap As Boolean, ByVal bmButtonState As Integer, ByVal dwTimeStamp As Long, ByVal dwSequenceNum As Long)
    
    Dim x As Long
    Dim y As Long
    
    x = (Picture1.Width * (abs_x - g_xMin)) / (g_xMax - g_xMin)
    y = (Picture1.Height * (abs_y - g_yMin)) / (g_yMax - g_yMin)
    If (Not fTouch) Then
        Picture1.PSet (x, y)
        g_fFirstTouch = True
    Else
        If (Not g_fFirstTouch) Then
            Picture1.Line (g_lastX, g_lastY)-(x, y)
        Else
            Picture1.PSet (x, y)
            g_fFirstTouch = False
        End If
    End If
    
    g_lastX = x
    g_lastY = y
    
End Sub
