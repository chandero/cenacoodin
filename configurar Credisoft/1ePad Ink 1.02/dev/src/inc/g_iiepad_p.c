
#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the proxy stub code */


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

#if !defined(_M_IA64) && !defined(_M_AXP64)

/* verify that the <rpcproxy.h> version is high enough to compile this file*/
#ifndef __REDQ_RPCPROXY_H_VERSION__
#define __REQUIRED_RPCPROXY_H_VERSION__ 440
#endif


#include "rpcproxy.h"
#ifndef __RPCPROXY_H_VERSION__
#error this stub requires an updated version of <rpcproxy.h>
#endif // __RPCPROXY_H_VERSION__


#include "g_iiepad.h"

#define TYPE_FORMAT_STRING_SIZE   131                               
#define PROC_FORMAT_STRING_SIZE   163                               
#define TRANSMIT_AS_TABLE_SIZE    0            
#define WIRE_MARSHAL_TABLE_SIZE   1            

typedef struct _MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } MIDL_TYPE_FORMAT_STRING;

typedef struct _MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } MIDL_PROC_FORMAT_STRING;


extern const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString;
extern const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString;


/* Standard interface: __MIDL_itf_g_iiepad_0000, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}} */


/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: IDispatch, ver. 0.0,
   GUID={0x00020400,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: gIIEPadEvent, ver. 0.0,
   GUID={0xD55113D0,0x95C8,0x4427,{0x9A,0xAD,0xEB,0x8B,0xC1,0xEC,0xB4,0xD9}} */


extern const MIDL_STUB_DESC Object_StubDesc;


#pragma code_seg(".orpc")

/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPadEvent_HandlePadData_Proxy( 
    gIIEPadEvent __RPC_FAR * This,
    int abs_x,
    int abs_y,
    int pressure,
    boolean fTouch,
    boolean fTap,
    int buttonState,
    unsigned long dwTimeStamp,
    unsigned long dwSequenceNum)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      7);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 4U + 4U + 4U + 1U + 2U + 11U + 7U + 7U;
            NdrProxyGetBuffer(This, &_StubMsg);
            *(( int __RPC_FAR * )_StubMsg.Buffer)++ = abs_x;
            
            *(( int __RPC_FAR * )_StubMsg.Buffer)++ = abs_y;
            
            *(( int __RPC_FAR * )_StubMsg.Buffer)++ = pressure;
            
            *(( boolean __RPC_FAR * )_StubMsg.Buffer)++ = fTouch;
            
            *(( boolean __RPC_FAR * )_StubMsg.Buffer)++ = fTap;
            
            _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            *(( int __RPC_FAR * )_StubMsg.Buffer)++ = buttonState;
            
            *(( unsigned long __RPC_FAR * )_StubMsg.Buffer)++ = dwTimeStamp;
            
            *(( unsigned long __RPC_FAR * )_StubMsg.Buffer)++ = dwSequenceNum;
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[0] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPadEvent_HandlePadData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    int abs_x;
    int abs_y;
    int buttonState;
    unsigned long dwSequenceNum;
    unsigned long dwTimeStamp;
    boolean fTap;
    boolean fTouch;
    int pressure;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[0] );
        
        abs_x = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        abs_y = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        pressure = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        fTouch = *(( boolean __RPC_FAR * )_StubMsg.Buffer)++;
        
        fTap = *(( boolean __RPC_FAR * )_StubMsg.Buffer)++;
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        buttonState = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        dwTimeStamp = *(( unsigned long __RPC_FAR * )_StubMsg.Buffer)++;
        
        dwSequenceNum = *(( unsigned long __RPC_FAR * )_StubMsg.Buffer)++;
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPadEvent*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> HandlePadData(
                 (gIIEPadEvent *) ((CStdStubBuffer *)This)->pvServerObject,
                 abs_x,
                 abs_y,
                 pressure,
                 fTouch,
                 fTap,
                 buttonState,
                 dwTimeStamp,
                 dwSequenceNum);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}

CINTERFACE_PROXY_VTABLE(8) _gIIEPadEventProxyVtbl = 
{
    &IID_gIIEPadEvent,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    0 /* IDispatch_GetTypeInfoCount_Proxy */ ,
    0 /* IDispatch_GetTypeInfo_Proxy */ ,
    0 /* IDispatch_GetIDsOfNames_Proxy */ ,
    0 /* IDispatch_Invoke_Proxy */ ,
    gIIEPadEvent_HandlePadData_Proxy
};


static const PRPC_STUB_FUNCTION gIIEPadEvent_table[] =
{
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    gIIEPadEvent_HandlePadData_Stub
};

CInterfaceStubVtbl _gIIEPadEventStubVtbl =
{
    &IID_gIIEPadEvent,
    0,
    8,
    &gIIEPadEvent_table[-3],
    CStdStubBuffer_DELEGATING_METHODS
};


/* Object interface: gIEDebugGUI, ver. 0.0,
   GUID={0xE41F84E3,0xF211,0x4870,{0x99,0xF7,0x34,0xC5,0x82,0x6C,0xEE,0xD5}} */


extern const MIDL_STUB_DESC Object_StubDesc;


#pragma code_seg(".orpc")

/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIEDebugGUI_DebugDialog_Proxy( 
    gIEDebugGUI __RPC_FAR * This)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      7);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[18] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIEDebugGUI_DebugDialog_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIEDebugGUI*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> DebugDialog((gIEDebugGUI *) ((CStdStubBuffer *)This)->pvServerObject);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIEDebugGUI_GetDeviceHandle_Proxy( 
    gIEDebugGUI __RPC_FAR * This,
    T_HANDLE __RPC_FAR *pHandle)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      8);
        
        
        
        if(!pHandle)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrSimpleStructBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR *)pHandle,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[12] );
            
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrSimpleStructMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                     (unsigned char __RPC_FAR *)pHandle,
                                     (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[12] );
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[20] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIEDebugGUI_GetDeviceHandle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    T_HANDLE __RPC_FAR *pHandle;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( T_HANDLE __RPC_FAR * )pHandle = 0;
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[20] );
        
        NdrSimpleStructUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                   (unsigned char __RPC_FAR * __RPC_FAR *)&pHandle,
                                   (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[12],
                                   (unsigned char)0 );
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIEDebugGUI*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> GetDeviceHandle((gIEDebugGUI *) ((CStdStubBuffer *)This)->pvServerObject,pHandle);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIEDebugGUI_SetDebugParam_Proxy( 
    gIEDebugGUI __RPC_FAR * This,
    /* [in] */ BSTR key,
    /* [in] */ BSTR value)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      9);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 8U + 15U;
            NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                      (unsigned char __RPC_FAR *)&key,
                                      (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46] );
            
            NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                      (unsigned char __RPC_FAR *)&value,
                                      (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46] );
            
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                    (unsigned char __RPC_FAR *)&key,
                                    (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46] );
            
            NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                    (unsigned char __RPC_FAR *)&value,
                                    (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46] );
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[26] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIEDebugGUI_SetDebugParam_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    void __RPC_FAR *_p_key;
    void __RPC_FAR *_p_value;
    BSTR key;
    BSTR value;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    _p_key = &key;
    MIDL_memset(
               _p_key,
               0,
               sizeof( BSTR  ));
    _p_value = &value;
    MIDL_memset(
               _p_value,
               0,
               sizeof( BSTR  ));
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[26] );
        
        NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_key,
                                  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46],
                                  (unsigned char)0 );
        
        NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_value,
                                  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46],
                                  (unsigned char)0 );
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIEDebugGUI*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> SetDebugParam(
                 (gIEDebugGUI *) ((CStdStubBuffer *)This)->pvServerObject,
                 key,
                 value);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        NdrUserMarshalFree( &_StubMsg,
                            (unsigned char __RPC_FAR *)&key,
                            &__MIDL_TypeFormatString.Format[46] );
        
        NdrUserMarshalFree( &_StubMsg,
                            (unsigned char __RPC_FAR *)&value,
                            &__MIDL_TypeFormatString.Format[46] );
        
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIEDebugGUI_GetDebugParam_Proxy( 
    gIEDebugGUI __RPC_FAR * This,
    /* [in] */ BSTR key,
    /* [out] */ BSTR __RPC_FAR *p_value)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    if(p_value)
        {
        MIDL_memset(
               p_value,
               0,
               sizeof( BSTR  ));
        }
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      10);
        
        
        
        if(!p_value)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 8U;
            NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                      (unsigned char __RPC_FAR *)&key,
                                      (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46] );
            
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                    (unsigned char __RPC_FAR *)&key,
                                    (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46] );
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[36] );
            
            NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                      (unsigned char __RPC_FAR * __RPC_FAR *)&p_value,
                                      (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[64],
                                      (unsigned char)0 );
            
            _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[56],
                         ( void __RPC_FAR * )p_value);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIEDebugGUI_GetDebugParam_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    BSTR _M0;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    void __RPC_FAR *_p_key;
    BSTR key;
    BSTR __RPC_FAR *p_value;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    _p_key = &key;
    MIDL_memset(
               _p_key,
               0,
               sizeof( BSTR  ));
    ( BSTR __RPC_FAR * )p_value = 0;
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[36] );
        
        NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_key,
                                  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46],
                                  (unsigned char)0 );
        
        p_value = &_M0;
        MIDL_memset(
               p_value,
               0,
               sizeof( BSTR  ));
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIEDebugGUI*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> GetDebugParam(
                 (gIEDebugGUI *) ((CStdStubBuffer *)This)->pvServerObject,
                 key,
                 p_value);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 8U + 11U;
        NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                  (unsigned char __RPC_FAR *)p_value,
                                  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[64] );
        
        _StubMsg.BufferLength += 16;
        
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                (unsigned char __RPC_FAR *)p_value,
                                (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[64] );
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        NdrUserMarshalFree( &_StubMsg,
                            (unsigned char __RPC_FAR *)&key,
                            &__MIDL_TypeFormatString.Format[46] );
        
        NdrPointerFree( &_StubMsg,
                        (unsigned char __RPC_FAR *)p_value,
                        &__MIDL_TypeFormatString.Format[56] );
        
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}

CINTERFACE_PROXY_VTABLE(11) _gIEDebugGUIProxyVtbl = 
{
    &IID_gIEDebugGUI,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    0 /* IDispatch_GetTypeInfoCount_Proxy */ ,
    0 /* IDispatch_GetTypeInfo_Proxy */ ,
    0 /* IDispatch_GetIDsOfNames_Proxy */ ,
    0 /* IDispatch_Invoke_Proxy */ ,
    gIEDebugGUI_DebugDialog_Proxy ,
    gIEDebugGUI_GetDeviceHandle_Proxy ,
    gIEDebugGUI_SetDebugParam_Proxy ,
    gIEDebugGUI_GetDebugParam_Proxy
};


