#!/bin/bash
# gzip the fastq files in a loop
for srr in `cat GSE230214_1.txt`
do
	echo "Zipping ${srr}....."
	/bin/gzip ${srr}_1.fastq ${srr}_2.fastq
	echo "completed ${srr}"
done
