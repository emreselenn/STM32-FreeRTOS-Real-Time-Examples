/*
 * led_effect.c
 *
 *  Created on: Feb 23, 2026
 *      Author: Emre Selen
 */

/*
 * led_effect.c
 *
 *  Modified for PC0 PC1 PC2 PC3 LEDs
 */

#include "main.h"

#define LED_PORT GPIOC

#define LED1 GPIO_PIN_0   // PC0
#define LED2 GPIO_PIN_1   // PC1
#define LED3 GPIO_PIN_2   // PC2
#define LED4 GPIO_PIN_3   // PC3


void led_effect_stop(void)
{
	for(int i = 0 ; i < 4 ; i++)
		xTimerStop(handle_led_timer[i],portMAX_DELAY);
}

void led_effect(int n )
{
	led_effect_stop();
	xTimerStart(handle_led_timer[n-1], portMAX_DELAY);
}

void turn_off_all_leds(void)
{
	HAL_GPIO_WritePin(LED_PORT, LED1, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED2, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED3, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED4, GPIO_PIN_RESET);
}

void turn_on_all_leds(void)
{
	HAL_GPIO_WritePin(LED_PORT, LED1, GPIO_PIN_SET);
	HAL_GPIO_WritePin(LED_PORT, LED2, GPIO_PIN_SET);
	HAL_GPIO_WritePin(LED_PORT, LED3, GPIO_PIN_SET);
	HAL_GPIO_WritePin(LED_PORT, LED4, GPIO_PIN_SET);
}

void turn_on_odd_leds(void)
{
	HAL_GPIO_WritePin(LED_PORT, LED1, GPIO_PIN_SET);
	HAL_GPIO_WritePin(LED_PORT, LED2, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED3, GPIO_PIN_SET);
	HAL_GPIO_WritePin(LED_PORT, LED4, GPIO_PIN_RESET);
}

void turn_on_even_leds(void)
{
	HAL_GPIO_WritePin(LED_PORT, LED1, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED2, GPIO_PIN_SET);
	HAL_GPIO_WritePin(LED_PORT, LED3, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED4, GPIO_PIN_SET);
}

void LED_control(int value)
{
	HAL_GPIO_WritePin(LED_PORT, LED1, (value & 0x01) ? GPIO_PIN_SET : GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED2, (value & 0x02) ? GPIO_PIN_SET : GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED3, (value & 0x04) ? GPIO_PIN_SET : GPIO_PIN_RESET);
	HAL_GPIO_WritePin(LED_PORT, LED4, (value & 0x08) ? GPIO_PIN_SET : GPIO_PIN_RESET);
}

void LED_effect1(void)
{
	static int flag = 1;
	(flag ^= 1) ? turn_off_all_leds() : turn_on_all_leds();
}

void LED_effect2(void)
{
	static int flag = 1;
	(flag ^= 1) ? turn_on_even_leds() : turn_on_odd_leds();
}

void LED_effect3(void)
{
	static int i = 0;
	LED_control(0x1 << (i++ % 4));
}

void LED_effect4(void)
{
	static int i = 0;
	LED_control(0x08 >> (i++ % 4));
}
