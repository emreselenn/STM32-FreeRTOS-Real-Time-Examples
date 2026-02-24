<h1 align="center">001Tasks</h1>
<h3 align="center">FreeRTOS Task Creation and Scheduler Behavior</h3>

---

# Project Overview

This project demonstrates the fundamental concepts of **task creation**, **scheduler initialization**, and **concurrent task execution** using **FreeRTOS** on the **STM32 NUCLEO-F401RE** development board.

The primary objective is to understand how FreeRTOS creates and manages multiple tasks, how the scheduler controls CPU execution between tasks, and how tasks execute independently in a real-time environment.

This project serves as the foundation for advanced RTOS features such as:

- Task synchronization  
- Inter-task communication  
- Deterministic timing control  
- Real-time system debugging  

---

# Hardware Platform

| Component | Description |
|----------|-------------|
| Development Board | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE — ARM Cortex-M4 |
| Debug Interface | ST-LINK (onboard) |
| Communication Interface | USART2 (UART) |
| Debug / Trace Tool | SEGGER SystemView |

## MCU Features Used

- ARM Cortex-M4 core with interrupt support  
- SysTick Timer (used by FreeRTOS scheduler)  
- NVIC (Nested Vector Interrupt Controller)  
- DWT (Data Watchpoint and Trace) Cycle Counter  

---

# Software Components

This project uses the following software stack:

- STM32CubeIDE  
- STM32 HAL (Hardware Abstraction Layer)  
- FreeRTOS Kernel  
- CMSIS  
- SEGGER SystemView  
- UART-based runtime debugging  

---

# Project Objective

The main objectives of this project are:

- Learn how to create FreeRTOS tasks  
- Understand the internal structure of a task function  
- Understand FreeRTOS scheduler behavior  
- Observe concurrent execution of multiple tasks  
- Learn how task parameters are passed  
- Understand scheduler-controlled CPU execution  
- Prepare real-time debugging infrastructure using SEGGER SystemView  

This project establishes the core foundation required for all multitasking RTOS applications.

---

# System Initialization Flow

The system follows this initialization sequence:

1. HAL Initialization  
2. System Clock Configuration  
3. GPIO Initialization  
4. UART Initialization (USART2)  
5. SEGGER UART Initialization  
6. DWT Cycle Counter Enable  
7. SEGGER SystemView Configuration  
8. FreeRTOS Task Creation  
9. FreeRTOS Scheduler Start  
10. Scheduler takes full control of CPU  

After the scheduler starts, the `main()` function no longer executes.

---

# Task Architecture

Two independent FreeRTOS tasks are created:

- Task-1  
- Task-2  

Both tasks:

- Run in infinite loops  
- Print debug messages via UART  
- Have equal priority (Priority = 2)  
- Are fully managed by the FreeRTOS scheduler  

## Example Task Implementation

```c
static void task1_handler(void* parameters)
{
    while(1)
    {
        printf("%s\n", (char*)parameters);
    }
}
```

Each task executes independently while the scheduler manages CPU allocation.

---

# FreeRTOS APIs Used

## xTaskCreate()

Creates a new FreeRTOS task.

```c
xTaskCreate(task1_handler,
            "Task-1",
            200,
            "Hello world from task 1",
            2,
            &task1_handle);
```

### Parameters

| Parameter | Description |
|---------|-------------|
| Task Function | Pointer to task function |
| Task Name | Human-readable task name |
| Stack Size | Task stack allocation |
| Parameter | Data passed to task |
| Priority | Task priority level |
| Task Handle | Reference to created task |

This function:

- Allocates task memory  
- Initializes stack and context  
- Registers task with scheduler  

---

## vTaskStartScheduler()

Starts the FreeRTOS scheduler.

```c
vTaskStartScheduler();
```

After scheduler startup:

- Scheduler takes full control of CPU  
- Tasks begin execution  
- main() function stops executing  
- System becomes a multitasking real-time system  

---

## configASSERT()

Runtime validation mechanism.

```c
configASSERT(status == pdPASS);
```

Used to:

- Verify successful task creation  
- Detect runtime configuration errors  

---

# Task Parameter Passing

Each task receives parameters using:

```c
pvParameters
```

Example parameter:

```c
"Hello world from task 1"
```

Usage inside task:

```c
printf("%s\n", (char*)parameters);
```

This enables flexible data passing to tasks.

---

# Scheduler Behavior Analysis

Both tasks have:

- Equal priority  
- Infinite execution loops  
- No blocking delay  

This results in continuous CPU utilization.

The scheduler applies:

# Time-Sliced Round Robin Scheduling

This demonstrates:

- Context switching  
- CPU resource sharing  
- Concurrent multitasking behavior  

---

# Context Switching

Context switching is the process where the scheduler switches CPU execution between tasks.

This involves saving and restoring:

- CPU registers  
- Stack pointer  
- Program counter  

This allows multiple tasks to safely share a single CPU core.

---

# UART Debug Output

USART2 is configured for runtime debug output.

Example:

```c
printf("Hello world from task");
```

This allows real-time observation of task execution.

UART is one of the most widely used debugging interfaces in embedded systems.

---

# SEGGER SystemView Integration

SEGGER SystemView initialization:

```c
SEGGER_UART_init(500000);
SEGGER_SYSVIEW_Conf();
```

DWT Cycle Counter enable:

```c
#define DWT_CTRL (*(volatile uint32_t*)0xE0001000)
DWT_CTRL |= (1<<0);
```

SystemView enables:

- Real-time task monitoring  
- Context switch visualization  
- Execution timing analysis  
- Scheduler activity tracking  

This provides deep insight into RTOS behavior.

---

# Key RTOS Concepts Learned

This project demonstrates core RTOS concepts:

- Task creation  
- Task execution model  
- Scheduler operation  
- Concurrent task execution  
- Context switching  
- Task parameter passing  
- RTOS system initialization flow  
- CPU resource sharing  
- Real-time debugging  

These concepts form the foundation of RTOS-based embedded firmware.

---

# Important Design Insight

In RTOS systems:

- Tasks do not run automatically  
- Scheduler decides which task executes  
- Tasks share CPU time  
- Proper task design is critical  

RTOS enables deterministic and controlled multitasking.

---

# Conclusion

This project successfully demonstrates the core functionality of FreeRTOS task creation and scheduler operation on STM32.

It establishes the essential foundation required for advanced RTOS features such as:

- Deterministic task timing  
- Task synchronization  
- Inter-task communication  
- Mutex and semaphore usage  
- Queue-based communication  
- Real-time system debugging  

This project represents the first and most fundamental step in mastering FreeRTOS on STM32.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Debug Tool | SEGGER SystemView |
| Communication | UART (USART2) |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---