singularity build mutect.simg docker://shengqh/mutect:latest

bbcp -f -w 4m --port 5031 -s 16 mutect.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
