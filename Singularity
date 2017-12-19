
# Singularity container definition 
# Also contain a set of performance tools


BootStrap: docker
From: centos:6
#From: cern:slc6-base
#From: ringo:scientific:6.5

%runscript
	echo "zsh from inside the container..."
	/bin/zsh


%post
	echo "Hello from inside the container"
	yum -ty install vim bash zsh wget curl tar coreutils which util-linux-ng man \
			environment-modules \
			#libpng libpng-devel libpng-static \
			#openmotif openmotif-devl openmotif22 \
			ipmitool \
			epel-release  # sl6 may need diff mech to enable epel


	# performance tools, many are from epel
	yum -ty install \
			iperf3 iperf3 perf sysstat \
			ethtool iftop telnet \
			nmap nuttcp iptraf iptraf-ng \
			htop ntop \
			powertop     # does not seems to work

			# systsat includes: sar iostat mpstat 
			# net-tools: mii-tool  
			# iputils: tracepath \
			

	touch /THIS_IS_INSIDE_SINGULARITY

	echo "end"                  >> /THIS_IS_INSIDE_SINGULARITY
	date                        >> /THIS_IS_INSIDE_SINGULARITY


## ref singhub/sl6_lbl.def
## sudo    /opt/singularity-2.4.2/bin/singularity build -w ./sl6_lbl.simg ./sl6_lbl.def
## sudo    /opt/singularity-2.4.2/bin/singularity build -w ./perf_tools.simg ./Singularity

