/**
$Revision: 1.21 $
$Revision: 1.21 $

$Id: ePadCls.h,v 1.21 2002/10/15 20:23:24 shier Exp $

Copyright (C) 2001 Interlink Electronics. All rights reserved.

$Author: shier $
*/

#ifndef __EPADCLS_H__
#define __EPADCLS_H__

#include <wdm.h>
#include <windef.h>

typedef struct tagEPAD_KERN_CLIENT_INFO {
    NTSTATUS (*Dispatch)(IN PDEVICE_OBJECT DeviceObject, IN PIRP Irp);
} EPAD_KERN_CLIENT_INFO, *PEPAD_KERN_CLIENT_INFO;

typedef struct tagEPAD_ABS_MOUSE_INFO {
    int x, y;
    int iButtonState;
} EPAD_ABS_MOUSE_INFO, *PEPAD_ABS_MOUSE_INFO;

typedef struct tagEPAD_REL_MOUSE_INFO {
    int x, y;
    int iButtonState;
} EPAD_REL_MOUSE_INFO, *PEPAD_REL_MOUSE_INFO;

typedef struct tagEPAD_KERN_CLIENT {
    PEPAD_KERN_CLIENT_INFO pClientInfo;
    EPAD_ABS_MOUSE_INFO lastMouseInfo;
    PDRIVER_OBJECT *pDriverObj;
    BOOLEAN fMouseInfoValid;
    struct tagEPAD_KERN_CLIENT *pPrev, *pNext;
} EPAD_KERN_CLIENT, *PEPAD_KERN_CLIENT;

#pragma pack(push)
#pragma pack(1)
typedef struct tagEPAD_RAW_USB_PACKET {
    BYTE fButton0 : 1;
    BYTE fButton1 : 1;
    BYTE funcKeys : 3;
    BYTE fTouch   : 1;
    BYTE fTap     : 1;
    BYTE unused1  : 1;

    unsigned short abs_x;
    unsigned short abs_y;

    BYTE  pressure : 7;
    BYTE  unused2  : 1;
} EPAD_RAW_USB_PACKET, *PEPAD_RAW_USB_PACKET;
#pragma pack(pop)

NTSTATUS EPAD_RegisterDriver(IN PVOID Arg1, IN PVOID Arg2);
NTSTATUS EPAD_FireMouseEventAbs(IN HANDLE pHandle, int buttonState, int x, int y);
NTSTATUS EPAD_FireMouseEventRel(IN HANDLE pHandle, int buttonState, int dx, int dy);


// {5E04EE91-E565-4343-A86E-C2EF3490A07D}
static const GUID EPAD_GUID = 
{ 0x5e04ee91, 0xe565, 0x4343, { 0xa8, 0x6e, 0xc2, 0xef, 0x34, 0x90, 0xa0, 0x7d } };


/**
IOCTL interface to user-land
*/
#define EPADCLS_IOCTL_INDEX  0x0000


#define IOCTL_EPADCLS_GET_VERSION     CTL_CODE(FILE_DEVICE_UNKNOWN,  \
                                                   EPADCLS_IOCTL_INDEX,\
                                                   METHOD_BUFFERED,  \
                                                   FILE_ANY_ACCESS)
typedef struct tagEPADCLS_VERSION_INFO {
    ULONG   majorVersion;
    ULONG   minorVersion;
    CHAR    dateTimeString[40];
} EPADCLS_VERSION_INFO, *PEPADCLS_VERSION_INFO;

                                                   
#define IOCTL_EPADCLS_ENUM_DEVICES     CTL_CODE(FILE_DEVICE_UNKNOWN,  \
                                                   EPADCLS_IOCTL_INDEX+1,\
                                                   METHOD_BUFFERED,  \
                                                   FILE_ANY_ACCESS)
typedef struct tagEPADCLS_ENUM_DEVICE_INFO {
    ULONG   nDevices;
    ULONG   deviceMatrix[1];
} EPADCLS_ENUM_DEVICE_INFO, *PEPADCLS_ENUM_DEVICE_INFO;

#define IOCTL_EPADCLS_SET_HID_BYPASS     CTL_CODE(FILE_DEVICE_UNKNOWN,  \
                                                   EPADCLS_IOCTL_INDEX+2,\
                                                   METHOD_BUFFERED,  \
                                                   FILE_ANY_ACCESS)
// bool *pByPass (true = bypass, false = no bypass)                                                   

#define IOCTL_EPADCLS_FIRE_MOUSE_REL     CTL_CODE(FILE_DEVICE_UNKNOWN,  \
                                                   EPADCLS_IOCTL_INDEX+3,\
                                                   METHOD_BUFFERED,  \
                                                   FILE_ANY_ACCESS)
// PEPAD_REL_MOUSE_INFO

#define IOCTL_EPADCLS_GET_RAW_USB_PACKET     CTL_CODE(FILE_DEVICE_UNKNOWN,  \
                                                   EPADCLS_IOCTL_INDEX+4,\
                                                   METHOD_BUFFERED,  \
                                                   FILE_ANY_ACCESS)
                                                   
// PEPAD_RAW_USB_PACKET

#define IOCTL_EPADCLS_USB_PASSTHRU     CTL_CODE(FILE_DEVICE_UNKNOWN,  \
                                                   EPADCLS_IOCTL_INDEX+5,\
                                                   METHOD_BUFFERED,  \
                                                   FILE_ANY_ACCESS)


#endif

/**
$Log: ePadCls.h,v $
Revision 1.21  2002/10/15 20:23:24  shier
Imported files from pid000002-t20021015a

Revision 1.3  2001/07/05 22:16:13  shier
Updated -- basic working relative mouse under WinME

Revision 1.2  2001/06/28 21:30:20  shier
Updated -- loads filter + class driver under WinME

Revision 1.1  2001/06/28 16:48:19  shier
Added class driver skeleton, top-level dirs file.

*/

