singularity build cqs.scRNASeq.simg docker://shengqh/cqs_scrnaseq

bbcp -f -w 4m --port 5031 -s 16 cqs.scRNASeq.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity/
