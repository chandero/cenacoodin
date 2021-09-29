// captureDlg.h : header file
//

#if !defined(AFX_CAPTUREDLG_H__93435AB6_3C21_402A_AE73_DBC2F993D3B7__INCLUDED_)
#define AFX_CAPTUREDLG_H__93435AB6_3C21_402A_AE73_DBC2F993D3B7__INCLUDED_

#import "..\..\inc\provider.tlb" raw_interfaces_only, raw_native_types, no_namespace, named_guids 
#import "..\..\inc\IePadEnum.tlb" raw_interfaces_only, raw_native_types, no_namespace, named_guids 


#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CCaptureDlg dialog

class CCaptureDlg : public CDialog,
	public CComObjectRootEx<CComSingleThreadModel>,
	public IDispatchImpl<gIIEPadEvent, &IID_gIIEPadEvent, &LIBID_IEPADENUMLib>
{
// Construction
public:
	CCaptureDlg(CWnd* pParent = NULL);	// standard constructor
    virtual ~CCaptureDlg();

// Dialog Data
	//{{AFX_DATA(CCaptureDlg)
	enum { IDD = IDD_CAPTURE_DIALOG };
	CButton	m_ViewAreaCtl;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCaptureDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CCaptureDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnClear();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

public:
virtual HRESULT STDMETHODCALLTYPE QueryInterface(REFIID riid, LPVOID *ppvObj) {
    return ( E_NOTIMPL );
}

virtual ULONG STDMETHODCALLTYPE AddRef(void) {
    return ( E_NOTIMPL );
}

virtual ULONG STDMETHODCALLTYPE Release(void) {
    return ( E_NOTIMPL );
}

	STDMETHOD(HandlePadData)(INT abs_x, INT abs_y, INT pressure, CHAR fTouch, CHAR fTap, INT buttonState, ULONG dwTimeStamp, ULONG dwSequenceNum);
private:
    gIIEPad *m_pEPad;
    IWedge *m_pWedge;
    BOOL fLastPointValid;
    int lastX,lastY;
    int minX, maxX, minY, maxY;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CAPTUREDLG_H__93435AB6_3C21_402A_AE73_DBC2F993D3B7__INCLUDED_)
