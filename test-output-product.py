from datetime import datetime
import sys
import os
from maap.maap import MAAP
maap = MAAP(maap_host='api.maap-project.org')

print(maap.profile.account_info())

date = datetime.now().isoformat()
output_dir = sys.argv[1]
with open(os.path.join(output_dir, "write-output.txt"), 'w') as fw:
    fw.write(str(date))
    fw.write(str(maap.aws.earthdata_s3_credentials('https://sentinel1.asf.alaska.edu/s3credentials')))
    fw.write(" Output Product Write successfull")
