// NoDevDlg.cpp : implementation file
//

#include "stdafx.h"
#include "capture.h"
#include "NoDevDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

HWND gWinHnd = 0;
HANDLE gThreadHnd = 0;

DWORD WINAPI _bgThread(LPVOID lpParam)
{
    gIIEPad *pWedge;
    PTHREAD_CONTEXT pContext = (PTHREAD_CONTEXT)lpParam;
    INT iNumDevices = 0;

    CoInitialize(NULL);
    HRESULT hr = CoGetInterfaceAndReleaseStream(pContext->pStream,IID_gIIEPad,(void **)&pWedge);
    if ( !FAILED(hr) ) {
        do {
            hr = pWedge->GetNumDevices(&iNumDevices);
            if ( !FAILED(hr) ) {
                if ( iNumDevices>0 ) {
                    //pContext->pDlg->EndDialog(IDOK);//dead lock
					PostMessage(gWinHnd, WM_MYMESSAGE, 0, 0 );
                } // endif
            } // endif
            if ( iNumDevices<1 ) {
                Sleep(500);
            } // endif
        } while ( (0==iNumDevices)&&(pContext->fRunning) );
    } // endif

	SetEvent ( pContext->hStoppedEvent );
	CoUninitialize();

    return ( 0 );
}

/////////////////////////////////////////////////////////////////////////////
// CNoDevDlg dialog


CNoDevDlg::CNoDevDlg(gIIEPad *pWedge, CWnd* pParent /*=NULL*/)
	: CDialog(CNoDevDlg::IDD, pParent),
    m_fCancelled(false)
{
	//{{AFX_DATA_INIT(CNoDevDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
    
    HRESULT hr = CoMarshalInterThreadInterfaceInStream(IID_gIIEPad,pWedge,
                                                       &threadContext.pStream);
    threadContext.pDlg = this;
    threadContext.fRunning = true;
    threadContext.hStoppedEvent = CreateEvent(NULL,TRUE,FALSE,NULL);
    
    ASSERT ( !FAILED(hr) );
}


CNoDevDlg::~CNoDevDlg()
{
    threadContext.fRunning = false;
    WaitForSingleObject(threadContext.hStoppedEvent,INFINITE);
    CloseHandle( threadContext.hStoppedEvent );
	//kill bgthread
	if ( gThreadHnd != 0 )
		TerminateThread(gThreadHnd, 0);
}

void CNoDevDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CNoDevDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CNoDevDlg, CDialog)
	//{{AFX_MSG_MAP(CNoDevDlg)
    ON_MESSAGE(WM_MYMESSAGE, OnMyMessage)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNoDevDlg message handlers

void CNoDevDlg::OnCancel() 
{
    m_fCancelled = true;
	
	CDialog::OnCancel();
}

BOOL CNoDevDlg::OnInitDialog() 
{
	DWORD hThreadID;

	CDialog::OnInitDialog();

	//need to know the windown handle
	gWinHnd = m_hWnd;	
	//keep thread id	
    gThreadHnd = ::CreateThread(NULL,0,_bgThread,&threadContext,0,&hThreadID);
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CNoDevDlg::OnMyMessage(WPARAM wParam, LPARAM lParam) 
{
	// TODO: Add your message handler code here and/or call default
	
	//CDialog::OnClose();
	EndDialog(IDOK);
}
