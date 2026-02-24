<h1 align="center">005LED_Task_Notify</h1>
<h3 align="center">Task Notification Mechanism and Event-Driven Task Control</h3>

---

# Project Overview

This project demonstrates the use of the **FreeRTOS Task Notification mechanism** to implement efficient **event-driven task control**.

A button press event is used to notify and terminate LED tasks sequentially. Each notification causes the currently active LED task to stop execution and transfer control to the next LED task.

This project highlights **Task Notification** as a lightweight and highly efficient alternative to traditional synchronization mechanisms such as semaphores and queues.

---

# Core Concept Demonstrated

This project focuses on:

# Direct Task-to-Task Notification using FreeRTOS

Task Notifications allow one task to signal another task directly without using external kernel objects such as:

- Queues  
- Semaphores  
- Mutexes  

Advantages of Task Notifications:

- Faster execution  
- Lower memory usage  
- Minimal kernel overhead  
- Direct kernel-level signaling  

Each FreeRTOS task contains its own internal notification value managed by the RTOS kernel.

---

# System Architecture

The system consists of four tasks:

| Task Name | Priority | Function |
|----------|----------|----------|
| Green LED Task | 3 | Toggles green LED and waits for notification |
| Orange LED Task | 2 | Toggles orange LED and waits for notification |
| Red LED Task | 1 | Toggles red LED and waits for notification |
| Button Task | 4 | Detects button press and sends notifications |

Higher priority Button Task controls LED task execution flow.

---

# System Execution Flow

Execution sequence:

1. Green LED task starts execution  
2. Button press notifies Green LED task  
3. Green LED task deletes itself and activates Orange LED task  
4. Button press notifies Orange LED task  
5. Orange LED task deletes itself and activates Red LED task  
6. Button press notifies Red LED task  
7. Red LED task deletes itself and terminates Button task  

This creates a deterministic sequential task execution chain.

---

# Event-Driven Task Execution Model

LED tasks operate in two modes:

- Periodic execution mode (LED toggling)
- Notification wait mode (event-driven state)

Example implementation:

```c
status = xTaskNotifyWait(0, 0, NULL, pdMS_TO_TICKS(1000));
```

This places the task into the Blocked state until:

- Notification is received, or
- Timeout expires

This ensures efficient CPU utilization.

---

# FreeRTOS APIs Used

---

## xTaskNotify()

Sends notification to a target task.

```c
xTaskNotify(next_task_handle, 0, eNoAction);
```

Function behavior:

- Signals the target task
- Wakes blocked task immediately
- Equivalent to binary semaphore signaling
- Faster and more efficient than semaphore

---

## xTaskNotifyWait()

Blocks task until notification is received.

```c
xTaskNotifyWait(0, 0, NULL, pdMS_TO_TICKS(1000));
```

Function behavior:

- Suspends task execution
- Waits for notification event
- Automatically wakes task upon notification

This enables event-driven system design.

---

## vTaskDelete()

Deletes a task from scheduler management.

```c
vTaskDelete(NULL);
```

Function behavior:

- Removes task from RTOS scheduler
- Releases task resources
- Ends task lifecycle

Used here to terminate LED tasks sequentially.

---

## vTaskSuspendAll() and xTaskResumeAll()

Used to protect shared global variable:

```c
TaskHandle_t volatile next_task_handle;
```

These APIs:

- Temporarily suspend scheduler operation
- Prevent task switching during critical updates
- Ensure atomic access to shared data

---

## vTaskDelay()

Used in button task to reduce CPU usage.

```c
vTaskDelay(pdMS_TO_TICKS(10));
```

Benefits:

- Prevents CPU overutilization
- Allows scheduler to run other tasks
- Improves system efficiency

---

# Task Synchronization Strategy

This project uses a global variable:

```c
TaskHandle_t volatile next_task_handle;
```

Purpose:

- Stores handle of next task to notify
- Controls sequential task activation

Each LED task:

- Updates this variable
- Deletes itself
- Transfers execution control to next task

This ensures deterministic task sequencing.

---

# Why Task Notification Instead of Semaphore?

Task Notification advantages:

- Faster execution
- No separate kernel object required
- Lower RAM usage
- Lower CPU overhead
- Built directly into FreeRTOS task structure

Task Notification is the most efficient signaling mechanism in FreeRTOS.

---

# Task State Transition Behavior

When notification is used, task state transitions occur:

Running → Blocked → Ready → Running → Deleted

This demonstrates complete task lifecycle management.

---

# Event-Driven System Design Insight

This project demonstrates event-driven firmware architecture.

Instead of continuously polling:

Tasks wait for specific events.

Benefits:

- Improved CPU efficiency
- Lower power consumption
- Faster system response
- Deterministic execution control

This is the preferred design pattern in professional embedded systems.

---

# Real-World Applications

Task Notification is widely used in:

- Interrupt-to-task signaling
- Peripheral driver event handling
- Sensor data acquisition systems
- Communication protocol stacks
- Real-time control systems

This mechanism is critical in high-performance embedded firmware.

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- Task Notification mechanism
- Event-driven task execution model
- Task synchronization without semaphores
- Task lifecycle management
- Task deletion and cleanup
- Efficient inter-task communication
- Scheduler-controlled task execution

---

# Conclusion

This project demonstrates efficient implementation of event-driven task control using FreeRTOS Task Notification.

Task Notification provides significant advantages over traditional synchronization mechanisms such as:

- Semaphores
- Queues

Advantages include:

- Faster signaling
- Lower memory usage
- Lower CPU overhead
- More efficient scheduler operation

Task Notification is widely used in professional embedded systems due to its efficiency and performance.

Understanding Task Notification is essential for designing high-performance real-time embedded systems.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Debug Tool | SEGGER SystemView |
| Input Device | User Button |
| Output Devices | LEDs |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---