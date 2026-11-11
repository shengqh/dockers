FROM rocker/tidyverse:4.5.3

# Install SSH
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server sudo && \
    rm -rf /var/lib/apt/lists/*

# Set up SSH
RUN mkdir -p /var/run/sshd && \
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

# Password-less sudo in case things need to be installed from the terminal
# I have no idea what the sudo password is for this Docker container ¯\_(ツ)_/¯
RUN echo "rstudio ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Make sure there's a .ssh folder with the right permissions. The 
# local id_rsa.pub gets mounted to here through Docker Compose
RUN mkdir -p /home/rstudio/.ssh && \
    chown rstudio:rstudio /home/rstudio/.ssh && \
    chmod 700 /home/rstudio/.ssh

EXPOSE 22 8787

RUN apt-get update && apt-get install -y --no-install-recommends \
    libhdf5-dev cmake libmagick++-dev imagemagick libglpk-dev

RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('remotes', ask=FALSE)"
RUN R -e "BiocManager::install(c('R.utils'), ask=FALSE);library('R.utils')"

RUN apt-get update && apt-get install -y --no-install-recommends \
    libnode-dev

# Start both SSH and RStudio
CMD service ssh start && /init
