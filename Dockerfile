# Use an official Ubuntu image as a base
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl4-openssl-dev \
    libzstd-dev \
    libatlas-base-dev  # Includes CBLAS

# Clone the PLINK-NG repository
RUN git clone https://github.com/chrchang/plink-ng.git

# Build PLINK-NG
WORKDIR /plink-ng/2.0
RUN ./build.sh

# Set up the entrypoint
ENTRYPOINT ["/plink-ng/2.0/bin/plink2"]

# docker run --rm --name plinkng \
#   -v /home/volture2721/Desktop/Practicum2/test-gemma-data/test-gemma-data:/data \
#   plinkng:latest \
#   --keep-allele-order --bfile /data/data500-pruned --geno-counts --out /data/output/kinship_output


