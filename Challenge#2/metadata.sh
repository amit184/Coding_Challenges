#!/bin/bash
METADATA_VALUE=$(curl http://metadata.google.internal/computeMetadata/v1/instance/image -H "Metadata-Flavor: Google")
apt update
apt -y install apache2
cat <<EOF > /var/www/html/index.html
<html><body><p>Accessing metadata value of foo: $METADATA_VALUE</p></body></html>
EOF