## trim the merged MUC file to MUC5AC and QC
bcftools sort -Oz -o merged_MUC_sorted.vcf.gz merged_MUC.vcf.gz
bcftools norm -d both -Oz -o merged_MUC_sorted_dedup.vcf.gz merged_MUC_sorted.vcf.gz
bcftools index merged_MUC_sorted_dedup.vcf.gz
bcftools view -r chr11:1157593-1201138 merged_MUC_sorted_dedup.vcf.gz -Oz -o merged_MUC_sorted_dedup_MUC5AC.vcf.gz
bcftools index merged_MUC_sorted_dedup_MUC5AC.vcf.gz
bcftools stats merged_MUC_sorted_dedup_MUC5AC.vcf.gz > merged_MUC_sorted_dedup_MUC5AC_stats.txt
## 2033 variants for 63 samples
