date_string=`date +%Y%m%d`
docker push shengqh/cqs_rstudio:${date_string}
docker push shengqh/cqs_rstudio:latest
