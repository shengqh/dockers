docker build -t shengqh/bioinfo:cqs-rnaseq-test .
docker run --mount src="/e/sqh/programs/perl/projects/docker_pipeline/",target=/projects,type=bind  --mount src="/e/scratch",target=/scratch,type=bind shengqh/bioinfo:cqs-rnaseq-test perl /projects/test.pl
