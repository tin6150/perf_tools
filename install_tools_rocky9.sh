
#!/bin/bash 


# script to install various tools (via yum mostly/only)
# to be called by Dockerfile 
# and future by Singularity def file

# need to update package name to rockylinux 9 naming
# 1 package install at a time would be slower but easier to find out where things broke...


date            | tee    /_install_tool_sh_
echo "start"    | tee -a /_install_tool_sh_

# rocky 9/dnf does not have a -t option
# dnf ... did not finish?

dnf -y update 

dnf -y install epel-release
dnf -y install vim
dnf -y install bash
dnf -y install zsh
dnf -y install wget
dnf -y install curl
dnf -y install tar
dnf -y install coreutils
dnf -y install which
dnf -y install util-linux-ng
dnf -y install man
dnf -y install environment-modules
dnf -y install pciutils
dnf -y install smartmontools




# performance tools, many are from epel
dnf -y install iperf3
dnf -y install perf
dnf -y install sysstat
dnf -y install ethtool
dnf -y install iftop
dnf -y install nmap
dnf -y install nmap-nat
dnf -y install nuttcp
dnf -y install iptraf
dnf -y install iptraf-ng
dnf -y install htop
dnf -y install ntop
dnf -y install powertop
dnf -y install kernel-tools
dnf -y install strace
dnf -y install telnet
dnf -y install net-tools
dnf -y install bind-utils
dnf -y install stress
dnf -y install stress-ng
dnf -y install p7zip
dnf -y install p7zip-doc
dnf -y install sysbench
dnf -y install openssh-clients
dnf -y install numactl
dnf -y install torque-libs
dnf -y install opensm-libs
dnf -y install librdmacm
dnf -y install spectre-meltdown-checker
dnf -y install iputils
dnf -y install sysstat
dnf -y install tcpdump
dnf -y install wireshark
dnf -y install mailx
dnf -y install alpine
dnf -y install postfix
dnf -y install tftp
dnf -y install tftp-server
dnf -y install tcsh
dnf -y install ksh
dnf -y install zsh
dnf -y install fish
dnf -y install ncurses
dnf -y install tmux
dnf -y install screen
dnf -y install ipmitool
dnf -y install redfish
dnf -y install traceroute


		#openssh-clients numactl libtorque opensm-libs  are needed by Y's staging test


		# powertop     # does not always work
		# systsat includes: sar iostat mpstat 
		# net-tools: mii-tool netstat 
		# nmap-ncat: nc
		# iputils: tracepath \


# adding some difftool, see psg/linux.html#difftools 
# wdiff is gnu word diff
# meld is gui tool

dnf -y install colordiff
dnf -y install wdiff
dnf -y install meld
dnf -y install xterm
dnf -y install git
dnf -y install smem
dnf -y install matplotlib                                                                                               dnf -y install python36-pip
dnf -y install python-pip

dnf -y install mousepad
# mousepad is a xfce editor, expect lightweight, check how much space it add to this perf_tools container 2024.0312

#which pip  # this throws an error and abort singularity hub build.  where was 
#pip --help
#pip install --quiet --no-color icdiff || echo "no pip found"
pip install --quiet icdiff || echo "some pip error" 


date            | tee -a /_install_tool_sh_
echo "end"      | tee -a /_install_tool_sh_


# vim: noexpandtab tabstop=4 paste
