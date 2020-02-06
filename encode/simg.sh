singularity build encode-chipseq2.simg docker://shengqh/encode_chipseq2

bbcp -f -w 4m --port 5031 -s 16 encode-chipseq2.simg shengq2@cqs3.accre.vanderbilt.edu:/scratch/cqs_share/softwares/singularity
