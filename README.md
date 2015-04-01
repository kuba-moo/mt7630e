Official MediaTek MT7630E driver with various fixes and clean-ups.  This driver should work for any recent kernel.

## Compilation

This driver has been modified to work as a single module therefore some of the official instructions (from [ReadMe](ReadMe)) will not work.  Before compilation make sure you have all the packages required by your distro to build modules installed, then proceed as follows:

First clone the repo:
```
git clone git@github.com:kuba-moo/mt7630e.git
cd mt7630e
```
Build the WiFi driver:
```
cd rt2x00/
make
cd ../
```
If build was successful there should be a *mt7630e.ko* file inside *rt2x00/* directory.  For next steps you need to be root (use *sudo su*).  Copy the firmware:
```
cp firmware/Wi-FI/MT7650E234.bin /lib/firmware/
```
Load the driver:
```
modprobe rt2800pci
insmod ./rt2x00/mt7630e.ko
```
Note: loading rt2800pci will make sure all required modules are present before you load the proper driver. You can *modprobe -r rt2800pci* to remove all unnecessary modules after *mt7630e* was loaded.

For Bluetooth use instructions from [ReadMe](ReadMe).