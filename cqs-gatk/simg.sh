singularity build cqs-gatk4.simg docker://shengqh/bioinfo:cqs-gatk4

bbcp -f -w 4m --port 5031 -s 16 cqs-gatk4.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs/softwares/singularity
