/*
 * delay.asm
 *
 *  Created: 17/04/2021 11:47:56
 *   Author: caiof
 */ 

 delay_1s:
        rcall delay_100ms
        rcall delay_100ms
        rcall delay_100ms
        rcall delay_100ms
        rcall delay_100ms
        rcall delay_100ms
        rcall delay_100ms
        rcall delay_100ms
        rcall delay_100ms
        rcall delay_100ms
        ret

delay_100ms:
        rcall delay_10ms
        rcall delay_10ms
        rcall delay_10ms
        rcall delay_10ms
        rcall delay_10ms
        rcall delay_10ms
        rcall delay_10ms
        rcall delay_10ms
        rcall delay_10ms
        rcall delay_10ms
        ret

delay_10ms:
        rcall delay_1ms
        rcall delay_1ms
        rcall delay_1ms
        rcall delay_1ms
        rcall delay_1ms
        rcall delay_1ms
        rcall delay_1ms
        rcall delay_1ms
        rcall delay_1ms
        rcall delay_1ms
        ret

delay_1ms:
        push r16
        ldi r16,99
        delay_1ms1:
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