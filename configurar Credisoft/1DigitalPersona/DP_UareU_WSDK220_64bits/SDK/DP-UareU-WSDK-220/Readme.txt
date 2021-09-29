-------------------------------------------------------------------

                           DigitalPersona
                         U.are.U Windows SDK

                           Version 2.2.0
                          November 12 2012
				
      (c) 1996-2012 DigitalPersona, Inc. All Rights Reserved. 
-------------------------------------------------------------------

This document provides late-breaking or other information that supplements the DigitalPersona U.are.U Windows SDK documentation.


-------------------------
How to Use This Document
-------------------------

To view the Readme file on-screen in Windows Notepad, maximize the Notepad window. On the Format menu, click Word Wrap. To print the Readme file, open it in Notepad or another word processor, and then use the Print command on the File menu.


---------
CONTENTS
---------

1.   INSTALLATION
2.   COMPATIBILITY
3.   SYSTEM REQUIREMENTS
4.   RELEASE NOTES
5.   KNOWN ISSUE  
6.   SUPPORT AND FEEDBACK

 
----------------
1. INSTALLATION
----------------

You must have local administrator rights to install this product on supported Windows systems.

U.are.U Windows SDK 2.2.0
1- Open/load the U.are.U Windows SDK product package
2- Run SDK\x86\setup.msi or SDK\x64\setup.msi
3- Follow the installation instructions
4- Connect the U.are.U Fingerprint Reader

U.are.U Windows RTE 2.2.0
1- Open/load the U.are.U Windows SDK product package 
2- Run RTE\x86\setup.msi or RTE\x64\setup.msi
3- Follow the installation instructions
4- Connect the U.are.U Fingerprint Reader


-----------------
2. COMPATIBILITY
-----------------

DigitalPersona U.are.U Windows SDK 2.2.0 is compatible with the following DigitalPersona products:

- DigitalPersona Pro for AD Workstation 5.3.0 and later
- DigitalPersona Pro for AD Kiosk 5.3.0 and later

Fingerprint templates produced by the U.are.U Windows SDK are also compatible with the following DigitalPersona SDKs:

- Gold SDK
- Gold CE SDK
- One Touch for Windows SDK, all previous editions
- One Touch for Linux SDK, all distributions
- U.are.U Linux SDK 2.x
- U.are.U Windows CE SDK 2.x

Platinum SDK registration templates must be converted to a compatible format to work with these SDKs. See the Developer Guide for instructions on performing the conversion. 

DigitalPersona U.are.U Windows SDK 2.2.0 is incompatible with any other DigitalPersona product.


-----------------------
3. SYSTEM REQUIREMENTS
-----------------------

For U.are.U 4500 readers:
- Microsoft Windows XP (32/64-bit), Microsoft Windows Vista (32/64-bit), Microsoft Windows 7 (32/64-bit), or Microsoft Server 2003/2008 (32/64-bit)

For U.are.U 5100 readers:
- Microsoft Windows XP (32-bit) or Microsoft Windows 7 (32/64-bit)

For U.are.U 4500 and 5100 readers:
- CD/DVD drive (for CD-ROM installation)
- JRE or JDK - To run samples and completed applications if developing in Java
- .NET Framework v2 or newer - To run samples and develop applications for .NET
- USB port on the computer where the fingerprint reader is to be connected


-----------------
4. RELEASE NOTES
-----------------

4.1 This release Provides interface for:
- C++
- .NET
- ActiveX
- Java
- JavaPOS
- OPOS


-----------------
5.   KNOWN ISSUE
-----------------

5.1  Streaming is not supported in Remote Desktop or Citrix environment. 

5.2  IE7 can receive images directly from ActiveX but has a limitation where it cannot display these images on the screen.  For IE7, the sample shows users how to receive captured and streamed images, but does not display them.

5.3  OPOS: Two of the four standard algorithms for OPOS are not implemented, specifically algorithm 1 and 4. The ANSI (when algorithm property is set to 2) and ISO (when algorithm property is set to 3) algorithms are in working condition. 

The first algorithm which is when the algorithm property is set to 1 or 0 (0 means default) allows legacy DigitalPersona templates to be used by the OPOS wrapper for enrollment and verification. This algorithm produces legacy DigitalPersona templates which include the standard 45-byte UPOS header. The fourth algorithm (when algorithm property is set to 4) is the same as the first algorithm except the algorithm produces legacy DigitalPersona templates which include 12-byte headers that are not standardized to the UPOS spec but standard to the previous version of this product.



------------------------
6. SUPPORT AND FEEDBACK
------------------------

The latest version of documentation is available at http://www.digitalpersona.com/Support/Reference-Material/DigitalPersona-SDK-Reference-Material/

We provide fee-based support packages and support for registered users at our web site http://www.digitalpersona.com. 

Free technical support is available through the DigitalPersona Developer Connection forums at www.digitalpersona.com/webforums.

If you have suggestions for future product releases or require technical support for the beta version of the SDK, send email to techsupport@digitalpersona.com. In the subject line, type "U.are.U Windows SDK 2.2.0 support."

You can also purchase a Developer Support package at our web store: https://store2.esellerate.net/store/checkout/CustomLayout.aspx?s=STR1045285899&pc=&page=OnePageCatalog.htm

