

service.gtr:
(as user)
docker pull  ghcr.io/tin6150/perf_tools:rocky9 
docker tag   ghcr.io/tin6150/perf_tools:rocky9 registry.greta.local:443/tin/perf_tools:rocky9
docker image push                              registry.greta.local:443/tin/perf_tools:rocky9


on internal need needing it:
sudo -u tin docker pull                        registry.greta.local:443/tin/perf_tools:rocky9


docker run -it --rm  --entrypoint=/bin/bash registry.greta.local:443/tin/perf_tools:rocky9
docker run -it --rm  --entrypoint=/bin/htop  registry.greta.local:443/tin/perf_tools:rocky9
docker run -it --rm  --entrypoint=/bin/bash ghcr.io/tin6150/perf_tools:rocky9


registry.greta.local:443/tin/beast2:dock264-beagle


docker tag  ghcr.io/tin6150/beast2:dock264-beagle registry.greta.local:443/tin/beast2
./benchmark_gpu/nvidia_gpu_bench.rst:docker tag  nvcr.io/nvidia/hpc-benchmarks:21.4-hpl   registry.greta.local:443/tin/hpc-benchmarks:21.4-hpl
