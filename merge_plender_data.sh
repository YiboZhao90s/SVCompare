# Merge Plender_Data
module load bcftools/1.16-kjo5veq  
cd /data/gen1/yz735/SV_explore/GRCh38 
bcftools concat -a -Oz -o variants_GRCh38_merged_HGSVC.vcf.gz *vcf.gz  
