singularity build bamplot.simg docker://shengqh/bioinfo:bamplot

bbcp -f -w 4m --port 5031 -s 16 bamplot.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs/softwares/singularity
