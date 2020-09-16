date_string=`date +%Y%m%d`
docker build -t shengqh/python2:${date_string} .
docker build -t shengqh/python2:latest .
docker push shengqh/python2:${date_string}
docker push shengqh/python2:latest
