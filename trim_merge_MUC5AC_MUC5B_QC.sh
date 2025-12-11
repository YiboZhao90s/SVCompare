## trim the merged MUC file to MUC5AC and QC
module load bcftools/1.16-kjo5veq
bcftools sort -Oz -o merged_MUC_sorted.vcf.gz merged_MUC.vcf.gz
bcftools norm -d both -Oz -o merged_MUC_sorted_dedup.vcf.gz merged_MUC_sorted.vcf.gz
bcftools index merged_MUC_sorted_dedup.vcf.gz
bcftools view -r chr11:1137953-1282172 merged_MUC_sorted_dedup.vcf.gz -Oz -o merged_MUC_sorted_dedup_MUC5AC_MUC5B.vcf.gz
bcftools index merged_MUC_sorted_dedup_MUC5AC_MUC5B.vcf.gz
bcftools stats merged_MUC_sorted_dedup_MUC5AC_MUC5B.vcf.gz > merged_MUC_sorted_dedup_MUC5AC_MUC5B_stats.txt
## 5054 variants for 63 samples

module load vcftools/0.1.14-rni73ax
vcftools --gzvcf merged_MUC_sorted_dedup_MUC5AC_MUC5B.vcf.gz --freq --out merged_MUC_sorted_dedup_MUC5AC_MUC5B
