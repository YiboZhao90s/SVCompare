# Check Overlapped Variants
- 4518 variants in Plender_variants // isec_out/0000.vcf
- 9479 variants in Lucy_variants // isec_out/0001.vcf
- 2745 overlapped variants // isec_out/0002.vcf & isec_out/0003.vcf

- 0002.vcf: for records from variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz shared by both	variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz
- 0003.vcf: for records from chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz shared by both	variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz

# Variant Characterisation
## bcftools stats 0002.vcf > stats_overlap.txt  
- number of records: 2745
- number of SNPs: 2393
- number of indels: 352  

## bcftools stats  chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz > stats_Lucy.txt
- number of records: 9479
- number of SNPs: 8103
- number of indels: 1349
- number of others: 27
- number of multiallelic sites: 38

## bcftools stats variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz  > stats_Plender.txt
- number of records: 4518
- number of SNPs: 3466
- number of indels: 877
- number of others: 175

# Zoom in MUC5AC: Overlapped Variants
- Chromosome 11: 1,157,953-1,201,138 
## module load htslib
## bgzip 0002.vcf
## bcftools index -t 0002.vcf.gz 
## bcftools view -r chr11:1157593-1201138 0002.vcf.gz -Oz -o overlapped_variants_MUC5AC.vcf.gz
## bcftools stats overlapped_variants_MUC5AC.vcf.gz > stats_overlap_MUC5AC.txt
- number of records: 501
- number of SNPs: 437
- number of indels: 64

# Zoom in MUC5AC: Unique Variants
## module load htslib
## bgzip 0000.vcf 
## bgzip 0001.vcf
## bcftools index -t 0001.vcf.gz
## bcftools index -t 0000.vcf.gz

## bcftools view -r chr11:1157593-1201138 0000.vcf.gz -Oz -o Plender_variants_MUC5AC.vcf.gz
## bcftools stats Plender_variants_MUC5AC.vcf.gz > stats_Plender_MUC5AC.txt
- number of records: 194
- number of SNPs: 104
- number of indels: 67
- number of others: 23

## bcftools view -r chr11:1157593-1201138 0001.vcf.gz -Oz -o Lucy_variants_MUC5AC.vcf.gz
## bcftools stats Lucy_variants_MUC5AC.vcf.gz > stats_Lucy_MUC5AC.txt
- number of records: 1410
- number of SNPs: 1170
- number of indels: 231
- number of others: 9
- number of multiallelic SNP sites: 4

# Merge 2 Sets
## bcftools concat -a chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz -Oz -o merged_MUC.vcf.gz
## bcftools index -t merged_MUC.vcf.gz
## bcftools view -r chr11:1157593-1201138 merged_MUC.vcf.gz -Oz -o merged_MUC_MUC5AC.vcf.gz
## bcftools index merged_MUC_MUC5AC.vcf.gz
## bcftools stats merged_MUC_MUC5AC.vcf.gz > merged_MUC_MUC5AC_stats.txt
- number of records: 2606
- number of SNPs: 2148
- number of indels: 426
- number of others: 32
- number of multiallelic sites: 4

