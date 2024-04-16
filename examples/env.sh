NAME="sample-batch-job"
# Google Cloud project
PROJECT="service-hpc-project2"
# Google Cloud zone (e.g. us-central1)
ZONE="us-central1"
# Google Cloud service account
SERVICE_ACCOUNT="batch-vm-runner@service-hpc-project2.iam.gserviceaccount.com"
# list available versions with: ../tools/list-versions.sh
VERSION="1.0-rc.11"
# DRAGEN application (e.g "illumina-dragen_3_7_8n")
JARVICE_DRAGEN_APP="illumina-dragen_4_2_4n"
JARVICE_API_USERNAME_SECRET="projects/service-hpc-project2/secrets/jarviceApiUsername/versions/latest"
JARVICE_API_APIKEY_SECRET="projects/service-hpc-project2/secrets/jarviceApiKey/versions/latest"
S3_ACCESS_KEY_SECRET="projects/service-hpc-project2/secrets/batchS3AccessKey/versions/latest"
S3_SECRET_KEY_SECRET="projects/service-hpc-project2/secrets/batchS3SecretKey/versions/latest"
ILLUMINA_LIC_SERVER_SECRET="projects/service-hpc-project2/secrets/illuminaLicServer/versions/latest"

DRAGEN_ARGS=(
-f
-r s3://jarvice-dragen-batch/4_2_reference
-1 s3://jarvice-dragen-batch/HG002.novaseq.pcr-free.35x.R1.fastq.gz
-2 s3://jarvice-dragen-batch/HG002.novaseq.pcr-free.35x.R2.fastq.gz
--RGID HG002 
--RGSM HG002 
--output-directory s3://jarvice-dragen-batch/output2
--output-file-prefix HG002_4_2
--enable-map-align true
--enable-map-align-output true
--output-format CRAM
--enable-duplicate-marking true
--enable-variant-caller true
--vc-enable-vcf-output true
--vc-emit-ref-confidence GVCF
--vc-frd-max-effective-depth 40
--vc-enable-joint-detection true
--read-trimmers polyg
--soft-read-trimmers none
)
