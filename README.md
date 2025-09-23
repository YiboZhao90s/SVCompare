# SVCompare
Compare structural variants calling from 2 studies
- Lucy_Data: A merged panel from [High Confident SVs called from 1kg nanopore (https://s3.amazonaws.com/1000g-ont/index.html?prefix=Gustafson_etal_2024_preprint_SUPPLEMENTAL/high_confidence_SVs_by_sample/)] and [1kg short-read 30X GRCh38]
- Plender_Data: HGSVC Phase3 (updated) variant calling files (from mixed nanopore and PacBio) https://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections//HGSVC3/release/Variant_Calls/1.0/ [https://www.nature.com/articles/s41586-025-09140-6]

The goal is to compare these 2 variant lists in various aspects.

# file path
- /scratch/gen1/yz735/HGSVC/GRCh38 ## Plender_Data (GRCh38)
- /scratch/gen1/yz735/HGSVC/CHM13 ## Plender_Data (T2T-CHM13)
- /rfs/TobinGroup/yz735/transfer ## Transfer Folder from HPC to PC
  
# Merge Plender_Data
cd /scratch/gen1/yz735/HGSVC/GRCh38  
module load bcftools/1.16-kjo5veq  
bcftools concat -a -Oz -o variants_GRCh38_merged_HGSVC.vcf.gz *vcf.gz  

# Check overlapped samples 
module load bcftools/1.16-kjo5veq  
bcftools query -l variants_GRCh38_merged_HGSVC.vcf.gz > plender_samples.txt  
- 65 plender samples  
bcftools query -l chr11_1kgp_imputed_vep.vcf.gz > lucy_samples.txt  
- 3202 lucy samples (*merged with short read? shouldn't be 100?*)  
grep -Fxf plender_samples.txt lucy_samples.txt > overlap_samples.txt  
- 63 overlapped samples

# Trim Lucy_Data and Plender_Data for overlapped samples
module load bcftools/1.16-kjo5veq  
bcftools view -S overlap_samples.txt -Oz -o variants_GRCh38_merged_trimmed_HGSVC.vcf.gz variants_GRCh38_merged_HGSVC.vcf.gz  
bcftools view -S overlap_samples.txt -Oz -o chr11_1kgp_imputed_vep_trimmed.vcf.gz chr11_1kgp_imputed_vep.vcf.gz  

bcftools index -t variants_GRCh38_merged_trimmed_HGSVC.vcf.gz  
bcftools index -t chr11_1kgp_imputed_vep_trimmed.vcf.gz  

# Trim Lucy_Data and Plender_Data for Mucin regions (GRCh38)
- MUC6: Chromosome 11: 1,012,823-1,036,718
- MUC2: Chromosome 11: 1,074,875-1,110,511
- MUC5AC: Chromosome 11: 1,157,953-1,201,138
- MUC5B: Chromosome 11: 1,223,066-1,262,172

module load bcftools/1.16-kjo5veq  
bcftools view -r chr11:1012823-1262172 -Oz -o variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz variants_GRCh38_merged_trimmed_HGSVC.vcf.gz  
bcftools view -r chr11:1012823-1262172 -Oz -o chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz chr11_1kgp_imputed_vep_trimmed.vcf.gz  
bcftools index -t variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz
bcftools index -t chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\n' variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz > Plender_variants.txt  
- 4518 variants in Plender_variants  

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\n' chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz  > Lucy_variants.txt  
- 9479 variants in Lucy_variants  

# Check Overlapped Variants
module load bcftools/1.16-kjo5veq  
bcftools isec -p isec_out variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz  
cd isec_out  
- 0000.vcf: for records private to	variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz
- 0001.vcf: for records private to	chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz
- 0002.vcf: for records from variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz shared by both	variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz
- 0003.vcf: for records from chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz shared by both	variants_GRCh38_merged_trimmed_MUC_HGSVC.vcf.gz chr11_1kgp_imputed_vep_trimmed_MUC.vcf.gz

bcftools query -f '%CHROM\t%POS\t%REF\t%ALT\n' 0002.vcf >overlapped_variants.txt  
wc overlapped_variants.txt  
- 2745 overlapped variants  

