## MediaTek MT7630E WiFi and Bluetooth drivers

Official MediaTek MT7630E driver with various fixes and clean-ups.  This driver should work for any recent kernel.

#### Instructions

This driver has been modified to work as a single module therefore some of the official instructions (from [ReadMe](ReadMe)) will not work.  Before compilation make sure you have all the packages required by your distro to build modules installed, then proceed as follows:

First clone the repo:
```
git clone git@github.com:kuba-moo/mt7630e.git
cd mt7630e
```
Build the drivers:
```
make
```
If build was successful there should be two modules present: *rt2x00/mt7630e.ko* and *btloader/mt76xx.ko*.  To install firmware and drivers you need to be root or use *sudo -s*:
```
sudo -s make install
```
Load the drivers:
```
sudo modprobe mt7630e
sudo modprobe mt76xx
```
Drivers should be automatically loaded after reboot.

You can uninstall drivers and firmware by running:
```
cd path_to_mt7630e/
sudo -s make uninstall
```

You can also use the driver without installing it.  First copy the firmware:
```
sudo cp -v firmware/*/* /lib/firmware/
```
then load the drivers manually:
```
sudo modprobe rt2800pci
sudo insmod ./rt2x00/mt7630e.ko
sudo insmod ./btloader/mt76xx.ko
```
Note: loading rt2800pci will make sure all required modules are present before you load the proper driver. You can *modprobe -r rt2800pci* to remove all unnecessary modules after *mt7630e* was loaded.

It is possible to enable dynamic module build with dkms package:
```
sudo make dkms
```
Drivers will be automatically rebuild for every new kernel update

For original instructions see [ReadMe](ReadMe).

#### Source

This driver is a modification of the vendor code: ```MT7630E_Wi-Fi_BT_Source_V3.14_20140625_v2.tar.gz```

with following MD5 checksum: ```d8583926d6c8ba8c3a1a8dd0b44a066e```

which can be downloaded from: [MediaTek website](http://www.mediatek.com/en/downloads/mt7630-pcie/).
