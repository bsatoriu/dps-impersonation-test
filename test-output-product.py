from datetime import datetime
import sys
import os
import boto3
import fsspec
import xarray
import rioxarray
import matplotlib.pyplot as plt
import rasterio
from rasterio.session import AWSSession
from maap.maap import MAAP
maap = MAAP(maap_host='api.maap-project.org')

print(maap.profile.account_info())

date = datetime.now().isoformat()
output_dir = sys.argv[1]
with open(os.path.join(output_dir, "write-output.txt"), 'w') as fw:
    fw.write(str(date))
    fw.write(str(maap.aws.earthdata_s3_credentials('https://sentinel1.asf.alaska.edu/s3credentials')))
    fw.write(" Output Product Write successful")

    s3_fsspec = fsspec.filesystem("s3", profile="maap-data-reader")
    s3_rasterio = rasterio.Env(AWSSession(profile_name="maap-data-reader"))
    nsidc_object = "s3://nsidc-cumulus-prod-protected/ATLAS/ATL08/006/2023/06/21/ATL08_20230621235543_00272011_006_01.h5"
    with s3_fsspec.open(nsidc_object) as f:
        ds = xarray.open_dataset(f, group='gt1l/land_segments', engine="h5netcdf", phony_dims='sort')
        fw.write(str(ds))
        fw.write("Output xarray.Dataset successful")


