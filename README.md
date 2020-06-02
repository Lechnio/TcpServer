[![license](https://img.shields.io/github/license/Lechnio/TcpServer)][license]

 [license]: https://github.com/Lechnio/TcpServer/blob/master/LICENSE "License"

# TcpServer
TCP core server in C++ for Linux

### Soon...
:see_no_evil:

## Requirements
Build was tested with utils listed below.
 * [Meson 0.54.1][meson]
 * [gcc 8.3.0][gcc]

Optional:
 * [Valgrind][valgrind] Required for running `test_valgrind` target which launch all test and checks for any memory leaks.

 [meson]: https://mesonbuild.com/ "Meson build system"
 [gcc]: https://gcc.gnu.org/ "GNU gcc"
 [valgrind]: http://valgrind.org/downloads/?src=www.discoversdk.com "Valgrind download"

## Getting Started
### Build
Clone the repository with
```
$ git clone https://github.com/Lechnio/LinuxEasyManager.git
```
Enter to the TcpServer directory and run
```
$ make
```

#### Build files tree
After the build has been passed, output tree is generated in the build directory:
```
build                           # Build directory
├── libtcpServer.so             # Main Tcp server shared library
├── examples                    # Examples directory
│   ├── fileTransfer
│   │   └── fileTransfer        # Executable example
│   └── pingPong
│       └── pingPong            # Executable example
└── tests                       # Tests directory
    ├── benchmark
    │   └── benchmarkTests      # Executable benchmark tests
    └── unit
        └── unitTests           # Executable unit tests
```

### IDE integration
 [ycm]: https://github.com/ycm-core/YouCompleteMe "YouCompleteMe plugin for VIM"
 [easy-manager]: https://github.com/Lechnio/LinuxEasyManager "Linux Easy Manager"

Since ninja backend is fully supported by the [YouCompleteMe (YCM)][ycm] VIM's plugin,
that is what I use by myself durring development.
If you are wondering how to use VIM to development, guide below is for you.
1. Install YCM plugin for your VIM editor.
You can easily do this by following the instructions from YCM's README, or you can get my own VIM setup (not only YCM)
from the other repository (see [LinuxEasyManager][easy-manager]).
2. After build directory was created with `make` there should be nothing more to do.
YCM will read `compile_commands.json` file in order to synchronize with compile options.<br />
NOTE: In case that ninja wont generate this file automatically `make vim_prepare` could be used as fallback.

Meson build system is also fully supported by KDevelop, just open main project directory into it.
That is probably not only one IDE supporting it, but the one I have used for a while.

## Configuring build type
Meson allows configuring a current build via its built-in options.
Those options can be extended with `meson_options.txt` file, but they can not be changed
form the inside of the `meson.build`. Therefore `Makefile` was created.
Since that `Makefile` exists, all possible targets can be list with `make [double TAB press]`.
All targets whose name starts with `conf_` can be used to reconfigure your build directory.

For example if you want to develop this project and test some of yours new features,
in such a case just perform
```
$ make conf_debug
```
to reconfigure the project for debugging, and update current build with
```
$ make
```

## Tests
There are two types of tests included, unit tests and benchmark tests.
Unit tests are run automatically after each build is made with `make`. That auto run option can be overrided with
```
$ meson configure -Dauto_unit_tests=false build
```

Running tests can be also performed any time with
```
$ make test
```
which executes all tests, or e.g.
```
$ make test_unit
```
to execute only specified test suite (in this case only unit tests).

### Extended tests
All test targets can be also used with additional memory checking (using [Valgrind][valgrind]).
One required thing here is to run specified test target with `_valgrind` suffix, e.g.
```
$ make test_unit_valgrind
```

## Examples
All examples are built automatically as default.
