################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Emre\ Selen/Desktop/LESSONS/UDEMY\ RTOS/Workspace/common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c 

OBJS += \
./common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o 

C_DEPS += \
./common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d 


# Each subdirectory must supply rules for building sources it contributes
common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o: C:/Users/Emre\ Selen/Desktop/LESSONS/UDEMY\ RTOS/Workspace/common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c common/ThirdParty/SEGGER/SEGGER/Syscalls/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/FreeRTOS/include" -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/SEGGER/Config" -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/SEGGER/OS" -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-ThirdParty-2f-SEGGER-2f-SEGGER-2f-Syscalls

clean-common-2f-ThirdParty-2f-SEGGER-2f-SEGGER-2f-Syscalls:
	-$(RM) ./common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.cyclo ./common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d ./common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o ./common/ThirdParty/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.su

.PHONY: clean-common-2f-ThirdParty-2f-SEGGER-2f-SEGGER-2f-Syscalls

