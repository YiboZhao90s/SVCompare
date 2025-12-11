# Note for All of Us workbench

gsutil -u terra-vpc-sc-7210ba51 cp gs://fc-aou-datasets-controlled/v8/wgs/long_read/BCM/revio/joint_call/GRCh38/v8.BI_Rev_mid.QualFT40.g.vcf.bgz* /home/jupyter/workspaces/muc5acsv/
/home/jupyter/packages/vcftools/bin/vcftools --gzvcf v8.BCM_Rev_high.QualFT40.g.vcf.bgz --freq --out v8.BCM_Rev_high.QualFT40_chr11
awk '$1 == "chr11"' v8.BCM_Rev_high.QualFT40.frq > v8.BCM_Rev_high.QualFT40_chr11.frq

