date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/prs:${date_string} .
docker tag shengqh/prs:${date_string} shengqh/prs:latest
