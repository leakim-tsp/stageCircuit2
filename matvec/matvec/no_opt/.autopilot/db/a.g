#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/mickael/stageFGPA/TP/matvec/matvec/solution1/.autopilot/db/a.g.bc ${1+"$@"}
