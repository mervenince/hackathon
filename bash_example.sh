#!/bin/bash
####SBATCH -J cluster_c0
####SBATCH -e log.err.%j
####SBATCH -o log.out

#SBATCH --cpus-per-task=20
#SBATCH --mem-per-cpu=4G
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --time=0-2:00:00

#SBATCH --account=lect0127
#SBATCH --reservation=SPP2331

export PATH=~/../lect0127/miniconda3/bin:$PATH
source activate chemcrow

python run_hf.py 