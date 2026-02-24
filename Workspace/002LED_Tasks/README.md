<h1 align="center">002LED_Tasks</h1>
<h3 align="center">Real-Time LED Control with Deterministic FreeRTOS Scheduling</h3>

---

# Overview

This project demonstrates **deterministic periodic task execution**, **preemptive multitasking**, and **real-time scheduling behavior** using **FreeRTOS** on the **STM32 NUCLEO-F401RE (ARM Cortex-M4)** platform.

Three independent RTOS tasks are created, each responsible for controlling a different LED with a unique execution period. This project highlights the **correct professional approach for implementing periodic real-time tasks**, and clearly demonstrates the behavioral differences between blocking delays, non-deterministic RTOS delays, and deterministic scheduling.

This implementation reflects real-world RTOS design patterns used in:

- Embedded firmware systems  
- Industrial automation and control systems  
- Robotics applications  
- Automotive Electronic Control Units (ECUs)  

---

# Hardware Platform

| Component | Description |
|---------|-------------|
| Development Board | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RET6 — ARM Cortex-M4 @ 84 MHz |
| RTOS Kernel | FreeRTOS |
| Development Environment | STM32CubeIDE |
| Debug Interface | SEGGER SystemView via UART / RTT |

---

# Task Architecture

Three independent FreeRTOS tasks are created using:

```c
xTaskCreate()
```

Each task controls a dedicated LED with a fixed periodic execution interval.

| Task Name | GPIO Pin | Execution Period | Function |
|----------|-----------|------------------|----------|
| Green LED Task | PC0 | 800 ms | Periodic LED control |
| Orange LED Task | PC1 | 400 ms | Periodic LED control |
| Red LED Task | PC2 | 200 ms | Periodic LED control |

Each task operates as an independent execution unit with:

- Independent stack memory  
- Dedicated execution context  
- Equal priority level  
- Independent scheduling lifecycle  

This demonstrates true **preemptive multitasking using an RTOS scheduler**.

---

# Deterministic Scheduling using vTaskDelayUntil()

This project uses the **industry-standard deterministic periodic delay mechanism**:

```c
vTaskDelayUntil(&last_wakeup_time, pdMS_TO_TICKS(period));
```

Each task initializes its reference wakeup time using:

```c
TickType_t last_wakeup_time = xTaskGetTickCount();
```

This guarantees:

- Deterministic periodic execution  
- Precise timing intervals  
- Zero cumulative timing drift  
- Stable real-time system behavior  

This is the **recommended professional method for periodic task implementation in real-time embedded systems**.

---

# Comparison of Delay Mechanisms

## HAL_Delay() — Blocking and Not RTOS Safe

```c
HAL_Delay(200);
```

Problems:

- Blocks the CPU completely  
- Prevents scheduler execution  
- Breaks multitasking behavior  
- Not suitable for RTOS environments  

---

## vTaskDelay() — RTOS Safe but Non-Deterministic

```c
vTaskDelay(pdMS_TO_TICKS(200));
```

Advantages:

- Non-blocking delay  
- Allows scheduler to execute other tasks  

Disadvantage:

- Execution period includes task runtime  
- Causes cumulative timing drift  
- Not suitable for precise periodic execution  

---

## vTaskDelayUntil() — Deterministic and Professional Solution

```c
vTaskDelayUntil(&last_wakeup_time, pdMS_TO_TICKS(200));
```

Advantages:

- Deterministic periodic execution  
- No timing drift  
- Precise execution intervals  
- Real-time system stability  

This is the **industry-standard solution for periodic task scheduling in RTOS-based embedded firmware**.

---

# FreeRTOS Scheduler Behavior

All tasks are created with equal priority:

```c
Priority = 2
```

The FreeRTOS scheduler performs:

- Preemptive scheduling  
- Automatic context switching  
- Efficient CPU time sharing  
- Task state management (Running, Ready, Blocked)

When tasks call:

```c
vTaskDelayUntil()
```

they enter the **Blocked state**, allowing the scheduler to execute other ready tasks efficiently.

This ensures optimal CPU utilization and true multitasking behavior.

---

# Real-Time Debugging using SEGGER SystemView

SEGGER SystemView integration enables real-time observation of RTOS behavior, including:

- Task execution monitoring  
- Context switch visualization  
- Scheduler activity tracking  
- Execution timing analysis  
- CPU usage observation  

Debug messages are transmitted using:

```c
SEGGER_SYSVIEW_PrintfTarget("LED toggled");
```

This provides deep visibility into system runtime behavior.

---

# Cortex-M DWT Cycle Counter Integration

The Cortex-M Data Watchpoint and Trace (DWT) unit is enabled using:

```c
#define DWT_CTRL (*(volatile uint32_t*)0xE0001000)
DWT_CTRL |= (1 << 0);
```

This enables:

- High-precision timing measurement  
- Accurate event timing analysis  
- Professional real-time debugging capability  

---

# FreeRTOS APIs Used

## Task Management

- xTaskCreate()
- vTaskStartScheduler()

## Timing Management

- vTaskDelayUntil()
- xTaskGetTickCount()
- pdMS_TO_TICKS()

## Debug and Monitoring

- SEGGER_SYSVIEW_Conf()
- SEGGER_SYSVIEW_PrintfTarget()
- SEGGER_UART_init()

---

# System Behavior Summary

After scheduler initialization:

- All tasks execute independently  
- Each LED toggles at its precise defined interval  
- Scheduler automatically manages task execution  
- CPU utilization is optimized  
- System operates deterministically  

This demonstrates correct and professional **RTOS-based firmware design**.

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- RTOS-based multitasking  
- Deterministic task scheduling  
- Periodic task implementation  
- Real-time system timing control  
- Scheduler-driven execution model  
- Embedded RTOS debugging techniques  

---

# Conclusion

This project demonstrates the correct and professional implementation of periodic real-time tasks using FreeRTOS.

Using:

```c
vTaskDelayUntil()
```

ensures deterministic, predictable, and stable real-time system behavior, which is essential for professional embedded firmware development.

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
