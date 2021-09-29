$Revision: 1.20 $

Installer:

When uninstalling this software sometimes the installer will
leave "wintab32.dll" in the system directory.  To re-install
the software the user will have to delete this file by hand.

Developer Documentation:

To obtain the developer documentation / samples you *must* use
the "custom" installation option.

ePadInk Errata:

"Map inking area" -- this option will result in data only being
reported within the specified inking region of the device.  The
data is rescaled so that unity is within this region.  Note that
no data reports will occur outside this region when this option 
is enabled.

Device compatibility:

This version of PC software requires firmware >= 0.98.
                 
Known issues:

* Incompatible with pre-existing wintab installations

Although the installer attempts to determine if a wintab stack
has already been installed it is a good idea to ensure that no
other wintab systems are installed prior to installing this
software.

* Windows 98,98SE and Me

Earlier firmware versions also published a HID-mouse interface.
If you are using a serial mouse and have one of these older units,
please make sure it is installed correctly *before* attaching the
ePadInk to the serial port.  If your system does not show a serial
mouse (even though the mouse appears to be working) you must go to
through the add new hardware function off of the control panel and
complete both PNP and non PNP device detection.  This *should*
properly install the serial mouse.

Failure to do so will result in the system "loosing" the mouse function
off of the serial port.

* Device "disappearing" off of the USB bus

In firmware versions 1.00 and earlier contact with the touchscreen
while performing I/O to the device (such as transferring a background
image) may result in the device failing to respond over the USB bus.
The end result is that device functionality will be lost. To recover:

1.  Reboot the system.

OR

1. Close all programs.
2. Detach the device.
3. use ctrl-alt-del and terminate any executing CWintab.exe tasks.
4. Reattach the device.


