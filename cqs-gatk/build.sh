date_string=`date +%Y%m%d`
docker build -t shengqh/cqs_gatk4:${date_string} .
docker build -t shengqh/cqs_gatk4:latest .
docker push shengqh/cqs_gatk4:${date_string}
docker push shengqh/cqs_gatk4:latest
