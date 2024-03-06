
section .data

section .text
	global checkers
    extern printf

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    sus_stanga:
    push eax
    push ebx
    dec eax
    js sus_dreapta
    cmp eax, 7
    jg sus_dreapta
    dec ebx
    js sus_dreapta
    cmp ebx, 7
    jg sus_dreapta
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    mov byte [ecx + eax], 1

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
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    mov byte [ecx + eax], 1


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
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    mov byte [ecx + eax], 1

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
    add eax, eax
    add eax, eax
    add eax, eax
    add eax, ebx
    mov byte [ecx + eax], 1

    done:
    pop ebx
    pop eax

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY