# Merge Plender_Data
module load bcftools/1.16-kjo5veq  
cd /data/gen1/yz735/mucinSV/plender 
bcftools concat -a -Oz -o variants_GRCh38_merged_HGSVC.vcf.gz *vcf.gz  
bcftools index --tbi variants_GRCh38_merged_HGSVC.vcf.gz
