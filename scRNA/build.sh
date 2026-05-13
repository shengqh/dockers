date_string=`date +%Y%m%d`

if [[ ! -d "MEcell_python" ]]; then
  git clone git@github.com:shengqh/MEcell_python.git
else
  cd MEcell_python && git pull && cd ..
fi

docker buildx build --progress=plain -t shengqh/cqs_scrnaseq:${date_string} .
docker image rm -f shengqh/cqs_scrnaseq:latest
docker tag shengqh/cqs_scrnaseq:${date_string} shengqh/cqs_scrnaseq:latest
