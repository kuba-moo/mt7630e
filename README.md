Official MediaTek MT7630E driver with various fixes and clean-ups.  This driver should work for any recent kernel.

## MediaTek MT7630E WiFi and Bluetooth drivers

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
If build was successful there should be two modules present: *rt2x00/mt7630e.ko* and *btloader/mt76xx.ko*.  To install firmware and drivers you need to be root or use *sudo*:
```
sudo make install
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
sudo make uninstall
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

For original instructions see [ReadMe](ReadMe).
