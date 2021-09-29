#if !defined(AFX_NODEVDLG_H__B5F17AAE_6405_4456_9E70_4B331B74DAF4__INCLUDED_)
#define AFX_NODEVDLG_H__B5F17AAE_6405_4456_9E70_4B331B74DAF4__INCLUDED_

#include "afxdlgs.h"
#include "afxwin.h"

#import "..\..\inc\iepadenum.tlb" raw_interfaces_only, raw_native_types, no_namespace, named_guids 

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// NoDevDlg.h : header file
//
typedef struct tagThreadContext {
    LPSTREAM pStream;
    HANDLE hStoppedEvent;
    bool fRunning;
    CDialog *pDlg;
} THREAD_CONTEXT, *PTHREAD_CONTEXT;

#define WM_MYMESSAGE (WM_USER + 100)

/////////////////////////////////////////////////////////////////////////////
// CNoDevDlg dialog

class CNoDevDlg : public CDialog
{
// Construction
public:
	CNoDevDlg(gIIEPad *pWedge, CWnd* pParent = NULL);   // standard constructor
    bool m_fCancelled;
virtual ~CNoDevDlg();

// Dialog Data
	//{{AFX_DATA(CNoDevDlg)
	enum { IDD = IDD_NODEVDLG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNoDevDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
    // inside the class declaration
    afx_msg void OnMyMessage(WPARAM wParam, LPARAM lParam);

	// Generated message map functions
	//{{AFX_MSG(CNoDevDlg)
	virtual void OnCancel();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
    THREAD_CONTEXT threadContext;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NODEVDLG_H__B5F17AAE_6405_4456_9E70_4B331B74DAF4__INCLUDED_)
