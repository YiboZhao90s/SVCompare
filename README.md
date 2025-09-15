# SVCompare
Compare structural variants calling from 2 studies
- Lucy_Data: A merged panel from [High Confident SVs called from 1kg nanopore (https://s3.amazonaws.com/1000g-ont/index.html?prefix=Gustafson_etal_2024_preprint_SUPPLEMENTAL/high_confidence_SVs_by_sample/)] and [1kg short-read 30X GRCh38]
- Plender_Data: HGSVC Phase3 (updated) variant calling files (from mixed nanopore and PacBio) https://ftp.1000genomes.ebi.ac.uk/vol1/ftp/data_collections//HGSVC3/release/Variant_Calls/1.0/

The goal is to compare these 2 variant lists in various aspects.

# file path
/scratch/gen1/yz735/HGSVC/GRCh38 ## Plender_Data (GRCh38)
/scratch/gen1/yz735/HGSVC/CHM13 ## Plender_Data (T2T-CHM13)
/rfs/TobinGroup/yz735/transfer ## Transfer Folder from HPC to PC


# Merge Plender_Data
cd /scratch/gen1/yz735/HGSVC/GRCh38
module load bcftools/1.16-kjo5veq
bcftools concat -a -Oz -o variants_GRCh38_merged_HGSVC.vcf.gz *vcf.gz
