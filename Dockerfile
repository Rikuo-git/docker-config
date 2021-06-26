FROM rocker/tidyverse:4.1.0

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
libglpk-dev \
libgdal-dev \
libudunits2-dev \
libgeos-dev \
libproj-dev
RUN R -e "remotes::install_version('Seurat', version = '4.0.2')"
RUN R -e "BiocManager::install(version = '3.13')" && \
R -e "BiocManager::install(c('BiocGenerics', 'DelayedArray', 'DelayedMatrixStats','limma', 'S4Vectors', 'SingleCellExperiment','SummarizedExperiment', 'batchelor', 'Matrix.utils'))"
RUN R -e "remotes::install_github('cole-trapnell-lab/leidenbase')"
RUN R -e "remotes::install_github('cole-trapnell-lab/monocle3')"
