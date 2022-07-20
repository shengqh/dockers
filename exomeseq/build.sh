date_string=`date +%Y%m%d`
docker build --progress=plain -f Dockerfile.20220719 -t shengqh/cqs_exomeseq:${date_string} .
docker tag shengqh/cqs_exomeseq:${date_string} shengqh/cqs_exomeseq:latest
