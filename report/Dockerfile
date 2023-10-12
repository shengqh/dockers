FROM shengqh/report:20221113

RUN R -e "BiocManager::install('rmdformats');library('rmdformats')"

RUN mv /usr/lib/R/site-library/* /usr/local/lib/R/site-library; \
    rm -rf /usr/lib/R/site-library/; \
    ln -s /usr/local/lib/R/site-library /usr/lib/R/site-library
    
RUN R -e "BiocManager::install('formatR');library('formatR')"
RUN R -e "BiocManager::install('rjson');library('rjson')"
RUN R -e "BiocManager::install(ask=FALSE)"
