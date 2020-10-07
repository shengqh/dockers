singularity build mafreport.simg docker://shengqh/mafreport:latest

bbcp -f -w 4m --port 5031 -s 16 mafreport.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity/
