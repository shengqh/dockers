# cd /home/shengq2/program/dockers/annotateGenome
# sh build.sh
# docker push shengqh/bioinfo:annotateGenome

#cd /home/shengq2/program/dockers/ubuntu_rjpmp
#sh build.sh
#sh push.sh

cd /home/shengq2/program/dockers/base
sh build.sh
sh push.sh

# cd /home/shengq2/program/dockers/chipseq
# sh build.sh
# sh push.sh

cd /home/shengq2/program/dockers/scRNA
sh build.sh
sh push.sh

# cd /home/shengq2/program/dockers/exomeseq
# sh build.sh
# docker push shengqh/bioinfo:cqs-exomeseq                                                                                                                                                                                                        
# sh simg.sh

# cd /home/shengq2/program/dockers/rnaseq
# sh build.sh
# docker push shengqh/bioinfo:cqs-rnaseq                                                                                                                                                                                                        
# sh simg.sh

# cd /home/shengq2/program/dockers/smallRNA
# sh build.sh
# docker push shengqh/bioinfo:cqs-smallRNA                                                                                                                                                                                                       
# sh simg.sh

# cd /home/shengq2/program/dockers/cqs-gatk
# sh build.sh
# docker push shengqh/bioinfo:cqs-gatk4                                                                                                                                                                                                       
# sh simg.sh

