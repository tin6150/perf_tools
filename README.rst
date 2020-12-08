

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

- https://www.singularity-hub.org/collections/...
- https://github.com/tin6150/perf_tools


Example usage
-------------

	singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif htop

	singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif stress  --io 6 --hdd 2  --vm  64 -t 120


	cd /local/scratch/tin/tmp
	T=1800; singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif stress-ng --all 1 --backoff 15 --timeout ${T}  --metrics-brief
	T=1800; singularity exec /global/scratch/tin/singularity-repo/perf_tools_latest.sif stress-ng --cpu 63 --backoff 15 --timeout ${T}  --tz --log-brief
	rm tmp-stress-ng-*


	# tbd memory test
	# need yum install memtester
	# determine free memory from "free -h"
	# run as root, it need to lock memory
	# last digit is # of loops, if ommited, will loop forever
	memtester 4K     10 # quick test to try tool
	memtester 31500M 1  # thorough test on a 32 GB machine


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



.. #vim: paste
