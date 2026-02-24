<div style="font-family: 'Times New Roman', Times, serif;">

<h1 align="center">001Tasks</h1>
<h3 align="center">Basic FreeRTOS Task Creation and Scheduler Behavior</h3>

---

# Overview

This project demonstrates the fundamental concepts of **task creation**, **scheduler initialization**, and **real-time task execution** using **FreeRTOS** on the **STM32 NUCLEO-F401RE (ARM Cortex-M4)** development board.

Two independent FreeRTOS tasks are created and executed concurrently. Each task continuously transmits debug messages using **SEGGER SystemView**, allowing real-time observation of scheduler behavior, context switching, and CPU time sharing.

This example serves as the foundation for understanding **FreeRTOS task management** and **RTOS-controlled execution** on ARM Cortex-M microcontrollers.

---

# Hardware Platform

| Component | Description |
|---------|-------------|
| Development Board | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RET6 — ARM Cortex-M4 |
| RTOS Kernel | FreeRTOS v10.4 / FreeRTOS v11 |
| Development Environment | STM32CubeIDE |
| Debug Tool | SEGGER SystemView |
| Debug Interface | SEGGER RTT / UART |

---

# Objective

The main objective of this project is to demonstrate:

- Creation of multiple FreeRTOS tasks  
- RTOS scheduler initialization and control  
- Concurrent task execution  
- Equal-priority task scheduling behavior  
- Real-time debug monitoring using SEGGER SystemView  
- Context switching observation  

---

# Task Creation

Two independent tasks are created using the FreeRTOS API:

```c
xTaskCreate()
```

Tasks created:

- Task-1  
- Task-2  

Each task has:

- Independent stack memory allocation  
- Independent execution context  
- Same priority level (Priority = 2)  
- Independent infinite execution loop  

Each task receives a string parameter and continuously transmits it using:

```c
SEGGER_SYSVIEW_PrintfTarget()
```

This demonstrates how FreeRTOS enables multiple independent execution units within a single embedded firmware system.

---

# Scheduler Initialization

The FreeRTOS scheduler is started using:

```c
vTaskStartScheduler()
```

After scheduler startup:

- FreeRTOS takes full control of CPU execution  
- main() function execution stops  
- RTOS scheduler begins managing task execution  
- Context switching is handled automatically by the kernel  

This marks the transition from **bare-metal execution to RTOS-controlled execution**.

---

# Task Execution Behavior

Both tasks execute infinite loops and continuously transmit debug messages.

Since both tasks:

- Have equal priority  
- Do not block  
- Do not use delay  

FreeRTOS applies:

# Round Robin Scheduling

This results in:

- Continuous context switching  
- Equal CPU time distribution  
- Logical parallel execution behavior  

This behavior can be directly observed using SEGGER SystemView.

---

# SEGGER SystemView Integration

SEGGER SystemView enables real-time monitoring of RTOS behavior, including:

- Real-time task execution monitoring  
- Context switch visualization  
- Scheduler activity tracking  
- CPU activity observation  
- Non-intrusive debug logging  

This provides deep visibility into FreeRTOS kernel execution.

---

# Cortex-M DWT Cycle Counter Integration

The Cortex-M Data Watchpoint and Trace (DWT) unit is enabled for high-precision timing measurement.

Example:

```c
#define DWT_CTRL (*(volatile uint32_t*)0xE0001000)
DWT_CTRL |= (1 << 0);
```

This enables:

- High-resolution timing measurement  
- Accurate RTOS event tracing  
- Precise SystemView timing analysis  

This is essential for professional real-time firmware debugging.

---

# FreeRTOS APIs Used

## Task Management

- xTaskCreate()
- vTaskStartScheduler()

## Debug and Monitoring

- SEGGER_SYSVIEW_Conf()
- SEGGER_SYSVIEW_PrintfTarget()
- SEGGER_UART_init()

---

# System Behavior Summary

After scheduler initialization:

- Both tasks execute continuously  
- FreeRTOS scheduler manages CPU execution  
- CPU switches between tasks automatically  
- Debug output is transmitted via SEGGER SystemView  
- System operates fully under RTOS control  

This demonstrates the fundamental operation of a real-time operating system.

---

# FreeRTOS Version Compatibility

This project was tested using:

- FreeRTOS Version 10.4  
- FreeRTOS Version 11  

No functional differences were observed.

This confirms stability and compatibility across kernel versions.

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- RTOS-based firmware architecture  
- Task creation and management  
- Scheduler operation  
- Context switching mechanisms  
- Real-time debugging techniques  
- Embedded RTOS execution model on ARM Cortex-M  

This example forms the foundation for advanced RTOS concepts such as:

- Queues  
- Semaphores  
- Mutexes  
- ISR synchronization  

---

# Project Information

| Parameter | Value |
|---------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RET6 |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Debug Tool | SEGGER SystemView |
| Programming Language | Embedded C |
| Development Environment | STM32CubeIDE |

---

</div>