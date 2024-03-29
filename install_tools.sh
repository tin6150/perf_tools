
#!/bin/bash 

# script to install various tools (via yum mostly/only)
# to be called by Dockerfile 
# and future by Singularity def file


date            | tee    /_install_tool_sh_
echo "start"    | tee -a /_install_tool_sh_

yum -ty update 
yum -ty install vim bash zsh wget curl tar coreutils which util-linux-ng man \
		environment-modules \
		pciutils \
		smartmontools \
		epel-release  # sl6 may need diff mech to enable epel
		#libpng libpng-devel libpng-static \
		#openmotif openmotif-devl openmotif22 \
		# smartmontools provides smartctl to check hd status
		# fish shell avail for 7.8 



# performance tools, many are from epel
yum -ty install \
		iperf3 iperf3 perf sysstat \
		ethtool iftop \
		nmap nmap-nat nuttcp iptraf iptraf-ng \
		htop ntop \
		powertop \
		kernel-tools  \
		strace \
		telnet net-tools bind-utils \
		stress stress-ng p7zip p7zip-doc sysbench \
		openssh-clients numactl torque-libs opensm-libs librdmacm \
		spectre-meltdown-checker \
		iputils sysstat \
		tcpdump wireshark \
		mailx alpine postfix \
		tftp tftp-server \
		tcsh ksh zsh fish \
		ncurses tmux screen \
		ipmitool redfish \
		traceroute

		#openssh-clients numactl libtorque opensm-libs  are needed by Y's staging test


		# powertop     # does not always work
		# systsat includes: sar iostat mpstat 
		# net-tools: mii-tool netstat 
		# nmap-ncat: nc
		# iputils: tracepath \


# adding some difftool, see psg/linux.html#difftools 
# wdiff is gnu word diff
# meld is gui tool
yum -ty install \
		colordiff \
		wdiff \
		meld \
		xterm  \
		git  \
		smem  \
		mousepad  \
		matplotlib  \
		python36-pip python-pip

# mousepad is a xfce editor, expect lightweight, check how much space it add to this perf_tools container 2024.0312

#which pip  # this throws an error and abort singularity hub build.  where was 
#pip --help
#pip install --quiet --no-color icdiff || echo "no pip found"
pip install --quiet icdiff || echo "some pip error" 


date            | tee -a /_install_tool_sh_
echo "end"      | tee -a /_install_tool_sh_


# vim: noexpandtab tabstop=4 paste
