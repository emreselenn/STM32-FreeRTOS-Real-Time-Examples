<h1 align="center">Binary Semaphore for Mutual Exclusion</h1>
<h3 align="center">Shared Resource Protection using FreeRTOS Binary Semaphore</h3>

---

# Project Overview

This project demonstrates how to use a **FreeRTOS Binary Semaphore** to implement **Mutual Exclusion**, ensuring safe access to a shared resource between multiple tasks.

Two tasks attempt to access a shared resource (UART printf output). The binary semaphore ensures that only one task can access the resource at a time.

This prevents:

- Race conditions  
- Data corruption  
- Concurrent access conflicts  

This is a fundamental synchronization mechanism in real-time embedded systems.

---

# Core Concept Demonstrated

This project implements:

# Mutual Exclusion using Binary Semaphore

Mutual exclusion ensures that only one task can access a shared resource at any given time.

Binary semaphore acts as a:

# Resource access lock

This ensures safe and deterministic resource access.

---

# Binary Semaphore Initialization

Semaphore creation:

```c
xBinarySemaphore = xSemaphoreCreateBinary();
```

Semaphore initial state:

```c
xSemaphoreGive(xBinarySemaphore);
```

This makes the semaphore available for the first task.

Binary semaphore has two possible states:

| State | Meaning |
|------|---------|
| Available (1) | Resource is free |
| Not Available (0) | Resource is locked |

---

# Shared Resource

The shared resource in this project is UART output:

```c
printf("Task X is running\r\n");
```

UART is a shared hardware peripheral.

Without synchronization, concurrent access could result in:

- Mixed output  
- Data corruption  
- Unpredictable system behavior  

Binary semaphore ensures exclusive access.

---

# Task Execution Pattern

Both Task1 and Task2 follow the same synchronization pattern.

---

## Step 1 — Take Semaphore (Lock Resource)

```c
xSemaphoreTake(xBinarySemaphore, portMAX_DELAY);
```

Behavior:

- Task blocks if semaphore is unavailable  
- Task proceeds if semaphore is available  

This locks the shared resource.

---

## Step 2 — Access Shared Resource

```c
printf("Task X is running\r\n");
```

Resource access is now protected.

---

## Step 3 — Give Semaphore (Release Resource)

```c
xSemaphoreGive(xBinarySemaphore);
```

Behavior:

- Releases resource lock  
- Allows other tasks to access resource  

---

## Step 4 — Delay Before Next Access

```c
vTaskDelay(pdMS_TO_TICKS(500));
```

Allows scheduler to execute other tasks.

---

# Mutual Exclusion Execution Flow

Example execution sequence:

Task1 takes semaphore  
↓  
Task1 accesses shared resource  
↓  
Task1 releases semaphore  
↓  
Task2 takes semaphore  
↓  
Task2 accesses shared resource  
↓  
Task2 releases semaphore  

This ensures exclusive access at all times.

---

# System Behavior Without Semaphore

Without semaphore protection:

Task1 and Task2 may access resource simultaneously.

This can cause:

- Race conditions  
- Corrupted output  
- Undefined system behavior  

Semaphore eliminates this risk.

---

# Task State Behavior

When semaphore is unavailable:

Task state transitions:

Running → Blocked → Ready → Running

Benefits:

- Efficient CPU usage  
- Safe resource access  
- Controlled task synchronization  

---

# Resource Protection Model

Binary semaphore acts as:

# Mutual Exclusion Lock

This ensures:

- Only one task accesses resource  
- Safe hardware interaction  
- Deterministic execution  

This is essential for shared hardware peripherals.

---

# FreeRTOS APIs Used

## Semaphore APIs

- xSemaphoreCreateBinary()
- xSemaphoreTake()
- xSemaphoreGive()

## Task Management APIs

- xTaskCreate()
- vTaskDelay()
- vTaskStartScheduler()

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- Mutual exclusion in RTOS systems  
- Binary semaphore usage  
- Resource protection techniques  
- Task synchronization  
- Race condition prevention  
- Safe shared resource access  

These concepts are fundamental for real-time embedded firmware development.

---

# Design Insight

Binary semaphore provides:

- Efficient resource locking  
- Safe multi-tasking  
- Deterministic access control  

This mechanism ensures system stability.

---

# Real-World Embedded System Applications

Binary semaphores are widely used in:

- UART communication drivers  
- SPI and I2C peripheral access  
- Shared memory protection  
- Hardware resource synchronization  
- Multi-tasking embedded firmware  

This is a core RTOS synchronization primitive.

---

# Conclusion

This project demonstrates how FreeRTOS Binary Semaphore enables safe mutual exclusion and protects shared resources from concurrent access.

Using binary semaphore ensures:

- Safe resource sharing  
- Deterministic execution  
- Reliable multi-tasking behavior  

This is a fundamental technique for designing robust real-time embedded systems.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Synchronization Primitive | Binary Semaphore |
| Protected Resource | UART (printf) |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---