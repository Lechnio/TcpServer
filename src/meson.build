libTcpServer_inc += [include_directories('.')]
libTcpServer_sources += files('tcpServer.cpp', 'tcpClient.cpp')
libTcpServer_headers += files('tcpServer.h', 'tcpClient.h', 'sysdep.h', 'log.h')

libTcpServer_deps += meson.get_compiler('cpp').find_library('pthread', required: true)
