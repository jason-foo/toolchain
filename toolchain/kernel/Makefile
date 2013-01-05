builddir:=$(BUILD_DIR_TOOLCHAIN)/kernel
install_dir:=$(STAGING_DIR)/$(TARGET)

version:=2.6.32.27

all: $(builddir)/.installed

$(builddir)/.prepared:
	-rm -rf $(builddir)
	mkdir -p $(builddir)
	tar -xf $(DL_DIR)/linux-$(version).tar.gz -C $(builddir)
	touch $@

$(builddir)/.compiled: $(builddir)/.prepared
	(cd $(builddir)/linux-$(version); make include/linux/version.h)
	touch $@

$(builddir)/.installed: $(builddir)/.compiled
	mkdir -p $(install_dir)/include
	(cd $(install_dir)/include; \
	ln -sf $(builddir)/linux-$(version)/include/linux linux ;\
	ln -sf $(builddir)/linux-$(version)/include/asm-generic asm-generic; \
	ln -sf $(builddir)/linux-$(version)/arch/arm/include/asm asm)
	touch $@