static const PRPC_STUB_FUNCTION gIEDebugGUI_table[] =
{
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    gIEDebugGUI_DebugDialog_Stub,
    gIEDebugGUI_GetDeviceHandle_Stub,
    gIEDebugGUI_SetDebugParam_Stub,
    gIEDebugGUI_GetDebugParam_Stub
};

CInterfaceStubVtbl _gIEDebugGUIStubVtbl =
{
    &IID_gIEDebugGUI,
    0,
    11,
    &gIEDebugGUI_table[-3],
    CStdStubBuffer_DELEGATING_METHODS
};


/* Object interface: gIIEPad, ver. 0.0,
   GUID={0xD85C50ED,0xC42D,0x4baa,{0x98,0x6C,0xB9,0x93,0x82,0x03,0xC9,0x8A}} */


extern const MIDL_STUB_DESC Object_StubDesc;


#pragma code_seg(".orpc")

/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_GetNumDevices_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ int __RPC_FAR *p_iNumDevices)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      7);
        
        
        
        if(!p_iNumDevices)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[46] );
            
            *p_iNumDevices = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_iNumDevices);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_GetNumDevices_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    int _M1;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    int __RPC_FAR *p_iNumDevices;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( int __RPC_FAR * )p_iNumDevices = 0;
    RpcTryFinally
        {
        p_iNumDevices = &_M1;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> GetNumDevices((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,p_iNumDevices);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U + 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_iNumDevices;
        
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_OpenConnection_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ int iDeviceNum,
    /* [in] */ gIIEPadEvent __RPC_FAR *p_EventHandler)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      8);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 4U + 0U;
            NdrInterfacePointerBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                           (unsigned char __RPC_FAR *)p_EventHandler,
                                           (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[78] );
            
            NdrProxyGetBuffer(This, &_StubMsg);
            *(( int __RPC_FAR * )_StubMsg.Buffer)++ = iDeviceNum;
            
            NdrInterfacePointerMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                         (unsigned char __RPC_FAR *)p_EventHandler,
                                         (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[78] );
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[52] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_OpenConnection_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    int iDeviceNum;
    gIIEPadEvent __RPC_FAR *p_EventHandler;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    p_EventHandler = 0;
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[52] );
        
        iDeviceNum = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        NdrInterfacePointerUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR * __RPC_FAR *)&p_EventHandler,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[78],
                                       (unsigned char)0 );
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> OpenConnection(
                  (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                  iDeviceNum,
                  p_EventHandler);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        NdrInterfacePointerFree( &_StubMsg,
                                 (unsigned char __RPC_FAR *)p_EventHandler,
                                 &__MIDL_TypeFormatString.Format[78] );
        
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_CloseConnection_Proxy( 
    gIIEPad __RPC_FAR * This)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      9);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[18] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_CloseConnection_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> CloseConnection((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetRanges_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ int __RPC_FAR *p_min_x,
    /* [out] */ int __RPC_FAR *p_max_x,
    /* [out] */ int __RPC_FAR *p_min_y,
    /* [out] */ int __RPC_FAR *p_max_y,
    /* [out] */ int __RPC_FAR *p_min_press,
    /* [out] */ int __RPC_FAR *p_max_press,
    /* [out] */ int __RPC_FAR *p_nButtons)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      10);
        
        
        
        if(!p_min_x)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!p_max_x)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!p_min_y)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!p_max_y)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!p_min_press)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!p_max_press)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!p_nButtons)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[60] );
            
            *p_min_x = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            *p_max_x = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            *p_min_y = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            *p_max_y = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            *p_min_press = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            *p_max_press = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            *p_nButtons = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_min_x);
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_max_x);
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_min_y);
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_max_y);
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_min_press);
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_max_press);
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_nButtons);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnGetRanges_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    int _M2;
    int _M3;
    int _M4;
    int _M5;
    int _M6;
    int _M7;
    int _M8;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    int __RPC_FAR *p_max_press;
    int __RPC_FAR *p_max_x;
    int __RPC_FAR *p_max_y;
    int __RPC_FAR *p_min_press;
    int __RPC_FAR *p_min_x;
    int __RPC_FAR *p_min_y;
    int __RPC_FAR *p_nButtons;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( int __RPC_FAR * )p_min_x = 0;
    ( int __RPC_FAR * )p_max_x = 0;
    ( int __RPC_FAR * )p_min_y = 0;
    ( int __RPC_FAR * )p_max_y = 0;
    ( int __RPC_FAR * )p_min_press = 0;
    ( int __RPC_FAR * )p_max_press = 0;
    ( int __RPC_FAR * )p_nButtons = 0;
    RpcTryFinally
        {
        p_min_x = &_M2;
        p_max_x = &_M3;
        p_min_y = &_M4;
        p_max_y = &_M5;
        p_min_press = &_M6;
        p_max_press = &_M7;
        p_nButtons = &_M8;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnGetRanges(
                 (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                 p_min_x,
                 p_max_x,
                 p_min_y,
                 p_max_y,
                 p_min_press,
                 p_max_press,
                 p_nButtons);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U + 4U + 4U + 4U + 4U + 4U + 4U + 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_min_x;
        
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_max_x;
        
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_min_y;
        
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_max_y;
        
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_min_press;
        
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_max_press;
        
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_nButtons;
        
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnSetMouseOn_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ boolean fState)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      11);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 1U;
            NdrProxyGetBuffer(This, &_StubMsg);
            *(( boolean __RPC_FAR * )_StubMsg.Buffer)++ = fState;
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[90] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnSetMouseOn_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    boolean fState;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[90] );
        
        fState = *(( boolean __RPC_FAR * )_StubMsg.Buffer)++;
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnSetMouseOn((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,fState);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetMouseOn_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ boolean __RPC_FAR *p_fState)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      12);
        
        
        
        if(!p_fState)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[94] );
            
            *p_fState = *(( boolean __RPC_FAR * )_StubMsg.Buffer)++;
            
            _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[96],
                         ( void __RPC_FAR * )p_fState);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnGetMouseOn_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    boolean _M9;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    boolean __RPC_FAR *p_fState;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( boolean __RPC_FAR * )p_fState = 0;
    RpcTryFinally
        {
        p_fState = &_M9;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnGetMouseOn((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,p_fState);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 1U + 7U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( boolean __RPC_FAR * )_StubMsg.Buffer)++ = *p_fState;
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnSetEventNotification_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ boolean fState)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      13);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 1U;
            NdrProxyGetBuffer(This, &_StubMsg);
            *(( boolean __RPC_FAR * )_StubMsg.Buffer)++ = fState;
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[90] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnSetEventNotification_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    boolean fState;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[90] );
        
        fState = *(( boolean __RPC_FAR * )_StubMsg.Buffer)++;
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnSetEventNotification((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,fState);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetEventNotification_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ boolean __RPC_FAR *p_fState)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      14);
        
        
        
        if(!p_fState)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[94] );
            
            *p_fState = *(( boolean __RPC_FAR * )_StubMsg.Buffer)++;
            
            _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[96],
                         ( void __RPC_FAR * )p_fState);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnGetEventNotification_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    boolean _M10;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    boolean __RPC_FAR *p_fState;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( boolean __RPC_FAR * )p_fState = 0;
    RpcTryFinally
        {
        p_fState = &_M10;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnGetEventNotification((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,p_fState);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 1U + 7U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( boolean __RPC_FAR * )_StubMsg.Buffer)++ = *p_fState;
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetSerialNumber_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ GUID __RPC_FAR *p_serialNum)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    if(p_serialNum)
        {
        MIDL_memset(
               p_serialNum,
               0,
               sizeof( GUID  ));
        }
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      15);
        
        
        
        if(!p_serialNum)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[100] );
            
            NdrSimpleStructUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR * __RPC_FAR *)&p_serialNum,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110],
                                       (unsigned char)0 );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[100],
                         ( void __RPC_FAR * )p_serialNum);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnGetSerialNumber_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    GUID _p_serialNumM;
    GUID __RPC_FAR *p_serialNum;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( GUID __RPC_FAR * )p_serialNum = 0;
    RpcTryFinally
        {
        p_serialNum = &_p_serialNumM;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnGetSerialNumber((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,p_serialNum);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 0U + 11U;
        NdrSimpleStructBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                   (unsigned char __RPC_FAR *)p_serialNum,
                                   (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
        
        _StubMsg.BufferLength += 16;
        
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        NdrSimpleStructMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                 (unsigned char __RPC_FAR *)p_serialNum,
                                 (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
        
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnPushMouseData_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ byte dx,
    /* [in] */ byte dy,
    /* [in] */ unsigned char bmButtons)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      16);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 1U + 1U + 1U;
            NdrProxyGetBuffer(This, &_StubMsg);
            *(( byte __RPC_FAR * )_StubMsg.Buffer)++ = dx;
            
            *(( byte __RPC_FAR * )_StubMsg.Buffer)++ = dy;
            
            *(( unsigned char __RPC_FAR * )_StubMsg.Buffer)++ = bmButtons;
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[106] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnPushMouseData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    unsigned char bmButtons;
    byte dx;
    byte dy;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[106] );
        
        dx = *(( byte __RPC_FAR * )_StubMsg.Buffer)++;
        
        dy = *(( byte __RPC_FAR * )_StubMsg.Buffer)++;
        
        bmButtons = *(( unsigned char __RPC_FAR * )_StubMsg.Buffer)++;
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnPushMouseData(
                     (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                     dx,
                     dy,
                     bmButtons);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_DisplayDebugGUI_Proxy( 
    gIIEPad __RPC_FAR * This)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      17);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[18] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_DisplayDebugGUI_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> DisplayDebugGUI((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ShowConfigDialog_Proxy( 
    gIIEPad __RPC_FAR * This)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      18);
        
        
        
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[18] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ShowConfigDialog_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    RpcTryFinally
        {
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ShowConfigDialog((gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetPhysicalExtents_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ double __RPC_FAR *pExtX,
    /* [out] */ double __RPC_FAR *pExtY)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      19);
        
        
        
        if(!pExtX)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!pExtY)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[114] );
            
            *pExtX = *(( double __RPC_FAR * )_StubMsg.Buffer)++;
            
            *pExtY = *(( double __RPC_FAR * )_StubMsg.Buffer)++;
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[122],
                         ( void __RPC_FAR * )pExtX);
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[122],
                         ( void __RPC_FAR * )pExtY);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnGetPhysicalExtents_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    double _M11;
    double _M12;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    double __RPC_FAR *pExtX;
    double __RPC_FAR *pExtY;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( double __RPC_FAR * )pExtX = 0;
    ( double __RPC_FAR * )pExtY = 0;
    RpcTryFinally
        {
        pExtX = &_M11;
        pExtY = &_M12;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnGetPhysicalExtents(
                          (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                          pExtX,
                          pExtY);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 8U + 8U + 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( double __RPC_FAR * )_StubMsg.Buffer)++ = *pExtX;
        
        *(( double __RPC_FAR * )_StubMsg.Buffer)++ = *pExtY;
        
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_ConnGetReportRate_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [out] */ int __RPC_FAR *p_nPackets,
    /* [out] */ int __RPC_FAR *p_milliseconds)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      20);
        
        
        
        if(!p_nPackets)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!p_milliseconds)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[124] );
            
            *p_nPackets = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            *p_milliseconds = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_nPackets);
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[74],
                         ( void __RPC_FAR * )p_milliseconds);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_ConnGetReportRate_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    int _M13;
    int _M14;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    int __RPC_FAR *p_milliseconds;
    int __RPC_FAR *p_nPackets;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( int __RPC_FAR * )p_nPackets = 0;
    ( int __RPC_FAR * )p_milliseconds = 0;
    RpcTryFinally
        {
        p_nPackets = &_M13;
        p_milliseconds = &_M14;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> ConnGetReportRate(
                     (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                     p_nPackets,
                     p_milliseconds);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U + 4U + 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_nPackets;
        
        *(( int __RPC_FAR * )_StubMsg.Buffer)++ = *p_milliseconds;
        
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_GetFriendlyName_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ GUID __RPC_FAR *pSerialNum,
    /* [out] */ BSTR __RPC_FAR *pFriendlyName)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    if(pFriendlyName)
        {
        MIDL_memset(
               pFriendlyName,
               0,
               sizeof( BSTR  ));
        }
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      21);
        
        
        
        if(!pSerialNum)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        if(!pFriendlyName)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U;
            NdrSimpleStructBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR *)pSerialNum,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
            
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrSimpleStructMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                     (unsigned char __RPC_FAR *)pSerialNum,
                                     (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[134] );
            
            NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                      (unsigned char __RPC_FAR * __RPC_FAR *)&pFriendlyName,
                                      (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[64],
                                      (unsigned char)0 );
            
            _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[56],
                         ( void __RPC_FAR * )pFriendlyName);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_GetFriendlyName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    BSTR _M15;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    BSTR __RPC_FAR *pFriendlyName;
    GUID __RPC_FAR *pSerialNum;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( GUID __RPC_FAR * )pSerialNum = 0;
    ( BSTR __RPC_FAR * )pFriendlyName = 0;
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[134] );
        
        NdrSimpleStructUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                   (unsigned char __RPC_FAR * __RPC_FAR *)&pSerialNum,
                                   (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110],
                                   (unsigned char)0 );
        
        pFriendlyName = &_M15;
        MIDL_memset(
               pFriendlyName,
               0,
               sizeof( BSTR  ));
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> GetFriendlyName(
                   (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                   pSerialNum,
                   pFriendlyName);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 8U + 11U;
        NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                  (unsigned char __RPC_FAR *)pFriendlyName,
                                  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[64] );
        
        _StubMsg.BufferLength += 16;
        
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                (unsigned char __RPC_FAR *)pFriendlyName,
                                (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[64] );
        
        _StubMsg.Buffer = (unsigned char __RPC_FAR *)(((long)_StubMsg.Buffer + 3) & ~ 0x3);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        NdrPointerFree( &_StubMsg,
                        (unsigned char __RPC_FAR *)pFriendlyName,
                        &__MIDL_TypeFormatString.Format[56] );
        
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_SetFriendlyName_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ GUID __RPC_FAR *pSerialNum,
    /* [in] */ BSTR FriendlyName)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      22);
        
        
        
        if(!pSerialNum)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 0U + 15U;
            NdrSimpleStructBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR *)pSerialNum,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
            
            NdrUserMarshalBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                      (unsigned char __RPC_FAR *)&FriendlyName,
                                      (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46] );
            
            NdrProxyGetBuffer(This, &_StubMsg);
            NdrSimpleStructMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                     (unsigned char __RPC_FAR *)pSerialNum,
                                     (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
            
            NdrUserMarshalMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                    (unsigned char __RPC_FAR *)&FriendlyName,
                                    (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46] );
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[144] );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_SetFriendlyName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    BSTR FriendlyName;
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    void __RPC_FAR *_p_FriendlyName;
    GUID __RPC_FAR *pSerialNum;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( GUID __RPC_FAR * )pSerialNum = 0;
    _p_FriendlyName = &FriendlyName;
    MIDL_memset(
               _p_FriendlyName,
               0,
               sizeof( BSTR  ));
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[144] );
        
        NdrSimpleStructUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                   (unsigned char __RPC_FAR * __RPC_FAR *)&pSerialNum,
                                   (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110],
                                   (unsigned char)0 );
        
        NdrUserMarshalUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                  (unsigned char __RPC_FAR * __RPC_FAR *)&_p_FriendlyName,
                                  (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[46],
                                  (unsigned char)0 );
        
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> SetFriendlyName(
                   (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                   pSerialNum,
                   FriendlyName);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 4U;
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        NdrUserMarshalFree( &_StubMsg,
                            (unsigned char __RPC_FAR *)&FriendlyName,
                            &__MIDL_TypeFormatString.Format[46] );
        
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_GetSerialNumber_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ int iDeviceNum,
    /* [out] */ GUID __RPC_FAR *p_serialNum)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    if(p_serialNum)
        {
        MIDL_memset(
               p_serialNum,
               0,
               sizeof( GUID  ));
        }
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      23);
        
        
        
        if(!p_serialNum)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 4U;
            NdrProxyGetBuffer(This, &_StubMsg);
            *(( int __RPC_FAR * )_StubMsg.Buffer)++ = iDeviceNum;
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[154] );
            
            NdrSimpleStructUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR * __RPC_FAR *)&p_serialNum,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110],
                                       (unsigned char)0 );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[100],
                         ( void __RPC_FAR * )p_serialNum);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_GetSerialNumber_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    GUID _p_serialNumM;
    int iDeviceNum;
    GUID __RPC_FAR *p_serialNum;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( GUID __RPC_FAR * )p_serialNum = 0;
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[154] );
        
        iDeviceNum = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        p_serialNum = &_p_serialNumM;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> GetSerialNumber(
                   (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                   iDeviceNum,
                   p_serialNum);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 0U + 11U;
        NdrSimpleStructBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                   (unsigned char __RPC_FAR *)p_serialNum,
                                   (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
        
        _StubMsg.BufferLength += 16;
        
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        NdrSimpleStructMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                 (unsigned char __RPC_FAR *)p_serialNum,
                                 (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
        
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}


/* [helpstring][id] */ HRESULT STDMETHODCALLTYPE gIIEPad_EnumSerialNumberHistory_Proxy( 
    gIIEPad __RPC_FAR * This,
    /* [in] */ int iDeviceNum,
    /* [out] */ GUID __RPC_FAR *p_serialNum)
{

    HRESULT _RetVal;
    
    RPC_MESSAGE _RpcMessage;
    
    MIDL_STUB_MESSAGE _StubMsg;
    
    if(p_serialNum)
        {
        MIDL_memset(
               p_serialNum,
               0,
               sizeof( GUID  ));
        }
    RpcTryExcept
        {
        NdrProxyInitialize(
                      ( void __RPC_FAR *  )This,
                      ( PRPC_MESSAGE  )&_RpcMessage,
                      ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                      ( PMIDL_STUB_DESC  )&Object_StubDesc,
                      24);
        
        
        
        if(!p_serialNum)
            {
            RpcRaiseException(RPC_X_NULL_REF_POINTER);
            }
        RpcTryFinally
            {
            
            _StubMsg.BufferLength = 4U;
            NdrProxyGetBuffer(This, &_StubMsg);
            *(( int __RPC_FAR * )_StubMsg.Buffer)++ = iDeviceNum;
            
            NdrProxySendReceive(This, &_StubMsg);
            
            if ( (_RpcMessage.DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
                NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[154] );
            
            NdrSimpleStructUnmarshall( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                       (unsigned char __RPC_FAR * __RPC_FAR *)&p_serialNum,
                                       (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110],
                                       (unsigned char)0 );
            
            _RetVal = *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++;
            
            }
        RpcFinally
            {
            NdrProxyFreeBuffer(This, &_StubMsg);
            
            }
        RpcEndFinally
        
        }
    RpcExcept(_StubMsg.dwStubPhase != PROXY_SENDRECEIVE)
        {
        NdrClearOutParameters(
                         ( PMIDL_STUB_MESSAGE  )&_StubMsg,
                         ( PFORMAT_STRING  )&__MIDL_TypeFormatString.Format[100],
                         ( void __RPC_FAR * )p_serialNum);
        _RetVal = NdrProxyErrorHandler(RpcExceptionCode());
        }
    RpcEndExcept
    return _RetVal;
}

void __RPC_STUB gIIEPad_EnumSerialNumberHistory_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase)
{
    HRESULT _RetVal;
    MIDL_STUB_MESSAGE _StubMsg;
    GUID _p_serialNumM;
    int iDeviceNum;
    GUID __RPC_FAR *p_serialNum;
    
NdrStubInitialize(
                     _pRpcMessage,
                     &_StubMsg,
                     &Object_StubDesc,
                     _pRpcChannelBuffer);
    ( GUID __RPC_FAR * )p_serialNum = 0;
    RpcTryFinally
        {
        if ( (_pRpcMessage->DataRepresentation & 0X0000FFFFUL) != NDR_LOCAL_DATA_REPRESENTATION )
            NdrConvert( (PMIDL_STUB_MESSAGE) &_StubMsg, (PFORMAT_STRING) &__MIDL_ProcFormatString.Format[154] );
        
        iDeviceNum = *(( int __RPC_FAR * )_StubMsg.Buffer)++;
        
        p_serialNum = &_p_serialNumM;
        
        *_pdwStubPhase = STUB_CALL_SERVER;
        _RetVal = (((gIIEPad*) ((CStdStubBuffer *)This)->pvServerObject)->lpVtbl) -> EnumSerialNumberHistory(
                           (gIIEPad *) ((CStdStubBuffer *)This)->pvServerObject,
                           iDeviceNum,
                           p_serialNum);
        
        *_pdwStubPhase = STUB_MARSHAL;
        
        _StubMsg.BufferLength = 0U + 11U;
        NdrSimpleStructBufferSize( (PMIDL_STUB_MESSAGE) &_StubMsg,
                                   (unsigned char __RPC_FAR *)p_serialNum,
                                   (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
        
        _StubMsg.BufferLength += 16;
        
        NdrStubGetBuffer(This, _pRpcChannelBuffer, &_StubMsg);
        NdrSimpleStructMarshall( (PMIDL_STUB_MESSAGE)& _StubMsg,
                                 (unsigned char __RPC_FAR *)p_serialNum,
                                 (PFORMAT_STRING) &__MIDL_TypeFormatString.Format[110] );
        
        *(( HRESULT __RPC_FAR * )_StubMsg.Buffer)++ = _RetVal;
        
        }
    RpcFinally
        {
        }
    RpcEndFinally
    _pRpcMessage->BufferLength = 
        (unsigned int)(_StubMsg.Buffer - (unsigned char __RPC_FAR *)_pRpcMessage->Buffer);
    
}

CINTERFACE_PROXY_VTABLE(25) _gIIEPadProxyVtbl = 
{
    &IID_gIIEPad,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    0 /* IDispatch_GetTypeInfoCount_Proxy */ ,
    0 /* IDispatch_GetTypeInfo_Proxy */ ,
    0 /* IDispatch_GetIDsOfNames_Proxy */ ,
    0 /* IDispatch_Invoke_Proxy */ ,
    gIIEPad_GetNumDevices_Proxy ,
    gIIEPad_OpenConnection_Proxy ,
    gIIEPad_CloseConnection_Proxy ,
    gIIEPad_ConnGetRanges_Proxy ,
    gIIEPad_ConnSetMouseOn_Proxy ,
    gIIEPad_ConnGetMouseOn_Proxy ,
    gIIEPad_ConnSetEventNotification_Proxy ,
    gIIEPad_ConnGetEventNotification_Proxy ,
    gIIEPad_ConnGetSerialNumber_Proxy ,
    gIIEPad_ConnPushMouseData_Proxy ,
    gIIEPad_DisplayDebugGUI_Proxy ,
    gIIEPad_ShowConfigDialog_Proxy ,
    gIIEPad_ConnGetPhysicalExtents_Proxy ,
    gIIEPad_ConnGetReportRate_Proxy ,
    gIIEPad_GetFriendlyName_Proxy ,
    gIIEPad_SetFriendlyName_Proxy ,
    gIIEPad_GetSerialNumber_Proxy ,
    gIIEPad_EnumSerialNumberHistory_Proxy
};


static const PRPC_STUB_FUNCTION gIIEPad_table[] =
{
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    gIIEPad_GetNumDevices_Stub,
    gIIEPad_OpenConnection_Stub,
    gIIEPad_CloseConnection_Stub,
    gIIEPad_ConnGetRanges_Stub,
    gIIEPad_ConnSetMouseOn_Stub,
    gIIEPad_ConnGetMouseOn_Stub,
    gIIEPad_ConnSetEventNotification_Stub,
    gIIEPad_ConnGetEventNotification_Stub,
    gIIEPad_ConnGetSerialNumber_Stub,
    gIIEPad_ConnPushMouseData_Stub,
    gIIEPad_DisplayDebugGUI_Stub,
    gIIEPad_ShowConfigDialog_Stub,
    gIIEPad_ConnGetPhysicalExtents_Stub,
    gIIEPad_ConnGetReportRate_Stub,
    gIIEPad_GetFriendlyName_Stub,
    gIIEPad_SetFriendlyName_Stub,
    gIIEPad_GetSerialNumber_Stub,
    gIIEPad_EnumSerialNumberHistory_Stub
};

CInterfaceStubVtbl _gIIEPadStubVtbl =
{
    &IID_gIIEPad,
    0,
    25,
    &gIIEPad_table[-3],
    CStdStubBuffer_DELEGATING_METHODS
};

extern const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ];

static const MIDL_STUB_DESC Object_StubDesc = 
    {
    0,
    NdrOleAllocate,
    NdrOleFree,
    0,
    0,
    0,
    0,
    0,
    __MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x20000, /* Ndr library version */
    0,
    0x5030118, /* MIDL Version 5.3.280 */
    0,
    UserMarshalRoutines,
    0,  /* notify & notify_flag routine table */
    0x1, /* MIDL flag */
    0,  /* Reserved3 */
    0,  /* Reserved4 */
    0   /* Reserved5 */
    };

#pragma data_seg(".rdata")

static const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ] = 
        {
            
            {
            BSTR_UserSize
            ,BSTR_UserMarshal
            ,BSTR_UserUnmarshal
            ,BSTR_UserFree
            }

        };


#if !defined(__RPC_WIN32__)
#error  Invalid build platform for this stub.
#endif

#if !(TARGET_IS_NT40_OR_LATER)
#error You need a Windows NT 4.0 or later to run this stub because it uses these features:
#error   [wire_marshal] or [user_marshal] attribute.
#error However, your C/C++ compilation flags indicate you intend to run this app on earlier systems.
#error This app will die there with the RPC_X_WRONG_STUB_VERSION error.
#endif


static const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString =
    {
        0,
        {
			0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/*  2 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/*  4 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/*  6 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x3,		/* FC_SMALL */
/*  8 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x3,		/* FC_SMALL */
/* 10 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 12 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 14 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 16 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 18 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 20 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 22 */	NdrFcShort( 0x2 ),	/* Type Offset=2 */
/* 24 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 26 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 28 */	NdrFcShort( 0x2e ),	/* Type Offset=46 */
/* 30 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 32 */	NdrFcShort( 0x2e ),	/* Type Offset=46 */
/* 34 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 36 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 38 */	NdrFcShort( 0x2e ),	/* Type Offset=46 */
/* 40 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 42 */	NdrFcShort( 0x38 ),	/* Type Offset=56 */
/* 44 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 46 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 48 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 50 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 52 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 54 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 56 */	NdrFcShort( 0x4e ),	/* Type Offset=78 */
/* 58 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 60 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 62 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 64 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 66 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 68 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 70 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 72 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 74 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 76 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 78 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 80 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 82 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 84 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 86 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 88 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 90 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x3,		/* FC_SMALL */
/* 92 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 94 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 96 */	NdrFcShort( 0x60 ),	/* Type Offset=96 */
/* 98 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 100 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 102 */	NdrFcShort( 0x64 ),	/* Type Offset=100 */
/* 104 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 106 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x1,		/* FC_BYTE */
/* 108 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x1,		/* FC_BYTE */
/* 110 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x2,		/* FC_CHAR */
/* 112 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 114 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 116 */	NdrFcShort( 0x7a ),	/* Type Offset=122 */
/* 118 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 120 */	NdrFcShort( 0x7a ),	/* Type Offset=122 */
/* 122 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 124 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 126 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 128 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 130 */	NdrFcShort( 0x4a ),	/* Type Offset=74 */
/* 132 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 134 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 136 */	NdrFcShort( 0x7e ),	/* Type Offset=126 */
/* 138 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 140 */	NdrFcShort( 0x38 ),	/* Type Offset=56 */
/* 142 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 144 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 146 */	NdrFcShort( 0x7e ),	/* Type Offset=126 */
/* 148 */	
			0x4d,		/* FC_IN_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 150 */	NdrFcShort( 0x2e ),	/* Type Offset=46 */
/* 152 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 154 */	0x4e,		/* FC_IN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */
/* 156 */	
			0x51,		/* FC_OUT_PARAM */
#ifndef _ALPHA_
			0x1,		/* x86, MIPS & PPC stack size = 1 */
#else
			0x2,		/* Alpha stack size = 2 */
#endif
/* 158 */	NdrFcShort( 0x64 ),	/* Type Offset=100 */
/* 160 */	0x53,		/* FC_RETURN_PARAM_BASETYPE */
			0x8,		/* FC_LONG */

			0x0
        }
    };

static const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */
/*  2 */	
			0x11, 0x0,	/* FC_RP */
/*  4 */	NdrFcShort( 0x8 ),	/* Offset= 8 (12) */
/*  6 */	
			0x1d,		/* FC_SMFARRAY */
			0x0,		/* 0 */
/*  8 */	NdrFcShort( 0x4 ),	/* 4 */
/* 10 */	0x2,		/* FC_CHAR */
			0x5b,		/* FC_END */
/* 12 */	
			0x15,		/* FC_STRUCT */
			0x0,		/* 0 */
/* 14 */	NdrFcShort( 0x4 ),	/* 4 */
/* 16 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 18 */	NdrFcShort( 0xfffffff4 ),	/* Offset= -12 (6) */
/* 20 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 22 */	
			0x12, 0x0,	/* FC_UP */
/* 24 */	NdrFcShort( 0xc ),	/* Offset= 12 (36) */
/* 26 */	
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 28 */	NdrFcShort( 0x2 ),	/* 2 */
/* 30 */	0x9,		/* Corr desc: FC_ULONG */
			0x0,		/*  */
/* 32 */	NdrFcShort( 0xfffc ),	/* -4 */
/* 34 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 36 */	
			0x17,		/* FC_CSTRUCT */
			0x3,		/* 3 */
/* 38 */	NdrFcShort( 0x8 ),	/* 8 */
/* 40 */	NdrFcShort( 0xfffffff2 ),	/* Offset= -14 (26) */
/* 42 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 44 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 46 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 48 */	NdrFcShort( 0x0 ),	/* 0 */
/* 50 */	NdrFcShort( 0x4 ),	/* 4 */
/* 52 */	NdrFcShort( 0x0 ),	/* 0 */
/* 54 */	NdrFcShort( 0xffffffe0 ),	/* Offset= -32 (22) */
/* 56 */	
			0x11, 0x4,	/* FC_RP [alloced_on_stack] */
/* 58 */	NdrFcShort( 0x6 ),	/* Offset= 6 (64) */
/* 60 */	
			0x13, 0x0,	/* FC_OP */
/* 62 */	NdrFcShort( 0xffffffe6 ),	/* Offset= -26 (36) */
/* 64 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 66 */	NdrFcShort( 0x0 ),	/* 0 */
/* 68 */	NdrFcShort( 0x4 ),	/* 4 */
/* 70 */	NdrFcShort( 0x0 ),	/* 0 */
/* 72 */	NdrFcShort( 0xfffffff4 ),	/* Offset= -12 (60) */
/* 74 */	
			0x11, 0xc,	/* FC_RP [alloced_on_stack] [simple_pointer] */
/* 76 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */
/* 78 */	
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 80 */	NdrFcLong( 0xd55113d0 ),	/* -716106800 */
/* 84 */	NdrFcShort( 0x95c8 ),	/* -27192 */
/* 86 */	NdrFcShort( 0x4427 ),	/* 17447 */
/* 88 */	0x9a,		/* 154 */
			0xad,		/* 173 */
/* 90 */	0xeb,		/* 235 */
			0x8b,		/* 139 */
/* 92 */	0xc1,		/* 193 */
			0xec,		/* 236 */
/* 94 */	0xb4,		/* 180 */
			0xd9,		/* 217 */
/* 96 */	
			0x11, 0xc,	/* FC_RP [alloced_on_stack] [simple_pointer] */
/* 98 */	0x3,		/* FC_SMALL */
			0x5c,		/* FC_PAD */
/* 100 */	
			0x11, 0x4,	/* FC_RP [alloced_on_stack] */
/* 102 */	NdrFcShort( 0x8 ),	/* Offset= 8 (110) */
/* 104 */	
			0x1d,		/* FC_SMFARRAY */
			0x0,		/* 0 */
/* 106 */	NdrFcShort( 0x8 ),	/* 8 */
/* 108 */	0x2,		/* FC_CHAR */
			0x5b,		/* FC_END */
/* 110 */	
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 112 */	NdrFcShort( 0x10 ),	/* 16 */
/* 114 */	0x8,		/* FC_LONG */
			0x6,		/* FC_SHORT */
/* 116 */	0x6,		/* FC_SHORT */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 118 */	0x0,		/* 0 */
			NdrFcShort( 0xfffffff1 ),	/* Offset= -15 (104) */
			0x5b,		/* FC_END */
/* 122 */	
			0x11, 0xc,	/* FC_RP [alloced_on_stack] [simple_pointer] */
/* 124 */	0xc,		/* FC_DOUBLE */
			0x5c,		/* FC_PAD */
/* 126 */	
			0x11, 0x0,	/* FC_RP */
/* 128 */	NdrFcShort( 0xffffffee ),	/* Offset= -18 (110) */

			0x0
        }
    };

