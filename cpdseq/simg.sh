singularity build cpdseqer.simg docker://shengqh/cpdseqer

bbcp -f -w 4m --port 5031 -s 16 cpdseqer.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
