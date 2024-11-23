section .data
    array db 1, 2, 3, 4, 5      ; Example array (size = 5)
    length equ 5                ; Length of the array

section .text
    global _start

_start:
    ; Initialize pointers
    mov esi, array              ; Start pointer
    mov edi, array + length - 1 ; End pointer

reverse_loop:
    ; Compare pointers
    cmp esi, edi
    jge reverse_done            ; Exit loop if pointers meet or cross

    ; Swap values
    mov al, [esi]               ; Load value from start
    mov bl, [edi]               ; Load value from end
    mov [esi], bl               ; Write value to start
    mov [edi], al               ; Write value to end

    ; Move pointers
    inc esi                     ; Move start pointer forward
    dec edi                     ; Move end pointer backward
    jmp reverse_loop

reverse_done:
    ; Exit program
    mov eax, 1                  ; sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80