const CInterfaceProxyVtbl * _g_iiepad_ProxyVtblList[] = 
{
    ( CInterfaceProxyVtbl *) &_gIIEPadEventProxyVtbl,
    ( CInterfaceProxyVtbl *) &_gIEDebugGUIProxyVtbl,
    ( CInterfaceProxyVtbl *) &_gIIEPadProxyVtbl,
    0
};

const CInterfaceStubVtbl * _g_iiepad_StubVtblList[] = 
{
    ( CInterfaceStubVtbl *) &_gIIEPadEventStubVtbl,
    ( CInterfaceStubVtbl *) &_gIEDebugGUIStubVtbl,
    ( CInterfaceStubVtbl *) &_gIIEPadStubVtbl,
    0
};

PCInterfaceName const _g_iiepad_InterfaceNamesList[] = 
{
    "gIIEPadEvent",
    "gIEDebugGUI",
    "gIIEPad",
    0
};

const IID *  _g_iiepad_BaseIIDList[] = 
{
    &IID_IDispatch,
    &IID_IDispatch,
    &IID_IDispatch,
    0
};


#define _g_iiepad_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _g_iiepad, pIID, n)

int __stdcall _g_iiepad_IID_Lookup( const IID * pIID, int * pIndex )
{
    IID_BS_LOOKUP_SETUP

    IID_BS_LOOKUP_INITIAL_TEST( _g_iiepad, 3, 2 )
    IID_BS_LOOKUP_NEXT_TEST( _g_iiepad, 1 )
    IID_BS_LOOKUP_RETURN_RESULT( _g_iiepad, 3, *pIndex )
    
}

