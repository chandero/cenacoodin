
#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 5.03.0280 */
/* at Thu Aug 01 13:04:21 2002
 */
/* Compiler settings for g_iiepad.idl:
    Os (OptLev=s), W1, Zp8, env=Win32 (32b run), ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __g_iiepad_h__
#define __g_iiepad_h__

/* Forward Declarations */ 

#ifndef __gIIEPadEvent_FWD_DEFINED__
#define __gIIEPadEvent_FWD_DEFINED__
typedef interface gIIEPadEvent gIIEPadEvent;
#endif 	/* __gIIEPadEvent_FWD_DEFINED__ */


#ifndef __gIEDebugGUI_FWD_DEFINED__
#define __gIEDebugGUI_FWD_DEFINED__
typedef interface gIEDebugGUI gIEDebugGUI;
#endif 	/* __gIEDebugGUI_FWD_DEFINED__ */


#ifndef __gIIEPad_FWD_DEFINED__
#define __gIIEPad_FWD_DEFINED__
typedef interface gIIEPad gIIEPad;
#endif 	/* __gIIEPad_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

/* interface __MIDL_itf_g_iiepad_0000 */
/* [local] */ 

typedef /* [public][public] */ struct __MIDL___MIDL_itf_g_iiepad_0000_0001
    {
    unsigned char bData[ 4 ];
    }	T_HANDLE;



extern RPC_IF_HANDLE __MIDL_itf_g_iiepad_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_g_iiepad_0000_v0_0_s_ifspec;

#ifndef __gIIEPadEvent_INTERFACE_DEFINED__
#define __gIIEPadEvent_INTERFACE_DEFINED__

