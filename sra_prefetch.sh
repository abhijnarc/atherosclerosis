#!/bin/bash
# prefetch the SRA from a list
# set the path first
export PATH=$PATH:/home/user/tools/sratoolkit.3.2.1-ubuntu64/bin
# run prefetch over a loop
for srr in `cat GSE230214.txt`
do
	echo "prefetching $srr"
	prefetch $srr
	echo "complete"
done
