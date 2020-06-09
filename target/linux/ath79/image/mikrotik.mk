include ./common-mikrotik.mk

define Device/mikrotik_routerboard-493g
  $(Device/mikrotik)
  SOC := ar7161
  DEVICE_MODEL := RouterBOARD 493G
  IMAGE/sysupgrade.bin = append-kernel | kernel2minor -s 2048 -e -c | \
	sysupgrade-tar kernel=$$$$@ | append-metadata
  DEVICE_PACKAGES += kmod-usb-ohci kmod-usb2 nand-utils
  SUPPORTED_DEVICES += rb-493g
endef
TARGET_DEVICES += mikrotik_routerboard-493g

define Device/mikrotik_routerboard-922uags-5hpacd
  $(Device/mikrotik)
  SOC := qca9558
  DEVICE_MODEL := RouterBOARD 922UAGS-5HPacD
  IMAGE/sysupgrade.bin = append-kernel | kernel2minor -s 2048 -e -c | \
	sysupgrade-tar kernel=$$$$@ | append-metadata
  DEVICE_PACKAGES += kmod-ath10k-ct ath10k-firmware-qca988x-ct \
	kmod-usb2 nand-utils
  SUPPORTED_DEVICES += rb-922uags-5hpacd
endef
TARGET_DEVICES += mikrotik_routerboard-922uags-5hpacd

define Device/mikrotik_lhg-hb
  $(Device/mikrotik_nor)
  SOC := qca9533
  DEVICE_PACKAGES += rssileds
endef

define Device/mikrotik_lhg-2nd
  $(Device/mikrotik_lhg-hb)
  DEVICE_MODEL := LHG 2 (RBLHG-2nD)
endef
TARGET_DEVICES += mikrotik_lhg-2nd

define Device/mikrotik_routerboard-wap-g-5hact2hnd
  $(Device/mikrotik_nor)
  SOC := qca9556
  DEVICE_MODEL := RouterBOARD wAP G-5HacT2HnD (wAP AC)
  SUPPORTED_DEVICES += rb-wapg-5hact2hnd
endef
TARGET_DEVICES += mikrotik_routerboard-wap-g-5hact2hnd
