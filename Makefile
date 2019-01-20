main: main.c culzss gpu_compress deculzss gpu_decompress decompression
	gcc -g -L /usr/local/cuda/lib64/ -lcuda -lcudart -lcudadevrt -pthread -o main main.c culzss.o gpu_compress.o deculzss.o gpu_decompress.o decompression.o

decompression: 	decompression.c decompression.h
	gcc -c -pthread -lcudadevrt -o decompression.o decompression.c
	
culzss:  culzss.c culzss.h 
	gcc -c -pthread -lcudadevrt -o culzss.o culzss.c 

gpu_compress: gpu_compress.cu gpu_compress.h
	nvcc -c -arch sm_61 -lpthread -lcudadevrt -o gpu_compress.o gpu_compress.cu 

deculzss:  deculzss.c deculzss.h 
	gcc -c -pthread -lcudadevrt -o deculzss.o deculzss.c

gpu_decompress: gpu_decompress.cu gpu_decompress.h
	nvcc -c -arch sm_61 -lpthread -lcudadevrt -o gpu_decompress.o gpu_decompress.cu

clean:
	rm *.o

