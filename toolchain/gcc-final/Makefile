include $(INCLUDE_DIR)/patch.mk

builddir:=$(BUILD_DIR_TOOLCHAIN)/build-gcc

all: $(builddir)/.installed

$(builddir)/.prepared:
	-rm -rf $(builddir)
	mkdir -p $(builddir)
	touch $@

$(builddir)/.configured: $(builddir)/.prepared
	(cd $(builddir); \
	../gcc-4.6.1/configure --target=$(TARGET) --prefix=$(PREFIX) --enable-languages=c,c++ --disable-libgomp)
	touch $@

$(builddir)/.compiled: $(builddir)/.configured
	make -C $(builddir)
	touch $@

$(builddir)/.installed: $(builddir)/.compiled
	(cd $(builddir); \
	make install)
	touch $@