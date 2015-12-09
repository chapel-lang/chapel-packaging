# Packaging for Chapel

This is the (soon-to-be) official packaging repository for Chapel.

There a top-level directory for each OS (linux distributions, in our case) that
Chapel builds packages for. There is a separate set of scripts for building,
testing, and deploying the package for each OS because each OS handles
packaging differently.

See the README.md in a given OS for a brief description of what the scripts
are doing, and how to use them to build, test, and release the Chapel package.

The usage for these scripts should generally be the same across each OS.


The following distributions are currently works in progress:

* ubuntu (APT / deb)
* debian (APT / deb)


The following distributions are planned for packaging in the near future:

* OpenSUSE      (YaST / RPM)
* Linux Mint    (APT / deb)
* SUSE          (YaST / RPM)
* Fedora        (yum / RPM)
* Arch          (pacman / PKGBUILD)
* CentOS        (yum / RPM)
* Gentoo        (portage / ebuild)


