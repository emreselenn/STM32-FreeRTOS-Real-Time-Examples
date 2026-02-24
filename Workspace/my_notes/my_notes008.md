<h1 align="center">008Queues_n_timers</h1>
<h3 align="center">Queue-Based Command Processing, Software Timers, and Event-Driven System Architecture</h3>

---

# Project Overview

This project implements a complete **event-driven embedded system architecture** using FreeRTOS queues, software timers, task notifications, and interrupt-driven UART communication.

The system provides an interactive **UART-based user interface**, allowing the user to:

- Select LED animation effects  
- Configure RTC time and date  
- Enable or disable periodic RTC reporting  

This project demonstrates a **real-world RTOS application architecture**, where tasks communicate using queues and notifications, and system functionality is driven entirely by events instead of polling.

This represents a complete embedded firmware design, not just a basic RTOS demonstration.

---

# System Architecture Overview

The system consists of five primary tasks:

| Task Name | Function |
|----------|----------|
| menu_task | Handles main menu navigation |
| cmd_handler_task | Processes user input commands |
| print_task | Dedicated UART output manager |
| led_task | Controls LED effects using software timers |
| rtc_task | Configures and manages RTC operations |

Additional system components:

- UART interrupt for input reception  
- FreeRTOS queues for inter-task communication  
- FreeRTOS software timers for periodic execution  
- Task notifications for fast task activation  

This follows a modular and layered RTOS architecture.

---

# Queue-Based Inter-Task Communication

Two queues are implemented to enable safe and structured inter-task communication.

---

## Queue 1 — UART Input Queue (q_data)

Queue creation:

```c
q_data = xQueueCreate(10, sizeof(char));
```

Purpose:

- Stores incoming UART characters  
- Acts as buffer between UART interrupt and command handler task  

Data flow:

UART ISR → q_data → cmd_handler_task

Benefits:

- Safe interrupt-to-task communication  
- Eliminates polling  
- Prevents data loss  

---

## Queue 2 — Print Queue (q_print)

Queue creation:

```c
q_print = xQueueCreate(10, sizeof(size_t));
```

Purpose:

- Transfers messages between system tasks and print_task  

Data flow:

Any Task → q_print → print_task → UART transmit

Benefits:

- Centralized UART access  
- Prevents race conditions  
- Improves system stability  

This is a professional embedded firmware design pattern.

---

# Interrupt-Driven UART Reception

UART reception is handled using interrupt mode:

```c
HAL_UART_Receive_IT(&huart2, &user_data, 1);
```

ISR callback:

```c
HAL_UART_RxCpltCallback()
```

ISR responsibilities:

- Sends received character to q_data using:

```c
xQueueSendFromISR()
```

- Notifies command handler task when command is complete

This creates a fully interrupt-driven input system.

No polling is used.

---

# Command Processing Architecture

Command processing flow:

UART Interrupt  
→ Input Queue (q_data)  
→ cmd_handler_task  
→ extract_command()  
→ process_command()  
→ Target Task Notification  

Command routing is controlled using a state machine:

```c
sMainMenu
sLedEffect
sRtcMenu
sRtcTimeConfig
sRtcDateConfig
sRtcReport
```

This ensures structured and scalable command handling.

---

# Task Notification for Fast Task Activation

Task notification is used for fast command dispatching:

```c
xTaskNotify(handle_led_task, (uint32_t)cmd, eSetValueWithOverwrite);
```

Advantages:

- Faster than queues  
- No additional kernel object required  
- Minimal memory overhead  
- Immediate task activation  

Ideal for event signaling.

---

# Software Timer Architecture

Software timers are used for periodic execution.

---

## LED Effect Timers

Timer creation:

```c
handle_led_timer[i] = xTimerCreate(..., led_effect_callback);
```

Each timer controls one LED animation effect.

Timer callback executes LED control logic.

Benefits:

- Non-blocking execution  
- Efficient scheduler integration  
- Precise periodic timing  

