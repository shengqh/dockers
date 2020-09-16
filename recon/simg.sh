singularity build python2.simg docker://shengqh/python2:latest

bbcp -f -w 4m --port 5031 -s 16 python2.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
