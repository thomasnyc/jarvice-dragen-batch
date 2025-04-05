#!/bin/bash

# JARVICE credentials provided during onboarding
JARVICE_API_USERNAME=thomashk
JARVICE_API_APIKEY=69xxxxxx
# HMAC keys created in Step 2
S3_ACCESS_KEY=GOOG1EFCUKL5Vxxxx
S3_SECRET_KEY=jtxxxxxxx
# Illumina license string
ILLUMINA_LIC_SERVER=https:///xxxxxxxx
# Google cloud project
PROJECT=service-hpc-project2
# Google Cloud zone used for testing (e.g. us-central1)
ZONE=us-central1

printf "$JARVICE_API_USERNAME" | gcloud secrets create --project $PROJECT "jarviceApiUsername" --data-file=- --replication-policy=user-managed --locations=$ZONE
printf "$JARVICE_API_APIKEY" | gcloud secrets create --project $PROJECT "jarviceApiKey" --data-file=- --replication-policy=user-managed --locations=$ZONE
printf "$S3_ACCESS_KEY" | gcloud secrets create --project $PROJECT "batchS3AccessKey" --data-file=- --replication-policy=user-managed --locations=$ZONE
printf "$S3_SECRET_KEY" | gcloud secrets create --project $PROJECT "batchS3SecretKey" --data-file=- --replication-policy=user-managed --locations=$ZONE
printf "$ILLUMINA_LIC_SERVER" | gcloud secrets create --project $PROJECT "illuminaLicServer" --data-file=- --replication-policy=user-managed --locations=$ZONE

