singularity build novatis.simg docker://shengqh/bioinfo:novatis

bbcp -f -w 4m --port 5031 -s 16 novatis.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
