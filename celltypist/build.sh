date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/celltypist:${date_string} .
docker tag shengqh/celltypist:${date_string} shengqh/celltypist:latest
