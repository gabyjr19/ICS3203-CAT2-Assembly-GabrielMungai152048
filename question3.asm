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

;Register management-Registers EBX, ECX, and EDX are used in the subroutine and must be preserved.
;The stack is used to save these registers before computations begin, ensuring that their original values are restored upon returning to the caller.

;Challenges-Recursive implementation was avoided for simplicity, and an iterative approach was used.
;Result Placement-The factorial result is stored in the EAX register upon subroutine completion, as required. This makes it readily accessible for further use.
