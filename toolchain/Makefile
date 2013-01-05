include $(INCLUDE_DIR)/p_subdir.mk

export PATH:=$(PREFIX)/bin:$(PATH)

curdir:=toolchain
builddir:=$(BUILD_DIR_TOOLCHAIN)

$(curdir)/builddirs:=kernel binutils gcc-boot glibc gcc-final

all: $(builddir)/.$(curdir)_compiled

$(builddir)/.$(curdir)_prepared:
	mkdir -p $(builddir)
	touch $@

$(builddir)/.$(curdir)_compiled:  $(builddir)/.$(curdir)_prepared
	@$(call p_subdir,$($(curdir)/builddirs))
#	touch $@