const ExtendedProxyFileInfo g_iiepad_ProxyFileInfo = 
{
    (PCInterfaceProxyVtblList *) & _g_iiepad_ProxyVtblList,
    (PCInterfaceStubVtblList *) & _g_iiepad_StubVtblList,
    (const PCInterfaceName * ) & _g_iiepad_InterfaceNamesList,
    (const IID ** ) & _g_iiepad_BaseIIDList,
    & _g_iiepad_IID_Lookup, 
    3,
    1,
    0, /* table of [async_uuid] interfaces */
    0, /* Filler1 */
    0, /* Filler2 */
    0  /* Filler3 */
};


#endif /* !defined(_M_IA64) && !defined(_M_AXP64)*/


#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the proxy stub code */


 /* File created by MIDL compiler version 5.03.0280 */
/* at Thu Aug 01 13:04:21 2002
 */
/* Compiler settings for g_iiepad.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win64 (32b run,appending), ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#if defined(_M_IA64) || defined(_M_AXP64)
#define USE_STUBLESS_PROXY


/* verify that the <rpcproxy.h> version is high enough to compile this file*/
#ifndef __REDQ_RPCPROXY_H_VERSION__
#define __REQUIRED_RPCPROXY_H_VERSION__ 475
#endif


#include "rpcproxy.h"
#ifndef __RPCPROXY_H_VERSION__
#error this stub requires an updated version of <rpcproxy.h>
#endif // __RPCPROXY_H_VERSION__


