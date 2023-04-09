#!/bin/bash

metadata_url="http://metadata.google.internal/computeMetadata/v1/instance"

for key in $@ 
do
res=`curl "${metadata_url}/${key}?recursive=true" -H "Metadata-Flavor: Google"`
echo "The metadata :: {"${key}" : "${res}"} " 
done
