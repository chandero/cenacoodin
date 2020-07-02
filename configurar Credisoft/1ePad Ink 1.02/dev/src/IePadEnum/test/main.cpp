/**
$Revision: 1.17 $
*/

#include "..\stdafx.h"
#include <atlbase.h>
#include <atlcom.h>


#import "..\release\IEPadEnum.dll"
#include "..\iepadenum.h"
#include "..\iepadenum1.h"
#include "..\iepadenum_i.c"

/**
Main (console) test program to simply call up enumerator's debug GUI
*/
int main(int argc, char *argv[])
{
	int iResult;
	HRESULT hr;
	IEPadEnum *pEPadEnum;

	iResult = 0;
	if ( FAILED(CoInitialize(NULL)) ) {
		iResult = -1;
		printf("Failed to initialize com\n");
	} else {
		pEPadEnum = NULL;
		hr = CoCreateInstance(  CLSID_IEPadEnum,
								NULL,
								CLSCTX_INPROC,
								IID_IIEPadEnum,
								(void **)&pEPadEnum );
		if ( !FAILED(hr) ) {
			pEPadEnum->DisplayDebugGUI();
			pEPadEnum->Release();
		} else {
			printf("Failed to create class instance\n");
		} // endif
	} // endif

	CoUninitialize();

	return ( iResult );
}


/**
$Log: main.cpp,v $
Revision 1.17  2002/10/15 20:23:24  shier
Imported files from pid000002-t20021015a

Revision 1.3  2002/10/04 21:44:31  shier
Rebuilt binaries with latest source on new dev platform.

Revision 1.2  2002/04/02 17:18:56  shier
Added comment

Revision 1.1  2001/11/06 18:07:51  shier
Added iePadEnum to repository.

*/
