# Check overlapped samples 
module load bcftools/1.16-kjo5veq  
bcftools query -l variants_GRCh38_merged_HGSVC.vcf.gz > plender_samples.txt  
# 65 plender samples  
bcftools query -l chr11_1kgp_imputed_vep.vcf.gz > lucy_samples.txt  
# 3202 webster samples (long-read data was only generated for 100 samples, and imputed in the rest of the cohort
grep -Fxf plender_samples.txt lucy_samples.txt > overlap_samples.txt  
# 63 overlapped samples
