date_string=`date +%Y%m%d`
docker build --progress=plain -t shengqh/ubuntu20.04_r4.2.2_java11.0.17_perl5.30.0_mono6.12.0.182_python3.8.10:${date_string} .
docker tag shengqh/ubuntu20.04_r4.2.2_java11.0.17_perl5.30.0_mono6.12.0.182_python3.8.10:${date_string} shengqh/ubuntu20.04_r4.2.2_java11.0.17_perl5.30.0_mono6.12.0.182_python3.8.10:latest
