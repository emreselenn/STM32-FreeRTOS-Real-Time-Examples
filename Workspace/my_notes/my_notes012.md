<h1 align="center">Mutex for Mutual Exclusion and Priority Protection</h1>
<h3 align="center">Shared Resource Protection using FreeRTOS Mutex and Priority Inheritance</h3>

---

# Project Overview

This project demonstrates how to use a **FreeRTOS Mutex** to protect a shared resource and ensure safe access between multiple tasks.

Two tasks attempt to print messages using a shared output interface (**SEGGER SystemView UART**). The mutex ensures that only one task can access the shared resource at any given time.

Unlike binary semaphores, mutexes provide an additional critical feature:

# Priority Inheritance

This prevents **priority inversion**, ensuring reliable real-time system behavior.

---

# Core Concept Demonstrated

This project implements:

# Mutual Exclusion using FreeRTOS Mutex

Mutex ensures:

- Exclusive access to shared resources  
- Prevention of race conditions  
- Safe multi-tasking execution  
- Priority inheritance support  

Mutex is the preferred synchronization primitive for shared resource protection.

---

# Mutex Creation

Mutex initialization:

```c
xMutex = xSemaphoreCreateMutex();
```

Purpose:

- Protect shared hardware resource  
- Ensure exclusive resource access  
- Prevent race conditions  
- Enable priority inheritance  

Mutex is initially available after creation.

---

# Shared Resource

The protected shared resource:

```c
printmsg(text);
```

Function implementation:

```c
SEGGER_SYSVIEW_PrintfTarget("%s", msg);
```

This transmits data via UART/SystemView interface.

UART is a shared hardware resource.

Without synchronization, concurrent access may cause:

- Corrupted output  
- Mixed messages  
- Undefined system behavior  

Mutex prevents these issues.

---

# Task Architecture

The system contains two tasks:

| Task Name | Priority | Function |
|----------|----------|----------|
| PrintTask1 | 1 | Prints message using shared resource |
| PrintTask2 | 2 | Prints message using shared resource |

Both tasks use mutex to protect resource access.

---

# Task Execution Pattern

Each task follows a structured synchronization pattern.

---

## Step 1 — Take Mutex (Lock Resource)

```c
xSemaphoreTake(xMutex, portMAX_DELAY);
```

Behavior:

- Task blocks if mutex is unavailable  
- Task acquires mutex when available  

This locks the shared resource.

---

## Step 2 — Access Shared Resource

```c
printmsg(text);
```

Shared resource access is now protected.

---

## Step 3 — Release Mutex (Unlock Resource)

```c
xSemaphoreGive(xMutex);
```

Behavior:

- Releases resource lock  
- Allows other waiting tasks to execute  

---

## Step 4 — Delay Before Next Access

```c
vTaskDelay(pdMS_TO_TICKS(500));
```

Allows scheduler to execute other tasks efficiently.

---

# Mutex Execution Flow

Example execution sequence:

Higher priority task takes mutex  
↓  
Task accesses shared resource  
↓  
Task releases mutex  
↓  
Lower priority task takes mutex  
↓  
Task accesses shared resource  
↓  
Process repeats  

Only one task accesses resource at any time.

---

# Priority Inheritance Mechanism

Mutex supports:

# Priority Inheritance

Scenario:

Low priority task holds mutex  
↓  
High priority task attempts to acquire mutex  
↓  
High priority task becomes blocked  
↓  
Low priority task temporarily inherits higher priority  
↓  
Low priority task completes execution faster  
↓  
Mutex released  
↓  
High priority task executes  

This prevents:

# Priority Inversion

This ensures deterministic real-time scheduling behavior.

---

# Why Mutex Instead of Binary Semaphore

Binary semaphore does NOT support priority inheritance.

Mutex is specifically designed for resource protection.

---

# Mutex vs Binary Semaphore Comparison

| Feature | Binary Semaphore | Mutex |
|--------|------------------|--------|
| Purpose | Event signaling | Resource protection |
| Mutual Exclusion | Possible | Designed specifically for it |
| Priority Inheritance | No | Yes |
| Prevents Priority Inversion | No | Yes |
| Recommended for Shared Resource Protection | No | Yes |

Mutex is the correct choice for protecting shared hardware resources.

---

# Task State Behavior

When mutex is unavailable:

Task state transition:

Running → Blocked → Ready → Running

Benefits:

- Efficient CPU utilization  
- Safe resource access  
- Deterministic execution  

---

# FreeRTOS APIs Used

## Mutex APIs

- xSemaphoreCreateMutex()
- xSemaphoreTake()
- xSemaphoreGive()

## Task Management APIs

- xTaskCreate()
- vTaskDelay()
- vTaskStartScheduler()

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- Mutex-based mutual exclusion  
- Shared resource protection  
- Priority inheritance mechanism  
- Priority inversion prevention  
- Task synchronization  
- Safe multi-tasking execution  

These concepts are critical in real-time embedded systems.

---

# Design Insight

Mutex provides:

- Safe resource locking  
- Deterministic task execution  
- Protection against priority inversion  
- Reliable real-time system behavior  

Mutex is the industry-standard method for protecting shared resources.

---

# Real-World Embedded System Applications

Mutex is widely used in:

- UART communication drivers  
- Peripheral access protection (SPI, I2C, CAN)  
- Shared memory access control  
- Multi-task hardware access  
- Real-time embedded firmware systems  

Mutex is essential in professional embedded software development.

---

# Conclusion

This project demonstrates how FreeRTOS Mutex ensures safe shared resource access while preventing priority inversion using priority inheritance.

Using mutex provides:

- Safe and reliable resource protection  
- Deterministic task execution  
- Proper real-time system behavior  

Mutex is the preferred synchronization mechanism for shared resource protection in FreeRTOS.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Synchronization Primitive | Mutex |
| Protected Resource | SEGGER SystemView UART |
| Feature Demonstrated | Priority Inheritance |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---