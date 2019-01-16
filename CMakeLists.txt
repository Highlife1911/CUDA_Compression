cmake_minimum_required(VERSION 3.13 FATAL_ERROR)
project(culzss LANGUAGES CXX CUDA)
 
add_executable(culzss
    main.c
    decompression.c
    decompression.h
    culzss.c
    culzss.h
    deculzss.c
    deculzss.h
    gpu_compress.cu
    gpu_compress.h
    gpu_decompress.cu
    gpu_decompress.h
  )
 
#target_compile_features(particles PUBLIC cxx_std_11)
 
# We need to explicitly state that we need all CUDA files in the 
# particle library to be built with -dc as the member functions 
# could be called by other libraries and executables
#set_target_properties( particles PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
 
#add_executable(particle_test test.cu)
 
#set_property(TARGET particle_test PROPERTY CUDA_SEPARABLE_COMPILATION ON)
#target_link_libraries(particle_test PRIVATE particles)