echo "FROM shengqh/bioinfo:ubuntu18.04_r4.0_java1.8_perl5.26_mono6.12_python3.9" > Dockerfile
tail -n +2 ../base/Dockerfile >> Dockerfile
docker build -t shengqh/bioinfo:base_ubuntu18 .
