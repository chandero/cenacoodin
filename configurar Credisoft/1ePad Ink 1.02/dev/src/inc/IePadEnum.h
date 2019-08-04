/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Fri Oct 04 09:23:53 2002
 */
/* Compiler settings for W:\interlink.cvs\pid000002\src\IePadEnum\IePadEnum.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
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

#ifndef __IePadEnum_h__
#define __IePadEnum_h__

#ifdef __cplusplus
extern "C"{
#endif 

/* Forward Declarations */ 

#ifndef __IIEPadEnum_FWD_DEFINED__
#define __IIEPadEnum_FWD_DEFINED__
typedef interface IIEPadEnum IIEPadEnum;
#endif 	/* __IIEPadEnum_FWD_DEFINED__ */


#ifndef __IEPadEnum_FWD_DEFINED__
#define __IEPadEnum_FWD_DEFINED__

#ifdef __cplusplus
typedef class IEPadEnum IEPadEnum;
#else
typedef struct IEPadEnum IEPadEnum;
#endif /* __cplusplus */

#endif 	/* __IEPadEnum_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "g_IIEPad.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

#ifndef __IIEPadEnum_INTERFACE_DEFINED__
#define __IIEPadEnum_INTERFACE_DEFINED__

/* interface IIEPadEnum */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IIEPadEnum;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1CCF63C0-E314-46BD-A45A-7493A33FC0F4")
    IIEPadEnum : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DisplayDebugGUI( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetNumProviders( 
            int __RPC_FAR *pNumProviders) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetClassID( 
            int iProvider,
            GUID __RPC_FAR *pClassID) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddService( 
            GUID __RPC_FAR *pClassID) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RemoveService( 
            GUID __RPC_FAR *pClassID) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetProviderDescription( 
            GUID __RPC_FAR *pClassID,
            BSTR __RPC_FAR *p_bDescription) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetProviderDescription( 
            GUID __RPC_FAR *pClassID,
            BSTR bDescription) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IIEPadEnumVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IIEPadEnum __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IIEPadEnum __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IIEPadEnum __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IIEPadEnum __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IIEPadEnum __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IIEPadEnum __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IIEPadEnum __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *DisplayDebugGUI )( 
            IIEPadEnum __RPC_FAR * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetNumProviders )( 
            IIEPadEnum __RPC_FAR * This,
            int __RPC_FAR *pNumProviders);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetClassID )( 
            IIEPadEnum __RPC_FAR * This,
            int iProvider,
            GUID __RPC_FAR *pClassID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *AddService )( 
            IIEPadEnum __RPC_FAR * This,
            GUID __RPC_FAR *pClassID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *RemoveService )( 
            IIEPadEnum __RPC_FAR * This,
            GUID __RPC_FAR *pClassID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetProviderDescription )( 
            IIEPadEnum __RPC_FAR * This,
            GUID __RPC_FAR *pClassID,
            BSTR __RPC_FAR *p_bDescription);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *SetProviderDescription )( 
            IIEPadEnum __RPC_FAR * This,
            GUID __RPC_FAR *pClassID,
            BSTR bDescription);
        
        END_INTERFACE
    } IIEPadEnumVtbl;

    interface IIEPadEnum
    {
        CONST_VTBL struct IIEPadEnumVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IIEPadEnum_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IIEPadEnum_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IIEPadEnum_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IIEPadEnum_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IIEPadEnum_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IIEPadEnum_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IIEPadEnum_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IIEPadEnum_DisplayDebugGUI(This)	\
    (This)->lpVtbl -> DisplayDebugGUI(This)

#define IIEPadEnum_GetNumProviders(This,pNumProviders)	\
    (This)->lpVtbl -> GetNumProviders(This,pNumProviders)

#define IIEPadEnum_GetClassID(This,iProvider,pClassID)	\
    (This)->lpVtbl -> GetClassID(This,iProvider,pClassID)

#define IIEPadEnum_AddService(This,pClassID)	\
    (This)->lpVtbl -> AddService(This,pClassID)

#define IIEPadEnum_RemoveService(This,pClassID)	\
    (This)->lpVtbl -> RemoveService(This,pClassID)

#define IIEPadEnum_GetProviderDescription(This,pClassID,p_bDescription)	\
    (This)->lpVtbl -> GetProviderDescription(This,pClassID,p_bDescription)

#define IIEPadEnum_SetProviderDescription(This,pClassID,bDescription)	\
    (This)->lpVtbl -> SetProviderDescription(This,pClassID,bDescription)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IIEPadEnum_DisplayDebugGUI_Proxy( 
    IIEPadEnum __RPC_FAR * This);


void __RPC_STUB IIEPadEnum_DisplayDebugGUI_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IIEPadEnum_GetNumProviders_Proxy( 
    IIEPadEnum __RPC_FAR * This,
    int __RPC_FAR *pNumProviders);


void __RPC_STUB IIEPadEnum_GetNumProviders_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IIEPadEnum_GetClassID_Proxy( 
    IIEPadEnum __RPC_FAR * This,
    int iProvider,
    GUID __RPC_FAR *pClassID);


void __RPC_STUB IIEPadEnum_GetClassID_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IIEPadEnum_AddService_Proxy( 
    IIEPadEnum __RPC_FAR * This,
    GUID __RPC_FAR *pClassID);


void __RPC_STUB IIEPadEnum_AddService_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IIEPadEnum_RemoveService_Proxy( 
    IIEPadEnum __RPC_FAR * This,
    GUID __RPC_FAR *pClassID);


void __RPC_STUB IIEPadEnum_RemoveService_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IIEPadEnum_GetProviderDescription_Proxy( 
    IIEPadEnum __RPC_FAR * This,
    GUID __RPC_FAR *pClassID,
    BSTR __RPC_FAR *p_bDescription);


void __RPC_STUB IIEPadEnum_GetProviderDescription_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IIEPadEnum_SetProviderDescription_Proxy( 
    IIEPadEnum __RPC_FAR * This,
    GUID __RPC_FAR *pClassID,
    BSTR bDescription);


void __RPC_STUB IIEPadEnum_SetProviderDescription_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IIEPadEnum_INTERFACE_DEFINED__ */



#ifndef __IEPADENUMLib_LIBRARY_DEFINED__
#define __IEPADENUMLib_LIBRARY_DEFINED__

/* library IEPADENUMLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_IEPADENUMLib;

EXTERN_C const CLSID CLSID_IEPadEnum;

#ifdef __cplusplus

class DECLSPEC_UUID("705AC2E5-E571-4760-9D9D-3D4D61AFBF15")
IEPadEnum;
#endif
#endif /* __IEPADENUMLib_LIBRARY_DEFINED__ */

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
