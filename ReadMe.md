# Merge 1KG variants
We have long-read seq of the 1KG cohort from 2 sources:
1. Lucy Webster merged 30X short-read WGS and ONT long-read seq from top 100 subjects, and imputed structural variants in the whole 1KG cohort
2. Liz Plender used HGSVC phase 3 ONT data on 65 1KG subjects (https://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections//HGSVC3/release/Variant_Calls/1.0/)

Here I will merge these 2 sources and extract variants in the *MUC5AC* region

## Source file path
Webster_data: /data/gen1/yz735/SV_explore/chr11_1kgp_imputed_vep.vcf.gz*  
Plender_data: /data/gen1/yz735/SV_explore/GRCh38  

## Main Workflow
1. merge_plender_data.sh // Merge all vcfs (for different variant types) into variants_GRCh38_merged_HGSVC.vcf.gz  
2. check_overlap_samples.sh // extract overlapped samples between Webster_data and Plender_data  
3. trim_to_overlap_samples.sh // trim webster_data and plender_data based on the 63 overlapped samples
4. trim_to_MUC_merge.sh // trim webster_data and plender_data to keep only MUC region and merge them (chr11:1012823-1262172)
5. trim_merge_MUC5AC_QC.sh // trim the merged MUC file to MUC5AC region only, and QC (chr11:1157953-1201138)

# Merge with All of Us long-read seq data (details see ReadMe_MergeAll.md)
*variant lists were derived from VCF files saved in All of Us workbench (See AllofUs.md and AllofUs.sh)*
1. Reformat the .frq file and save individual variant list (R_frq_process.R)
2. Check overlap across the variant lists using coordinates and alleles (R_Merge_1KG_AllofUs.R)





