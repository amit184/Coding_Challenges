#!/bin/bash
metadata_url="http://metadata.google.internal/computeMetadata/v1/"

for key in $@ 
do
data_url="http://metadata.google.internal/computeMetadata/v1/${key}"
res=`curl "http://metadata.google.internal/computeMetadata/v1/instance/${key}?recursive=true" -H "Metadata-Flavor: Google"`
echo "The metadata :: {"${key}" : "${res}"} " 
done