#include "g_iiepad.h"

#define TYPE_FORMAT_STRING_SIZE   127                               
#define PROC_FORMAT_STRING_SIZE   995                               
#define TRANSMIT_AS_TABLE_SIZE    0            
#define WIRE_MARSHAL_TABLE_SIZE   1            

typedef struct _MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } MIDL_TYPE_FORMAT_STRING;

typedef struct _MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } MIDL_PROC_FORMAT_STRING;


extern const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString;
extern const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString;


/* Standard interface: __MIDL_itf_g_iiepad_0000, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00}} */


/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: IDispatch, ver. 0.0,
   GUID={0x00020400,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: gIIEPadEvent, ver. 0.0,
   GUID={0xD55113D0,0x95C8,0x4427,{0x9A,0xAD,0xEB,0x8B,0xC1,0xEC,0xB4,0xD9}} */


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO gIIEPadEvent_ServerInfo;

#pragma code_seg(".orpc")
static const unsigned short gIIEPadEvent_FormatStringOffsetTable[] = 
    {
    (unsigned short) -1,
    (unsigned short) -1,
    (unsigned short) -1,
    (unsigned short) -1,
    0
    };

static const MIDL_SERVER_INFO gIIEPadEvent_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &gIIEPadEvent_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0
    };

static const MIDL_STUBLESS_PROXY_INFO gIIEPadEvent_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &gIIEPadEvent_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };

CINTERFACE_PROXY_VTABLE(8) _gIIEPadEventProxyVtbl = 
{
    &gIIEPadEvent_ProxyInfo,
    &IID_gIIEPadEvent,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    0 /* (void *)-1 /* IDispatch::GetTypeInfoCount */ ,
    0 /* (void *)-1 /* IDispatch::GetTypeInfo */ ,
    0 /* (void *)-1 /* IDispatch::GetIDsOfNames */ ,
    0 /* IDispatch_Invoke_Proxy */ ,
    (void *)-1 /* gIIEPadEvent::HandlePadData */
};


static const PRPC_STUB_FUNCTION gIIEPadEvent_table[] =
{
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    NdrStubCall2
};

CInterfaceStubVtbl _gIIEPadEventStubVtbl =
{
    &IID_gIIEPadEvent,
    &gIIEPadEvent_ServerInfo,
    8,
    &gIIEPadEvent_table[-3],
    CStdStubBuffer_DELEGATING_METHODS
};


/* Object interface: gIEDebugGUI, ver. 0.0,
   GUID={0xE41F84E3,0xF211,0x4870,{0x99,0xF7,0x34,0xC5,0x82,0x6C,0xEE,0xD5}} */


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO gIEDebugGUI_ServerInfo;

#pragma code_seg(".orpc")
static const unsigned short gIEDebugGUI_FormatStringOffsetTable[] = 
    {
    (unsigned short) -1,
    (unsigned short) -1,
    (unsigned short) -1,
    (unsigned short) -1,
    80,
    112,
    150,
    194
    };

static const MIDL_SERVER_INFO gIEDebugGUI_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &gIEDebugGUI_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0
    };

static const MIDL_STUBLESS_PROXY_INFO gIEDebugGUI_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &gIEDebugGUI_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };

CINTERFACE_PROXY_VTABLE(11) _gIEDebugGUIProxyVtbl = 
{
    &gIEDebugGUI_ProxyInfo,
    &IID_gIEDebugGUI,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    0 /* (void *)-1 /* IDispatch::GetTypeInfoCount */ ,
    0 /* (void *)-1 /* IDispatch::GetTypeInfo */ ,
    0 /* (void *)-1 /* IDispatch::GetIDsOfNames */ ,
    0 /* IDispatch_Invoke_Proxy */ ,
    (void *)-1 /* gIEDebugGUI::DebugDialog */ ,
    (void *)-1 /* gIEDebugGUI::GetDeviceHandle */ ,
    (void *)-1 /* gIEDebugGUI::SetDebugParam */ ,
    (void *)-1 /* gIEDebugGUI::GetDebugParam */
};


static const PRPC_STUB_FUNCTION gIEDebugGUI_table[] =
{
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2
};

CInterfaceStubVtbl _gIEDebugGUIStubVtbl =
{
    &IID_gIEDebugGUI,
    &gIEDebugGUI_ServerInfo,
    11,
    &gIEDebugGUI_table[-3],
    CStdStubBuffer_DELEGATING_METHODS
};


/* Object interface: gIIEPad, ver. 0.0,
   GUID={0xD85C50ED,0xC42D,0x4baa,{0x98,0x6C,0xB9,0x93,0x82,0x03,0xC9,0x8A}} */


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO gIIEPad_ServerInfo;

#pragma code_seg(".orpc")
static const unsigned short gIIEPad_FormatStringOffsetTable[] = 
    {
    (unsigned short) -1,
    (unsigned short) -1,
    (unsigned short) -1,
    (unsigned short) -1,
    238,
    276,
    320,
    352,
    426,
    464,
    502,
    540,
    578,
    616,
    666,
    698,
    730,
    774,
    818,
    862,
    906,
    950
    };

static const MIDL_SERVER_INFO gIIEPad_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    __MIDL_ProcFormatString.Format,
    &gIIEPad_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0
    };

static const MIDL_STUBLESS_PROXY_INFO gIIEPad_ProxyInfo =
    {
    &Object_StubDesc,
    __MIDL_ProcFormatString.Format,
    &gIIEPad_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };

CINTERFACE_PROXY_VTABLE(25) _gIIEPadProxyVtbl = 
{
    &gIIEPad_ProxyInfo,
    &IID_gIIEPad,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    0 /* (void *)-1 /* IDispatch::GetTypeInfoCount */ ,
    0 /* (void *)-1 /* IDispatch::GetTypeInfo */ ,
    0 /* (void *)-1 /* IDispatch::GetIDsOfNames */ ,
    0 /* IDispatch_Invoke_Proxy */ ,
    (void *)-1 /* gIIEPad::GetNumDevices */ ,
    (void *)-1 /* gIIEPad::OpenConnection */ ,
    (void *)-1 /* gIIEPad::CloseConnection */ ,
    (void *)-1 /* gIIEPad::ConnGetRanges */ ,
    (void *)-1 /* gIIEPad::ConnSetMouseOn */ ,
    (void *)-1 /* gIIEPad::ConnGetMouseOn */ ,
    (void *)-1 /* gIIEPad::ConnSetEventNotification */ ,
    (void *)-1 /* gIIEPad::ConnGetEventNotification */ ,
    (void *)-1 /* gIIEPad::ConnGetSerialNumber */ ,
    (void *)-1 /* gIIEPad::ConnPushMouseData */ ,
    (void *)-1 /* gIIEPad::DisplayDebugGUI */ ,
    (void *)-1 /* gIIEPad::ShowConfigDialog */ ,
    (void *)-1 /* gIIEPad::ConnGetPhysicalExtents */ ,
    (void *)-1 /* gIIEPad::ConnGetReportRate */ ,
    (void *)-1 /* gIIEPad::GetFriendlyName */ ,
    (void *)-1 /* gIIEPad::SetFriendlyName */ ,
    (void *)-1 /* gIIEPad::GetSerialNumber */ ,
    (void *)-1 /* gIIEPad::EnumSerialNumberHistory */
};


