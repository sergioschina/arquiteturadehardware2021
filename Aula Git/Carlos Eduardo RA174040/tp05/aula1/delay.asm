	delay_1s:
		rcall delay_500ms
		rcall delay_500ms
	delay_500ms:
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
		rcall delay_100ms
	delay_100ms:
		rcall delay_25ms
		rcall delay_25ms
		rcall delay_25ms
		rcall delay_25ms
	delay_25ms:
		rcall delay_5ms
		rcall delay_5ms
		rcall delay_5ms
		rcall delay_5ms
		rcall delay_5ms
	delay_5ms:
		rcall delay_1ms
		rcall delay_1ms
		rcall delay_1ms
		rcall delay_1ms
		rcall delay_1ms
		ret
  delay_1ms:
		push r16
		ldi r16,99
		delay_1ms1: ;/10us/loop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
			nop
		dec r16
		brne delay_1ms1
		pop r16
		ret
