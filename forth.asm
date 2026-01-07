; Форт

.target "8080"
.format "bin"
.org 0x0000
    nop
.align 0x0100,0x00

    jmp l_0106
    jmp	*
l_0106:
    nop

.end
