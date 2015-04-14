.PHONY: all clean install uninstall

KDIR ?= /lib/modules/`uname -r`/build
DST_DIR ?= /lib/modules/`uname -r`/kernel/drivers/net/wireless/

all:
	$(MAKE) -C $(KDIR) M=$(PWD)/rt2x00 modules
	$(MAKE) -C $(KDIR) M=$(PWD)/btloader modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD)/rt2x00 clean
	$(MAKE) -C $(KDIR) M=$(PWD)/btloader clean

install:
	cp -v firmware/*/* /lib/firmware/
	cp rt2x00/mt7630e.ko $(DST_DIR)
	cp btloader/mt76xx.ko $(DST_DIR)
	depmod

uninstall:
	rm -vf /lib/firmware/mt76x0.bin /lib/firmware/MT7650E234.bin
	rm -vf $(DST_DIR)/mt7630e.ko
	rm -vf $(DST_DIR)/mt76xx.ko
	depmod

dkms:
	cp -v firmware/*/* /lib/firmware/
	cp -R . /usr/src/mt7630e-0.1
	dkms add -m mt7630e -v 0.1
	dkms build -m mt7630e -v 0.1
	dkms install -m mt7630e -v 0.1
