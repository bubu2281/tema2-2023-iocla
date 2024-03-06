%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    prelucrare_string:
        mov al, byte [esi + ecx - 1] ;pune in al litera respectiva din plain
        add al, dl ; adauga step la litera
        cmp al, 'Z' ;comp intre litera si Z
        jle salt_litera_greater_Z ; salt daca litera depaseste Z
        sub al, dl ; scade din litera stepul, ajungandu-se la litera initiala
        mov bl, 26 ; pune in bl 26
        sub bl, dl ; scade din 26 stepul
        sub al, bl ; scade reuzultatul de mai sus din litera initiala
        salt_litera_greater_Z:
        mov byte [edi + ecx - 1], al ;pune litera finala in enc_string
        loop prelucrare_string

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
