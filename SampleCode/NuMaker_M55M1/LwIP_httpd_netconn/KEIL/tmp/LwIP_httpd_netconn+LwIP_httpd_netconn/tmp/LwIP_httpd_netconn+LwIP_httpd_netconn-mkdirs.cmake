# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn")
  file(MAKE_DIRECTORY "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn")
endif()
file(MAKE_DIRECTORY
  "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/1"
  "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn"
  "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn/tmp"
  "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn/src/LwIP_httpd_netconn+LwIP_httpd_netconn-stamp"
  "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn/src"
  "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn/src/LwIP_httpd_netconn+LwIP_httpd_netconn-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn/src/LwIP_httpd_netconn+LwIP_httpd_netconn-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/chrsei01/02_Git/KeilChris/M55M1BSP/SampleCode/NuMaker_M55M1/LwIP_httpd_netconn/KEIL/tmp/LwIP_httpd_netconn+LwIP_httpd_netconn/src/LwIP_httpd_netconn+LwIP_httpd_netconn-stamp${cfgdir}") # cfgdir has leading slash
endif()
