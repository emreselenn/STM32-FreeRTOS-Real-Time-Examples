<h1 align="center">006ButtonISR</h1>
<h3 align="center">Interrupt-to-Task Notification and Priority-Based Preemptive Scheduling</h3>

---

# Project Overview

This project demonstrates how **hardware interrupts interact with FreeRTOS tasks** and how the scheduler performs **priority-based preemptive context switching**.

A hardware interrupt (button press) is used to notify tasks directly using **ISR-safe FreeRTOS APIs**. Based on task priority and notification events, the scheduler immediately switches execution to the appropriate task.

This project highlights the core real-time behavior of FreeRTOS:

# Preemptive scheduling driven by interrupt events and task priority

---

# Core Concepts Demonstrated

This project focuses on three fundamental real-time mechanisms:

1. Interrupt-to-task signaling using ISR-safe FreeRTOS APIs  
2. Priority-based preemptive scheduling  
3. Immediate context switching triggered by interrupts  

These mechanisms form the foundation of real-time embedded system execution.

---

# Interrupt-to-Task Communication

This project uses a hardware interrupt to notify a task directly.

## Interrupt Service Routine Implementation

```c
void button_interrupt_handler(void)
{
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;

    traceISR_ENTER();

    xTaskNotifyFromISR(next_task_handle,
                       0,
                       eNoAction,
                       &xHigherPriorityTaskWoken);

    portYIELD_FROM_ISR(xHigherPriorityTaskWoken);

    traceISR_EXIT();
}
```

This demonstrates the correct and safe interaction between interrupt context and RTOS task scheduling.

---

# xTaskNotifyFromISR()

This API is specifically designed for use inside interrupt context.

```c
xTaskNotifyFromISR()
```

Purpose:

- Sends notification from ISR to a task  
- ISR-safe and scheduler-aware  
- Does not corrupt kernel state  
- Enables interrupt-driven task execution  

This is the preferred mechanism for ISR-to-task signaling in FreeRTOS.

---

# portYIELD_FROM_ISR()

This is one of the most critical real-time scheduling mechanisms.

```c
portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
```

Function behavior:

- Forces immediate context switch if required  
- Scheduler immediately executes highest priority ready task  
- Ensures deterministic real-time response  

Without this call:

- Context switch occurs later

With this call:

- Context switch occurs immediately

This ensures true real-time responsiveness.

---

# Priority-Based Task Architecture

Tasks are created with different priority levels:

| Task Name | Priority | Function |
|----------|----------|----------|
| Green LED Task | 3 | Highest priority LED task |
| Orange LED Task | 2 | Medium priority LED task |
| Red LED Task | 1 | Lowest priority LED task |

FreeRTOS scheduler always executes:

# Highest priority READY task

If a higher priority task becomes ready:

- Current task is preempted
- Higher priority task executes immediately

This is called:

# Preemptive Scheduling

This behavior is essential in real-time systems.

---

# Interrupt-Triggered Context Switching

Execution sequence:

1. System is executing a task  
2. Hardware interrupt occurs (button press)  
3. Interrupt Service Routine executes  
4. ISR sends notification to a task  
5. Scheduler immediately switches execution to notified task  

This immediate switch is triggered by:

```c
portYIELD_FROM_ISR()
```

This demonstrates deterministic interrupt-driven scheduling.

---

# Critical Section Protection

Shared variable:

```c
TaskHandle_t next_task_handle;
```

Protected using:

```c
portENTER_CRITICAL();
portEXIT_CRITICAL();
```

Purpose:

- Prevent race conditions  
- Protect shared resources  
- Ensure atomic access  
- Maintain data integrity  

Critical sections temporarily disable interrupts to protect shared data.

---

# Difference Between xTaskNotify() and xTaskNotifyFromISR()

| API | Usage Context | ISR Safe |
|-----|----------------|----------|
| xTaskNotify() | Task context | No |
| xTaskNotifyFromISR() | Interrupt context | Yes |

Using incorrect API inside ISR can corrupt scheduler behavior.

Always use ISR-safe APIs inside interrupts.

---

# Real-Time Behavior Demonstrated

This project demonstrates one of the most important RTOS capabilities:

# Immediate response to hardware events

Interrupt event triggers:

- Task notification  
- Immediate context switch  
- Priority-based task execution  

This ensures deterministic real-time system response.

---

# SEGGER SystemView Integration

SystemView trace macros used:

```c
traceISR_ENTER();
traceISR_EXIT();
```

These allow visualization of:

- Interrupt execution timing  
- Context switching  
- Scheduler behavior  
- Task execution flow  

This is critical for real-time system debugging and performance analysis.

---

# Real-World Embedded System Applications

This design pattern is widely used in:

- Button interrupt handling  
- UART interrupt-driven communication  
- SPI interrupt processing  
- ADC conversion complete events  
- Sensor interrupt handling  
- Motor control systems  
- Industrial automation systems  

Interrupt-to-task signaling is fundamental in professional embedded firmware.

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- ISR-safe FreeRTOS APIs  
- Interrupt-to-task communication  
- Priority-based preemptive scheduling  
- Immediate context switching  
- Critical section protection  
- Real-time system responsiveness  
- Deterministic interrupt-driven execution  

---

# Conclusion

This project demonstrates how FreeRTOS integrates hardware interrupts with task scheduling.

Using ISR-safe notification APIs and priority-based scheduling, FreeRTOS ensures:

- Immediate task activation  
- Deterministic real-time behavior  
- Efficient CPU utilization  
- Reliable interrupt handling  

This mechanism is essential for building responsive and high-performance real-time embedded systems.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Interrupt Source | User Button (EXTI) |
| Debug Tool | SEGGER SystemView |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---