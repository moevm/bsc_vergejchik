from __future__ import absolute_import
from .production import *

if SWIFT_REGION_NAME:
    SWIFT_EXTRA_OPTIONS = {'region_name': SWIFT_REGION_NAME}

# Swift container setup
SWIFT_CONTAINER_NAME = UPLOAD_BUCKET
SWIFT_NAME_PREFIX = UPLOAD_PATH_PREFIX
SWIFT_TEMP_URL_DURATION = UPLOAD_URL_EXPIRE