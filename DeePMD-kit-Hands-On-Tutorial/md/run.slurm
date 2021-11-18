#!/bin/bash
#SBATCH --job-name=water_run         # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=28              # total number of tasks across all nodes
#SBATCH --tasks-per-node=28
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=8G         # memory per cpu-core (4G is default)
#SBATCH --gres=gpu:4             # number of gpus per node
#SBATCH --time=20:00:00          # total run time limit (HH:MM:SS)
##SBATCH --mail-type=begin        # send email when job begins
##SBATCH --mail-type=end          # send email when job ends
##SBATCH --mail-user=yifanl@princeton.edu

export OMP_NUM_THREADS=1
module load anaconda3
conda activate mpi-test
out_path=`pwd`
cd $out_path

mpirun -np 16 lmp -in in.lammps
