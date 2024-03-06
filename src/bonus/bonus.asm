section .data

section .text
    global bonus
    extern printf

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    sus_stanga:
    push eax
    push ebx
    dec eax ; noua valoarea a lui x
    js sus_dreapta
    cmp eax, 7
    jg sus_dreapta
    dec ebx ; noua valoarea a lui y
    js sus_dreapta
    cmp ebx, 7
    jg sus_dreapta
    xor edx,edx ; edx = 0
    mov edx, 1 ; edx = 1
    cmp eax, 4
    jge label1
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    push ecx
    mov ecx, eax
    shl edx, cl
    pop ecx
    or dword [ecx + 4], edx
    jmp sus_dreapta
    label1:
    sub eax, 4
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    push ecx
    mov ecx, eax
    shl edx, cl
    pop ecx
    or [ecx + 0], edx
    

    sus_dreapta:
    pop ebx
    pop eax
    push eax
    push ebx
    dec eax
    js jos_stanga
    cmp eax, 7
    jg jos_stanga
    inc ebx
    js jos_stanga
    cmp ebx, 7
    jg jos_stanga
    xor edx,edx
    mov edx, 1
    ; shl edx, 31
    cmp eax, 4
    jge label2
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    push ecx
    mov ecx, eax
    shl edx, cl
    pop ecx
    or [ecx + 4], edx
    jmp jos_stanga
    label2:
    sub eax, 4
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    push ecx
    mov ecx, eax
    shl edx, cl
    pop ecx
    or [ecx + 0], edx


    jos_stanga:

    pop ebx
    pop eax
    push eax
    push ebx
    inc eax
    js jos_dreapta
    cmp eax, 7
    jg jos_dreapta
    dec ebx
    js jos_dreapta
    cmp ebx, 7
    jg jos_dreapta
    xor edx,edx
    mov edx, 1
    cmp eax, 4
    jge label3
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    push ecx
    mov ecx, eax
    shl edx, cl
    pop ecx
    or [ecx + 4], edx
    jmp jos_dreapta
    label3:
    sub eax, 4
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    push ecx
    mov ecx, eax
    shl edx, cl
    pop ecx
    or [ecx], edx

    jos_dreapta:

    pop ebx
    pop eax
    push eax
    push ebx
    inc eax
    js done
    cmp eax, 7
    jg done
    inc ebx
    js done
    cmp ebx, 7
    jg done
    xor edx,edx
    mov edx, 1
    cmp eax, 4
    jge label4
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    push ecx
    mov ecx, eax
    shl edx, cl
    pop ecx
    or [ecx + 4], edx
    jmp done
    label4:
    sub eax, 4
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    push ecx
    mov ecx, eax
    shl edx, cl
    pop ecx
    or [ecx + 0], edx

    done:
    pop ebx
    pop eax


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY