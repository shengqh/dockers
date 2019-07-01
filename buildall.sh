cd /home/shengq2/programs/dockers/perl
sh build.sh
docker push shengqh/bioinfo:perl5.22.1

cd /home/shengq2/programs/dockers/r
sh build.sh
docker push shengqh/bioinfo:r3.6.0

cd /home/shengq2/programs/dockers/r_python3
sh build.sh
docker push shengqh/bioinfo:r3.6.0_python3.7.3

cd /home/shengq2/programs/dockers/annotateGenome
sh build.sh
docker push shengqh/bioinfo:annotateGenome

cd /home/shengq2/programs/dockers/rpj
sh build.sh
docker push shengqh/bioinfo:r3.6.0_python3.7.3_jre1.8.0

cd /home/shengq2/programs/dockers/rpjm
sh build.sh
docker push shengqh/bioinfo:r3.6.0_python3.7.3_jre1.8.0_mono5.20.1.19

cd /home/shengq2/programs/dockers/base
sh build.sh
docker push shengqh/bioinfo:base                                                                                                                                                                                                        

cd /home/shengq2/programs/dockers/rnaseq
sh build.sh
docker push shengqh/bioinfo:cqs-rnaseq                                                                                                                                                                                                        
sh simg.sh

cd /home/shengq2/programs/dockers/r_python2
sh build.sh
docker push shengqh/bioinfo:r3.6.0_python2.7.12

