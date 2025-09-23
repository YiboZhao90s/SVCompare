# Dataset Description for Lucy_Data and Plender_Data
## Plender_Data
module load bcftools/1.16-kjo5veq
module load python/3.10.12-tggsi7t  
bcftools stats variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz > plender_stats.txt  
plot-vcfstats -p outdir plender_stats.txt  
- On your cluster, LaTeX is missing multirow.sty, so compilation fails. So no summary pdf was generated, but individual plots were saved in .pdf and .png in outdir

## Lucy_Data
bcftools stats chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz > lucy_stats.txt  
plot-vcfstats -p outdir lucy_stats.txt  

## Check missing rate for variants
module load vcftools/0.1.14-uowdqmf
vcftools --gzvcf  chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz  --missing-site
awk '$5 > 0' out.lmiss > lucy_missing_data.txt
