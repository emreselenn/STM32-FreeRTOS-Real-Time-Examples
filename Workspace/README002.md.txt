# 002LED_Tasks – Real-Time LED Control with Deterministic FreeRTOS Scheduling

---

## Overview

This project demonstrates **deterministic periodic task execution**, **preemptive multitasking**, and **real-time scheduling behavior** using **FreeRTOS** on the **STM32 NUCLEO-F401RE (ARM Cortex‑M4)** platform.

Three independent RTOS tasks are created, each responsible for controlling a different LED with a unique execution period. The project highlights the **correct professional approach for implementing periodic real-time tasks**, and clearly demonstrates the differences between:

* ❌ Blocking delay (`HAL_Delay`)
* ⚠️ Non‑deterministic RTOS delay (`vTaskDelay`)
* ✅ Deterministic periodic delay (`vTaskDelayUntil`)

This implementation reflects real-world RTOS design patterns used in **embedded firmware, industrial control systems, robotics, and automotive ECUs**.

---

## Hardware Platform

**Development Board:** STM32 NUCLEO‑F401RE
**Microcontroller:** STM32F401RET6 – ARM Cortex‑M4 (84 MHz)
**RTOS Kernel:** FreeRTOS
**Development Environment:** STM32CubeIDE
**Debug Interface:** SEGGER SystemView via UART/RTT

---

## Task Architecture

Three independent FreeRTOS tasks are created using `xTaskCreate()`:

| Task Name       | Hardware Resource | Execution Period | Function             |
| --------------- | ----------------- | ---------------- | -------------------- |
| Green LED Task  | GPIO PC0          | 800 ms           | Periodic LED control |
| Orange LED Task | GPIO PC1          | 400 ms           | Periodic LED control |
| Red LED Task    | GPIO PC2          | 200 ms           | Periodic LED control |

Each task runs as an independent execution entity with:

* Its own stack
* Its own execution context
* Equal priority level
* Independent scheduling lifecycle

This demonstrates **true RTOS‑based multitasking**.

---

## Deterministic Scheduling using vTaskDelayUntil()

This project uses the **correct and professional RTOS timing mechanism**:

```
vTaskDelayUntil(&last_wakeup_time, pdMS_TO_TICKS(period));
```

Each task initializes its reference time using:

```
TickType_t last_wakeup_time = xTaskGetTickCount();
```

This ensures that each task executes at a **precisely defined periodic interval**, independent of execution overhead.

Unlike traditional delay mechanisms, this approach guarantees:

* Deterministic execution
* No timing drift
* Precise periodic scheduling
* Real-time system stability

This is the **industry‑standard method** for periodic task implementation.

---

## Comparison of Delay Mechanisms

### HAL_Delay() — Not RTOS Safe

```
HAL_Delay(200);
```

**Problems:**

* Blocks the CPU
* Prevents scheduler operation
* Breaks multitasking
* Not suitable for RTOS systems

---

### vTaskDelay() — RTOS Safe but Non‑Deterministic

```
vTaskDelay(pdMS_TO_TICKS(200));
```

**Advantages:**

* Allows scheduler operation
* Non‑blocking

**Disadvantage:**

* Execution period includes task runtime
* Causes cumulative timing drift

---

### vTaskDelayUntil() — Deterministic and Correct

```
vTaskDelayUntil(&last_wakeup_time, pdMS_TO_TICKS(200));
```

**Advantages:**

* Precise periodic execution
* No drift
* Deterministic timing
* Professional RTOS behavior

This is the **recommended approach for real‑time embedded systems**.

---

## FreeRTOS Scheduler Behavior

All tasks are created with equal priority:

```
Priority = 2
```

FreeRTOS scheduler performs:

* Preemptive scheduling
* Automatic context switching
* Efficient CPU utilization
* Task state management (Running, Ready, Blocked)

When tasks call `vTaskDelayUntil()`, they enter the **Blocked state**, allowing the scheduler to execute other ready tasks.

This ensures efficient multitasking.

---

## Real-Time Debugging using SEGGER SystemView

SEGGER SystemView integration enables:

* Real‑time task monitoring
* Scheduler activity visualization
* Context switch tracking
* Execution timing analysis
* CPU usage observation

Debug messages are transmitted using:

```
SEGGER_SYSVIEW_PrintfTarget("Toggling LED");
```

This provides deep visibility into RTOS behavior.

---

## Cortex‑M DWT Cycle Counter Integration

The Cortex‑M Data Watchpoint and Trace unit is enabled:

```
#define DWT_CTRL (*(volatile uint32_t*)0xE0001000)
DWT_CTRL |= (1<<0);
```

This enables:

* High‑precision timing
* Accurate RTOS event tracing
* Professional‑level real‑time debugging

---

## FreeRTOS APIs Used

**Task Management**

* xTaskCreate()
* vTaskStartScheduler()

**Timing Management**

* vTaskDelayUntil()
* xTaskGetTickCount()
* pdMS_TO_TICKS()

**Debug and Monitoring**

* SEGGER_SYSVIEW_Conf()
* SEGGER_SYSVIEW_PrintfTarget()
* SEGGER_UART_init()

---

## System Behavior Summary

After scheduler startup:

* All tasks execute independently
* Each LED toggles at its precise period
* Scheduler manages execution automatically
* CPU utilization is optimized
* System operates deterministically

This demonstrates **professional real‑time firmware design using FreeRTOS**.

---

## Key Learning Outcomes

This project demonstrates practical understanding of:

* RTOS‑based multitasking
* Deterministic task scheduling
* Periodic task implementation
* Real‑time system timing control
* Scheduler‑driven execution
* Embedded RTOS debugging techniques

---

## Conclusion

This project demonstrates the correct and professional implementation of periodic tasks using FreeRTOS.

Using **vTaskDelayUntil() ensures deterministic, stable, and predictable real‑time system behavior**, which is essential for professional embedded firmware development.

---

**Platform:** STM32 NUCLEO‑F401RE
**RTOS:** FreeRTOS
**Debug Tool:** SEGGER SystemView
**Language:** Embedded C

---
