date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/samtools_bcftools_tabix:v1.21 .
docker tag shengqh/samtools_bcftools_tabix:v1.21 shengqh/samtools_bcftools_tabix:latest
