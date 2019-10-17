singularity build annotateGenome.simg docker://shengqh/annotate_genome

bbcp -f -w 4m --port 5031 -s 16 annotateGenome.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs/softwares/singularity/
