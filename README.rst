Performance and SysAdmin tool collection (CentOS 6)
***************************************************

singularity container with a collection of performance tools such as iperf3, perf, htop, etc.

To run::

	singularity pull shub://tin6150/perf_tools
	./tin6150-perf_tools-latest.simg

Container is based on CentOS 6

Ref: 

- https://www.singularity-hub.org/collections/...
- https://github.com/tin6150/perf_tools


~~~~

Dev/Build instructions 

.. code:: bash

	SING_VER=2.4.1
	module load container/singularity/${SING_VER}
	Singularity=$( which singularity )
	sudo    $Singularity build -w perf_tools.simg ./Singularity
	-or-
	mkdir ./sandbox
	sudo    $Singularity build --sandbox ./sandbox ./Singularity