static const PRPC_STUB_FUNCTION gIIEPad_table[] =
{
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2,
    NdrStubCall2
};

CInterfaceStubVtbl _gIIEPadStubVtbl =
{
    &IID_gIIEPad,
    &gIIEPad_ServerInfo,
    25,
    &gIIEPad_table[-3],
    CStdStubBuffer_DELEGATING_METHODS
};

extern const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ];

static const MIDL_STUB_DESC Object_StubDesc = 
    {
    0,
    NdrOleAllocate,
    NdrOleFree,
    0,
    0,
    0,
    0,
    0,
    __MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x50002, /* Ndr library version */
    0,
    0x5030118, /* MIDL Version 5.3.280 */
    0,
    UserMarshalRoutines,
    0,  /* notify & notify_flag routine table */
    0x1, /* MIDL flag */
    0,  /* Reserved3 */
    0,  /* Reserved4 */
    0   /* Reserved5 */
    };

#pragma data_seg(".rdata")

static const USER_MARSHAL_ROUTINE_QUADRUPLE UserMarshalRoutines[ WIRE_MARSHAL_TABLE_SIZE ] = 
        {
            
            {
            BSTR_UserSize
            ,BSTR_UserMarshal
            ,BSTR_UserUnmarshal
            ,BSTR_UserFree
            }

        };


#if !defined(__RPC_WIN64__)
#error  Invalid build platform for this stub.
#endif

