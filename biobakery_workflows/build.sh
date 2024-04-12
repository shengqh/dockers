date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/biobakery_workflows:${date_string} .
docker tag shengqh/biobakery_workflows:${date_string} shengqh/biobakery_workflows:latest
