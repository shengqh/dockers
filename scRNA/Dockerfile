FROM shengqh/bioinfo:base

RUN pip3 install umap-learn

RUN R -e "BiocManager::install('Seurat')"
RUN R -e "BiocManager::install('hdf5r')"

