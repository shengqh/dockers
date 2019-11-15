singularity build annogen.simg docker://shengqh/annogen

bbcp -f -w 4m --port 5031 -s 16 annogen.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
