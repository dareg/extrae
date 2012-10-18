#!/bin/bash

EXTRAE_ON=1 ./dump-events
../../../src/merger/mpi2prv -f TRACE.mpits -dump -dump-without-time >& OUTPUT

# Remove headers for mpi2prv dump
grep -v ^mpi2prv OUTPUT   > OUTPUT-1
grep -v ^merger  OUTPUT-1 > OUTPUT-2
grep -v ^COUNTERS OUTPUT-2 > OUTPUT-3

# Actual comparison
diff reference OUTPUT-3
