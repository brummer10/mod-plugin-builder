######################################
#
# metaltone
#
######################################

METALTONE_VERSION = e0868b13238f01b9d347f29eba4d4855a8e091a0
METALTONE_SITE = $(call github,brummer10,MetalTone,$(METALTONE_VERSION))
METALTONE_BUNDLES = MetalTone.lv2

ifdef BR2_cortex_a7
METALTONE_SSE_CFLAGS = -mfpu=vfpv3
else
METALTONE_SSE_CFLAGS = ""
endif

METALTONE_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE)  SSE_CFLAGS="$(METALTONE_SSE_CFLAGS)" -C $(@D)

define METALTONE_BUILD_CMDS
	$(METALTONE_TARGET_MAKE) mod
endef

define METALTONE_INSTALL_TARGET_CMDS
	$(METALTONE_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_DIR=/usr/lib/lv2
endef

$(eval $(generic-package))
