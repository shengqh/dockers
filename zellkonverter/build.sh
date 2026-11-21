date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/zellkonverter:${date_string} .
docker tag shengqh/zellkonverter:${date_string} shengqh/zellkonverter:latest