/* interface gIIEPadEvent */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_gIIEPadEvent;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D55113D0-95C8-4427-9AAD-EB8BC1ECB4D9")
    gIIEPadEvent : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE HandlePadData( 
            int abs_x,
            int abs_y,
            int pressure,
            boolean fTouch,
            boolean fTap,
            int buttonState,
            unsigned long dwTimeStamp,
            unsigned long dwSequenceNum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct gIIEPadEventVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            gIIEPadEvent __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            gIIEPadEvent __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            gIIEPadEvent __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            gIIEPadEvent __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            gIIEPadEvent __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            gIIEPadEvent __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            gIIEPadEvent __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *HandlePadData )( 
            gIIEPadEvent __RPC_FAR * This,
            int abs_x,
            int abs_y,
            int pressure,
            boolean fTouch,
            boolean fTap,
            int buttonState,
            unsigned long dwTimeStamp,
            unsigned long dwSequenceNum);
        
        END_INTERFACE
    } gIIEPadEventVtbl;

    interface gIIEPadEvent
    {
        CONST_VTBL struct gIIEPadEventVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define gIIEPadEvent_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define gIIEPadEvent_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define gIIEPadEvent_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define gIIEPadEvent_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define gIIEPadEvent_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define gIIEPadEvent_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define gIIEPadEvent_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define gIIEPadEvent_HandlePadData(This,abs_x,abs_y,pressure,fTouch,fTap,buttonState,dwTimeStamp,dwSequenceNum)	\
    (This)->lpVtbl -> HandlePadData(This,abs_x,abs_y,pressure,fTouch,fTap,buttonState,dwTimeStamp,dwSequenceNum)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPadEvent_HandlePadData_Proxy( 
    gIIEPadEvent __RPC_FAR * This,
    int abs_x,
    int abs_y,
    int pressure,
    boolean fTouch,
    boolean fTap,
    int buttonState,
    unsigned long dwTimeStamp,
    unsigned long dwSequenceNum);


void __RPC_STUB gIIEPadEvent_HandlePadData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __gIIEPadEvent_INTERFACE_DEFINED__ */


#ifndef __gIEDebugGUI_INTERFACE_DEFINED__
#define __gIEDebugGUI_INTERFACE_DEFINED__

/* interface gIEDebugGUI */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_gIEDebugGUI;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("E41F84E3-F211-4870-99F7-34C5826CEED5")
    gIEDebugGUI : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DebugDialog( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetDeviceHandle( 
            T_HANDLE __RPC_FAR *pHandle) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetDebugParam( 
            /* [in] */ BSTR key,
            /* [in] */ BSTR value) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetDebugParam( 
            /* [in] */ BSTR key,
            /* [out] */ BSTR __RPC_FAR *p_value) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct gIEDebugGUIVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            gIEDebugGUI __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            gIEDebugGUI __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            gIEDebugGUI __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            gIEDebugGUI __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            gIEDebugGUI __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            gIEDebugGUI __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            gIEDebugGUI __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *DebugDialog )( 
            gIEDebugGUI __RPC_FAR * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetDeviceHandle )( 
            gIEDebugGUI __RPC_FAR * This,
            T_HANDLE __RPC_FAR *pHandle);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *SetDebugParam )( 
            gIEDebugGUI __RPC_FAR * This,
            /* [in] */ BSTR key,
            /* [in] */ BSTR value);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetDebugParam )( 
            gIEDebugGUI __RPC_FAR * This,
            /* [in] */ BSTR key,
            /* [out] */ BSTR __RPC_FAR *p_value);
        
        END_INTERFACE
    } gIEDebugGUIVtbl;

    interface gIEDebugGUI
    {
        CONST_VTBL struct gIEDebugGUIVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define gIEDebugGUI_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define gIEDebugGUI_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define gIEDebugGUI_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define gIEDebugGUI_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define gIEDebugGUI_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define gIEDebugGUI_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define gIEDebugGUI_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define gIEDebugGUI_DebugDialog(This)	\
    (This)->lpVtbl -> DebugDialog(This)

#define gIEDebugGUI_GetDeviceHandle(This,pHandle)	\
    (This)->lpVtbl -> GetDeviceHandle(This,pHandle)

#define gIEDebugGUI_SetDebugParam(This,key,value)	\
    (This)->lpVtbl -> SetDebugParam(This,key,value)

#define gIEDebugGUI_GetDebugParam(This,key,p_value)	\
    (This)->lpVtbl -> GetDebugParam(This,key,p_value)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIEDebugGUI_DebugDialog_Proxy( 
    gIEDebugGUI __RPC_FAR * This);


void __RPC_STUB gIEDebugGUI_DebugDialog_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIEDebugGUI_GetDeviceHandle_Proxy( 
    gIEDebugGUI __RPC_FAR * This,
    T_HANDLE __RPC_FAR *pHandle);


void __RPC_STUB gIEDebugGUI_GetDeviceHandle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIEDebugGUI_SetDebugParam_Proxy( 
    gIEDebugGUI __RPC_FAR * This,
    /* [in] */ BSTR key,
    /* [in] */ BSTR value);


void __RPC_STUB gIEDebugGUI_SetDebugParam_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIEDebugGUI_GetDebugParam_Proxy( 
    gIEDebugGUI __RPC_FAR * This,
    /* [in] */ BSTR key,
    /* [out] */ BSTR __RPC_FAR *p_value);


void __RPC_STUB gIEDebugGUI_GetDebugParam_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __gIEDebugGUI_INTERFACE_DEFINED__ */


#ifndef __gIIEPad_INTERFACE_DEFINED__
#define __gIIEPad_INTERFACE_DEFINED__

/* interface gIIEPad */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_gIIEPad;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D85C50ED-C42D-4baa-986C-B9938203C98A")
    gIIEPad : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetNumDevices( 
            /* [out] */ int __RPC_FAR *p_iNumDevices) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OpenConnection( 
            /* [in] */ int iDeviceNum,
            /* [in] */ gIIEPadEvent __RPC_FAR *p_EventHandler) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CloseConnection( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnGetRanges( 
            /* [out] */ int __RPC_FAR *p_min_x,
            /* [out] */ int __RPC_FAR *p_max_x,
            /* [out] */ int __RPC_FAR *p_min_y,
            /* [out] */ int __RPC_FAR *p_max_y,
            /* [out] */ int __RPC_FAR *p_min_press,
            /* [out] */ int __RPC_FAR *p_max_press,
            /* [out] */ int __RPC_FAR *p_nButtons) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnSetMouseOn( 
            /* [in] */ boolean fState) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnGetMouseOn( 
            /* [out] */ boolean __RPC_FAR *p_fState) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnSetEventNotification( 
            /* [in] */ boolean fState) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnGetEventNotification( 
            /* [out] */ boolean __RPC_FAR *p_fState) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnGetSerialNumber( 
            /* [out] */ GUID __RPC_FAR *p_serialNum) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnPushMouseData( 
            /* [in] */ byte dx,
            /* [in] */ byte dy,
            /* [in] */ unsigned char bmButtons) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DisplayDebugGUI( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ShowConfigDialog( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnGetPhysicalExtents( 
            /* [out] */ double __RPC_FAR *pExtX,
            /* [out] */ double __RPC_FAR *pExtY) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ConnGetReportRate( 
            /* [out] */ int __RPC_FAR *p_nPackets,
            /* [out] */ int __RPC_FAR *p_milliseconds) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetFriendlyName( 
            /* [in] */ GUID __RPC_FAR *pSerialNum,
            /* [out] */ BSTR __RPC_FAR *pFriendlyName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetFriendlyName( 
            /* [in] */ GUID __RPC_FAR *pSerialNum,
            /* [in] */ BSTR FriendlyName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetSerialNumber( 
            /* [in] */ int iDeviceNum,
            /* [out] */ GUID __RPC_FAR *p_serialNum) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumSerialNumberHistory( 
            /* [in] */ int iDeviceNum,
            /* [out] */ GUID __RPC_FAR *p_serialNum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct gIIEPadVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            gIIEPad __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            gIIEPad __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            gIIEPad __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetNumDevices )( 
            gIIEPad __RPC_FAR * This,
            /* [out] */ int __RPC_FAR *p_iNumDevices);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *OpenConnection )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ int iDeviceNum,
            /* [in] */ gIIEPadEvent __RPC_FAR *p_EventHandler);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *CloseConnection )( 
            gIIEPad __RPC_FAR * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnGetRanges )( 
            gIIEPad __RPC_FAR * This,
            /* [out] */ int __RPC_FAR *p_min_x,
            /* [out] */ int __RPC_FAR *p_max_x,
            /* [out] */ int __RPC_FAR *p_min_y,
            /* [out] */ int __RPC_FAR *p_max_y,
            /* [out] */ int __RPC_FAR *p_min_press,
            /* [out] */ int __RPC_FAR *p_max_press,
            /* [out] */ int __RPC_FAR *p_nButtons);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnSetMouseOn )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ boolean fState);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnGetMouseOn )( 
            gIIEPad __RPC_FAR * This,
            /* [out] */ boolean __RPC_FAR *p_fState);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnSetEventNotification )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ boolean fState);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnGetEventNotification )( 
            gIIEPad __RPC_FAR * This,
            /* [out] */ boolean __RPC_FAR *p_fState);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnGetSerialNumber )( 
            gIIEPad __RPC_FAR * This,
            /* [out] */ GUID __RPC_FAR *p_serialNum);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnPushMouseData )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ byte dx,
            /* [in] */ byte dy,
            /* [in] */ unsigned char bmButtons);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *DisplayDebugGUI )( 
            gIIEPad __RPC_FAR * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ShowConfigDialog )( 
            gIIEPad __RPC_FAR * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnGetPhysicalExtents )( 
            gIIEPad __RPC_FAR * This,
            /* [out] */ double __RPC_FAR *pExtX,
            /* [out] */ double __RPC_FAR *pExtY);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *ConnGetReportRate )( 
            gIIEPad __RPC_FAR * This,
            /* [out] */ int __RPC_FAR *p_nPackets,
            /* [out] */ int __RPC_FAR *p_milliseconds);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetFriendlyName )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ GUID __RPC_FAR *pSerialNum,
            /* [out] */ BSTR __RPC_FAR *pFriendlyName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *SetFriendlyName )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ GUID __RPC_FAR *pSerialNum,
            /* [in] */ BSTR FriendlyName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetSerialNumber )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ int iDeviceNum,
            /* [out] */ GUID __RPC_FAR *p_serialNum);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *EnumSerialNumberHistory )( 
            gIIEPad __RPC_FAR * This,
            /* [in] */ int iDeviceNum,
            /* [out] */ GUID __RPC_FAR *p_serialNum);
        
        END_INTERFACE
    } gIIEPadVtbl;

    interface gIIEPad
    {
        CONST_VTBL struct gIIEPadVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define gIIEPad_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define gIIEPad_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define gIIEPad_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define gIIEPad_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define gIIEPad_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define gIIEPad_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define gIIEPad_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define gIIEPad_GetNumDevices(This,p_iNumDevices)	\
    (This)->lpVtbl -> GetNumDevices(This,p_iNumDevices)

#define gIIEPad_OpenConnection(This,iDeviceNum,p_EventHandler)	\
    (This)->lpVtbl -> OpenConnection(This,iDeviceNum,p_EventHandler)

#define gIIEPad_CloseConnection(This)	\
    (This)->lpVtbl -> CloseConnection(This)

#define gIIEPad_ConnGetRanges(This,p_min_x,p_max_x,p_min_y,p_max_y,p_min_press,p_max_press,p_nButtons)	\
    (This)->lpVtbl -> ConnGetRanges(This,p_min_x,p_max_x,p_min_y,p_max_y,p_min_press,p_max_press,p_nButtons)

#define gIIEPad_ConnSetMouseOn(This,fState)	\
    (This)->lpVtbl -> ConnSetMouseOn(This,fState)

#define gIIEPad_ConnGetMouseOn(This,p_fState)	\
    (This)->lpVtbl -> ConnGetMouseOn(This,p_fState)

#define gIIEPad_ConnSetEventNotification(This,fState)	\
    (This)->lpVtbl -> ConnSetEventNotification(This,fState)

#define gIIEPad_ConnGetEventNotification(This,p_fState)	\
    (This)->lpVtbl -> ConnGetEventNotification(This,p_fState)

#define gIIEPad_ConnGetSerialNumber(This,p_serialNum)	\
    (This)->lpVtbl -> ConnGetSerialNumber(This,p_serialNum)

#define gIIEPad_ConnPushMouseData(This,dx,dy,bmButtons)	\
    (This)->lpVtbl -> ConnPushMouseData(This,dx,dy,bmButtons)

#define gIIEPad_DisplayDebugGUI(This)	\
    (This)->lpVtbl -> DisplayDebugGUI(This)

#define gIIEPad_ShowConfigDialog(This)	\
    (This)->lpVtbl -> ShowConfigDialog(This)

#define gIIEPad_ConnGetPhysicalExtents(This,pExtX,pExtY)	\
    (This)->lpVtbl -> ConnGetPhysicalExtents(This,pExtX,pExtY)

#define gIIEPad_ConnGetReportRate(This,p_nPackets,p_milliseconds)	\
    (This)->lpVtbl -> ConnGetReportRate(This,p_nPackets,p_milliseconds)

#define gIIEPad_GetFriendlyName(This,pSerialNum,pFriendlyName)	\
    (This)->lpVtbl -> GetFriendlyName(This,pSerialNum,pFriendlyName)

#define gIIEPad_SetFriendlyName(This,pSerialNum,FriendlyName)	\
    (This)->lpVtbl -> SetFriendlyName(This,pSerialNum,FriendlyName)

#define gIIEPad_GetSerialNumber(This,iDeviceNum,p_serialNum)	\
    (This)->lpVtbl -> GetSerialNumber(This,iDeviceNum,p_serialNum)

#define gIIEPad_EnumSerialNumberHistory(This,iDeviceNum,p_serialNum)	\
    (This)->lpVtbl -> EnumSerialNumberHistory(This,iDeviceNum,p_serialNum)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_GetNumDevices_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ int __RPC_FAR *p_iNumDevices);


