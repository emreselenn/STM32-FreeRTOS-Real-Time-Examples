################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Emre\ Selen/Desktop/LESSONS/UDEMY\ RTOS/Workspace/common/ThirdParty/SEGGER/Rec/segger_uart.c 

OBJS += \
./common/ThirdParty/SEGGER/Rec/segger_uart.o 

C_DEPS += \
./common/ThirdParty/SEGGER/Rec/segger_uart.d 


# Each subdirectory must supply rules for building sources it contributes
common/ThirdParty/SEGGER/Rec/segger_uart.o: C:/Users/Emre\ Selen/Desktop/LESSONS/UDEMY\ RTOS/Workspace/common/ThirdParty/SEGGER/Rec/segger_uart.c common/ThirdParty/SEGGER/Rec/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/FreeRTOS/include" -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/SEGGER/Config" -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/SEGGER/OS" -I"C:/Users/Emre Selen/Desktop/LESSONS/UDEMY RTOS/Workspace/common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-common-2f-ThirdParty-2f-SEGGER-2f-Rec

clean-common-2f-ThirdParty-2f-SEGGER-2f-Rec:
	-$(RM) ./common/ThirdParty/SEGGER/Rec/segger_uart.cyclo ./common/ThirdParty/SEGGER/Rec/segger_uart.d ./common/ThirdParty/SEGGER/Rec/segger_uart.o ./common/ThirdParty/SEGGER/Rec/segger_uart.su

.PHONY: clean-common-2f-ThirdParty-2f-SEGGER-2f-Rec

