# author: Jason.Fu
# mail: fujianshuang@gmail.com

TOPDIR:=$(CURDIR)
export TOPDIR

world:

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/p_subdir.mk

prepare: .prepared
.prepared:
	mkdir -p $(BUILD_DIR_BASE) $(STAGING_DIR) $(STAMP_DIR) 
	mkdir -p $(PREFIX)/bin
	touch $@

dirs:=toolchain package
world: prepare
	@$(call p_subdir,$(patsubst %,$(TOPDIR)/%,$(dirs)))
	file $(BUILD_DIR_PACKAGE)/hello/hello

help:
	@cat README

debug:
	@echo $@
clean:
	-rm -rf $(BUILD_DIR_BASE) $(STAMP_DIR) $(STAGING_DIR)
	-rm .prepared

.PHONY: prepare world clean help debug