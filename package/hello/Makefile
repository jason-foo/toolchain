include $(INCLUDE_DIR)/patch.mk

curdir:=hello
builddir:=$(BUILD_DIR_PACKAGE)/$(curdir)

all: $(builddir)/.compiled

$(builddir)/.prepared:
	-rm -rf $(builddir)
	mkdir -p $(builddir)
	cp -fpR $(CURDIR)/files/* $(builddir)
	touch $@

$(builddir)/.compiled: $(builddir)/.prepared
	make -C $(builddir)
	touch $@
