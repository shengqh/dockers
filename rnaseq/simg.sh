singularity build cqs-rnaseq.simg docker://shengqh/cqs_rnaseq

bbcp -f -w 4m --port 5031 -s 16 cqs-rnaseq.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs/softwares/singularity
