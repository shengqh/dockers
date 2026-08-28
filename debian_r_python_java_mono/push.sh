date_string=`date +%Y%m%d`
docker_name='shengqh/debian12bookworm_r4.5.3_python3.13.15_java17.0.20.1_mono6.12.0.200_perl5.36.0'
docker push ${docker_name}:${date_string}
docker push ${docker_name}:latest
