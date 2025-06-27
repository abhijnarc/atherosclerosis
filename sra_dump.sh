#!/bin/bash
# Fastq dump of SRA from a list
# set the path first
export PATH=$PATH:/home/user/tools/sratoolkit.3.2.1-ubuntu64/bin
# run dump over a loop
for srr in `cat GSE230214.txt`
do
	echo "dumping $srr ...."
	fasterq-dump $srr
	echo "zipping ${srr} ...."
	#/bin/gzip ${srr}_1.fastq ${srr}_2.fastq
	/bin/gzip ${srr}.fastq
	echo "completed $srr"
done
