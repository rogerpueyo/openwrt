#
# Copyright (C) 2018 adron@yapic.net
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mtpoe_ctrl
PKG_SOURCE_VERSION:=7d6b6efd8501d8e1f83957ac6fe9355c5a4694fc
PKG_VERSION:=1.15
PKG_RELEASE:=19

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/rogerpueyo/mtpoe_ctrl.git
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Sergey Sergeev <adron@yapic.net>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/mtpoe_ctrl
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libuci +kmod-spi-dev
  TITLE:=Management utility for Mikrotiks PoE V2/V3
  URL:=https://github.com/rogerpueyo/mtpoe_ctrl.git
endef

define Package/mtpoe_ctrl/description
	Management utility for Mikrotiks PoE V2/V3
endef

define Package/mtpoe_ctrl/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bins/mtpoe_ctrl $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/openwrt/etc/init.d/mtpoe_ctrl $(1)/etc/init.d
endef

$(eval $(call BuildPackage,mtpoe_ctrl))
