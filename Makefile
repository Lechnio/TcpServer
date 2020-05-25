# Since meson does not support changing options from the meson.build file,
# this require to configure them before. It is also possible to change them
# with default_options but in that case 'wipe refresh' for the build directory is required.

BUILD_DIR		:= ./build

DEBUG_OPTS		:= -Dbuildtype=debugoptimized
RELEASE_OPTS	:= -Dbuildtype=release -Doptimization=3

.PHONY: test clean build conf_debug conf_release
default: build

build:
	@[ -d $(BUILD_DIR) ] || meson $(BUILD_DIR)
	@ninja -C $(BUILD_DIR)

conf_debug:
	@meson configure $(BUILD_DIR) $(DEBUG_OPTS)
	@echo "Configured debug build:\n$(DEBUG_OPTS)"

conf_release:
	@meson configure $(BUILD_DIR) $(RELEASE_OPTS)
	@echo "Configured release build:\n$(RELEASE_OPTS)"

test:
	@echo "BUILD_DIR=$(BUILD_DIR)"

clean:
	rm -rf $(BUILD_DIR)
