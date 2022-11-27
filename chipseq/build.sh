date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/cqs_chipseq:${date_string} .
docker tag shengqh/cqs_chipseq:${date_string} shengqh/cqs_chipseq:latest
