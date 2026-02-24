<h1 align="center">007TSwap_Task_Priority</h1>
<h3 align="center">Task Execution Control Using Binary Semaphores and Interrupt-Based Task Switching</h3>

---

# Project Overview

This project demonstrates how **binary semaphores** can be used to explicitly control which task is allowed to execute, and how a **hardware interrupt** can dynamically switch execution between tasks.

Two tasks are created with equal priority, but only one task is allowed to run at a time. A button interrupt switches execution between tasks using **ISR-safe semaphore signaling**.

This project demonstrates:

- Controlled task execution  
- ISR-to-task synchronization  
- Deterministic task switching  
- Scheduler behavior when tasks compete for CPU access  

---

# Core Concept Demonstrated

This project focuses on:

# Explicit task execution control using binary semaphores

Instead of relying solely on scheduler priority, task execution permission is controlled using synchronization primitives.

This allows:

- Deterministic task activation  
- Explicit execution control  
- Interrupt-driven task switching  
- Predictable real-time behavior  

---

# System Architecture

The system consists of the following components:

| Component | Function |
|----------|----------|
| Task1 | Controls LED on GPIO PC0 |
| Task2 | Controls LED on GPIO PC1 |
| Button Interrupt Handler | Switches execution between tasks |
| Binary Semaphore semTask1 | Execution permission for Task1 |
| Binary Semaphore semTask2 | Execution permission for Task2 |

---

# System Startup Behavior

At system initialization:

```c
xSemaphoreGive(semTask1);
```

This allows Task1 to execute first.

Task2 remains blocked until its semaphore is released.

---

# Task Execution Control Using Binary Semaphore

Each task waits for execution permission using:

```c
xSemaphoreTake(semTask1, portMAX_DELAY);
```

If semaphore is unavailable:

- Task enters Blocked state  
- Scheduler executes other ready tasks  

This ensures only one task executes at a time.

Binary semaphore acts as an execution permission token.

---

# Interrupt-Based Task Switching

Task execution is switched using a hardware interrupt.

Example ISR implementation:

```c
xSemaphoreGiveFromISR(semTask2, &xHigherPriorityTaskWoken);
```

This releases the semaphore of the next task.

Effect:

- Currently blocked task becomes Ready  
- Scheduler may immediately switch execution  

This enables interrupt-driven task control.

---

# xSemaphoreGiveFromISR()

ISR-safe version of semaphore release function.

```c
xSemaphoreGiveFromISR()
```

Purpose:

- Used inside interrupt context  
- Signals a blocked task safely  
- Maintains kernel integrity  

This is required for ISR-to-task synchronization.

---

# portYIELD_FROM_ISR()

Forces immediate scheduler evaluation.

```c
portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
```

Function behavior:

- Forces immediate context switch if required  
- Allows real-time task activation  
- Ensures deterministic interrupt response  

Without this call, context switching may be delayed.

---

# Scheduler Behavior Demonstrated

Both tasks have equal priority:

```c
Priority = 1
```

Normally, scheduler would use time slicing.

However, semaphore control ensures:

- Only one task is in Ready state
- Other task remains Blocked

This demonstrates:

# Task state controls execution, not just priority

Task state transitions determine scheduler behavior.

---

# Task State Machine

Task state transitions in this project:

Running → Blocked → Ready → Running

Binary semaphore controls state transitions.

This demonstrates the fundamental RTOS task lifecycle.

---

# Execution Control Using Binary Semaphore

Binary semaphore acts as:

# Execution permission token

Only the task holding the semaphore can execute.

Benefits:

- Deterministic execution control  
- Explicit task activation  
- Controlled task switching  

This is essential in event-driven systems.

---

# Shared Variable Control

Shared variable used:

```c
volatile uint8_t current_task;
```

Purpose:

- Tracks currently active task  
- Updated by interrupt handler  
- Used to determine next task activation  

Volatile ensures correct compiler behavior.

---

# Real-Time Design Insight

This project demonstrates that:

- Task execution can be externally controlled  
- Interrupts can dynamically alter system behavior  
- Scheduler reacts immediately to synchronization events  

This is a fundamental real-time system design principle.

---

# Real-World Embedded System Applications

This pattern is widely used in:

- Mode switching systems  
- State machine implementations  
- Interrupt-driven task activation  
- Event-driven embedded firmware  
- Real-time control systems  

Binary semaphores are essential synchronization primitives.

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- Binary semaphore usage  
- Task blocking and unblocking  
- ISR-safe synchronization  
- Controlled task execution  
- Scheduler behavior with blocked tasks  
- Interrupt-driven task switching  
- RTOS task state management  

---

# Conclusion

This project demonstrates how binary semaphores can be used to precisely control task execution and dynamically switch execution using hardware interrupts.

Using ISR-safe semaphore signaling ensures:

- Deterministic task switching  
- Reliable interrupt-driven synchronization  
- Controlled scheduler behavior  
- Efficient real-time execution  

This mechanism is essential for designing deterministic and event-driven embedded systems.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Synchronization Primitive | Binary Semaphore |
| Interrupt Source | User Button |
| Debug Method | SEGGER SystemView |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---