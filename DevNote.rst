general
docker run -it --rm  --entrypoint=/bin/bash ghcr.io/tin6150/perf_tools:rocky9


service.greta:
(as user)
docker pull  ghcr.io/tin6150/perf_tools:master
docker tag   ghcr.io/tin6150/perf_tools:master registry.greta.local:443/tin/perf_tools:centos7
docker image push                              registry.greta.local:443/tin/perf_tools:centos7

docker pull  ghcr.io/tin6150/perf_tools:rocky9 
docker tag   ghcr.io/tin6150/perf_tools:rocky9 registry.greta.local:443/tin/perf_tools:rocky9
docker image push                              registry.greta.local:443/tin/perf_tools:rocky9


on internal need needing it:
sudo -u tin docker pull                        registry.greta.local:443/tin/perf_tools:rocky9


docker run -it --rm  --entrypoint=/bin/bash registry.greta.local:443/tin/perf_tools:rocky9
docker run -it --rm  --entrypoint=/bin/htop  registry.greta.local:443/tin/perf_tools:rocky9   # htop only see inside container :/


##// so, somehow also started satoolbag, and that repo has lots of overlap with this one.
##// performance benchmarking need lots of tools to check for things... maybe should just merge into 1...
##// for now, satoolbag is Rocky 8 based, whereas perf_tools is CentOS 7 and Rocky 9
