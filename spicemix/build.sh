date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/spicemix:${date_string} .
docker tag shengqh/spicemix:${date_string} shengqh/spicemix:latest
