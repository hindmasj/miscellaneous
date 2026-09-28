#!/bin/env /bin/bash

# Rename the Link camera files to include the date and time in the name
# in a regular format, and to move the files from the date based subdirectories
# to the current working directory.

loc=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

echo "Checking for video files in "$PWD

all_files=$(find . -name '*-*.mp4' -type f)

for source_file in ${all_files}
do
    #echo ${source_file}
    file_name=$(basename ${source_file})
    file_stem=$(dirname ${source_file})
    parent_dir=$(basename ${file_stem})
    #echo ${parent_dir} ${file_name}
    dest_file=$(echo "20${parent_dir}${file_name}" | tr -d '-')
    echo "moving ${source_file} to ${dest_file}"
    mv ${source_file} ${dest_file}
done

echo "To clean up empty directories try"
echo "     find . -depth -type d -empty -exec rmdir {} \;"