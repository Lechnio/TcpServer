benchmark_sources = files('main.cpp')

benchmark_dep = benchmark.get_variable('google_benchmark_dep')

benchmark_deps = [
  libTcpServer_dep,
  benchmark_dep
]

benchmarkTests = executable('benchmarkTests',
  benchmark_sources,
  dependencies : benchmark_deps,
  cpp_args : libTcpServer_cpp_args
)

test('Benchmark tests', benchmarkTests)
