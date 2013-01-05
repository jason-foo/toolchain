include $(INCLUDE_DIR)/p_subdir.mk

export PATH:=$(PREFIX)/bin:$(PATH)

curdir:=package
builddir:=$(BUILD_DIR_PACKAGE)

$(curdir)/builddirs:=$(shell ls -d */)

all: $(builddir)/.$(curdir)_compiled

$(builddir)/.$(curdir)_prepared:
	mkdir -p $(builddir)
	touch $@

$(builddir)/.$(curdir)_compiled: $(builddir)/.$(curdir)_prepared
	$(call p_subdir,$($(curdir)/builddirs))
#	touch $@
