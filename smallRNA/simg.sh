singularity build cqs-smallRNA.simg docker://shengqh/bioinfo:cqs-smallRNA
bbcp -f -w 4m --port 5031 -s 16 cqs-smallRNA.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs/softwares/singularity
