singularity build cqs-chipseq.simg docker://shengqh/bioinfo:cqs-chipseq

bbcp -f -w 4m --port 5031 -s 16 cqs-chipseq.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs/softwares/singularity
