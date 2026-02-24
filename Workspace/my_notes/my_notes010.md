<h1 align="center">Counting Semaphore with Interrupt and Tasks</h1>
<h3 align="center">Interrupt-to-Task Synchronization using FreeRTOS Counting Semaphore</h3>

---

# Project Overview

This project demonstrates how to use a **FreeRTOS Counting Semaphore** to synchronize an **Interrupt Service Routine (ISR)** with a task.

The system consists of three main components:

| Component | Role |
|----------|------|
| Periodic Task | Generates interrupt events |
| Interrupt Service Routine (ISR) | Signals event occurrence |
| Handler Task | Processes events |

This project demonstrates a fundamental real-time design pattern:

# Interrupt-to-task synchronization using Counting Semaphore

This mechanism ensures safe and efficient event handling in real-time embedded systems.

---

# Counting Semaphore — Event Counter Mechanism

Counting semaphore creation:

```c
xCountingSemaphore = xSemaphoreCreateCounting(10, 0);
```

Parameters:

| Parameter | Description |
|----------|-------------|
| Maximum Count | 10 (maximum number of stored events) |
| Initial Count | 0 (no events at startup) |

Purpose:

- Counts number of interrupt events  
- Allows task to process events sequentially  
- Prevents event loss  

Counting semaphore functions as an:

# Event counter

Each interrupt increments the counter.

Each task execution decrements the counter.

---

# Handler Task — Event Consumer

Handler Task waits for event signal:

```c
xSemaphoreTake(xCountingSemaphore, portMAX_DELAY);
```

Behavior:

- Task enters Blocked state when no events exist  
- Task wakes when semaphore count increases  
- Task processes event safely  

Example event handling:

```c
printf("Handler Task: Event processed\r\n");
```

Handler Task is responsible for:

# Event processing

This ensures ISR remains fast and efficient.

---

# Periodic Task — Interrupt Generator

Periodic Task simulates interrupt events.

Example:

```c
vTaskDelay(pdMS_TO_TICKS(2000));
```

Interrupt trigger:

```c
NVIC_SetPendingIRQ(EXTI15_10_IRQn);
```

Purpose:

- Simulates external hardware interrupt  
- Generates periodic events  
- Demonstrates interrupt-driven system behavior  

This task acts as an:

# Interrupt generator

---

# Interrupt Service Routine (ISR)

ISR signals event using ISR-safe semaphore function:

```c
xSemaphoreGiveFromISR(xCountingSemaphore, NULL);
```

Purpose:

- Increments semaphore count  
- Signals Handler Task  
- Notifies system that event occurred  

Important design rule:

# ISR should NOT perform heavy processing

ISR responsibilities:

- Signal event  
- Exit quickly  

Task handles actual processing.

---

# System Execution Flow

System event sequence:

Periodic Task triggers interrupt  
↓  
Interrupt Service Routine executes  
↓  
ISR gives semaphore  
↓  
Semaphore count increases  
↓  
Handler Task wakes from Blocked state  
↓  
Handler Task processes event  
↓  
Handler Task waits for next event  

This creates a safe and efficient event handling loop.

---

# Why Counting Semaphore is Used

Counting semaphore allows multiple events to be stored safely.

Example scenario:

Interrupt occurs 3 times:

Semaphore count becomes:

```
3
```

Handler Task will process event 3 times.

Binary semaphore cannot store multiple events.

Counting semaphore prevents:

- Event loss  
- Missed interrupt signals  

This ensures reliable system behavior.

---

# Task State Behavior

Handler Task state transitions:

Blocked → Ready → Running → Blocked

Benefits:

- Efficient CPU usage  
- Event-driven execution  
- No polling required  

This is a key RTOS execution model.

---

# Interrupt-to-Task Synchronization Model

Synchronization flow:

Interrupt → Semaphore → Task

This model provides:

- Safe interrupt handling  
- Deterministic event processing  
- Efficient CPU utilization  

This is a fundamental RTOS design pattern.

---

# FreeRTOS APIs Used

## Semaphore APIs

- xSemaphoreCreateCounting()
- xSemaphoreTake()
- xSemaphoreGiveFromISR()

## Task Management APIs

- xTaskCreate()
- vTaskDelay()
- vTaskStartScheduler()

## Interrupt APIs

- NVIC_SetPendingIRQ()

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- Counting semaphore usage  
- Interrupt-to-task synchronization  
- Event-driven task execution  
- ISR-safe RTOS API usage  
- Task blocking and unblocking mechanisms  
- Real-time event handling architecture  

These concepts are essential for professional embedded firmware development.

---

# Design Insight

Counting semaphore is ideal when:

- Multiple events may occur before processing  
- Events must not be lost  
- ISR signals task asynchronously  

Semaphore count represents number of pending events.

This ensures deterministic and reliable event handling.

---

# Real-World Embedded System Applications

Counting semaphores are widely used in:

- Sensor interrupt processing  
- Communication stacks (UART, SPI, CAN)  
- ADC conversion complete events  
- Industrial automation systems  
- Real-time monitoring systems  

This is a core synchronization mechanism in RTOS-based systems.

---

# Conclusion

This project demonstrates how FreeRTOS Counting Semaphore enables safe, efficient, and reliable interrupt-to-task synchronization.

Using counting semaphore allows:

- Accurate event counting  
- Safe interrupt handling  
- Efficient task-based event processing  

This architecture is essential for building robust real-time embedded systems.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Synchronization Primitive | Counting Semaphore |
| Interrupt Source | EXTI (Simulated via NVIC) |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---