---

## RTC Reporting Timer

Timer creation:

```c
rtc_timer = xTimerCreate(..., rtc_report_callback);
```

Purpose:

- Periodic RTC time reporting  
- Background system monitoring  

Demonstrates periodic task execution using timers.

---

# Software Timer Callback Mechanism

Example callback:

```c
void led_effect_callback(TimerHandle_t xTimer)
```

Timer identification:

```c
pvTimerGetTimerID()
```

Benefits:

- Single callback handles multiple timers  
- Efficient and scalable design  

---

# Dedicated Print Task Design Pattern

Print task implementation:

```c
xQueueReceive(q_print, &msg, portMAX_DELAY);
HAL_UART_Transmit(...);
```

Advantages:

- Prevents simultaneous UART access  
- Eliminates race conditions  
- Improves system reliability  
- Provides centralized I/O management  

This is a widely used professional embedded pattern.

---

# State Machine Implementation

System behavior is controlled using:

```c
state_t curr_state;
```

State determines how commands are interpreted.

Benefits:

- Structured command processing  
- Predictable system behavior  
- Scalable firmware design  

State machines are fundamental in embedded systems.

---

# LED Effect Control Using Software Timers

LED animations are implemented using timers instead of delays.

Benefits:

- Non-blocking execution  
- Scheduler-friendly design  
- Efficient CPU utilization  
- Deterministic timing  

This is superior to delay-based control.

---

# RTC Integration with FreeRTOS

RTC functionality integrated into RTOS architecture.

Features:

- Time configuration  
- Date configuration  
- Periodic reporting  

RTC reporting is controlled using software timers.

Demonstrates peripheral integration with RTOS tasks.

---

# System Interaction Flow

Full system interaction sequence:

UART Interrupt  
→ Queue Communication  
→ Command Handler Task  
→ State Machine Processing  
→ Task Notification  
→ Software Timer Control  
→ Hardware Peripheral Control  

This represents a complete embedded system execution model.

---

# FreeRTOS APIs Used

## Queue APIs

- xQueueCreate()
- xQueueSend()
- xQueueReceive()
- xQueueSendFromISR()

## Task Notification APIs

- xTaskNotify()
- xTaskNotifyWait()
- xTaskNotifyFromISR()

## Software Timer APIs

- xTimerCreate()
- xTimerStart()
- xTimerStop()
- pvTimerGetTimerID()

## Task Management APIs

- xTaskCreate()
- vTaskStartScheduler()

---

# Design Patterns Demonstrated

This project implements industry-standard embedded design patterns:

- Interrupt-driven input handling  
- Queue-based inter-task communication  
- Dedicated I/O manager task  
- Software timer-based periodic execution  
- State machine-based system control  
- Event-driven firmware architecture  

These patterns are used in production embedded systems.

---

# Key Learning Outcomes

This project demonstrates practical understanding of:

- Queue-based communication  
- Software timers  
- Event-driven firmware design  
- Interrupt-to-task communication  
- State machine implementation  
- Peripheral integration with RTOS  
- Modular RTOS architecture  

This represents a complete RTOS application design.

---

# Conclusion

This project demonstrates how FreeRTOS can be used to implement a fully event-driven embedded firmware architecture using queues, task notifications, software timers, and interrupt-driven input handling.

This design provides:

- High efficiency  
- Modular structure  
- Deterministic execution  
- Scalable system architecture  

This approach is essential for professional embedded software development.

---

# Project Information

| Parameter | Value |
|----------|--------|
| Platform | STM32 NUCLEO-F401RE |
| Microcontroller | STM32F401RE |
| Architecture | ARM Cortex-M4 |
| RTOS | FreeRTOS |
| Communication Interface | UART |
| Peripherals Used | GPIO, UART, RTC |
| Design Architecture | Event-driven |
| Language | Embedded C |
| IDE | STM32CubeIDE |

---