# parameters: destination_dir patchdir patchdir_suffix
define p_patch
	(cd $(1); \
	if [ -d $(2)$(3) ] && [ $$(ls $(2)$(3) | wc -l) -gt 0 ]; then \
		for patchfile in $$(ls $(2)$(3)); do \
			echo "Applying patch $$patchfile ..."; \
			echo -n "   "; \
			patch -p0 -i $(2)$(3)/$$patchfile; \
		done \
	fi)
endef