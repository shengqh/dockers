FROM cellprofiler/cellprofiler:4.2.8

# -------------------------
# Sanity check
# -------------------------
RUN python -c "import cellprofiler; \
import cellprofiler_core.pipeline; \
import cellprofiler_core.preferences; \
import cellprofiler_core.utilities.java; \
import pathlib; \
"

RUN python -m pip install \
    geopandas \
    tifffile \
    rasterio \
    shapely \
    pyarrow \
    tqdm \
    pillow \
    opencv-python \
    pyogrio

RUN python -m pip install \
    imagecodecs

# -------------------------
# Sanity check
# -------------------------
RUN python -c "import json; \
import geopandas as gpd; \
import pandas as pd; \
import numpy as np; \
from PIL import Image; \
import tifffile; \
from tqdm import tqdm; \
"
