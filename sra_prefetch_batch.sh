#!/bin/bash
# Usage: ./sra_prefetch.sh <prefix_file.txt>
# prefetch the SRA from a list, 4 at a time

export PATH=$PATH:/home/user/tools/sratoolkit.3.2.1-ubuntu64/bin

PREFIX_FILE="$1"
if [ -z "$PREFIX_FILE" ]; then
    echo "Usage: $0 <prefix_file.txt>"
    exit 1
fi

# Read first 4 IDs
mapfile -t IDS < <(head -n 4 "$PREFIX_FILE")

for srr in "${IDS[@]}"
do
    echo "prefetching $srr"
    prefetch "$srr"
    echo "complete"
done

# Remove processed IDs from the file
tail -n +5 "$PREFIX_FILE" > "${PREFIX_FILE}.tmp" && mv "${PREFIX_FILE}.tmp" "$PREFIX_FILE"