project('libTcpServer', 'cpp',
  version : run_command('cat', 'VERSION').stdout().strip(),
  license : ['"MIT"'],
  meson_version : '>= 0.54.1',
  subproject_dir : 'third_party', # reference manual says it is only capability mode and should not be used, but who cares
  default_options : [ 'warning_level=2', 'buildtype=release', 'cpp_std=c++14' ]
)

# Just metion used variables even if they are not used
libTcpServer_sources = []
libTcpServer_headers = []
libTcpServer_libs = []
libTcpServer_cpp_args = []
libTcpServer_inc = [include_directories('')]
libTcpServer_deps = []

# Configure project info header
info_conf = configuration_data({
  'PROJECT_AUTHOR' : '"Jakub Frackiewicz"',
  'PROJECT_LICENSE' : meson.project_license()[0],
  'PROJECT_COPYRIGHT' : '"Copyright (c) 2020"',
  'PROJECT_SITE' : '"https://github.com/Lechnio/TcpServer"'
})

info_conf.set_quoted('PROJECT_VERSION', meson.project_version(),
  description : 'Auto updated from VERSION file')

configure_file(output : 'project_info.h', configuration : info_conf)
libTcpServer_inc += [include_directories('.')]

# Point subprojects
gtest = subproject('gtest')
benchmark = subproject('benchmark')

# Point sub meson recipies
subdir('src')

if get_option('buildtype').startswith('debug')
  libTcpServer_cpp_args += ['-DDEBUG']
endif

libTcpServer = shared_library('tcpServer',
  libTcpServer_sources,
  dependencies : [libTcpServer_deps],
  include_directories : libTcpServer_inc,
  cpp_args : libTcpServer_cpp_args
)

# Variables for the top layer meson
libTcpServer_dep = declare_dependency(
  include_directories : libTcpServer_inc,
  link_with : libTcpServer
)

# Build examples after
if get_option('auto_build_examples')
  message('Auto build examples option selected.')
  subdir('examples')
endif
