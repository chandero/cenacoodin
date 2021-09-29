/**
$Revision: 1.21 $

$Id: ePadLib.h,v 1.21 2002/10/15 20:23:24 shier Exp $

Copyright (C) 2001 Interlink Electronics. All rights reserved.

$Author: shier $
*/

#ifndef __OSLIB_H__
#define __OSLIB_H__

#include <wdm.h>
#include <hidport.h>

typedef struct tagOSLIB_CLIENTINFO {
    PVOID  pContext;
} OSLIB_CLIENTINFO, *POSLIB_CLIENTINFO;

NTSTATUS osLib_AllocateDevice(PVOID pContext, HANDLE *pHandle);
VOID osLib_FreeDevice(HANDLE handle);

typedef struct tagPASSIVE_CONTEXT {
    PVOID workItem;
    VOID (*pFunc)();
    PVOID pContext;
} PASSIVE_CONTEXT, *PPASSIVE_CONTEXT;

VOID iLink_PassiveHook(IN PDEVICE_OBJECT pDeviceObj, IN PVOID pContext);
NTSTATUS iLink_ExecuteAtPassiveLevel(VOID (*pFunc)(PVOID pUserContext),PDEVICE_OBJECT pDeviceObj, PVOID pContext);

NTSTATUS
iLink_HidRegisterMinidriver(
    IN PHID_MINIDRIVER_REGISTRATION  MinidriverRegistration
    );

BOOLEAN iLink_GetSystemMouseEnabled(IN PDEVICE_OBJECT pDeviceObj);

void osLib_FireMouseEvent(int iButtonState, int dx, int dy);

#endif

/**
$Log: ePadLib.h,v $
Revision 1.21  2002/10/15 20:23:24  shier
Imported files from pid000002-t20021015a

Revision 1.3  2001/08/01 23:21:35  shier
Added iLink_GetSystemMouseEnabled API

Revision 1.2  2001/07/30 19:52:21  shier
Updated to use isolation library

Revision 1.1  2001/06/28 16:48:19  shier
Added class driver skeleton, top-level dirs file.

*/
 
