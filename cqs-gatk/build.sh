date_string=`date +%Y%m%d`
gatk_version='4.1.8.1'
docker build -t shengqh/cqs_gatk${gatk_version}:${date_string} .
docker build -t shengqh/cqs_gatk${gatk_version}:latest .
docker push shengqh/cqs_gatk${gatk_version}:${date_string}
docker push shengqh/cqs_gatk${gatk_version}:latest
