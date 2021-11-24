date_string=`date +%Y%m%d`
docker build -t shengqh/rstudio4:${date_string} .
docker build -t shengqh/rstudio4:latest .
