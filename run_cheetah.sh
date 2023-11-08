#!/bin/sh

run=$1
outname=$2
outdir=$3

if [[ ! -e $outdir ]]; then
    mkdir $outdir
elif [[ ! -d $outdir ]]; then
    echo "$outdir already exists but is not a directory" 1>&2
fi

cd $outdir

#find ${run} -name "*_d0_*.h5" | sort -d > files.lst
ls -v ${run}/*_d0_*.h5 > files.lst

SLURMFILE="${outname}.sh"

echo "#!/bin/sh" > $SLURMFILE
echo >> $SLURMFILE

echo "#SBATCH --partition=all" >> $SLURMFILE  # Set your partition here
echo "#SBATCH --time=6:00:00" >> $SLURMFILE
echo "#SBATCH --nodes=1" >> $SLURMFILE
echo >> $SLURMFILE

echo "#SBATCH --chdir   $outdir" >> $SLURMFILE
echo "#SBATCH --job-name  ${outname}-cheetah" >> $SLURMFILE
echo "#SBATCH --output    slurm.out" >> $SLURMFILE
echo "#SBATCH --error     slurm.err" >> $SLURMFILE
echo "#SBATCH --nice=100" >> $SLURMFILE

echo >> $SLURMFILE

#echo "source /home/atolstik/miniforge3/envs/om//bin/activate" >> $SLURMFILE
echo "source /home/atolstik/miniforge3/envs/om-dev//bin/activate" >> $SLURMFILE
echo "mpirun -np 11 om_monitor.py files.lst" >> $SLURMFILE

#sbatch $SLURMFILE

#source /home/atolstik/miniforge3/envs/om//bin/activate

source /home/atolstik/miniforge3/envs/om-dev//bin/activate
mpirun -n 2 om_monitor.py files.lst


#mpirun -np 11 om_monitor.py files.lst
#mpirun -n 10 om_monitor.py files.lst
