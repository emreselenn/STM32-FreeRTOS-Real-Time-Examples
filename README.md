<h1 align="center">FreeRTOS and STM32 Hands-On Project Collection</h1>
<h3 align="center">Real-Time Embedded Systems Development using STM32, FreeRTOS, and SEGGER SystemView</h3>

---

# Overview

This repository contains a comprehensive collection of hands-on embedded systems projects developed while completing the Udemy course:

**Mastering RTOS: Hands-on FreeRTOS and STM32Fx with Debugging**  
Instructor: **Kiran Nayak**

The purpose of this repository is to document and demonstrate practical understanding of:

- FreeRTOS kernel architecture
- Task management and scheduling
- Interrupt-to-task synchronization
- Inter-task communication mechanisms
- Mutexes, Semaphores, Queues, and Task Notifications
- Software timers and event-driven system design
- Real-time debugging using SEGGER SystemView
- Deterministic real-time firmware design on ARM Cortex-M

All projects were implemented on:

**Platform:** STM32 NUCLEO-F401RE  
**Architecture:** ARM Cortex-M4  
**RTOS:** FreeRTOS (v10.4 and v11)  
**IDE:** STM32CubeIDE  
**Debug Tool:** SEGGER SystemView  

This repository represents a complete hands-on learning progression from basic task creation to full event-driven embedded system architecture.

---

# Repository Structure

This workspace is organized into multiple standalone FreeRTOS example projects, each demonstrating a specific RTOS concept.

```
FreeRTOS-Workspace/
│
├── 001Tasks/
├── 002LED_Tasks/
├── 005LED_Task_Notify/
├── 006ButtonISR/
├── 007TSwap_Task_Priority/
├── 008Queues_n_timers/
├── 009BinarySemaphore/
├── 010CountingSemaphore/
├── 011BinarySemaphore_Mutex/
├── 012Mutex_API/
│
├── common/
│   └── Third_Party/
│       ├── FreeRTOS/
│       └── SEGGER/
│
├── mynotes/
│
├── records/
│
└── include_path_settings.xml
```

Each project folder contains:

- Complete STM32CubeIDE project
- Source code
- Configuration files
- Dedicated README explaining implementation and concepts

---

# Project List and Learning Scope

Each project builds upon previous knowledge and introduces new RTOS concepts.

| Project | Concept Demonstrated |
|--------|----------------------|
| 001Tasks | Task creation and scheduler behavior |
| 002LED_Tasks | Task delay mechanisms and deterministic timing |
| 005LED_Task_Notify | Task Notification and event-driven execution |
| 006ButtonISR | Interrupt-to-task synchronization |
| 007TSwap_Task_Priority | Binary semaphore-based task switching |
| 008Queues_n_timers | Queue-based architecture and software timers |
| 009BinarySemaphore | Binary semaphore synchronization |
| 010CountingSemaphore | Counting semaphore event handling |
| 011BinarySemaphore_Mutex | Mutual exclusion using binary semaphore |
| 012Mutex_API | Mutex and priority inheritance |

These projects demonstrate progressively advanced RTOS concepts.

---

# Personal Technical Notes (mynotes/)

Directory:

```
mynotes/
```

Contains personal technical documentation created during the learning process.

Includes:

- Detailed explanation of each project
- FreeRTOS API descriptions
- Synchronization mechanisms
- Scheduler behavior analysis
- Debugging techniques

This serves as a personal embedded systems knowledge base.

---

# FreeRTOS Version Migration (v10.4 → v11)

Initially, all projects were developed using:

**FreeRTOS Version 10.4**

During later stages, when using **SEGGER SystemView Continuous Recording**, compatibility issues were encountered.

To resolve this, the kernel was upgraded to:

**FreeRTOS Version 11**

The migration ensured:

- Proper SystemView integration
- Stable continuous event recording
- Improved debugging reliability

The **001Tasks project exists in both FreeRTOS v10.4 and FreeRTOS v11 versions** to validate compatibility and confirm correct system behavior after migration.

This demonstrates practical experience with RTOS kernel migration and debugging integration.

---

# LED Task Delay Mechanism Design (Projects 002–004)

Projects demonstrating delay mechanisms were implemented within a single project structure using conditional compilation and commenting.

These include comparison of:

- HAL_Delay() → Blocking delay (not RTOS safe)
- vTaskDelay() → Relative delay
- vTaskDelayUntil() → Deterministic periodic delay

Instead of creating separate projects, the delay method was changed using commented code sections to ensure consistency in:

- Task logic
- Scheduler behavior
- Hardware configuration

This allowed controlled comparison of delay mechanisms without introducing unrelated variables.


---

# Common Third-Party Source Integration

To improve maintainability and avoid duplication, a centralized shared library structure was created:

```
common/
└── Third_Party/
    ├── FreeRTOS/
    └── SEGGER/
```

This contains:

- FreeRTOS kernel source code
- SEGGER SystemView source files

Instead of copying these files into each project, all projects reference this shared directory.

Benefits:

- Reduced redundancy
- Easier kernel updates
- Cleaner project structure
- Consistent configuration across projects

---

# Include Path Configuration Management

File:

```
include_path_settings.xml
```

This file stores preconfigured include paths for:

- FreeRTOS kernel
- SEGGER SystemView

This allows fast configuration of new projects without manually reconfiguring include paths each time.

Improves workflow efficiency and consistency.

---

# SEGGER SystemView Recording Data

The repository includes a dedicated folder:

```
records/
```

Contains:

- Continuous recording session outputs
- Single-shot recording session outputs
- Raw binary trace files

These recordings demonstrate:

- Task scheduling behavior
- Interrupt execution timing
- Context switching
- Real-time kernel activity

These traces were used to analyze and verify real-time behavior.

---

# Core RTOS Concepts Covered

This repository demonstrates practical implementation of:

- Task creation and scheduling
- Preemptive multitasking
- Context switching
- Binary semaphores
- Counting semaphores
- Mutex and priority inheritance
- Task notifications
- Interrupt-to-task signaling
- Queue-based inter-task communication
- Software timers
- Event-driven architecture
- ISR-safe kernel interaction
- Real-time debugging using SystemView

---

# Debugging and Analysis Tools

This project extensively uses:

**SEGGER SystemView**

Used for:

- Task execution monitoring
- Interrupt analysis
- Scheduler behavior visualization
- Context switching analysis
- Timing verification

---

# Development Environment

| Component | Tool |
|---------|------|
| IDE | STM32CubeIDE |
| RTOS | FreeRTOS |
| Debugger | SEGGER SystemView |
| Hardware | STM32 NUCLEO-F401RE |
| Architecture | ARM Cortex-M4 |

---

# Learning Outcome

This repository demonstrates hands-on understanding of:

- Real-time operating system fundamentals
- Embedded multitasking firmware design
- Interrupt-driven system architecture
- Deterministic task scheduling
- RTOS synchronization mechanisms
- Professional embedded firmware development practices

---

# Purpose of This Repository

This repository serves as:

- Embedded systems learning portfolio
- FreeRTOS reference implementation collection
- Real-time firmware architecture demonstration
- Professional embedded development reference

---

# Author

Yunus Emre SELEN
Focus Areas:

- Embedded Software Development
- Real-Time Systems
- ARM Cortex-M Architecture
- FreeRTOS Kernel Development

---
