#time ./FFT_of_densities.x ./Parameter_files/parameters_file_ASCII.dat | tee screen_FFT_c2c.txt
#time ./FFT_of_densities.x ./Parameter_files/parameters_file_Binary_512.dat | tee screen_FFT_c2c.txt
time ./CIC.x ./Parameters_file/parameters_file_Binary.dat | tee screen_CIC.txt
