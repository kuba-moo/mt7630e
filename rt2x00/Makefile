rt2x00lib-y				+= rt2x00dev.o
rt2x00lib-y				+= rt2x00mac.o
rt2x00lib-y				+= rt2x00config.o
rt2x00lib-y				+= rt2x00queue.o
rt2x00lib-y				+= rt2x00link.o
rt2x00lib-y				+= mt_linux.o
rt2x00lib-$(CONFIG_RT2X00_LIB_DEBUGFS)	+= rt2x00debug.o
rt2x00lib-$(CONFIG_RT2X00_LIB_CRYPTO)	+= rt2x00crypto.o
rt2x00lib-$(CONFIG_RT2X00_LIB_FIRMWARE)	+= rt2x00firmware.o
rt2x00lib-$(CONFIG_RT2X00_LIB_LEDS)	+= rt2x00leds.o

obj-$(CONFIG_RT2X00_LIB)		+= rt2x00lib.o
obj-n					+= rt2x00mmio.o
obj-$(CONFIG_RT2X00_LIB_PCI)		+= rt2x00pci.o
obj-n					+= rt2x00soc.o
obj-n					+= rt2x00usb.o
obj-$(CONFIG_RT2800_LIB)		+= rt2800lib.o
obj-n					+= rt2400pci.o
obj-n					+= rt2500pci.o
obj-n					+= rt61pci.o
obj-$(CONFIG_RT2800PCI)			+= rt2800pci.o
obj-n					+= rt2500usb.o
obj-n					+= rt73usb.o
obj-n					+= rt2800usb.o

KVERSION:= $(shell uname -r)

all:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
