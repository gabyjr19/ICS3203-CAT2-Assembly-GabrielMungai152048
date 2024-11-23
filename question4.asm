section .data
    sensor_value db 0       ; Simulated water level sensor value
    motor_status db 0       ; Motor status: 0 = off, 1 = on
    alarm_status db 0       ; Alarm status: 0 = off, 1 = on

section .text
    global _start

_start:
    ; Read sensor value (simulate reading from memory)
    mov al, [sensor_value]  ; Load sensor value into AL register

    ; Determine action based on sensor value
    cmp al, 5               ; Compare water level with threshold for "moderate"
    je moderate_level        ; If equal, go to moderate level handler
    jl low_level             ; If less, go to low level handler

    ; High water level
high_level:
    mov byte [motor_status], 1 ; Turn motor ON
    mov byte [alarm_status], 1 ; Trigger alarm
    jmp end_program           ; End program

    ; Moderate water level
moderate_level:
    mov byte [motor_status], 0 ; Stop motor
    mov byte [alarm_status], 0 ; Ensure alarm is OFF
    jmp end_program            ; End program

    ; Low water level
low_level:
    mov byte [motor_status], 1 ; Turn motor ON
    mov byte [alarm_status], 0 ; Ensure alarm is OFF
    jmp end_program            ; End program

end_program:
    ; Exit the program (simulate program termination)
    mov eax, 1               ; sys_exit syscall
    xor ebx, ebx             ; Exit code 0
    int 0x80
