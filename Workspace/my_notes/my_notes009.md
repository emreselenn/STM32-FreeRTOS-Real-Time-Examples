<h1 align="center">Work Distribution using Queue and Binary Semaphore</h1>
<h3 align="center">Producer–Consumer Architecture using FreeRTOS Queue and Binary Semaphore</h3>

---

# Project Overview

This project demonstrates how to use a **FreeRTOS Queue and Binary Semaphore together** to implement a simple and efficient **work distribution system**.

The system simulates a real-world embedded firmware scenario where:

- One task generates work  
- Another task performs the work  
- A queue transfers the work data  
- A binary semaphore signals work availability  

This implementation follows the well-known:

# Producer–Consumer Design Pattern

System roles:

| Component | Role |
|----------|------|
| Manager Task | Producer (generates work) |
| Employee Task | Consumer (performs work) |
| Queue | Data transfer mechanism |
| Binary Semaphore | Event signaling mechanism |

This architecture is widely used in real-time embedded systems.

---

# Queue — Inter-Task Data Communication

Queue creation:

```c
xWorkQueue = xQueueCreate(1, sizeof(uint32_t));
```

Purpose:

- Transfers Ticket ID from Manager Task → Employee Task  
- Stores actual work data  
- Provides thread-safe communication between tasks  

---

## Manager Task Sending Data

```c
xQueueSend(xWorkQueue, &xWorkTicketId, portMAX_DELAY);
```

Function behavior:

- Places work item into queue  
- Blocks if queue is full  
- Ensures safe data transfer  

---

## Employee Task Receiving Data

```c
xQueueReceive(xWorkQueue, &xWorkTicketId, 0);
```

Function behavior:

- Retrieves work item from queue  
- Ensures safe and synchronized data access  

---

Queue is used for:

# Data transfer between tasks

---

# Binary Semaphore — Task Synchronization

Semaphore creation:

```c
xWork = xSemaphoreCreateBinary();
```

Purpose:

- Signals Employee Task that work is available  
- Synchronizes task execution  
- Prevents unnecessary CPU usage  

Binary semaphore acts as an:

# Event notification mechanism

---

## Manager Task Giving Semaphore

```c
xSemaphoreGive(xWork);
```

Function behavior:

- Signals Employee Task  
- Unblocks waiting task  

---

## Employee Task Taking Semaphore

```c
xSemaphoreTake(xWork, portMAX_DELAY);
```

Function behavior:

- Blocks task until work becomes available  
- Ensures efficient CPU utilization  

---

Semaphore is used for:

# Event signaling, not data storage

---

# Manager Task (Producer)

Responsibilities:

## Generate Work Item

```c
xWorkTicketId = rand() & 0x1FF;
```

Generates random Ticket ID representing work unit.

---

## Send Work to Queue

```c
xQueueSend(xWorkQueue, &xWorkTicketId, portMAX_DELAY);
```

Transfers work data safely.

---

## Notify Employee Task

```c
xSemaphoreGive(xWork);
```

Signals Employee Task that work is available.

---

Manager Task continuously produces work items.

---

# Employee Task (Consumer)

Responsibilities:

## Wait for Work Signal

```c
xSemaphoreTake(xWork, portMAX_DELAY);
```

Task remains in Blocked state until notified.

---

## Receive Work Item

```c
xQueueReceive(xWorkQueue, &xWorkTicketId, 0);
```

Retrieves assigned work.

---

## Perform Work

```c
vTaskDelay(pdMS_TO_TICKS(TicketId));
```

Simulates work execution time.

---

Employee Task remains blocked when no work is available.

This ensures efficient CPU usage.

---

# System Execution Flow

System operation sequence:

Manager Task generates Ticket ID  
↓  
Manager Task sends Ticket ID to Queue  
↓  
Manager Task signals Semaphore  
↓  
Employee Task wakes from Blocked state  
↓  
Employee Task reads Ticket ID from Queue  
↓  
Employee Task performs work  
↓  
Employee Task waits for next work signal  

This creates a controlled and synchronized workflow.

---

# Task State Behavior

Task state transitions:

Employee Task:

Blocked → Ready → Running → Blocked

Benefits:

- Efficient CPU usage  
- Event-driven execution  
- No unnecessary polling  

---

# Design Pattern Demonstrated

This project implements the:

# Producer–Consumer Architecture

Key characteristics:

- Producer generates work  
- Consumer processes work  
- Queue transfers data  
- Semaphore signals events  

This pattern is fundamental in real-time embedded systems.

---

# FreeRTOS APIs Used

## Queue APIs

- xQueueCreate()
- xQueueSend()
- xQueueReceive()

## Semaphore APIs

- xSemaphoreCreateBinary()
- xSemaphoreGive()
- xSemaphoreTake()

## Task Management APIs

- xTaskCreate()
- vTaskDelay()
- vTaskStartScheduler()
- taskYIELD()

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- Inter-task communication using queues  
- Task synchronization using binary semaphores  
- Producer–consumer design pattern  
- Task blocking and unblocking mechanisms  
- Event-driven task execution  
- Efficient CPU utilization  

These concepts are fundamental in RTOS-based firmware design.

---

# Design Insight

Queue and Semaphore serve different purposes:

| Mechanism | Purpose |
|----------|---------|
| Queue | Transfers data |
| Binary Semaphore | Signals event |

Using both together enables:

- Safe communication  
- Efficient synchronization  
- Deterministic task execution  

---

# Real-World Applications

This design pattern is widely used in:

- Sensor data processing systems  
- Communication protocol stacks  
- Driver task architectures  
- Event-driven embedded systems  
- Industrial control firmware  

This is a core embedded firmware architecture pattern.

---

# Conclusion

This project demonstrates how FreeRTOS enables safe, synchronized, and efficient communication between tasks using queues and binary semaphores.

The combination of:

- Queue for data transfer  
- Semaphore for event signaling  

creates a robust and scalable inter-task communication mechanism.

This architecture is essential for designing reliable real-time embedded systems.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Design Pattern | Producer–Consumer |
| Synchronization | Binary Semaphore |
| Communication | Queue |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---