date_string=`date +%Y%m%d`
docker build -t shengqh/mafreport:${date_string} .
docker build -t shengqh/mafreport:latest .
docker push shengqh/mafreport:${date_string}
docker push shengqh/mafreport:latest
