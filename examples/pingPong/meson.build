pingPong_sources = files('pingPong.cpp')

executable('examples/pingPong',
  pingPong_sources,
  dependencies : [libTcpServer_dep],
  include_directories : source_includes,
  cpp_args : libTcpServer_cpp_args
)
