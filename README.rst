

[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/377)
[.md, need to convert to .rst]


Performance and SysAdmin tool collection (CentOS 7)
***************************************************

singularity container with a collection of performance tools such as iperf3, perf, htop, etc.

To run::

	singularity pull shub://tin6150/perf_tools
	./tin6150-perf_tools-latest.simg


Container is based on CentOS 7 (in the centos7 branch)

Ref: 

- https://www.singularity-hub.org/collections/377
- https://github.com/tin6150/perf_tools


Example usage
-------------

	./perf_tools7.simg # get dropped into zsh inside the container

	singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif htop

	singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif stress  --io 6 --hdd 2  --vm  64 -t 120


	cd /local/scratch/tin/tmp
	T=1800; singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif stress-ng --all 1 --backoff 15 --timeout ${T}  --metrics-brief
	T=1800; singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif stress-ng --cpu 63 --backoff 15 --timeout ${T}  --tz --log-brief
	rm tmp-stress-ng-*

	singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif stress -m 4 # 4 cpu/memory channel test, no need for clean up

~~~~

Dev/Build instructions 

.. code:: bash

	# Singularity Hub 3.2 build with CentOS 7 base worked well as well.

	# older 2.4 based build cmd ::
	sudo    /opt/singularity-2.4.2/bin/singularity build -w ./perf_tools.simg ./Singularity
	sudo    /opt/singularity-2.4.2/bin/singularity build -w ./sl6_lbl.simg ./sl6_lbl.def

	# 2.6 from local modules ::
	SING_VER=2.6.1
	module load container/singularity/${SING_VER}
	Singularity=$( which singularity )
	sudo    $Singularity build --writable perf_tools7.simg ./Singularity 2>&1 | tee singularity_build.log

	sudo    $Singularity build -w perf_tools7.simg ./Singularity
	-or-
	mkdir ./sandbox
	sudo    $Singularity build --sandbox ./sandbox ./Singularity


~~~~

Docker version
==============

	docker run -it tin6150/perf_tools bash

	maybe it would work with podman, untested

	This docker container is more or less same idea as the singularity container, 
	but contents are not the same (at first).
	And it is to troubleshoot docker host and its routing problem, 
	but perhaps as template to host tmp code to troubleshoot other issue with running things inside docker
	It is essentially a fat container with lots of tools installed, such as traceroute, nslookup, dig, nc, telnet, etc.



.. #vim: paste
