[bits 16]
mov ax, 0xA000
mov ds, ax

m1:
    mov cx, 0xffff
    mov di, 0x0
    lp_lb:
        inc word [ds:di]
        inc di
    loop lp_lb
jmp m1