#! /bin/bash

bucket_path=gs://your-bucket-name

# Create a new bucket for resulting log file.

gsutil mb -c regional -l us-west2 $bucket_path

gcloud config set compute/zone us-west2-b

gcloud config set compute/region us-west2

startup_script_path=gce_startup_script.sh

# The new instance runs the script.
# A log file appears in new bucket after instance finishes starting up.

gcloud compute instances create your-vm-name --machine-type=f1-micro \
       --metadata=lab-logs-bucket=$bucket_path \
       --metadata-from-file=startup-script=$startup_script_path \
       --scopes https://www.googleapis.com/auth/devstorage.full_control