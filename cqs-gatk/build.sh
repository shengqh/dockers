date_string=`date +%Y%m%d`
gatk_version='4.6.2.0'
docker buildx build --progress=plain -t shengqh/cqs_gatk${gatk_version}:${date_string} .
docker tag shengqh/cqs_gatk${gatk_version}:${date_string} shengqh/cqs_gatk${gatk_version}:latest
