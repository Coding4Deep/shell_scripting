#!/bin/bash
# Create a script to detect and delete **duplicate files**
# in a directory tree by checksum compariso


DIR=${1:-/var/log/}

for i in "${ls ${DIR}}" ; do
  if [ -f "${DIR}/$i" ] ; then 
       md5sum $i == md5sum ${i+1} && rm -rf $i 
  fi
done 