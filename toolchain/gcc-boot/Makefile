include $(INCLUDE_DIR)/patch.mk

gcc-version:=4.6.1
mpfr-version:=2.4.2
gmp-version:=5.0.2
mpc-version:=0.9

builddir:=$(BUILD_DIR_TOOLCHAIN)/build-boot-gcc
sourcedir:=$(BUILD_DIR_TOOLCHAIN)/gcc-$(gcc-version)

all: $(builddir)/.installed

$(builddir)/.prepared:
	-rm -rf $(sourcedir) $(builddir)
	mkdir -p $(builddir)

	tar -xf $(DL_DIR)/gcc-$(gcc-version).tar.gz -C $(BUILD_DIR_TOOLCHAIN)
	(cd $(sourcedir); \
	tar -xf $(DL_DIR)/mpfr-$(mpfr-version).tar.gz; \
	mv mpfr-$(mpfr-version) mpfr; \
	tar -xf $(DL_DIR)/gmp-$(gmp-version).tar.bz2; \
	mv gmp-$(gmp-version) gmp; \
	tar -xf $(DL_DIR)/mpc-$(mpc-version).tar.gz; \
	mv mpc-$(mpc-version) mpc)

	(cd $(sourcedir); \
	$(call p_patch,$(sourcedir),$(CURDIR)/patches))

	touch $@

$(builddir)/.configured: $(builddir)/.prepared
	(cd $(builddir); \
	../gcc-$(gcc-version)/configure --target=$(TARGET) --prefix=$(PREFIX) --without-headers --enable-languages=c --disable-threads --with-newlib --disable-shared --disable-libmudflap --disable-libssp)
	touch $@

$(builddir)/.compiled: $(builddir)/.configured
	(cd $(builddir); \
	make all-gcc; \
	make all-target-libgcc)
	touch $@

$(builddir)/.installed: $(builddir)/.compiled
	(cd $(builddir); \
	make install-gcc; \
	make install-target-libgcc)
	touch $@