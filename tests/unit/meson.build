unit_tests_sources = files('main.cpp')

gtest_dep = gtest.get_variable('gtest_dep')

unit_tests_deps = [
  libTcpServer_dep,
  gtest_dep
]

unitTests = executable('unitTests',
  unit_tests_sources,
  dependencies : unit_tests_deps,
  cpp_args : libTcpServer_cpp_args
)

test('Unit tests', unitTests)
