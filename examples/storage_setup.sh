#!/bin/bash

# Google Cloud Storage bucket for testing
BUCKET_NAME=jarvice-dragen-batch
# Google Cloud project
PROJECT=service-hpc-project2
# get sample files
cd batch-test
wget https://ilmn-dragen-giab-samples.s3.amazonaws.com/WGS/precisionFDA_v2_HG002/HG002.novaseq.pcr-free.35x.R1.fastq.gz
wget https://ilmn-dragen-giab-samples.s3.amazonaws.com/WGS/precisionFDA_v2_HG002/HG002.novaseq.pcr-free.35x.R2.fastq.gz
mkdir v8 && cd v8
wget https://ilmn-dragen-giab-samples.s3.amazonaws.com/Hashtable/hg38_altaware-cnv-graph-anchored.v8.tar
tar -xf hg38_altaware-cnv-graph-anchored.v8.tar && rm hg38_altaware-cnv-graph-anchored.v8.tar && cd ..
# create storage bucket for test
gcloud storage buckets --project $PROJECT create gs://$BUCKET_NAME
gcloud storage cp --project $PROJECT HG002.novaseq.pcr-free.35x.R1.fastq.gz gs://$BUCKET_NAME
gcloud storage cp --project $PROJECT HG002.novaseq.pcr-free.35x.R2.fastq.gz gs://$BUCKET_NAME
gcloud storage cp -r --project $PROJECT v8 gs://$BUCKET_NAME

