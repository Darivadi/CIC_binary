CC = gcc
CFLAGS = -g -Wall -I/home/$(USER)/libs/include/ -DCIC -DBINARYDATA
LFLAGS = -L/home/$(USER)/libs/lib
PROGRAM = CIC
#PROGRAM = CIC_plot_dens

$(PROGRAM):
	$(CC) -c -save-temps $@.c $(CFLAGS)
	#$(CC) $@.o -lgsl -lgslcblas -lm -lfftw3 $(LFLAGS) -o $@.x
	$(CC) $@.o -lm $(LFLAGS) -o $@.x

clean:
	rm -rf *.out
	rm -rf *-
	rm -rf *.out
	rm -rf *#
	rm -rf *.o
	rm -rf *.a
	rm -rf *.so
	rm *~
	rm *.x
