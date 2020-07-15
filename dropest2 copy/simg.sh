singularity build dropest2.simg docker://vpetukhov/dropest2:latest

bbcp -f -w 4m --port 5031 -s 16 dropest2.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
