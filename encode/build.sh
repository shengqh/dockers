date_string=`date +%Y%m%d`
cd chip-seq-pipeline2
docker build -t shengqh/encode_chipseq2:${date_string} -f dev/docker_image/Dockerfile .
docker build -t shengqh/encode_chipseq2:latest -f dev/docker_image/Dockerfile .
docker push shengqh/encode_chipseq2:${date_string}
docker push shengqh/encode_chipseq2:latest
