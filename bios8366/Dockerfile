FROM r-base:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev \
    libxml2-dev \
    libcairo2-dev \
    libxt-dev \
    libv8-dev \
    libpq-dev

# Install additional R packages
RUN R -e "install.packages(c('ggplot2', 'dplyr', 'tidyr', 'shiny', 'caret'))"

# Set the working directory
WORKDIR /app

# Copy your R script to the container
COPY sum.r .

# Run your R script
CMD ["Rscript", "sum.r"]

