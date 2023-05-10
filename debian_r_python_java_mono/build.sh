date_string=`date +%Y%m%d`
docker_name='shengqh/debian10.2.1_r4.3.0_python3.10.11_java11.0.18_mono6.12.0.182'
docker build --progress=plain -t ${docker_name}:${date_string} .
docker tag ${docker_name}:${date_string} ${docker_name}:latest
