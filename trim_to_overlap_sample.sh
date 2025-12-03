# Trim Lucy_Data and Plender_Data for overlapped samples
module load bcftools/1.16-kjo5veq  
bcftools view -S overlap_samples.txt -Oz -o variants_GRCh38_merged_trimmed_HGSVC.vcf.gz variants_GRCh38_merged_HGSVC.vcf.gz  
bcftools view -S overlap_samples.txt -Oz -o chr11_1kgp_imputed_vep_trimmed.vcf.gz chr11_1kgp_imputed_vep.vcf.gz  
bcftools index -t variants_GRCh38_merged_trimmed_HGSVC.vcf.gz  
bcftools index -t chr11_1kgp_imputed_vep_trimmed.vcf.gz  
