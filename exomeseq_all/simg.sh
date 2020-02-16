singularity build cqs-exomeseq.simg docker://shengqh/bioinfo:cqs-exomeseq

bbcp -f -w 4m --port 5031 -s 16 cqs-exomeseq.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
