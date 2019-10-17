date_string=`date +%Y%m%d`
docker build -t shengqh/annotate_genome:${date_string} .
docker build -t shengqh/annotate_genome:latest .
docker push shengqh/annotate_genome:${date_string}
docker push shengqh/annotate_genome:latest
