section .data
    prompt db "Enter a number: ", 0
    positive_msg db "The number is POSITIVE.", 0
    negative_msg db "The number is NEGATIVE.", 0
    zero_msg db "The number is ZERO.", 0
    num db 0                ; Storage for the input number

section .bss
    input resb 4            ; Reserve 4 bytes for user input

section .text
    global _start

_start:
    ; Prompt user for input
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, prompt
    mov edx, 16             ; Length of the prompt
    int 0x80

    ; Read user input
    mov eax, 3              ; sys_read
    mov ebx, 0              ; stdin
    mov ecx, input          ; Buffer for input
    mov edx, 4              ; Max 4 bytes
    int 0x80

    ; Convert input to integer (basic implementation, assumes valid input)
    mov eax, [input]
    sub eax, '0'            ; Convert ASCII to integer
    mov [num], eax

    ; Check if number is ZERO
    cmp eax, 0
    je zero

    ; Check if number is NEGATIVE
    jl negative

    ; Otherwise, it's POSITIVE
positive:
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, positive_msg
    mov edx, 23             ; Length of the message
    int 0x80
    jmp end_program         ; Unconditional jump to end

negative:
    mov eax, 4              ; sys_write
    mov ebx, 1              ; stdout
    mov ecx, negative_msg
    mov edx, 23
    int 0x80
    jmp end_program

zero:
    mov eax, 4              ; sys_write
    mov ebx, 1
    mov ecx, zero_msg
    mov edx, 18
    int 0x80

end_program:
    mov eax, 1              ; sys_exit
    xor ebx, ebx            ; Exit code 0
    int 0x80
