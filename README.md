# Chapel Packaging

This is the official packaging repository for Chapel.

There a top-level directory for each OS (linux distributions, in our case) that
Chapel builds packages for, containing the package build files and scripts to
build, test, and deploy a Chapel package. These are primarily meant for
internal use.

See the READMEs within a given OS directory for more information on building
the package. The usage for these scripts should generally be the same across
each OS.

The `dropoff/` directory temporarily contains packages built by these scripts
in their current development form for users to have access before the 1.13
release.

## Packages

The following distributions are currently works in progress, and are planned
for deployment around the Chapel 1.13.0 release.

* debian (deb)
    * ubuntu (deb)

The following distributions are planned for packaging in the future
(including downstream distributions over time):

* SUSE (RPM)
    * OpenSUSE
* Fedora (RPM)
    * RHEL
        * CentOS
* Arch (PKGBUILD)
* Gentoo (ebuild)
