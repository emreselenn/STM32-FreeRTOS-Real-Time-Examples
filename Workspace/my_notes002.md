<h1 align="center">002LED_Tasks</h1>
<h3 align="center">Task Delay Mechanisms and Deterministic Timing in FreeRTOS</h3>

---

# Project Overview

This project demonstrates different delay mechanisms used inside **FreeRTOS tasks** and explains their impact on **scheduler behavior**, **CPU utilization**, and **timing accuracy**.

Three independent tasks are created to toggle three LEDs at different frequencies:

| LED | Period | Purpose |
|-----|--------|---------|
| Green LED | 800 ms | Slow periodic task |
| Orange LED | 400 ms | Medium periodic task |
| Red LED | 200 ms | Fast periodic task |

The main objective of this project is to compare the following delay mechanisms:

- HAL_Delay() → Blocking delay (not RTOS-aware)  
- vTaskDelay() → RTOS-aware relative delay  
- vTaskDelayUntil() → RTOS-aware absolute delay (deterministic periodic execution)  

This project demonstrates the correct implementation of periodic tasks in real-time systems.

---

# Core Concept Demonstrated

This project focuses on one of the most critical RTOS design principles:

# Correct implementation of periodic tasks

In real-time embedded systems, tasks often execute at fixed intervals, such as:

- Sensor sampling every 10 ms  
- Control loop execution every 1 ms  
- Communication tasks every 100 ms  

Improper delay usage can cause:

- Timing drift  
- CPU blocking  
- Scheduler inefficiency  
- Non-deterministic system behavior  

This project demonstrates both correct and incorrect approaches.

---

# Task Architecture

Three independent tasks are created using:

```c
xTaskCreate()
```

Tasks created:

- led_green_handler()
- led_orange_handler()
- led_red_handler()

Each task:

- Toggles its assigned LED
- Sends debug output using SEGGER SystemView
- Executes periodically using a delay mechanism

## Example Task Implementation

```c
static void led_green_handler(void* parameters)
{
    TickType_t last_wakeup_time;
    last_wakeup_time = xTaskGetTickCount();

    while(1)
    {
        HAL_GPIO_TogglePin(GPIOC, LED_GREEN_PIN);
        vTaskDelayUntil(&last_wakeup_time, pdMS_TO_TICKS(800));
    }
}
```

This implementation ensures deterministic periodic execution.

---

# Delay Mechanisms Comparison

This project evaluates three delay methods.

---

# Method 1 — HAL_Delay() (Incorrect for RTOS)

```c
HAL_Delay(800);
```

Characteristics:

- Blocks CPU execution
- Prevents scheduler efficiency
- Not RTOS-aware
- Breaks multitasking behavior
- Causes poor system responsiveness

This method should NOT be used inside FreeRTOS tasks.

Included for educational comparison purposes only.

---

# Method 2 — vTaskDelay() (Relative Delay)

```c
vTaskDelay(pdMS_TO_TICKS(800));
```

Characteristics:

- Non-blocking delay
- Scheduler can execute other tasks
- Task enters Blocked state
- Efficient CPU utilization

Limitation:

This method creates relative delay.

Execution time affects the next wake-up time.

Example:

Expected period = 800 ms  
Task execution time = 10 ms  
Actual period = 810 ms  

This results in cumulative timing drift.

---

# Method 3 — vTaskDelayUntil() (Correct Professional Method)

```c
vTaskDelayUntil(&last_wakeup_time, pdMS_TO_TICKS(800));
```

This is the correct method for periodic task implementation.

Characteristics:

- Absolute delay reference
- No timing drift
- Deterministic periodic execution
- Stable real-time behavior
- Industry-standard implementation

Execution timeline example:

- 800 ms
- 1600 ms
- 2400 ms
- 3200 ms

Execution duration does not affect periodic timing.

This is essential for real-time control systems.

---

# FreeRTOS APIs Used

## xTaskCreate()

Creates tasks and registers them with the scheduler.

Enables multitasking execution.

---

## vTaskDelay()

Suspends task for a relative time duration.

Task state transition:

Running → Blocked → Ready → Running

---

## vTaskDelayUntil()

Suspends task until an absolute time reference.

Ensures deterministic periodic execution.

Preferred method for periodic tasks.

---

## xTaskGetTickCount()

Returns current RTOS tick count.

Used to initialize periodic delay reference.

Required for vTaskDelayUntil().

---

# Task State Transition Behavior

When delay APIs are used, tasks transition between states:

Running → Blocked → Ready → Running

Benefits:

- Efficient CPU sharing
- Reduced CPU waste
- Controlled task execution

Without delay, tasks would consume 100% CPU time.

---

# SEGGER SystemView Integration

SEGGER SystemView is used for real-time analysis of RTOS behavior.

Monitored events include:

- Task execution timing
- Scheduler activity
- Context switching
- Task state transitions

Example debug output:

```c
SEGGER_SYSVIEW_PrintfTarget("Toggling Green LED");
```

This enables real-time system behavior visualization.

---

# Critical Design Insight

This project demonstrates a fundamental RTOS design rule:

# Never use HAL_Delay() inside FreeRTOS tasks

Always use:

- vTaskDelay()
- or preferably
- vTaskDelayUntil()

For periodic tasks, always use:

# vTaskDelayUntil()

Benefits:

- Deterministic execution timing
- Stable scheduler operation
- Predictable system performance
- Professional real-time system design

---

# Real-World Applications

This design pattern is widely used in:

- Motor control systems
- Sensor sampling systems
- Communication protocols
- Industrial automation
- Robotics systems
- Medical embedded systems

Accurate timing is essential in real-time systems.

---

# Conclusion

This project demonstrates correct and incorrect delay implementations in FreeRTOS tasks.

Key learning outcomes:

- Understanding blocking vs non-blocking delays
- Understanding scheduler interaction with delayed tasks
- Understanding deterministic task execution
- Understanding RTOS timing control mechanisms
- Understanding professional RTOS task design

This project establishes critical knowledge required for reliable real-time embedded firmware development.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Debug Tool | SEGGER SystemView |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---