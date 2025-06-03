cmake_minimum_required(VERSION 3.27)

# Roots
include("../roots.cmake")

set(CONTEXT LwIP_httpd_netconn+LwIP_httpd_netconn)
set(TARGET ${CONTEXT})
set(OUT_DIR "${SOLUTION_ROOT}/out/LwIP_httpd_netconn/LwIP_httpd_netconn")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(HEX_FILE "LwIP_httpd_netconn.hex")
set(LD_MAP_FILE "LwIP_httpd_netconn.axf.map")
set(LD_SCRIPT "${SOLUTION_ROOT}/../../../../Library/Device/Nuvoton/M55M1/Source/ARM/M55M1.scatter")
set(LD_SCRIPT_PP ${LD_SCRIPT})

# Processor Options
set(CPU Cortex-M55)
set(FPU DP_FPU)
set(DSP DSP)
set(MVE FP_FVE)
set(BYTE_ORDER Little-endian)

# Toolchain config map
include("toolchain.cmake")

# Setup project
project(${CONTEXT} LANGUAGES C)

# Compilation database
add_custom_target(database
  COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" "${OUT_DIR}"
)
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Setup context
add_executable(${CONTEXT})
set_target_properties(${CONTEXT} PROPERTIES PREFIX "" SUFFIX ".axf" OUTPUT_NAME "LwIP_httpd_netconn")
set_target_properties(${CONTEXT} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUT_DIR})
add_library(${CONTEXT}_GLOBAL INTERFACE)

# Includes
target_include_directories(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    "${SOLUTION_ROOT}/../../../../Library/CMSIS/Core/Include"
    "${SOLUTION_ROOT}/../../../../Library/Device/Nuvoton/M55M1/Include"
    "${SOLUTION_ROOT}/../../../../Library/StdDriver/inc"
    "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/include"
    "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Demo/Common/include"
    "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/portable/GCC/ARM_CM55_NTZ/non_secure"
    "${SOLUTION_ROOT}/../../lwIP/include"
    "${SOLUTION_ROOT}/../../lwIP/drv_emac"
    "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/include"
    "${SOLUTION_ROOT}/.."
    "${SOLUTION_ROOT}/../../../../Library/StdDriver/inc/emac"
  >
  "${CMSIS_PACK_ROOT}/Nuvoton/NuMicro_DFP/1.3.25/Device/M55M1/Include"
)

# Defines
target_compile_definitions(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    SYSTEM_CORE_CLOCK=220000000
    __MICROLIB
  >
)

# Compile options
target_compile_options(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_CPU}"
    "SHELL:${CC_FLAGS}"
    "SHELL:${CC_SECURE}"
    "SHELL:${CC_BYTE_ORDER}"
    "SHELL:-gdwarf-5"
    "SHELL:-std=c11"
    "SHELL:-fno-rtti"
    "SHELL:-funsigned-char"
    "SHELL:-fshort-enums"
    "SHELL:-fshort-wchar"
    "SHELL:-ffunction-sections"
    "SHELL:-Wno-packed"
    "SHELL:-Wno-missing-variable-declarations"
    "SHELL:-Wno-missing-prototypes"
    "SHELL:-Wno-missing-noreturn"
    "SHELL:-Wno-sign-conversion"
    "SHELL:-Wno-nonportable-include-path"
    "SHELL:-Wno-reserved-id-macro"
    "SHELL:-Wno-unused-macros"
    "SHELL:-Wno-documentation-unknown-command"
    "SHELL:-Wno-documentation"
    "SHELL:-Wno-license-management"
    "SHELL:-Wno-parentheses-equality"
  >
)

# Compile Options Abstractions
add_library(${CONTEXT}_ABSTRACTIONS INTERFACE)
cbuild_set_options_flags(CC "debug" "on" "" "" CC_OPTIONS_FLAGS_${CONTEXT})
target_compile_options(${CONTEXT}_ABSTRACTIONS INTERFACE
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_OPTIONS_FLAGS_${CONTEXT}}"
  >
)

# Add groups and components
include("groups.cmake")
include("components.cmake")

target_link_libraries(${CONTEXT} PUBLIC
  Group_CMSIS
  Group_User
  Group_drv_emac
  Group_FreeRTOS
  Group_Library
  Group_LwIP
)

# Linker options
target_link_options(${CONTEXT} PUBLIC
  "SHELL:${LD_CPU}"
  "SHELL:${_LS}\"${LD_SCRIPT_PP}\""
  "SHELL:${LD_MAP}"
  "SHELL:${LD_SECURE}"
  "SHELL:--entry=Reset_Handler"
  "SHELL:--library_type=microlib"
  "SHELL:--map"
  "SHELL:--load_addr_map_info"
  "SHELL:--xref"
  "SHELL:--callgraph"
  "SHELL:--symbols"
  "SHELL:--info sizes"
  "SHELL:--info totals"
  "SHELL:--info unused"
  "SHELL:--info veneers"
  "SHELL:--strict"
  "SHELL:--summary_stderr"
  "SHELL:--info summarysizes"
)
set_target_properties(${CONTEXT} PROPERTIES LINK_DEPENDS ${LD_SCRIPT})

# Hex Conversion
 add_custom_command(TARGET ${CONTEXT} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ${ELF2HEX})
