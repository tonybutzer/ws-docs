# Tallgrass and Caldera User Guide

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
