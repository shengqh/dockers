cd /home/shengq2/dockers/r
sh build.sh
docker push shengqh/bioinfo:r3.6.0

cd /home/shengq2/dockers/r_python3
sh build.sh
docker push shengqh/bioinfo:r3.6.0_python3.7.3

cd /home/shengq2/dockers/annotateGenome
sh build.sh
docker push shengqh/bioinfo:annotateGenome

cd /home/shengq2/dockers/r_python2
sh build.sh
docker push shengqh/bioinfo:r3.6.0_python2.7.12

cd /home/shengq2/dockers/mono
sh build.sh
docker push shengqh/bioinfo:mono5.20

cd /home/shengq2/dockers/rpmj
sh build.sh
docker push shengqh/bioinfo:r_python_mono_jre

cd /home/shengq2/dockers/rnaseq
sh build.sh
docker push shengqh/bioinfo:rnaseq                                                                                                                                                                                                        

