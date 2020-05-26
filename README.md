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

## Build
Clone the repository with
```
$ git clone https://github.com/Lechnio/LinuxEasyManager.git
```
Enter to the TcpServer directory and run
```
$ make
```

### Build files tree
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
