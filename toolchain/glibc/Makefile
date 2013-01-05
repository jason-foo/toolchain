include $(INCLUDE_DIR)/patch.mk

glibc-version:=2.14
glibc-linuxthreads-version:=2.5
glibc-ports-version:=2.13

builddir:=$(BUILD_DIR_TOOLCHAIN)/build-glibc
sourcedir:=$(BUILD_DIR_TOOLCHAIN)/glibc-$(glibc-version)

all: $(builddir)/.installed

$(builddir)/.prepared:
	-rm -rf $(sourcedir) $(builddir)
	mkdir -p $(builddir)

	tar -xf $(DL_DIR)/glibc-$(glibc-version).tar.gz -C $(BUILD_DIR_TOOLCHAIN)
	(cd $(sourcedir); \
	tar -xf $(DL_DIR)/glibc-linuxthreads-$(glibc-linuxthreads-version).tar.bz2; \
	tar -xf $(DL_DIR)/glibc-ports-$(glibc-ports-version).tar.gz; \
	mv glibc-ports-$(glibc-ports-version) ports; \
	$(call p_patch,$(sourcedir),$(CURDIR)/patches))

	(cd $(STAGING_DIR)/lib/gcc/arm-linux/4.6.1; \
	ln -sf libgcc.a libgcc_eh.a)

	touch $@

$(builddir)/.configured: $(builddir)/.prepared
	cp -fpR $(CURDIR)/files/* $(builddir)

	(cd $(builddir); \
	BUILD_CC="gcc" CC=$(TARGET)-gcc ../glibc-$(glibc-version)/configure --host=$(TARGET) --target=$(TARGET) --prefix=/usr --enable-add-ons --disable-profile --cache-file=config.cache --with-binutils=$(PREFIX)/bin/ --with-headers=$(TARGET_PREFIX)/include/)
	touch $@

$(builddir)/.compiled: $(builddir)/.configured
	make -C $(builddir)
	touch $@

$(builddir)/.installed: $(builddir)/.compiled
	(cd $(builddir); \
	make install_root=$(TARGET_PREFIX) prefix="" install)
	(cd $(sourcedir); \
	$(call p_patch,$(TARGET_PREFIX),$(CURDIR)/patches,_install))
	touch $@
