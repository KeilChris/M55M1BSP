# roots.cmake
set(CMSIS_PACK_ROOT "/Users/chrsei01/.cache/arm/packs" CACHE PATH "CMSIS pack root")
cmake_path(ABSOLUTE_PATH CMSIS_PACK_ROOT NORMALIZE OUTPUT_VARIABLE CMSIS_PACK_ROOT)
set(CMSIS_COMPILER_ROOT "/Users/chrsei01/.vcpkg/artifacts/2139c4c6/tools.open.cmsis.pack.cmsis.toolbox/2.9.0/etc" CACHE PATH "CMSIS compiler root")
cmake_path(ABSOLUTE_PATH CMSIS_COMPILER_ROOT NORMALIZE OUTPUT_VARIABLE CMSIS_COMPILER_ROOT)
set(SOLUTION_ROOT "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL" CACHE PATH "CMSIS solution root")
cmake_path(ABSOLUTE_PATH SOLUTION_ROOT NORMALIZE OUTPUT_VARIABLE SOLUTION_ROOT)
