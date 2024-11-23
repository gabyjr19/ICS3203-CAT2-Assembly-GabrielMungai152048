section .data
    num db 5                    ; Number to calculate factorial for
    result dd 1                 ; Result initialized to 1

section .text
    global _start

_start:
    ; Load the number to calculate factorial
    mov al, [num]
    call factorial              ; Call factorial subroutine

    ; Store the result
    mov [result], eax

    ; Exit program
    mov eax, 1                  ; sys_exit
    xor ebx, ebx                ; Exit code 0
    int 0x80

factorial:
    ; Base case: if n <= 1, return 1
    cmp al, 1
    jle factorial_done

    ; Recursive case: n * factorial(n-1)
    push eax                    ; Save current value of eax
    dec al                      ; n = n - 1
    call factorial              ; Recursive call
    pop ebx                     ; Restore original n into ebx
    mul bl                      ; eax = n * factorial(n-1)

factorial_done:
    ret                         ; Return from subroutine
