// captureDlg.cpp : implementation file
//

#include "stdafx.h"
#include "capture.h"
#include "captureDlg.h"
#include "NoDevDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)

{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCaptureDlg dialog

CCaptureDlg::CCaptureDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CCaptureDlg::IDD, pParent),
    m_pEPad(NULL),
    m_pWedge(NULL),
    fLastPointValid(FALSE)
{
	//{{AFX_DATA_INIT(CCaptureDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);

    CoInitialize(NULL);
}

CCaptureDlg::~CCaptureDlg()
{
    if ( NULL!=m_pEPad ) {
        m_pEPad->CloseConnection();
        m_pEPad->Release();
    } // endif
    if ( NULL!=m_pWedge ) {
        m_pWedge->Release();
    } // endif

    CoUninitialize();
}

void CCaptureDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CCaptureDlg)
	DDX_Control(pDX, IDC_VIEW, m_ViewAreaCtl);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CCaptureDlg, CDialog)
	//{{AFX_MSG_MAP(CCaptureDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_CLEAR, OnClear)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCaptureDlg message handlers

BOOL CCaptureDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
    HRESULT hr = CoCreateInstance(  CLSID_Wedge,
                            NULL,
                            CLSCTX_INPROC,
                            IID_IWedge,
                            (void **)&m_pWedge );
    if ( !FAILED(hr) ) {
        hr = m_pWedge->QueryInterface(IID_gIIEPad,(void **)&m_pEPad);
        if ( !FAILED(hr) ) {
            int iNumDevices;
			bool fAbort = false;
			do {
	            hr = m_pEPad->GetNumDevices(&iNumDevices);
				if (!FAILED(hr)) {
					if (0==iNumDevices) {
						CNoDevDlg noDev((gIIEPad *)m_pEPad);
						noDev.DoModal();
                        fAbort = noDev.m_fCancelled;
					} // endif
				} else {
                    iNumDevices = 0;
					fAbort = true;
				} // endif
			} while ( (0==iNumDevices)&&(!fAbort) );
            if ( (!FAILED(hr))&&(!fAbort) ) {
                for ( int x=0; x<=iNumDevices; x++ ) {
                    hr = m_pEPad->OpenConnection(x,this);
                    if ( !FAILED(hr) ) {
                        int unused;
                        m_pEPad->ConnGetRanges(&minX,&maxX,&minY,&maxY,&unused,&unused,&unused);
                        break;
                    } // endif
                } // endfor
			} else {
				EndDialog(IDCANCEL);
            } // endif
        } else {
        } // endif
    } // endif
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CCaptureDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CCaptureDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CCaptureDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}


STDMETHODIMP CCaptureDlg::HandlePadData(INT abs_x, INT abs_y, INT pressure, CHAR fTouch, CHAR fTap, INT buttonState, ULONG dwTimeStamp, ULONG dwSequenceNum)
{
    CDC *pDC = m_ViewAreaCtl.GetDC();
    RECT rect;
    int pointX, pointY;

    m_ViewAreaCtl.GetClientRect(&rect);
	//move window orig down and right
	pDC->SetWindowOrg(-15, -80);

	//scaling
    pointX = (abs_x*(rect.right-rect.left))/(maxX - minX);
	pointX = pointX * 92 / 100;

    pointY = (abs_y*(rect.bottom-rect.top))/(maxY - minY);
	pointY = pointY * 62 / 100;

    if ( fTouch ) {
        if ( !fLastPointValid ) {
            fLastPointValid = TRUE;
            lastX = pointX;
            lastY = pointY;
            pDC->MoveTo(lastX,lastY);
        } else {
            pDC->MoveTo(lastX,lastY);
            pDC->LineTo(pointX,pointY);
            lastX = pointX;
            lastY = pointY;
        } // endif
    } else {
        fLastPointValid = FALSE;
    } // endif

    m_ViewAreaCtl.ReleaseDC(pDC);

    return ( NOERROR );
}




void CCaptureDlg::OnClear() 
{
    Invalidate();
}
