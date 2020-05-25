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

 [meson]: https://mesonbuild.com/ "Meson build system"
 [gcc]: https://gcc.gnu.org/ "GNU gcc"

## Build
Clone the repository with
```
$ git clone https://github.com/Lechnio/LinuxEasyManager.git
```
Enter to the TcpServer directory and run
```
$ make
```

## Configuring build type
Meson allows configuring a current build via its built-in options.
Those options can be extended with `meson_options.txt` file, but they can not be changed
form the inside of the `meson.build`. Therefore `Makefile` was created.
Since that `Makefile` exists, all possible targets can be list with `make [double TAB press]`.
All targets whose name starts with `conf_` can be used to reconfigure your build directory.
