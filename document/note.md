
## Note

This is a note for describing how to setup development environment and meantime mark a keynote.

### 1. Install ZeroTier
```c
cat@lubancat:~$ curl -s https://install.zerotier.com | sudo bash

*** ZeroTier Service Quick Install for Unix-like Systems

*** Tested OSes / distributions:

***   MacOS (10.13+) (just installs ZeroTier One.pkg)
***   Debian Linux (7+)
***   RedHat/CentOS Linux (6+)
***   Fedora Linux (16+)
***   SuSE Linux (12+)
***   Mint Linux (18+)

*** Supported architectures vary by OS / distribution. We try to support
*** every system architecture supported by the target.

*** Please report problems to contact@zerotier.com and we will try to fix.

*** Detecting Linux Distribution

*** Found Debian, creating /etc/apt/sources.list.d/zerotier.list
Hit:1 http://download.zerotier.com/debian/buster buster InRelease
Hit:2 http://mirrors.ustc.edu.cn/debian buster InRelease
Hit:3 http://mirrors.ustc.edu.cn/debian-security buster/updates InRelease
Hit:4 http://mirrors.ustc.edu.cn/debian buster-updates InRelease
Hit:5 https://cloud.embedfire.com/mirrors/ebf-debian carp-rk356x InRelease
Reading package lists... Done                         
Reading package lists... Done
Building dependency tree       
Reading state information... Done
gpg is already the newest version (2.2.12-1+deb10u2).
The following packages were automatically installed and are no longer required:
  libdrm-freedreno1 libdrm-tegra0
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 50 not upgraded.
1 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Setting up openssh-server (1:7.9p1-10+deb10u3) ...
rescue-ssh.target is a disabled or a static unit, not starting it.

...

insserv: Default-Start undefined, assuming empty start runlevel(s) for script `boot_init.sh'
insserv: Default-Stop  undefined, assuming empty stop  runlevel(s) for script `boot_init.sh'
insserv: script rkwifibt.sh: service rockchip already provided!

*** Waiting for identity generation...

*** Success! You are ZeroTier address
```

### 2. Install cron

```c
cat@lubancat:~$ sudo apt-get install cron
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libdrm-freedreno1 libdrm-tegra0
Use 'sudo apt autoremove' to remove them.
Suggested packages:
  logrotate checksecurity
Recommended packages:
  default-mta | mail-transport-agent
The following NEW packages will be installed:
  cron
0 upgraded, 1 newly installed, 0 to remove and 52 not upgraded.
Need to get 98.0 kB of archives.
After this operation, 261 kB of additional disk space will be used.
Get:1 http://mirrors.ustc.edu.cn/debian buster/main arm64 cron arm64 3.0pl1-134+deb10u1 [98.0 kB]
Fetched 98.0 kB in 3s (29.6 kB/s)
Selecting previously unselected package cron.
(Reading database ... 128804 files and directories currently installed.)
Preparing to unpack .../cron_3.0pl1-134+deb10u1_arm64.deb ...
Unpacking cron (3.0pl1-134+deb10u1) ...
Setting up cron (3.0pl1-134+deb10u1) ...
Adding group `crontab' (GID 119) ...
Done.
insserv: warning: script 'boot_init.sh' missing LSB tags
insserv: Default-Start undefined, assuming empty start runlevel(s) for script `boot_init.sh'
insserv: Default-Stop  undefined, assuming empty stop  runlevel(s) for script `boot_init.sh'
insserv: script rkwifibt.sh: service rockchip already provided!
Created symlink /etc/systemd/system/multi-user.target.wants/cron.service → /lib/systemd/system/cron.service.
Processing triggers for man-db (2.8.5-2) ...
Processing triggers for systemd (241-7~deb10u10) ...
```
