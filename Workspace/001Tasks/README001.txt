# 001Tasks – Basic FreeRTOS Task Creation and Scheduler Behavior

## Overview

This project demonstrates the fundamental concepts of task creation, scheduler initialization, and real-time task execution using FreeRTOS on the STM32 NUCLEO-F401RE development board.

Two independent FreeRTOS tasks are created and executed concurrently. Each task continuously transmits debug messages using SEGGER SystemView, allowing real-time observation of scheduler behavior, context switching, and CPU time sharing.

This example serves as the foundation for understanding FreeRTOS task management and RTOS-controlled execution on ARM Cortex-M microcontrollers.

---

## Hardware Platform

**Development Board:** STM32 NUCLEO-F401RE  
**Microcontroller:** STM32F401RET6 – ARM Cortex-M4  
**RTOS:** FreeRTOS v10.4 and FreeRTOS v11  
**Development Environment:** STM32CubeIDE  
**Debug Tool:** SEGGER SystemView  
**Debug Interface:** SEGGER RTT / UART  

---

## Objective

The main objective of this project is to demonstrate:

- Creation of multiple FreeRTOS tasks
- RTOS scheduler initialization and control
- Concurrent task execution
- Equal-priority task scheduling behavior
- Real-time debug monitoring using SEGGER SystemView
- Context switching observation

---

## Task Creation

Two independent tasks are created using the FreeRTOS API:

- Task-1
- Task-2

Each task has:

- Its own stack memory allocation
- Its own execution context
- Same priority level (Priority = 2)
- Independent execution loop

FreeRTOS API used:

- xTaskCreate()

Each task receives a string parameter and continuously transmits it using SEGGER SystemView.

This demonstrates how FreeRTOS allows multiple independent execution units within a single embedded system.

---

## Scheduler Initialization

The FreeRTOS scheduler is started using:

vTaskStartScheduler()

After this function is called:

- FreeRTOS takes full control of CPU execution
- The main() function stops executing
- Task scheduling begins
- Context switching is managed by the RTOS kernel

This marks the transition from bare-metal execution to RTOS-based execution.

---

## Task Execution Behavior

Both tasks execute infinite loops and continuously send debug messages using:

SEGGER_SYSVIEW_PrintfTarget()

Since both tasks:

- Have equal priority
- Do not block
- Do not use delay

FreeRTOS applies Round Robin Scheduling.

This results in:

- Continuous context switching between tasks
- Equal CPU time distribution
- Parallel task execution behavior (logically concurrent)

This behavior can be directly observed using SEGGER SystemView.

---

## SEGGER SystemView Integration

SEGGER SystemView is used for real-time monitoring of RTOS behavior.

The following features are enabled:

- Real-time task execution monitoring
- Context switch visualization
- Scheduler activity tracking
- CPU activity observation
- Non-intrusive debug logging

SystemView provides deep insight into FreeRTOS kernel behavior.

---

## Cortex-M DWT Cycle Counter Usage

The Cortex-M Data Watchpoint and Trace (DWT) unit is enabled to allow precise timing measurements.

This enables:

- High-resolution timestamp generation
- Accurate RTOS event tracing
- Precise SystemView timing analysis

This is essential for real-time system debugging and performance analysis.

---

## FreeRTOS APIs Used

**Task Management APIs**

- xTaskCreate()
- vTaskStartScheduler()

**Debug and Monitoring APIs**

- SEGGER_SYSVIEW_Conf()
- SEGGER_SYSVIEW_PrintfTarget()
- SEGGER_UART_init()

---

## System Behavior Summary

After scheduler startup:

- Both tasks execute continuously
- FreeRTOS scheduler manages task execution
- CPU switches between tasks automatically
- Debug output is transmitted via SEGGER SystemView
- System operates fully under RTOS control

This demonstrates the fundamental operation of a real-time operating system.

---

## FreeRTOS Version Compatibility

This project was tested using:

- FreeRTOS Version 10.4
- FreeRTOS Version 11

No functional differences were observed.

This confirms compatibility and stability of FreeRTOS task management across versions.

---

## Key Learning Outcomes

This project demonstrates practical understanding of:

- RTOS-based firmware architecture
- Task creation and management
- Scheduler operation
- Context switching
- Real-time debugging techniques
- Embedded RTOS execution model on ARM Cortex-M

This example forms the foundation for more advanced RTOS concepts such as queues, semaphores, mutexes, and ISR synchronization.

---