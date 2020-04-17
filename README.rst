

[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/377)
[.md, need to convert to .rst]


Performance and SysAdmin tool collection (CentOS 6)
***************************************************

singularity container with a collection of performance tools such as iperf3, perf, htop, etc.

To run::

	singularity pull shub://tin6150/perf_tools
	./tin6150-perf_tools-latest.simg


Container is based on CentOS 7 (in the centos7 branch)

Ref: 

- https://www.singularity-hub.org/collections/...
- https://github.com/tin6150/perf_tools


~~~~

Dev/Build instructions 

.. code:: bash

	SING_VER=2.6.1
	module load container/singularity/${SING_VER}
	Singularity=$( which singularity )
	sudo    $Singularity build --writable perf_tools7.simg ./Singularity 2>&1 | tee singularity_build.log
 


	sudo    $Singularity build -w perf_tools7.simg ./Singularity
	-or-
	mkdir ./sandbox
	sudo    $Singularity build --sandbox ./sandbox ./Singularity


