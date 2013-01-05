ifneq ($(__rules_inc),1)
__rules_inc=1

PRJROOT:=$(TOPDIR)
TARGET:=arm-linux
PREFIX:=$(PRJROOT)/tools
TARGET_PREFIX:=$(PREFIX)/$(TARGET)

DL_DIR:=$(TOPDIR)/dl
INCLUDE_DIR:=$(TOPDIR)/include

BUILD_DIR_BASE:=$(TOPDIR)/build_dir
STAGING_DIR:=$(PREFIX)
BUILD_DIR_TOOLCHAIN:=$(BUILD_DIR_BASE)/build_tools
BUILD_DIR_PACKAGE:=$(BUILD_DIR_BASE)/build_packages

export

endif #__rules_inc
