define p_subdir
	for dir in $(1); do \
		make -C $$dir; \
	done
endef
