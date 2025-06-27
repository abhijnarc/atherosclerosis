#!/bin/bash
# script to run TRUST4 for all fastq files in directory

# get sample id from argument
DIR=$1
if [ -z "$DIR" ]; then
    echo "Usage: $0 <directory_with_fastq.gz_files>"
    exit 1
fi

# reference files
bcr_file=/data/athero/hg38_bcr.fa
ref_file=/data/athero/human_IMGT+C.fa

for file in "$DIR"/*.fastq.gz; do
  [ -e "$file" ] || continue
  prefix=$(basename "$file" .fastq.gz)
  outname="${prefix}_output"

  echo "Processing sample: $prefix"
  /home/user/tools/TRUST4/run-trust4 \
    -u "$file" \
    -f "$ref_file" --ref "$ref_file" \
    -t 40 \
    --od "$DIR/$prefix" \
    -o "$outname"
done