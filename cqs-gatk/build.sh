date_string=`date +%Y%m%d`
gatk_version='4.5.0.0'
docker build --progress=plain -t shengqh/cqs_gatk${gatk_version}:${date_string} .
docker tag shengqh/cqs_gatk${gatk_version}:${date_string} shengqh/cqs_gatk${gatk_version}:latest
