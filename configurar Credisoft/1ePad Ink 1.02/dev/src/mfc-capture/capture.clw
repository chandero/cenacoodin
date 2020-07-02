; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CNoDevDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "capture.h"

ClassCount=4
Class1=CCaptureApp
Class2=CCaptureDlg
Class3=CAboutDlg

ResourceCount=4
Resource1=IDD_CAPTURE_DIALOG
Resource2=IDR_MAINFRAME
Resource3=IDD_ABOUTBOX
Class4=CNoDevDlg
Resource4=IDD_NODEVDLG

[CLS:CCaptureApp]
Type=0
HeaderFile=capture.h
ImplementationFile=capture.cpp
Filter=N

[CLS:CCaptureDlg]
Type=0
HeaderFile=captureDlg.h
ImplementationFile=captureDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=CCaptureDlg

[CLS:CAboutDlg]
Type=0
HeaderFile=captureDlg.h
ImplementationFile=captureDlg.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_CAPTURE_DIALOG]
Type=1
Class=CCaptureDlg
ControlCount=4
Control1=IDOK,button,1342242817
Control2=IDC_VIEW,button,1342177287
Control3=IDC_CLEAR,button,1342242816
Control4=IDC_STATIC,button,1342177287

[DLG:IDD_NODEVDLG]
Type=1
Class=CNoDevDlg
ControlCount=2
Control1=IDCANCEL,button,1342242816
Control2=IDC_STATIC,static,1342308353

[CLS:CNoDevDlg]
Type=0
HeaderFile=NoDevDlg.h
ImplementationFile=NoDevDlg.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CNoDevDlg

