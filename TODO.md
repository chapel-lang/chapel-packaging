# Notes / TODOs

* Changing Chapel's default `CHPL_variables` for packages (`.chplrc`?)
    * Could alternatively hardcode variables as a package-level patch
* Shipping third-party packages with our package and merging upstream
    * Figuring out the above list, and removing them as a package-level patch
* Licensing details
    * Licensing of all remaining third-party packages
* Update contact info to Cray Chapel org / email

# Third-party support for Chapel package planning

* chpl-venv/        - Deployed (could Depend)
* dlmalloc/         - Dropped (could Depend?)
* fltk/             - Dropped
* gasnet/           - Dropped (optionally patched, could Depend with loss of
                               some functionality)
* gmp/              - Depends
* hwloc/            - Dropped (could Depend?)
* llvm/             - Dropped
* massivethreads/   - Dropped (could Depend)
* qthread/          - Dropped (patched)
* re2/              - Deployed (could Depend)
* tcmalloc/         - Dropped (patched)
* utf8-decoder/     - Deployed
