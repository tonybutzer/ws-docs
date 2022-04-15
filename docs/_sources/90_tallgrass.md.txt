# Tallgrass and Caldera User Guide

## Run Conus Mosaics on Tallgrass

- make salloc - to allocate a node for 1 hour
- make shell - to get a bash in the new allocation

- cd opt/etm_v3_tony

- conda activate pangeo
- cd tallgrass
- cd conus_api_etm

## Testing 

- make test

## General Algorythm

- parameters
    - year
    - in  # input path
    - out # output path
- command_line_runner
    - get input parameters
    - call mos.run_mosaic

- run_mosaic (cos_mosaic.py)
    - get subfolders
    - _do_just_one_day  ( for each day 1,365)

- _do_just_one_day
    - DS = xr_build_mosaic_ds(bucket, p, tifs) - # bucket here is extraineous
    - xr_write_geotiff_from_ds(DS, primary_name, out_prefix_path)

## How to Cheat at Slurm

```
#!/bin/sh



#SBATCH --account=eros
#SBATCH -p gpu
#SBATCH --time=2-00:00:00
#SBATCH --job-name=unet-train
#SBATCH -o %j_train.out
#SBATCH --error=%j_train.err
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=rfleckenstein@contractor.usgs.gov
#SBATCH --hint=compute_bound
#SBATCH --gres=gpu:4 # number of GPU's you are requesting



# load analytics and cuda modules
module load cuda11.3/toolkit/11.3.0
module load analytics
source /home/rfleckenstein/miniconda3/bin/activate tense



export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/rfleckenstein/miniconda3/pkgs/cudnn-8.1.0.77-h90431f1_0/lib:/home/rfleckenstein/miniconda3/pkgs/cudatoolkit-11.2.0-h73cb219_8/lib



# train the model
python ~/unet_nlcd/train.py ~/unet_nlcd/configs/config_double.json

```

- #SBATCH --time=2-00:00:00 - # what this mean?
> thats for letting them know how much time it might take to run your job, max youre allowed is 2 days so if you dont know you put that but if you do know how long it will take you should make it closer because it puts you higher in priority, longer jobs get moved down in the queue


## HPC References

- https://www.tablesgenerator.com/markdown_tables#
- https://stackoverflow.com/questions/68094835/how-to-load-anaconda-virtual-environment-from-slurm
- https://help.rc.ufl.edu/doc/Sample_SLURM_Scripts
- 
- https://github.com/tonybutzer/harmony-docs/blob/ecc524ce73a08f6eb81e8d38e4fa89eb65efe5af/documentation/source/01hpc.md
- https://www.esma.europa.eu/sites/default/files/library/jc-2018-04_joint_committee_final_report_on_big_data.pdf
