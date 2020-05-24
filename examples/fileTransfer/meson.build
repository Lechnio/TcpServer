fileTransfer_sources = files('fileTransfer.cpp')

executable('fileTransfer',
  fileTransfer_sources,
  dependencies : [libTcpServer_dep],
  include_directories : source_includes,
  cpp_args : libTcpServer_cpp_args
)
