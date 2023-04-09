#!/bin/bash

metadata_url="http://metadata.google.internal/computeMetadata/v1/instance"

for key in $@ 
do
res=`curl "${metadata_url}/${key}?recursive=true" -H "Metadata-Flavor: Google"`
echo "The metadata :: {"${key}" : "${res}"} " 
done


#-- The gcloud cmd to execute local bash script on GCP VM --!

#gcloud compute ssh user@host -- bash -s < local_script.sh

            #OR
#-- One can use startip script to execute bash script on GCE VM --!

#sudo google_metadata_script_runner startup --> to rerun startup script..