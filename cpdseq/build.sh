date_string=`date +%Y%m%d`
docker build --no-cache -t shengqh/cpdseqer:${date_string} .
docker build -t shengqh/cpdseqer:latest .
docker push shengqh/cpdseqer:${date_string}
docker push shengqh/cpdseqer:latest
