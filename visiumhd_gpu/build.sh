date_string=`date +%Y%m%d`
docker buildx build --progress=plain -t shengqh/visiumhd:${date_string} .
docker image rm -f shengqh/visiumhd:latest
docker tag shengqh/visiumhd:${date_string} shengqh/visiumhd:latest

