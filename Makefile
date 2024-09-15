include $(TOPDIR)/rules.mk

PKG_NAME:=nodogsplash
PKG_VERSION:=custom
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=local
PKG_SOURCE_VERSION:=custom

PKG_LICENSE:=GPL-2.0-only
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/nodogsplash
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Captive Portals
  TITLE:=NoDogSplash
  DEPENDS:=+libpthread +libmicrohttpd
endef

define Package/nodogsplash/description
  NoDogSplash is a Captive Portal.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
	if [ -d "./src/." ]; then \
		$(CP) ./src/.[!.]* $(PKG_BUILD_DIR)/ 2>/dev/null || true; \
	fi
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -Wall" \
		LDFLAGS="$(TARGET_LDFLAGS) -lmicrohttpd"
endef

define Package/nodogsplash/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nodogsplash $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ndsctl $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/nodogsplash/htdocs/images
	$(INSTALL_CONF) ./resources/nodogsplash.conf $(1)/etc/nodogsplash/
	$(INSTALL_DATA) ./resources/splash.html $(1)/etc/nodogsplash/htdocs/
	$(INSTALL_DATA) ./resources/splash.css $(1)/etc/nodogsplash/htdocs/
	$(INSTALL_DATA) ./resources/status.html $(1)/etc/nodogsplash/htdocs/
	$(INSTALL_DATA) ./resources/splash.jpg $(1)/etc/nodogsplash/htdocs/images/
endef

$(eval $(call BuildPackage,nodogsplash))

