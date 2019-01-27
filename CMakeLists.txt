cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(culzss LANGUAGES C CUDA)
 
add_library(culzsslib
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
set_target_properties(culzsslib PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
 
add_executable(culzss main.c)

target_link_libraries(culzss PRIVATE culzsslib)
