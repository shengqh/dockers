date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/bcftools:${date_string} .
docker tag shengqh/bcftools:${date_string} shengqh/bcftools:latest
