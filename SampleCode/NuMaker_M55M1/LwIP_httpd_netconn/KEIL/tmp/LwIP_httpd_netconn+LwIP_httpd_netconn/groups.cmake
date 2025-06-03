# groups.cmake

# group CMSIS
add_library(Group_CMSIS OBJECT
  "${SOLUTION_ROOT}/../../../../Library/Device/Nuvoton/M55M1/Source/startup_M55M1.c"
  "${SOLUTION_ROOT}/../../../../Library/Device/Nuvoton/M55M1/Source/system_M55M1.c"
)
target_include_directories(Group_CMSIS PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_CMSIS PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_CMSIS_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_CMSIS_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_CMSIS PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_CMSIS PUBLIC
  Group_CMSIS_ABSTRACTIONS
)

# group User
add_library(Group_User OBJECT
  "${SOLUTION_ROOT}/../main.c"
  "${SOLUTION_ROOT}/../fs.c"
  "${SOLUTION_ROOT}/../httpserver-netconn.c"
)
target_include_directories(Group_User PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_User PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_User_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_User_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_User PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_User PUBLIC
  Group_User_ABSTRACTIONS
)

# group drv_emac
add_library(Group_drv_emac OBJECT
  "${SOLUTION_ROOT}/../../lwIP/drv_emac/emac.c"
  "${SOLUTION_ROOT}/../../lwIP/drv_emac/mii.c"
)
target_include_directories(Group_drv_emac PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_drv_emac PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_drv_emac_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_drv_emac_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_drv_emac PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_drv_emac PUBLIC
  Group_drv_emac_ABSTRACTIONS
)

# group FreeRTOS
add_library(Group_FreeRTOS OBJECT
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/list.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/tasks.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/timers.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/portable/MemMang/heap_2.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/queue.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Demo/Common/Minimal/GenQTest.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Demo/Common/Minimal/PollQ.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Demo/Common/Minimal/semtest.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Demo/Common/Minimal/QueueSet.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/portable/GCC/ARM_CM55_NTZ/non_secure/port.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/FreeRTOS/Source/portable/GCC/ARM_CM55_NTZ/non_secure/portasm.c"
)
target_include_directories(Group_FreeRTOS PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_FreeRTOS PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_FreeRTOS_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_FreeRTOS_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_FreeRTOS PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_FreeRTOS PUBLIC
  Group_FreeRTOS_ABSTRACTIONS
)

# group Library
add_library(Group_Library OBJECT
  "${SOLUTION_ROOT}/../../../../Library/StdDriver/src/retarget.c"
  "${SOLUTION_ROOT}/../../../../Library/StdDriver/src/clk.c"
  "${SOLUTION_ROOT}/../../../../Library/StdDriver/src/sys.c"
  "${SOLUTION_ROOT}/../../../../Library/StdDriver/src/uart.c"
  "${SOLUTION_ROOT}/../../../../Library/StdDriver/src/emac/synopGMAC_Dev.c"
  "${SOLUTION_ROOT}/../../../../Library/StdDriver/src/emac/synopGMAC_network_interface.c"
  "${SOLUTION_ROOT}/../../../../Library/StdDriver/src/emac/synopGMAC_plat.c"
  "${SOLUTION_ROOT}/../../../../Library/StdDriver/src/gpio.c"
)
target_include_directories(Group_Library PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Library PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Library_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Library_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Library PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Library PUBLIC
  Group_Library_ABSTRACTIONS
)

# group LwIP
add_library(Group_LwIP OBJECT
  "${SOLUTION_ROOT}/../../lwIP/sys_arch.c"
  "${SOLUTION_ROOT}/../../lwIP/time_stamp.c"
  "${SOLUTION_ROOT}/../../lwIP/netif/ethernetif.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/def.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/dns.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/inet_chksum.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/init.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ip.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/mem.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/memp.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/netif.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/pbuf.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/raw.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/stats.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/sys_lwip.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/tcp.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/tcp_in.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/tcp_out.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/timeouts.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/udp.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ipv4/autoip.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ipv4/dhcp.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ipv4/etharp.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ipv4/icmp.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ipv4/igmp.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ipv4/ip4.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ipv4/ip4_addr.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/core/ipv4/ip4_frag.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/api/api_lib.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/api/api_msg.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/api/err.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/api/netbuf.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/api/netdb.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/api/netifapi.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/api/sockets.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/api/tcpip.c"
  "${SOLUTION_ROOT}/../../../../ThirdParty/lwIP/src/netif/ethernet.c"
)
target_include_directories(Group_LwIP PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_LwIP PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_LwIP_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_LwIP_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_LwIP PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_LwIP PUBLIC
  Group_LwIP_ABSTRACTIONS
)
