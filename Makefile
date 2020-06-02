# Since meson does not support changing options from the meson.build file,
# this require to configure them before. It is also possible to change them
# with default_options but in that case 'wipe refresh' for the build directory is required.

BUILD_DIR		:= ./build

DEBUG_OPTS		:= -Dbuildtype=debugoptimized
RELEASE_OPTS	:= -Dbuildtype=release -Doptimization=3

TARGET_TESTS	:= test_unit test_benchmark
TARGET_CONF		:= conf_debug conf_release

# Construct valgrind tests
TARGET_TESTS_V	= $(TARGET_TESTS:=_valgrind)

.PHONY: build clean test test_valgrind vim_prepare $(TARGET_TESTS) $(TARGET_TESTS_V) $(TARGET_CONF)
default: build

build:
	@[ -d $(BUILD_DIR) ] || meson $(BUILD_DIR)
	@ninja -C $(BUILD_DIR)

	@make show | grep -qE auto_unit_tests[[:space:]]*true && make test_unit || return 0

#
# CONFIGURE
#

conf_debug:
	@meson configure $(BUILD_DIR) $(DEBUG_OPTS)
	@echo "Configured debug build:\n$(DEBUG_OPTS)"

conf_release:
	@meson configure $(BUILD_DIR) $(RELEASE_OPTS)
	@echo "Configured release build:\n$(RELEASE_OPTS)"

#
# TESTS
#

test:
	@meson test -C $(BUILD_DIR)

test_valgrind:
	@meson test -C $(BUILD_DIR) --wrap='valgrind --tool=helgrind'

test_unit:
	@meson test -C $(BUILD_DIR) 'Unit tests'

test_unit_valgrind:
	@meson test -C $(BUILD_DIR) --wrap='valgrind --tool=helgrind' 'Unit tests'
	
test_benchmark:
	@meson test -C $(BUILD_DIR) 'Unit tests'

test_benchmark_valgrind:
	@meson test -C $(BUILD_DIR) --wrap='valgrind --tool=helgrind' 'Benchmark tests'

#
# OTHER
#

vim_prepare:
	@# Configure for YouCompleteMe
	@# Since YCM is damn great, there is an option to use pregenerated
	@# config for the project (instead using .ycm_extra_conf.py)
	@# Ninja can list your setup for build and YCM is possible to parse it.
	@# NOTE: It reuires YCM installed for the vim, you can use
	@# https://github.com/Lechnio/LinuxEasyManager to do it for you.
	
	@# dummy check
	@[ -d ~/.vim/bundle/YouCompleteMe ] || (echo "Error: YouCompleteMe is not installed." && return 1)
	
	@# Fixed 'compile_commands.json' name is required by YCM.
	@ninja -C $(BUILD_DIR) -t compdb > $(BUILD_DIR)/compile_commands.json

show:
	@echo "BUILD_DIR=$(BUILD_DIR)"
	meson configure $(BUILD_DIR)

clean:
	@rm -rf $(BUILD_DIR) && echo "Build directory removed: '$(BUILD_DIR)'"
