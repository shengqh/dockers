singularity build dropest.simg docker://shengqh/dropest

bbcp -f -w 4m --port 5031 -s 16 dropest.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
