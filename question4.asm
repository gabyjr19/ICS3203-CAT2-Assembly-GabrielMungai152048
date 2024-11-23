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


;The program simulates monitoring a water level sensor and performing appropriate actions based on the sensor value.

;Three cases are handled:
;Low water level: The motor is turned ON, and the alarm remains OFF.
;Moderate water level: Both the motor and alarm are turned OFF.
;High water level: The motor is ON, and the alarm is triggered.

;Memory-Mapped I/O:
;sensor_value: Simulates the input port/memory where the sensor value is stored.
;motor_status: Simulates a memory location controlling the motor's state (0 = off, 1 = on).
;alarm_status: Simulates a memory location controlling the alarm's state (0 = off, 1 = on).

;Control Flow:
;The sensor value is loaded into the AL register for evaluation.
;The program uses CMP and conditional jumps (JE, JL) to decide the appropriate action based on the sensor value.

;Impact on Memory/Ports:
;The motor's state is updated by writing to the motor_status variable.
;The alarm's state is updated by writing to the alarm_status variable.
;These writes simulate the effect of controlling hardware through memory-mapped I/O.
