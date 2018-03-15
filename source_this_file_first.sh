module purge

module load modules modules-init modules-gs/prod modules-eichler/prod
module load hdf5/1.8.13 netcdf/4.3.2 R/3.1.0 samtools/1.3.1

# gcc is required for Rscript and mpc,mpfr, and gmp are required for gcc
module load mpc/0.8.2 mpfr/2.4.1 gmp/4.2.4 gcc/4.9.1