static const MIDL_PROC_FORMAT_STRING __MIDL_ProcFormatString =
    {
        0,
        {

	/* Procedure HandlePadData */

			0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/*  2 */	NdrFcLong( 0x0 ),	/* 0 */
/*  6 */	NdrFcShort( 0x7 ),	/* 7 */
/*  8 */	NdrFcShort( 0x50 ),	/* ia64, axp64 Stack size/offset = 80 */
/* 10 */	NdrFcShort( 0x3a ),	/* 58 */
/* 12 */	NdrFcShort( 0x8 ),	/* 8 */
/* 14 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x9,		/* 9 */
/* 16 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 18 */	NdrFcShort( 0x0 ),	/* 0 */
/* 20 */	NdrFcShort( 0x0 ),	/* 0 */
/* 22 */	NdrFcShort( 0x0 ),	/* 0 */
/* 24 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter abs_x */

/* 26 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 28 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 30 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter abs_y */

/* 32 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 34 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 36 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter pressure */

/* 38 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 40 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 42 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter fTouch */

/* 44 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 46 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 48 */	0x3,		/* FC_SMALL */
			0x0,		/* 0 */

	/* Parameter fTap */

/* 50 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 52 */	NdrFcShort( 0x28 ),	/* ia64, axp64 Stack size/offset = 40 */
/* 54 */	0x3,		/* FC_SMALL */
			0x0,		/* 0 */

	/* Parameter buttonState */

/* 56 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 58 */	NdrFcShort( 0x30 ),	/* ia64, axp64 Stack size/offset = 48 */
/* 60 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter dwTimeStamp */

/* 62 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 64 */	NdrFcShort( 0x38 ),	/* ia64, axp64 Stack size/offset = 56 */
/* 66 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter dwSequenceNum */

/* 68 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 70 */	NdrFcShort( 0x40 ),	/* ia64, axp64 Stack size/offset = 64 */
/* 72 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Return value */

/* 74 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 76 */	NdrFcShort( 0x48 ),	/* ia64, axp64 Stack size/offset = 72 */
/* 78 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure DebugDialog */

/* 80 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 82 */	NdrFcLong( 0x0 ),	/* 0 */
/* 86 */	NdrFcShort( 0x7 ),	/* 7 */
/* 88 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 90 */	NdrFcShort( 0x0 ),	/* 0 */
/* 92 */	NdrFcShort( 0x8 ),	/* 8 */
/* 94 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x1,		/* 1 */
/* 96 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 98 */	NdrFcShort( 0x0 ),	/* 0 */
/* 100 */	NdrFcShort( 0x0 ),	/* 0 */
/* 102 */	NdrFcShort( 0x0 ),	/* 0 */
/* 104 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Return value */

/* 106 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 108 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 110 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure GetDeviceHandle */

/* 112 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 114 */	NdrFcLong( 0x0 ),	/* 0 */
/* 118 */	NdrFcShort( 0x8 ),	/* 8 */
/* 120 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 122 */	NdrFcShort( 0x18 ),	/* 24 */
/* 124 */	NdrFcShort( 0x8 ),	/* 8 */
/* 126 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x2,		/* 2 */
/* 128 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 130 */	NdrFcShort( 0x0 ),	/* 0 */
/* 132 */	NdrFcShort( 0x0 ),	/* 0 */
/* 134 */	NdrFcShort( 0x0 ),	/* 0 */
/* 136 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter pHandle */

/* 138 */	NdrFcShort( 0x10a ),	/* Flags:  must free, in, simple ref, */
/* 140 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 142 */	NdrFcShort( 0xc ),	/* Type Offset=12 */

	/* Return value */

/* 144 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 146 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 148 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure SetDebugParam */

/* 150 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 152 */	NdrFcLong( 0x0 ),	/* 0 */
/* 156 */	NdrFcShort( 0x9 ),	/* 9 */
/* 158 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 160 */	NdrFcShort( 0x0 ),	/* 0 */
/* 162 */	NdrFcShort( 0x8 ),	/* 8 */
/* 164 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x3,		/* 3 */
/* 166 */	0xa,		/* 10 */
			0x5,		/* Ext Flags:  new corr desc, srv corr check, */
/* 168 */	NdrFcShort( 0x0 ),	/* 0 */
/* 170 */	NdrFcShort( 0x2 ),	/* 2 */
/* 172 */	NdrFcShort( 0x0 ),	/* 0 */
/* 174 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter key */

/* 176 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 178 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 180 */	NdrFcShort( 0x30 ),	/* Type Offset=48 */

	/* Parameter value */

/* 182 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 184 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 186 */	NdrFcShort( 0x30 ),	/* Type Offset=48 */

	/* Return value */

/* 188 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 190 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 192 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure GetDebugParam */

/* 194 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 196 */	NdrFcLong( 0x0 ),	/* 0 */
/* 200 */	NdrFcShort( 0xa ),	/* 10 */
/* 202 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 204 */	NdrFcShort( 0x0 ),	/* 0 */
/* 206 */	NdrFcShort( 0x8 ),	/* 8 */
/* 208 */	0x47,		/* Oi2 Flags:  srv must size, clt must size, has return, has ext, */
			0x3,		/* 3 */
/* 210 */	0xa,		/* 10 */
			0x7,		/* Ext Flags:  new corr desc, clt corr check, srv corr check, */
/* 212 */	NdrFcShort( 0x1 ),	/* 1 */
/* 214 */	NdrFcShort( 0x1 ),	/* 1 */
/* 216 */	NdrFcShort( 0x0 ),	/* 0 */
/* 218 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter key */

/* 220 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 222 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 224 */	NdrFcShort( 0x30 ),	/* Type Offset=48 */

	/* Parameter p_value */

/* 226 */	NdrFcShort( 0x2113 ),	/* Flags:  must size, must free, out, simple ref, srv alloc size=8 */
/* 228 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 230 */	NdrFcShort( 0x42 ),	/* Type Offset=66 */

	/* Return value */

/* 232 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 234 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 236 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure GetNumDevices */

/* 238 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 240 */	NdrFcLong( 0x0 ),	/* 0 */
/* 244 */	NdrFcShort( 0x7 ),	/* 7 */
/* 246 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 248 */	NdrFcShort( 0x0 ),	/* 0 */
/* 250 */	NdrFcShort( 0x10 ),	/* 16 */
/* 252 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x2,		/* 2 */
/* 254 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 256 */	NdrFcShort( 0x0 ),	/* 0 */
/* 258 */	NdrFcShort( 0x0 ),	/* 0 */
/* 260 */	NdrFcShort( 0x0 ),	/* 0 */
/* 262 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p_iNumDevices */

/* 264 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 266 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 268 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Return value */

/* 270 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 272 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 274 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure OpenConnection */

/* 276 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 278 */	NdrFcLong( 0x0 ),	/* 0 */
/* 282 */	NdrFcShort( 0x8 ),	/* 8 */
/* 284 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 286 */	NdrFcShort( 0x8 ),	/* 8 */
/* 288 */	NdrFcShort( 0x8 ),	/* 8 */
/* 290 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x3,		/* 3 */
/* 292 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 294 */	NdrFcShort( 0x0 ),	/* 0 */
/* 296 */	NdrFcShort( 0x0 ),	/* 0 */
/* 298 */	NdrFcShort( 0x0 ),	/* 0 */
/* 300 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter iDeviceNum */

/* 302 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 304 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 306 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_EventHandler */

/* 308 */	NdrFcShort( 0xb ),	/* Flags:  must size, must free, in, */
/* 310 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 312 */	NdrFcShort( 0x50 ),	/* Type Offset=80 */

	/* Return value */

/* 314 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 316 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 318 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure CloseConnection */

/* 320 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 322 */	NdrFcLong( 0x0 ),	/* 0 */
/* 326 */	NdrFcShort( 0x9 ),	/* 9 */
/* 328 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 330 */	NdrFcShort( 0x0 ),	/* 0 */
/* 332 */	NdrFcShort( 0x8 ),	/* 8 */
/* 334 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x1,		/* 1 */
/* 336 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 338 */	NdrFcShort( 0x0 ),	/* 0 */
/* 340 */	NdrFcShort( 0x0 ),	/* 0 */
/* 342 */	NdrFcShort( 0x0 ),	/* 0 */
/* 344 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Return value */

/* 346 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 348 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 350 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnGetRanges */

/* 352 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 354 */	NdrFcLong( 0x0 ),	/* 0 */
/* 358 */	NdrFcShort( 0xa ),	/* 10 */
/* 360 */	NdrFcShort( 0x48 ),	/* ia64, axp64 Stack size/offset = 72 */
/* 362 */	NdrFcShort( 0x0 ),	/* 0 */
/* 364 */	NdrFcShort( 0x40 ),	/* 64 */
/* 366 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x8,		/* 8 */
/* 368 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 370 */	NdrFcShort( 0x0 ),	/* 0 */
/* 372 */	NdrFcShort( 0x0 ),	/* 0 */
/* 374 */	NdrFcShort( 0x0 ),	/* 0 */
/* 376 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p_min_x */

/* 378 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 380 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 382 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_max_x */

/* 384 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 386 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 388 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_min_y */

/* 390 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 392 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 394 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_max_y */

/* 396 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 398 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 400 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_min_press */

/* 402 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 404 */	NdrFcShort( 0x28 ),	/* ia64, axp64 Stack size/offset = 40 */
/* 406 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_max_press */

/* 408 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 410 */	NdrFcShort( 0x30 ),	/* ia64, axp64 Stack size/offset = 48 */
/* 412 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_nButtons */

/* 414 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 416 */	NdrFcShort( 0x38 ),	/* ia64, axp64 Stack size/offset = 56 */
/* 418 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Return value */

/* 420 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 422 */	NdrFcShort( 0x40 ),	/* ia64, axp64 Stack size/offset = 64 */
/* 424 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnSetMouseOn */

/* 426 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 428 */	NdrFcLong( 0x0 ),	/* 0 */
/* 432 */	NdrFcShort( 0xb ),	/* 11 */
/* 434 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 436 */	NdrFcShort( 0x5 ),	/* 5 */
/* 438 */	NdrFcShort( 0x8 ),	/* 8 */
/* 440 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x2,		/* 2 */
/* 442 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 444 */	NdrFcShort( 0x0 ),	/* 0 */
/* 446 */	NdrFcShort( 0x0 ),	/* 0 */
/* 448 */	NdrFcShort( 0x0 ),	/* 0 */
/* 450 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter fState */

/* 452 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 454 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 456 */	0x3,		/* FC_SMALL */
			0x0,		/* 0 */

	/* Return value */

/* 458 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 460 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 462 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnGetMouseOn */

/* 464 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 466 */	NdrFcLong( 0x0 ),	/* 0 */
/* 470 */	NdrFcShort( 0xc ),	/* 12 */
/* 472 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 474 */	NdrFcShort( 0x0 ),	/* 0 */
/* 476 */	NdrFcShort( 0xd ),	/* 13 */
/* 478 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x2,		/* 2 */
/* 480 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 482 */	NdrFcShort( 0x0 ),	/* 0 */
/* 484 */	NdrFcShort( 0x0 ),	/* 0 */
/* 486 */	NdrFcShort( 0x0 ),	/* 0 */
/* 488 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p_fState */

/* 490 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 492 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 494 */	0x3,		/* FC_SMALL */
			0x0,		/* 0 */

	/* Return value */

/* 496 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 498 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 500 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnSetEventNotification */

/* 502 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 504 */	NdrFcLong( 0x0 ),	/* 0 */
/* 508 */	NdrFcShort( 0xd ),	/* 13 */
/* 510 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 512 */	NdrFcShort( 0x5 ),	/* 5 */
/* 514 */	NdrFcShort( 0x8 ),	/* 8 */
/* 516 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x2,		/* 2 */
/* 518 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 520 */	NdrFcShort( 0x0 ),	/* 0 */
/* 522 */	NdrFcShort( 0x0 ),	/* 0 */
/* 524 */	NdrFcShort( 0x0 ),	/* 0 */
/* 526 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter fState */

/* 528 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 530 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 532 */	0x3,		/* FC_SMALL */
			0x0,		/* 0 */

	/* Return value */

/* 534 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 536 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 538 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnGetEventNotification */

/* 540 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 542 */	NdrFcLong( 0x0 ),	/* 0 */
/* 546 */	NdrFcShort( 0xe ),	/* 14 */
/* 548 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 550 */	NdrFcShort( 0x0 ),	/* 0 */
/* 552 */	NdrFcShort( 0xd ),	/* 13 */
/* 554 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x2,		/* 2 */
/* 556 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 558 */	NdrFcShort( 0x0 ),	/* 0 */
/* 560 */	NdrFcShort( 0x0 ),	/* 0 */
/* 562 */	NdrFcShort( 0x0 ),	/* 0 */
/* 564 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p_fState */

/* 566 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 568 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 570 */	0x3,		/* FC_SMALL */
			0x0,		/* 0 */

	/* Return value */

/* 572 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 574 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 576 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnGetSerialNumber */

/* 578 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 580 */	NdrFcLong( 0x0 ),	/* 0 */
/* 584 */	NdrFcShort( 0xf ),	/* 15 */
/* 586 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 588 */	NdrFcShort( 0x0 ),	/* 0 */
/* 590 */	NdrFcShort( 0x28 ),	/* 40 */
/* 592 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x2,		/* 2 */
/* 594 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 596 */	NdrFcShort( 0x0 ),	/* 0 */
/* 598 */	NdrFcShort( 0x0 ),	/* 0 */
/* 600 */	NdrFcShort( 0x0 ),	/* 0 */
/* 602 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p_serialNum */

/* 604 */	NdrFcShort( 0x4112 ),	/* Flags:  must free, out, simple ref, srv alloc size=16 */
/* 606 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 608 */	NdrFcShort( 0x6a ),	/* Type Offset=106 */

	/* Return value */

/* 610 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 612 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 614 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnPushMouseData */

/* 616 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 618 */	NdrFcLong( 0x0 ),	/* 0 */
/* 622 */	NdrFcShort( 0x10 ),	/* 16 */
/* 624 */	NdrFcShort( 0x28 ),	/* ia64, axp64 Stack size/offset = 40 */
/* 626 */	NdrFcShort( 0xf ),	/* 15 */
/* 628 */	NdrFcShort( 0x8 ),	/* 8 */
/* 630 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x4,		/* 4 */
/* 632 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 634 */	NdrFcShort( 0x0 ),	/* 0 */
/* 636 */	NdrFcShort( 0x0 ),	/* 0 */
/* 638 */	NdrFcShort( 0x0 ),	/* 0 */
/* 640 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter dx */

/* 642 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 644 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 646 */	0x1,		/* FC_BYTE */
			0x0,		/* 0 */

	/* Parameter dy */

/* 648 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 650 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 652 */	0x1,		/* FC_BYTE */
			0x0,		/* 0 */

	/* Parameter bmButtons */

/* 654 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 656 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 658 */	0x2,		/* FC_CHAR */
			0x0,		/* 0 */

	/* Return value */

/* 660 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 662 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 664 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure DisplayDebugGUI */

/* 666 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 668 */	NdrFcLong( 0x0 ),	/* 0 */
/* 672 */	NdrFcShort( 0x11 ),	/* 17 */
/* 674 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 676 */	NdrFcShort( 0x0 ),	/* 0 */
/* 678 */	NdrFcShort( 0x8 ),	/* 8 */
/* 680 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x1,		/* 1 */
/* 682 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 684 */	NdrFcShort( 0x0 ),	/* 0 */
/* 686 */	NdrFcShort( 0x0 ),	/* 0 */
/* 688 */	NdrFcShort( 0x0 ),	/* 0 */
/* 690 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Return value */

/* 692 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 694 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 696 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ShowConfigDialog */

/* 698 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 700 */	NdrFcLong( 0x0 ),	/* 0 */
/* 704 */	NdrFcShort( 0x12 ),	/* 18 */
/* 706 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 708 */	NdrFcShort( 0x0 ),	/* 0 */
/* 710 */	NdrFcShort( 0x8 ),	/* 8 */
/* 712 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x1,		/* 1 */
/* 714 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 716 */	NdrFcShort( 0x0 ),	/* 0 */
/* 718 */	NdrFcShort( 0x0 ),	/* 0 */
/* 720 */	NdrFcShort( 0x0 ),	/* 0 */
/* 722 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Return value */

/* 724 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 726 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 728 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnGetPhysicalExtents */

/* 730 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 732 */	NdrFcLong( 0x0 ),	/* 0 */
/* 736 */	NdrFcShort( 0x13 ),	/* 19 */
/* 738 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 740 */	NdrFcShort( 0x0 ),	/* 0 */
/* 742 */	NdrFcShort( 0x28 ),	/* 40 */
/* 744 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x3,		/* 3 */
/* 746 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 748 */	NdrFcShort( 0x0 ),	/* 0 */
/* 750 */	NdrFcShort( 0x0 ),	/* 0 */
/* 752 */	NdrFcShort( 0x0 ),	/* 0 */
/* 754 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter pExtX */

/* 756 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 758 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 760 */	0xc,		/* FC_DOUBLE */
			0x0,		/* 0 */

	/* Parameter pExtY */

/* 762 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 764 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 766 */	0xc,		/* FC_DOUBLE */
			0x0,		/* 0 */

	/* Return value */

/* 768 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 770 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 772 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure ConnGetReportRate */

/* 774 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 776 */	NdrFcLong( 0x0 ),	/* 0 */
/* 780 */	NdrFcShort( 0x14 ),	/* 20 */
/* 782 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 784 */	NdrFcShort( 0x0 ),	/* 0 */
/* 786 */	NdrFcShort( 0x18 ),	/* 24 */
/* 788 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x3,		/* 3 */
/* 790 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 792 */	NdrFcShort( 0x0 ),	/* 0 */
/* 794 */	NdrFcShort( 0x0 ),	/* 0 */
/* 796 */	NdrFcShort( 0x0 ),	/* 0 */
/* 798 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter p_nPackets */

/* 800 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 802 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 804 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_milliseconds */

/* 806 */	NdrFcShort( 0x2150 ),	/* Flags:  out, base type, simple ref, srv alloc size=8 */
/* 808 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 810 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Return value */

/* 812 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 814 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 816 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure GetFriendlyName */

/* 818 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 820 */	NdrFcLong( 0x0 ),	/* 0 */
/* 824 */	NdrFcShort( 0x15 ),	/* 21 */
/* 826 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 828 */	NdrFcShort( 0x20 ),	/* 32 */
/* 830 */	NdrFcShort( 0x8 ),	/* 8 */
/* 832 */	0x45,		/* Oi2 Flags:  srv must size, has return, has ext, */
			0x3,		/* 3 */
/* 834 */	0xa,		/* 10 */
			0x3,		/* Ext Flags:  new corr desc, clt corr check, */
/* 836 */	NdrFcShort( 0x1 ),	/* 1 */
/* 838 */	NdrFcShort( 0x0 ),	/* 0 */
/* 840 */	NdrFcShort( 0x0 ),	/* 0 */
/* 842 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter pSerialNum */

/* 844 */	NdrFcShort( 0x10a ),	/* Flags:  must free, in, simple ref, */
/* 846 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 848 */	NdrFcShort( 0x6a ),	/* Type Offset=106 */

	/* Parameter pFriendlyName */

/* 850 */	NdrFcShort( 0x2113 ),	/* Flags:  must size, must free, out, simple ref, srv alloc size=8 */
/* 852 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 854 */	NdrFcShort( 0x42 ),	/* Type Offset=66 */

	/* Return value */

/* 856 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 858 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 860 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure SetFriendlyName */

/* 862 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 864 */	NdrFcLong( 0x0 ),	/* 0 */
/* 868 */	NdrFcShort( 0x16 ),	/* 22 */
/* 870 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 872 */	NdrFcShort( 0x20 ),	/* 32 */
/* 874 */	NdrFcShort( 0x8 ),	/* 8 */
/* 876 */	0x46,		/* Oi2 Flags:  clt must size, has return, has ext, */
			0x3,		/* 3 */
/* 878 */	0xa,		/* 10 */
			0x5,		/* Ext Flags:  new corr desc, srv corr check, */
/* 880 */	NdrFcShort( 0x0 ),	/* 0 */
/* 882 */	NdrFcShort( 0x1 ),	/* 1 */
/* 884 */	NdrFcShort( 0x0 ),	/* 0 */
/* 886 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter pSerialNum */

/* 888 */	NdrFcShort( 0x10a ),	/* Flags:  must free, in, simple ref, */
/* 890 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 892 */	NdrFcShort( 0x6a ),	/* Type Offset=106 */

	/* Parameter FriendlyName */

/* 894 */	NdrFcShort( 0x8b ),	/* Flags:  must size, must free, in, by val, */
/* 896 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 898 */	NdrFcShort( 0x30 ),	/* Type Offset=48 */

	/* Return value */

/* 900 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 902 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 904 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure GetSerialNumber */

/* 906 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 908 */	NdrFcLong( 0x0 ),	/* 0 */
/* 912 */	NdrFcShort( 0x17 ),	/* 23 */
/* 914 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 916 */	NdrFcShort( 0x8 ),	/* 8 */
/* 918 */	NdrFcShort( 0x28 ),	/* 40 */
/* 920 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x3,		/* 3 */
/* 922 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 924 */	NdrFcShort( 0x0 ),	/* 0 */
/* 926 */	NdrFcShort( 0x0 ),	/* 0 */
/* 928 */	NdrFcShort( 0x0 ),	/* 0 */
/* 930 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter iDeviceNum */

/* 932 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 934 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 936 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_serialNum */

/* 938 */	NdrFcShort( 0x4112 ),	/* Flags:  must free, out, simple ref, srv alloc size=16 */
/* 940 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 942 */	NdrFcShort( 0x6a ),	/* Type Offset=106 */

	/* Return value */

/* 944 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 946 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 948 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Procedure EnumSerialNumberHistory */

/* 950 */	0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/* 952 */	NdrFcLong( 0x0 ),	/* 0 */
/* 956 */	NdrFcShort( 0x18 ),	/* 24 */
/* 958 */	NdrFcShort( 0x20 ),	/* ia64, axp64 Stack size/offset = 32 */
/* 960 */	NdrFcShort( 0x8 ),	/* 8 */
/* 962 */	NdrFcShort( 0x28 ),	/* 40 */
/* 964 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x3,		/* 3 */
/* 966 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 968 */	NdrFcShort( 0x0 ),	/* 0 */
/* 970 */	NdrFcShort( 0x0 ),	/* 0 */
/* 972 */	NdrFcShort( 0x0 ),	/* 0 */
/* 974 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Parameter iDeviceNum */

/* 976 */	NdrFcShort( 0x48 ),	/* Flags:  in, base type, */
/* 978 */	NdrFcShort( 0x8 ),	/* ia64, axp64 Stack size/offset = 8 */
/* 980 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

	/* Parameter p_serialNum */

/* 982 */	NdrFcShort( 0x4112 ),	/* Flags:  must free, out, simple ref, srv alloc size=16 */
/* 984 */	NdrFcShort( 0x10 ),	/* ia64, axp64 Stack size/offset = 16 */
/* 986 */	NdrFcShort( 0x6a ),	/* Type Offset=106 */

	/* Return value */

/* 988 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 990 */	NdrFcShort( 0x18 ),	/* ia64, axp64 Stack size/offset = 24 */
/* 992 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

			0x0
        }
    };

static const MIDL_TYPE_FORMAT_STRING __MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */
/*  2 */	
			0x11, 0x0,	/* FC_RP */
/*  4 */	NdrFcShort( 0x8 ),	/* Offset= 8 (12) */
/*  6 */	
			0x1d,		/* FC_SMFARRAY */
			0x0,		/* 0 */
/*  8 */	NdrFcShort( 0x8 ),	/* 8 */
/* 10 */	0x2,		/* FC_CHAR */
			0x5b,		/* FC_END */
/* 12 */	
			0x15,		/* FC_STRUCT */
			0x0,		/* 0 */
/* 14 */	NdrFcShort( 0x8 ),	/* 8 */
/* 16 */	0x4c,		/* FC_EMBEDDED_COMPLEX */
			0x0,		/* 0 */
/* 18 */	NdrFcShort( 0xfffffff4 ),	/* Offset= -12 (6) */
/* 20 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 22 */	
			0x12, 0x0,	/* FC_UP */
/* 24 */	NdrFcShort( 0xe ),	/* Offset= 14 (38) */
/* 26 */	
			0x1b,		/* FC_CARRAY */
			0x1,		/* 1 */
/* 28 */	NdrFcShort( 0x2 ),	/* 2 */
/* 30 */	0x9,		/* Corr desc: FC_ULONG */
			0x0,		/*  */
/* 32 */	NdrFcShort( 0xfffc ),	/* -4 */
/* 34 */	NdrFcShort( 0x1 ),	/* Corr flags:  early, */
/* 36 */	0x6,		/* FC_SHORT */
			0x5b,		/* FC_END */
/* 38 */	
			0x17,		/* FC_CSTRUCT */
			0x3,		/* 3 */
/* 40 */	NdrFcShort( 0x8 ),	/* 8 */
/* 42 */	NdrFcShort( 0xfffffff0 ),	/* Offset= -16 (26) */
/* 44 */	0x8,		/* FC_LONG */
			0x8,		/* FC_LONG */
/* 46 */	0x5c,		/* FC_PAD */
			0x5b,		/* FC_END */
/* 48 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 50 */	NdrFcShort( 0x0 ),	/* 0 */
/* 52 */	NdrFcShort( 0x8 ),	/* 8 */
/* 54 */	NdrFcShort( 0x0 ),	/* 0 */
/* 56 */	NdrFcShort( 0xffffffde ),	/* Offset= -34 (22) */
/* 58 */	
			0x11, 0x4,	/* FC_RP [alloced_on_stack] */
/* 60 */	NdrFcShort( 0x6 ),	/* Offset= 6 (66) */
/* 62 */	
			0x13, 0x0,	/* FC_OP */
/* 64 */	NdrFcShort( 0xffffffe6 ),	/* Offset= -26 (38) */
/* 66 */	0xb4,		/* FC_USER_MARSHAL */
			0x83,		/* 131 */
/* 68 */	NdrFcShort( 0x0 ),	/* 0 */
/* 70 */	NdrFcShort( 0x8 ),	/* 8 */
/* 72 */	NdrFcShort( 0x0 ),	/* 0 */
/* 74 */	NdrFcShort( 0xfffffff4 ),	/* Offset= -12 (62) */
/* 76 */	
			0x11, 0xc,	/* FC_RP [alloced_on_stack] [simple_pointer] */
/* 78 */	0x8,		/* FC_LONG */
			0x5c,		/* FC_PAD */
/* 80 */	
			0x2f,		/* FC_IP */
			0x5a,		/* FC_CONSTANT_IID */
/* 82 */	NdrFcLong( 0xd55113d0 ),	/* -716106800 */
/* 86 */	NdrFcShort( 0x95c8 ),	/* -27192 */
/* 88 */	NdrFcShort( 0x4427 ),	/* 17447 */
/* 90 */	0x9a,		/* 154 */
			0xad,		/* 173 */
/* 92 */	0xeb,		/* 235 */
			0x8b,		/* 139 */
/* 94 */	0xc1,		/* 193 */
			0xec,		/* 236 */
/* 96 */	0xb4,		/* 180 */
			0xd9,		/* 217 */
/* 98 */	
			0x11, 0xc,	/* FC_RP [alloced_on_stack] [simple_pointer] */
/* 100 */	0x3,		/* FC_SMALL */
			0x5c,		/* FC_PAD */
/* 102 */	
			0x11, 0x4,	/* FC_RP [alloced_on_stack] */
/* 104 */	NdrFcShort( 0x2 ),	/* Offset= 2 (106) */
/* 106 */	
			0x15,		/* FC_STRUCT */
			0x3,		/* 3 */
/* 108 */	NdrFcShort( 0x10 ),	/* 16 */
/* 110 */	0x8,		/* FC_LONG */
			0x6,		/* FC_SHORT */
/* 112 */	0x6,		/* FC_SHORT */
			0x4c,		/* FC_EMBEDDED_COMPLEX */
/* 114 */	0x0,		/* 0 */
			NdrFcShort( 0xffffff93 ),	/* Offset= -109 (6) */
			0x5b,		/* FC_END */
/* 118 */	
			0x11, 0xc,	/* FC_RP [alloced_on_stack] [simple_pointer] */
/* 120 */	0xc,		/* FC_DOUBLE */
			0x5c,		/* FC_PAD */
/* 122 */	
			0x11, 0x0,	/* FC_RP */
/* 124 */	NdrFcShort( 0xffffffee ),	/* Offset= -18 (106) */

			0x0
        }
    };