void __RPC_STUB gIIEPad_GetNumDevices_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_OpenConnection_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ int iDeviceNum,
    /* [in] */ gIIEPadEvent __RPC_FAR *p_EventHandler);


void __RPC_STUB gIIEPad_OpenConnection_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_CloseConnection_Proxy( 
    gIIEPad __RPC_FAR * This);


void __RPC_STUB gIIEPad_CloseConnection_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetRanges_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ int __RPC_FAR *p_min_x,
    /* [out] */ int __RPC_FAR *p_max_x,
    /* [out] */ int __RPC_FAR *p_min_y,
    /* [out] */ int __RPC_FAR *p_max_y,
    /* [out] */ int __RPC_FAR *p_min_press,
    /* [out] */ int __RPC_FAR *p_max_press,
    /* [out] */ int __RPC_FAR *p_nButtons);


void __RPC_STUB gIIEPad_ConnGetRanges_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnSetMouseOn_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ boolean fState);


void __RPC_STUB gIIEPad_ConnSetMouseOn_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetMouseOn_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ boolean __RPC_FAR *p_fState);


void __RPC_STUB gIIEPad_ConnGetMouseOn_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnSetEventNotification_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ boolean fState);


void __RPC_STUB gIIEPad_ConnSetEventNotification_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetEventNotification_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ boolean __RPC_FAR *p_fState);


