date_string=`date +%Y%m%d`
docker build -t shengqh/cyberduck:${date_string} .
docker build -t shengqh/cyberduck:latest .
docker push shengqh/cyberduck:${date_string}
docker push shengqh/cyberduck:latest
