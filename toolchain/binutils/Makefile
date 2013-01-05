binutils-version:=2.21.1

builddir:=$(BUILD_DIR_TOOLCHAIN)/build-binutils
sourcedir:=$(BUILD_DIR_TOOLCHAIN)/binutils-$(binutils-version)

all: $(builddir)/.installed

$(builddir)/.prepared:
	-rm -rf $(sourcedir) $(builddir)
	mkdir -p $(builddir)
	tar -xjf $(DL_DIR)/binutils-$(binutils-version).tar.bz2 -C $(BUILD_DIR_TOOLCHAIN)
	touch $@

$(builddir)/.configured: $(builddir)/.prepared
	(cd $(builddir); \
	../binutils-$(binutils-version)/configure -target=$(TARGET) --prefix=$(PREFIX) )
	touch $@

$(builddir)/.compiled: $(builddir)/.configured
	(cd $(builddir); \
	make)
	touch $@

$(builddir)/.installed: $(builddir)/.compiled
	(cd $(builddir); \
	make install)
	touch $@
