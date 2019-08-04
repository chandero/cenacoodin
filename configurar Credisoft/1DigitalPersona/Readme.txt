   ------------------------------------------------------------------
                           DigitalPersona    

                  DigitalPersona Platinum SDK 3.3.0 
                 
                            Readme File
          
                             May 2007
   ------------------------------------------------------------------
               
          (c) DigitalPersona, Inc., 2007. All rights reserved


This document provides late-breaking or other information that supplements the DigitalPersona Platinum SDK Guide.


-------------------------
How to Use This Document
-------------------------

To view the Readme file on-screen in Windows Notepad, maximize the Notepad window. On the Edit menu, click Word Wrap.

To print the Readme file, open it in Notepad or another word processor, and then use the Print command on the File menu.


---------
CONTENTS
---------

1.   INSTALLATION

2.   COMPATIBILITY
     
3.   SYSTEM REQUIREMENTS

4.   RELEASE NOTES
	4.1	Windows Vista Support
	4.2     Support for new DigitalPersona keyboard with newer U.are.U reader
	4.3     New Installer method

5.   KNOWN ISSUES	
	5.1	Compile VB sample code
	5.2	Setup.msi on Vista
	5.3	Installation on Vist
	
6.   SUPPORT AND FEEDBACK


----------------
1. INSTALLATION
----------------

You must have local administrator rights to install this product on the supported Windows NT-based operating systems.

1- Insert the Platinum SDK CD in the CD-ROM drive.
2- Run Setup.exe located in the root of the CD.
3- If needed, the installer will install Microsoft Windows Installer and ask you to restart your computer. After the computer restarts, the installation will continue automatically. This usually happens only on Windows 98 and NT.
4- Follow the installation instructions.
5- Restart the computer and log on to your Windows account.
6- Connect the U.are.U Fingerprint Reader.


-----------------
2. COMPATIBILITY
-----------------

DigitalPersona Platinum SDK version 3.3.0 is compatible with the following DigitalPersona products:
- DigitalPersona Gold SDK/Fingerprint Recognition Software/For Java version 2.4.0 and later
- DigitalPersona Pro for Active Directory version 3.4.0 and 3.5.0
- DigitalPersona Pro Kiosk version 1.x.x
- DigitalPersona Platinum SDK/Fingerprint Recognition Software version 3.0.0 and later

DigitalPersona Platinum SDK version 3.3.0 is not compatible with:
- DigitalPersona Pro for Active Directory version 4.x.x
- DigitalPersona Password Manager

DigitalPersona Platinum SDK is not certified to be used in conjunction with the following DigitalPersona products:
- U.are.U Pro for AD version 2.1.4 and earlier
- U.are.U Personal 
- U.are.U Pro for NT 
- U.are.U Pro for AD-SA
- U.are.U Gold SDK/Sensor Software 2.3.0 and earlier

This version of the Platinum SDK version 3.3.0 is not certified (not tested) on Windows 98 and Windows NT operating systems.


-----------------------
3. SYSTEM REQUIREMENTS
-----------------------

- Pentium-class processor
- 30MB free hard disk space
- USB port 
- Windows Vista, Windows 2000 Server, Windows 2000 Advanced Server, Windows 2003 Server, Windows XP Professional, Windows 2000 Professional. 


-----------------
4. RELEASE NOTES
-----------------

4.1	Windows Vista Support
This version now supports the new Windows Vista 32-bit operating system. Developers might need to modify application services and driver services to run in Windows Vista; please refer to the Microsoft document: "Impact of Session 0 Isolation on  Services and Drivers in Windows Vista". This document is included on the product CD in the Docs folder, the filename is "Session0_Vista.doc".

4.2	Support for new keyboard with U.are.U reader
This version includes a new WHQL driver that supports the newer U.are.U 4000B reader Rev 101, and the new DigitalPersona Fingerprint Keyboards.

4.3	New Installer method
Microsoft Install Framework was used to install device drivers.


----------------
5. KNOWN ISSUES
----------------

5.1	Compile VB sample code
Visual Basic sample code can only be compiled in Visual Studio 6.

5.2	Setup.msi on Vista
On Vista computers, setup.msi does not have sufficient priviliges to execute successfully. You must run setup.exe.

5.3	Installation on Vista
To install on Vista computers, right mouse click on setup.msi and select "Run as administrator" to start installation.

------------------------
6. SUPPORT AND FEEDBACK
------------------------
 
If you have suggestions for future product releases or require technical support for your product, e-mail to techsupport@digitalpersona.com. In the subject line, type "DigitalPersona Platinum SDK support".

The DigitalPersona Web site, at http://www.digitalpersona.com, provides support for registered users as well.

