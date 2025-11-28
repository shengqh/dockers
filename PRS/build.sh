date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/prs:${date_string} .
docker tag shengqh/prs:${date_string} shengqh/prs:latest
