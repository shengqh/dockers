date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/schpf:${date_string} .
docker tag shengqh/schpf:${date_string} shengqh/schpf:latest
