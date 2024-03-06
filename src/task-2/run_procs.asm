%include "../include/io.mac"

    ;;
    ;;   TODO: Declare 'avg' struct to match its C counterpart
struc avg
    .quo: resw 1
    .remain: resw 1
endstruc
    ;;

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0

section .text
    global run_procs
    extern printf

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    xor esi, esi
    ; construim cei doi vectori time si prio
    ; in time adaugam la pozitia i timpul cu prioritate i
    ; iar in prio incrementam pozitia i  cu 1
    label1:
        xor edx, edx
        mov dl, byte [ecx + esi + proc.prio]
        push ebx
        xor ebx, ebx
        mov bx, word [ecx + esi + proc.time]
        add dword [time_result + (edx-1) * 4], ebx
        inc dword [prio_result + (edx-1) * 4]
        pop ebx

        add esi, proc_size
        dec ebx
    jnz label1

    xor esi, esi
    mov esi, eax
    xor ecx, ecx
    mov ecx, 5

    ; loop ptra a lua fiecare element din vectorul time si a il imparti
    ; la fiecare element din vect prio, care au acelasi indice
    ; rezultatele le punem in vectorul avg
    contstr_avg:
        xor edx, edx
        xor eax, eax
        mov eax, dword [time_result + (ecx-1) * 4]
        xor ebx, ebx
        mov ebx, dword [prio_result + (ecx-1) * 4]
        cmp ebx, 0
        je if_zero
        div ebx
        if_zero:
        mov word [esi + avg_size * (ecx - 1) + avg.quo], ax
        mov word [esi + avg_size * (ecx - 1) + avg.remain], dx
    loop contstr_avg
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