const CInterfaceProxyVtbl * _g_iiepad_ProxyVtblList[] = 
{
    ( CInterfaceProxyVtbl *) &_gIIEPadEventProxyVtbl,
    ( CInterfaceProxyVtbl *) &_gIEDebugGUIProxyVtbl,
    ( CInterfaceProxyVtbl *) &_gIIEPadProxyVtbl,
    0
};

const CInterfaceStubVtbl * _g_iiepad_StubVtblList[] = 
{
    ( CInterfaceStubVtbl *) &_gIIEPadEventStubVtbl,
    ( CInterfaceStubVtbl *) &_gIEDebugGUIStubVtbl,
    ( CInterfaceStubVtbl *) &_gIIEPadStubVtbl,
    0
};

PCInterfaceName const _g_iiepad_InterfaceNamesList[] = 
{
    "gIIEPadEvent",
    "gIEDebugGUI",
    "gIIEPad",
    0
};

const IID *  _g_iiepad_BaseIIDList[] = 
{
    &IID_IDispatch,
    &IID_IDispatch,
    &IID_IDispatch,
    0
};


#define _g_iiepad_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _g_iiepad, pIID, n)

int __stdcall _g_iiepad_IID_Lookup( const IID * pIID, int * pIndex )
{
    IID_BS_LOOKUP_SETUP

    IID_BS_LOOKUP_INITIAL_TEST( _g_iiepad, 3, 2 )
    IID_BS_LOOKUP_NEXT_TEST( _g_iiepad, 1 )
    IID_BS_LOOKUP_RETURN_RESULT( _g_iiepad, 3, *pIndex )
    
}

const ExtendedProxyFileInfo g_iiepad_ProxyFileInfo = 
{
    (PCInterfaceProxyVtblList *) & _g_iiepad_ProxyVtblList,
    (PCInterfaceStubVtblList *) & _g_iiepad_StubVtblList,
    (const PCInterfaceName * ) & _g_iiepad_InterfaceNamesList,
    (const IID ** ) & _g_iiepad_BaseIIDList,
    & _g_iiepad_IID_Lookup, 
    3,
    2,
    0, /* table of [async_uuid] interfaces */
    0, /* Filler1 */
    0, /* Filler2 */
    0  /* Filler3 */
};


#endif /* defined(_M_IA64) || defined(_M_AXP64)*/

