%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs
    extern printf

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    mov ecx, eax ; punem lungimea in ecx pentru a itera
    xor ebx, ebx ; golim ebx
    mov eax, edx ; mutam in eax adresa de start a vectrorului de structuri
    dec ecx ; ecx-- pentru a face loop-ul de la 0 la n-1
    prelucrare_proces:
        xor ebx, ebx ; golim ebx
        mov esi, edx ; mutam in esi adres
        mov edi, [ebp + 12]
        dec edi
        for1:
            push ecx
            xor ecx, ecx
            mov cl, byte [esi + proc.prio]
            cmp cl, byte [esi + proc_size + proc.prio]
            jl no_swap
            cmp cl, byte [esi + proc_size + proc.prio]
            jg swap
            xor ecx, ecx
            mov cx, word [esi + proc.time]
            cmp cx, word [esi + proc_size + proc.time]
            jl no_swap
            cmp cx, word [esi + proc_size + proc.time]
            jg swap
            xor ecx, ecx
            mov cx, word [esi + proc.pid]
            cmp cx, word [esi + proc_size + proc.pid]
            jl no_swap
            cmp cx, word [esi + proc_size + proc.pid]
            jg swap
            swap:
                xor ecx, ecx
                mov cl, byte [esi + proc.prio]
                xchg byte [esi + proc_size + proc.prio], cl
                mov [esi + proc.prio], cl
                xor ecx, ecx
                mov cx, word [esi + proc.pid]
                xchg word [esi + proc_size + proc.pid], cx
                mov [esi + proc.pid], cx
                xor ecx, ecx
                mov cx, word [esi + proc.time]
                xchg word [esi + proc_size + proc.time], cx
                mov [esi + proc.time], cx
            no_swap:
            pop ecx
            add esi, proc_size
            dec edi
            jnz for1
        add eax, proc_size 
    loop prelucrare_proces

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
