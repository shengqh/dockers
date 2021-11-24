date_string=`date +%Y%m%d`
gatk_version='4.2.2.0'
docker push shengqh/cqs_gatk${gatk_version}:${date_string}
docker push shengqh/cqs_gatk${gatk_version}:latest
