# cd /home/shengq2/programs/dockers/annotateGenome
# sh build.sh
# docker push shengqh/bioinfo:annotateGenome

#cd /home/shengq2/programs/dockers/ubuntu_rjpmp
#sh build.sh
#docker push shengqh/bioinfo:ubuntu20.04_r4.0_java1.8_perl5.30_mono6.12_python3.8

cd /home/shengq2/programs/dockers/base
sh build.sh
docker push shengqh/bioinfo:base                                                                                                                                                                                                        

cd /home/shengq2/programs/dockers/exomeseq
sh build.sh
docker push shengqh/bioinfo:cqs-exomeseq                                                                                                                                                                                                        
sh simg.sh

cd /home/shengq2/programs/dockers/rnaseq
sh build.sh
docker push shengqh/bioinfo:cqs-rnaseq                                                                                                                                                                                                        
sh simg.sh

cd /home/shengq2/programs/dockers/smallRNA
sh build.sh
docker push shengqh/bioinfo:cqs-smallRNA                                                                                                                                                                                                       
sh simg.sh

cd /home/shengq2/programs/dockers/cqs-gatk
sh build.sh
docker push shengqh/bioinfo:cqs-gatk4                                                                                                                                                                                                       
sh simg.sh