void __RPC_STUB gIIEPad_ConnGetEventNotification_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetSerialNumber_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ GUID __RPC_FAR *p_serialNum);


void __RPC_STUB gIIEPad_ConnGetSerialNumber_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnPushMouseData_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ byte dx,
    /* [in] */ byte dy,
    /* [in] */ unsigned char bmButtons);


void __RPC_STUB gIIEPad_ConnPushMouseData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_DisplayDebugGUI_Proxy( 
    gIIEPad __RPC_FAR * This);


void __RPC_STUB gIIEPad_DisplayDebugGUI_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ShowConfigDialog_Proxy( 
    gIIEPad __RPC_FAR * This);


void __RPC_STUB gIIEPad_ShowConfigDialog_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetPhysicalExtents_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ double __RPC_FAR *pExtX,
    /* [out] */ double __RPC_FAR *pExtY);


void __RPC_STUB gIIEPad_ConnGetPhysicalExtents_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetReportRate_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ int __RPC_FAR *p_nPackets,
    /* [out] */ int __RPC_FAR *p_milliseconds);


void __RPC_STUB gIIEPad_ConnGetReportRate_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_GetFriendlyName_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ GUID __RPC_FAR *pSerialNum,
    /* [out] */ BSTR __RPC_FAR *pFriendlyName);


void __RPC_STUB gIIEPad_GetFriendlyName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_SetFriendlyName_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ GUID __RPC_FAR *pSerialNum,
    /* [in] */ BSTR FriendlyName);


void __RPC_STUB gIIEPad_SetFriendlyName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_GetSerialNumber_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ int iDeviceNum,
    /* [out] */ GUID __RPC_FAR *p_serialNum);


void __RPC_STUB gIIEPad_GetSerialNumber_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_EnumSerialNumberHistory_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ int iDeviceNum,
    /* [out] */ GUID __RPC_FAR *p_serialNum);


void __RPC_STUB gIIEPad_EnumSerialNumberHistory_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __gIIEPad_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long __RPC_FAR *, unsigned long            , BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long __RPC_FAR *, BSTR __RPC_FAR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


