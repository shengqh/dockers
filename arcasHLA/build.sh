date_string=`date +%Y%m%d`
docker build -t shengqh/arcashla:${date_string} .
docker build -t shengqh/arcashla:latest .
