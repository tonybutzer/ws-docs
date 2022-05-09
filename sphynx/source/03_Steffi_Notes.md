# Document Outline

- ec2-instance creation
- Running the Model
    - Using Docker to Scale
        - Tiles and Chips
        - Running single small regions
    - Config files YAML
    - Logging and Outputs
    
- Mosaicking Chips to Tiles
- Mosaicking Tiles to CONUS
    - Sending files to HPC-Caldera - using rclone
    - Slurm 101
    
# Other Training
- Linux/UNIX Shell --> BASH
- Jupyter Notebooks
- ssh
    - ssh keys why and how?
- ec2 -starting and stopping
    - console
    - pinstance
    - shell - shutdown -h now



# Steffi Notes

1. find steffi documentation notes
2. start converting to markdown

using the repo https://code.usgs.gov/skagone/veget_v2
there is now a snow calculation turn on/off switch included in the script.


Timing is:
started 1 tile (r50tile7) on bigship
2/17/2022 - 1.40pm until 2/18/2022 9.50am(for 20 years) = 19 hours
~ 1 hour per year or 8 sec per day

previously it used to take:
Tile 1 – on bigship-intel took 10:52 am to 5:58 am – about 19 hours or 1 hour per year or 8 sec per day

started 2 tiles on 10.12.68.186 (new bigship - "a" machine with amd processor):
tile9 and 0 
3/1/2022 - 10.45am until 3/3/2022 7.45 am(for 20 years) = 40 hours
~ 2 hour per year or 20 sec per day





r50_tile5, tile6, tile7, tile8, tile9
r37_tile0, tile1, tile2, tile3


mosaicking test:
did 1 param (etasw) for 2000, it took from 3/7/2020 at 4.00pm to 3/8/2020 at 1.52am = 10 hours
on bigship run old code like this



ARM computers are a bust: 
https://en.wikipedia.org/wiki/AArch64





config files are 
# input location
# in_root: ws-in
# output_location
out_root_prefix: ws-out
region: CONUS
region_name: conus

# Dataset info
precip_settings:
  #dynamic_settings: False
  name_fmt: prec_{}.tif
  dt_fmt: YYYYdoy
  dir_loc: /vsis3/ws-in/CONUS/PPT/gridmet/
  climatology: False
  scaling_factor: 1

ndvi_settings:
  #dynamic_settings: False
  #dynamic_file: ./running_config/dynamic_config.yml
  name_fmt: med{}.250_m_NDVI.tif
  dt_fmt: doy
  dir_loc: /vsis3/ws-in/CONUS/NDVI/median/
  climatology: True
  scaling_factor: 0.0001

eto_settings:
  #dynamic_settings: False
  name_fmt: medeto_{}.tif
  dt_fmt: doy
  dir_loc: /vsis3/ws-in/CONUS/ETo/gridmet_ETo/
  climatology: True
  scaling_factor: 1

tmin_settings:
  #dynamic_settings: False
  name_fmt: tmin_{}.tif
  dt_fmt: YYYYdoy
  dir_loc: /vsis3/ws-in/CONUS/TEMP/tmin/
  climatology: False
  scaling_factor: 1

tmax_settings:
  #dynamic_settings: False
  name_fmt: tmax_{}.tif
  dt_fmt: YYYYdoy
  dir_loc: /vsis3/ws-in/CONUS/TEMP/tmax/
  climatology: False
  scaling_factor: 1

tavg_settings:
  #dynamic_settings: False
  name_fmt: tavg_{}.tif
  dt_fmt: YYYYdoy
  dir_loc: /vsis3/ws-in/CONUS/TEMP/tavg/
  climatology: False
  scaling_factor: 1

# === Static raster data settings ====
watermask_settings:
  file_loc: /vsis3/ws-in/CONUS/water_NA.tif
whc_settings:
  file_loc: /vsis3/ws-in/CONUS/Soil/awc_NA_mosaic.tif
saturation_settings:
  file_loc: /vsis3/ws-in/CONUS/Soil/por_NA_mosaic.tif
field_capacity_settings:
  file_loc: /vsis3/ws-in/CONUS/Soil/fc_NA_mosaic.tif
interception_settings:
  file_loc: /vsis3/ws-in/CONUS/Soil/intercept_filled_0_na.tif #15%





## Making HTML from Markdown

- cd sphynx/source; make


## Push to Git

- cd ~/opt/ws-docs; make publish
    - cut token use as password
    - cat ~/token.txt