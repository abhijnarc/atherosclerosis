#!/bin/bash
# filepath: /data/athero/fastp.sh

# Usage: ./fastp.sh <directory_with_fastq.gz_files>
DIR="$1"
if [ -z "$DIR" ]; then
    echo "Usage: $0 <directory_with_fastq.gz_files>"
    exit 1
fi

for file in "$DIR"/*.fastq.gz; do
    [ -e "$file" ] || continue  # skip if no files found
    samp=$(basename "$file")
    file="$DIR/${samp}"
    rep_file="$DIR/${samp}_fastp.html"
    echo "Processing sample: $samp"
    /home/user/tools/fastp --in1 "$file" \
        --qualified_quality_phred 30 \
        --detect_adapter_for_pe \
        --correction \
        --trim_tail1=1 \
        --cut_tail \
        --cut_window_size=4 \
        --cut_mean_quality=30 \
        --length_required=50 \
        --html "$rep_file"
done