date_string=`date +%Y%m%d`
docker build -t shengqh/mutect:${date_string} .
docker build -t shengqh/mutect:latest .
docker push shengqh/mutect:${date_string}
docker push shengqh/mutect:latest
