FROM nvidia/cuda:12.6.3-cudnn-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# -------------------------
# System dependencies
# -------------------------
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y \
    python3.11 \
    python3.11-dev \
    build-essential \
    git \
    wget \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.11 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

# Install pip for 3.11
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.11 get-pip.py && rm get-pip.py

# -------------------------
# Python Stack (Ordered for Stability)
# -------------------------
RUN python -m pip install --upgrade pip setuptools wheel

# 1. PyTorch
RUN python -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cu126

# 2. Heavy Spatial/Data stack (Using wheels)
# This installs rasterio and geopandas without manual C-compilation
RUN python -m pip install \
    numpy \
    scanpy \
    squidpy \
    spatialdata \
    spatialdata-io \
    geopandas \
    rasterio \
    shapely \
    tifffile \
    pyarrow \
    tqdm \
    pillow \
    opencv-python

# -------------------------
# Sanity check
# -------------------------
RUN python -c "import torch, rasterio, spatialdata; \
print(f'PyTorch CUDA: {torch.version.cuda}'); \
print(f'Rasterio version: {rasterio.__version__}'); \
print(f'GPU Available: {torch.cuda.is_available()}')"

CMD ["bash"]
