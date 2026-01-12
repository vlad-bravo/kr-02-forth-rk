; Форт

.target "8080"
.format "bin"
.org 0x0000
.storage 0x0100,0x00

   jmp l0106     ; $0100 c3 06 01
   jmp l0140     ; $0103 c3 40 01
l0106:
   lxi d,l019e   ; $0106 11 9e 01 Словарная статья _FORTH
   lxi h,l3448   ; $0109 21 48 34 копируется в новое место
   mvi b,$11     ; $010c 06 11   
l010e:
   ldax d        ; $010e 1a      
   mov m,a       ; $010f 77      
   inx h         ; $0110 23      
   inx d         ; $0111 13      
   dcr b         ; $0112 05      
   jnz l010e     ; $0113 c2 0e 01
   mvi b,$1a     ; $0116 06 1a    Обнуление области памяти
   lxi h,$3400   ; $0118 21 00 34
   sub a         ; $011b 97      
l011c:
   mov m,a       ; $011c 77      
   inx h         ; $011d 23      
   dcr b         ; $011e 05      
   jnz l011c     ; $011f c2 1c 01
   lhld $02d0    ; $0122 2a d0 02 Инициализация
   shld $341a    ; $0125 22 1a 34
   lhld $02d2    ; $0128 2a d2 02
   shld $341c    ; $012b 22 1c 34
   lhld $02d4    ; $012e 2a d4 02
   shld $3420    ; $0131 22 20 34
   lhld $02d6    ; $0134 2a d6 02
   shld $3424    ; $0137 22 24 34
   lhld $02d8    ; $013a 2a d8 02
   jmp l0d44     ; $013d c3 44 0d

l0140:
   lhld $341c    ; $0140 2a 1c 34
   sphl          ; $0143 f9      
   lhld $341a    ; $0144 2a 1a 34
   shld $341e    ; $0147 22 1e 34
   lxi b,l015a   ; $014a 01 5a 01 Адрес ФОРТ-программы
   jmp l02ef     ; $014d c3 ef 02 Передача управления

   stax b        ; $0150 02      
   nop           ; $0151 00      
   add b         ; $0152 80      
   mov l,l       ; $0153 6d      
   adc h         ; $0154 8c      
   mov m,l       ; $0155 75      
   inr b         ; $0156 04      
   nop           ; $0157 00      
   add b         ; $0158 80      
   mov e,l       ; $0159 5d      

l015a:
   .word _LIT             ; $015a 0A2B - LIT
   .word $3418            ; $015c 3418
   .word __40             ; $015e 0984 - @
   .word __3FDUP          ; $0160 03E0 - ?DUP
   .word __3FBRANCH       ; $0162 0A7A - ?BRANCH
   .word $016A            ; $0164 016A
   .word _EXECUTE         ; $0166 032C - EXECUTE
   .word _EXIT            ; $0168 0315 - EXIT
   .word $162A            ; $016a 162A
   .word _TITLE           ; $016c 0D78 - TITLE
   .word _TRUE            ; $016e 0EE6 - TRUE
   .word _WARNING         ; $0170 02C0 - WARNING
   .word __21             ; $0172 099D - !
   .word _DECIMAL         ; $0174 1694 - DECIMAL
   .word _QUIT            ; $0176 10A4 - QUIT

l0178:
   .word _LIT             ; $0178 0A2B - LIT
   .word $6574            ; $017a 6574
   .word _FIRST1          ; $017c 2A8C - FIRST1
   .word __21             ; $017e 099D - !
   .word _LIT             ; $0180 0A2B - LIT
   .word $758C            ; $0182 758C
   .word _LIMIT1          ; $0184 2A9A - LIMIT1
   .word __21             ; $0186 099D - !
   .word _EMPTY_2DBUFFERS ; $0188 2B48 - EMPTY-BUFFERS
   .word _BRANCH          ; $018a 0A68 - BRANCH
   .word $015A            ; $018c 015A
   .word _NOOP            ; $018e 2086 - NOOP
   .word _NOOP            ; $0190 2086 - NOOP
   .word _NOOP            ; $0192 2086 - NOOP
   .word _TRUE            ; $0194 0EE6 - TRUE
   .word _WARNING         ; $0196 02C0 - WARNING
   .word __21             ; $0198 099D - !
   .word _DECIMAL         ; $019a 1694 - DECIMAL
   .word _QUIT            ; $019c 10A4 - QUIT

; NOT IN WORDS LINK
l019e:
   .byte 5, "FORTH"
   .word 0x0000
;_FORTH:
   call l1b95    ; $01a6 cd 95 1b
   .byte $01
   .byte $80
   .word $4386
   .word $0000

NFA_R0:          ; 01AF
   .byte 2,"R0"
   .word NFA_FORTH
_R0:             ; 01B4
   call $0984    ; $01b4 cd 84 09
   .word $341a

NFA_S0:          ; 01B9
   .byte 2,"S0"
   .word NFA_R0
_S0:             ; 01BE
   call $0984
   .word $341c

NFA_RP:          ; 01C3
   .byte 2,"RP"
   .word NFA_S0
_RP:             ; 01C8
   call $0984
   .word $341e

NFA_H:           ; 01CD
   .byte 1,"H"
   .word NFA_RP
_H:              ; 01D1
   call $0984
   .word $3420

NFA_VOC_2DLINK:    ; 01D6
   .byte 8,"VOC-LINK"
   .word NFA_H
_VOC_2DLINK:       ; 01E1
   call $0984
   .word $3422

NFA_FENCE:       ; 01E6
   .byte 5,"FENCE"
   .word NFA_VOC_2DLINK
_FENCE:          ; 01EE
   call $0984    ; $01ee cd 84 09
   .word $3424

NFA_W_2DLINK:    ; 01F3
   .byte 6,"W-LINK"
   .word NFA_FENCE        ; 01E6
_W_2DLINK:       ; 01FC - None
   call $0984    ; $01fc cd 84 09
   .word $3426

NFA_BASE:        ; 0201
   .byte 4,"BASE"
   .word NFA_FENCE
_BASE:           ; 0208
   call $0984    ; $0208 cd 84 09
   .word $3428

NFA_STATE:       ; 020D
   .byte 5,"STATE"
   .word NFA_BASE
_STATE:          ; 0215
   call $0984    ; $0208 cd 84 09
   .word $342a

NFA_CONTEXT:     ; 021A
   .byte 7,"CONTEXT"
   .word NFA_STATE
_CONTEXT:        ; 0224
   call $0984    ; $0224 cd 84 09
   .word $342c

NFA_CURRENT:     ; 0229
   .byte 7,"CURRENT"
   .word NFA_CONTEXT
_CURRENT:        ; 0233
   call $0984    ; $0233 cd 84 09
   .word $342e   ; $0236 2e 34   

NFA_DPL:         ; 0238
   .byte 3,"DPL"
   .word NFA_CURRENT
_DPL:            ; 023E
   call $0984    ; $023e cd 84 09
   .word $3430

NFA_HLD:         ; 0243
   .byte 3,"HLD"
   .word NFA_DPL
_HLD:            ; 0249
   call $0984    ; $0249 cd 84 09
   .word $3432   ; $024c 32 34

NFA_CSP:         ; 024E
   .byte 3,"CSP"
   .word NFA_HLD
_CSP:            ; 0254
   call $0984    ; $0254 cd 84 09
   .word $3434   ; $0257 34      

; NOT IN WORDS LINK
NFA_INB:         ; 0259
   .byte 3,"INB"
   .word NFA_CSP          ; 024E
_INB:            ; 025F - None
   call $0984    ; $025f cd 84 09
   .word $3436   ; $0262 36 34   

NFA__23TIB:      ; 0264
   .byte 4,"#TIB"
   .word NFA_CSP
__23TIB:         ; 026B
   call $0984    ; $026b cd 84 09
   .word $3438   ; $026e 38      

NFA__3EIN:       ; 0270
   .byte 3,">IN"
   .word NFA__23TIB
__3EIN:          ; 0276
   call $0984    ; $0276 cd 84 09
   .word $343a   ; $0279 3a 34

; NOT IN WORDS LINK
NFA_OUTB:        ; 027B
   .byte 4,"OUTB"
   .word NFA__3EIN          ; 0270
_OUTB:           ; 0282 - None
   call $0984    ; $0282 cd 84 09
   .word $343c   ; $0285 3c      

; NOT IN WORDS LINK
NFA__23TOB:      ; 0287
   .byte 4,"#TOB"
   .word NFA__3EIN          ; 0270
__23TOB:         ; 028E - None
   call $0984    ; $028e cd 84 09
   .word $343e   ; $0291 3e 34   

NFA_SPAN:        ; 0293
   .byte 4,"SPAN"
   .word NFA__3EIN          ; 0270
_SPAN:           ; 029A
   call $0984    ; $029a cd 84 09
   .word $3440   ; $029d 40      

NFA__3EOUT:        ; 029F
   .byte 4,">OUT"
   .word NFA_SPAN         ; 0293
__3EOUT:           ; 02A6
   call $0984    ; $02a6 cd 84 09
   .word $3442   ; $02a9 42      

NFA_BLK:         ; 02AB
   .byte 3,"BLK"
   .word NFA__3EOUT         ; 029F
_BLK:            ; 02B1
   call $0984    ; $02b1 cd 84 09
   .word $3444   ; $02b4 44      

NFA_WARNING:     ; 02B6
   .byte 7,"WARNING"
   .word NFA_BLK          ; 02AB
_WARNING:        ; 02C0
   call $0984    ; $02c0 cd 84 09
   .word $3446   ; $02c3 46      

NFA_TIB:         ; 02C5
   .byte 3,"TIB"
   .word NFA_WARNING      ; 02B6
_TIB:            ; 02CB
   call $0984    ; $02cb cd 84 09
   sbb l         ; $02ce 9d      
   inr m         ; $02cf 34      

; !!!
   sbb c         ; $02d0 99      
   inr m         ; $02d1 34      
   cmc           ; $02d2 3f      
   dcr m         ; $02d3 35      
   mov b,d       ; $02d4 42      
   mov b,h       ; $02d5 44      
   mov b,d       ; $02d6 42      
   mov b,h       ; $02d7 44      
   mov a,b       ; $02d8 78      
   dcr a         ; $02d9 3d      

NFA_COLD:        ; 02DA
   .byte 4,"COLD"
   .word NFA_TIB          ; 02C5
_COLD:           ; 02E1
   jmp $0106     ; $02e1 c3 06 01

_FCALL:
   lhld $341e    ; $02e4 2a 1e 34
   dcx h         ; $02e7 2b      
   mov m,b       ; $02e8 70      
   dcx h         ; $02e9 2b      
   mov m,c       ; $02ea 71      
   shld $341e    ; $02eb 22 1e 34
   pop b         ; $02ee c1      
l02ef:
   ldax b        ; $02ef 0a      
   mov l,a       ; $02f0 6f      
   inx b         ; $02f1 03      
   ldax b        ; $02f2 0a      
   mov h,a       ; $02f3 67      
   inx b         ; $02f4 03      
   pchl          ; $02f5 e9      

NFA_NEXT:        ; 02F6
   .byte 4,"NEXT"
   .word NFA_COLD         ; 02DA
_NEXT:           ; 02FD
   call $0984
   .word $02ef

NFA_CALL:        ; 0302
   .byte 4,"CALL"
   .word NFA_NEXT         ; 02F6
_CALL:           ; 0309
   call $0984    ; $0309 cd 84 09
   .word $02e4

NFA_EXIT:        ; 030E
   .byte 4,"EXIT"
   .word NFA_CALL         ; 0302
_EXIT:           ; 0315
   lhld $341e    ; $0315 2a 1e 34
   mov c,m       ; $0318 4e      
   inx h         ; $0319 23      
   mov b,m       ; $031a 46      
   inx h         ; $031b 23      
   shld $341e    ; $031c 22 1e 34
   jmp $02ef     ; $031f c3 ef 02

NFA_EXECUTE:     ; 0322
   .byte 7,"EXECUTE"
   .word NFA_EXIT         ; 030E
_EXECUTE:        ; 032C
   ret           ; $032c c9      

; NOT IN WORDS LINK
NFA_ASMCALL:     ; 032D
   .byte 7,"ASMCALL"
   .word NFA_EXECUTE      ; 0322
_ASMCALL:        ; 0337 - None
   lhld $341e    ; $0337 2a 1e 34
   dcx h         ; $033a 2b      
   mov m,b       ; $033b 70      
   dcx h         ; $033c 2b      
   mov m,c       ; $033d 71      
   shld $341e    ; $033e 22 1e 34
   pop h         ; $0341 e1      
   pop b         ; $0342 c1      
   pop d         ; $0343 d1      
   xthl          ; $0344 e3      
   shld $3543    ; $0345 22 43 35
   pop h         ; $0348 e1      
   pop psw       ; $0349 f1      
   push h        ; $034a e5      
   lxi h,$0354   ; $034b 21 54 03
   xthl          ; $034e e3      
   push h        ; $034f e5      
   lhld $3543    ; $0350 2a 43 35
   ret           ; $0353 c9      

   push psw      ; $0354 f5      
   push h        ; $0355 e5      
   push d        ; $0356 d5      
   push b        ; $0357 c5      
   jmp $0315     ; $0358 c3 15 03

NFA_OVER:        ; 035B
   .byte 4,"OVER"
   .word NFA_EXECUTE      ; 0322
_OVER:           ; 0362
   pop h
   pop d         ; $0363 d1      
   push d        ; $0364 d5      
   push h        ; $0365 e5      
   push d        ; $0366 d5      
   jmp $02ef     ; $0367 c3 ef 02

NFA_PICK:        ; 036A
   .byte 4,"PICK"
   .word NFA_OVER         ; 035B
_PICK:           ; 0371
   pop h         ; $0371 e1      
   dad h         ; $0372 29      
   dad sp        ; $0373 39      
   mov e,m       ; $0374 5e      
   inx h         ; $0375 23      
   mov d,m       ; $0376 56      
   push d        ; $0377 d5      
   jmp $02ef     ; $0378 c3 ef 02

NFA_DROP:        ; 037B
   .byte 4,"DROP"
   .word NFA_PICK         ; 036A
_DROP:           ; 0382
   pop h         ; $0382 e1      
   jmp $02ef     ; $0383 c3 ef 02

NFA_SWAP:        ; 0386
   .byte 4,"SWAP"
   .word NFA_DROP         ; 037B
_SWAP:           ; 038D
   pop h         ; $038d e1      
   xthl          ; $038e e3      
   push h        ; $038f e5      
   jmp $02ef     ; $0390 c3 ef 02

NFA_2SWAP:       ; 0393
   .byte 5,"2SWAP"
   .word NFA_SWAP         ; 0386
_2SWAP:          ; 039B
   pop h         ; $039b e1      
   pop d         ; $039c d1      
   xthl          ; $039d e3      
   push h        ; $039e e5      
   lxi h,$0004   ; $039f 21 04 00
   dad sp        ; $03a2 39      
   mov a,m       ; $03a3 7e      
   mov m,e       ; $03a4 73      
   mov e,a       ; $03a5 5f      
   inx h         ; $03a6 23      
   mov a,m       ; $03a7 7e      
   mov m,d       ; $03a8 72      
   mov d,a       ; $03a9 57      
   pop h         ; $03aa e1      
   push d        ; $03ab d5      
   push h        ; $03ac e5      
   jmp $02ef     ; $03ad c3 ef 02

NFA_ROT:         ; 03B0
   .byte 3,"ROT"
   .word NFA_2SWAP        ; 0393
_ROT:            ; 03B6
   pop d         ; $03b6 d1      
   pop h         ; $03b7 e1      
   xthl          ; $03b8 e3      
   push d        ; $03b9 d5      
   push h        ; $03ba e5      
   jmp $02ef     ; $03bb c3 ef 02

NFA__2DROT:        ; 03BE
   .byte 4,"-ROT"
   .word NFA_ROT          ; 03B0
__2DROT:           ; 03C5
   pop h         ; $03c5 e1      
   pop d         ; $03c6 d1      
   xthl          ; $03c7 e3      
   push h        ; $03c8 e5      
   push d        ; $03c9 d5      
   jmp $02ef     ; $03ca c3 ef 02

NFA_DUP:         ; 03CD
   .byte 3,"DUP"
   .word NFA__2DROT         ; 03BE
_DUP:            ; 03D3
   pop h         ; $03d3 e1      
   push h        ; $03d4 e5      
   push h        ; $03d5 e5      
   jmp $02ef     ; $03d6 c3 ef 02

NFA__3FDUP:        ; 03D9
   .byte 4,"?DUP"
   .word NFA_DUP          ; 03CD
__3FDUP:           ; 03E0
   pop h
   push h        ; $03e1 e5      
   mov a,h       ; $03e2 7c      
   ora l         ; $03e3 b5      
   jz $02ef      ; $03e4 ca ef 02
   push h        ; $03e7 e5      
   jmp $02ef     ; $03e8 c3 ef 02

NFA_2DUP:        ; 03EB
   .byte 4,"2DUP"
   .word NFA__3FDUP         ; 03D9
_2DUP:           ; 03F2
   pop h         ; $03f2 e1      
   pop d         ; $03f3 d1      
   push d        ; $03f4 d5      
   push h        ; $03f5 e5      
   push d        ; $03f6 d5      
   push h        ; $03f7 e5      
   jmp $02ef     ; $03f8 c3 ef 02

NFA_2DROP:       ; 03FB
   .byte 5,"2DROP"
   .word NFA_2DUP         ; 03EB
_2DROP:          ; 0403
   pop d         ; $0403 d1      
   pop d         ; $0404 d1      
   jmp $02ef     ; $0405 c3 ef 02

NFA_PRESS:       ; 0408
   .byte 5,"PRESS"
   .word NFA_2DROP        ; 03FB
_PRESS:          ; 0410
   pop h         ; $0410 e1      
   xthl          ; $0411 e3      
   jmp $02ef     ; $0412 c3 ef 02

NFA_2OVER:       ; 0415
   .byte 5,"2OVER"
   .word NFA_PRESS        ; 0408
_2OVER:          ; 041D
   lxi h,$0007   ; $041d 21 07 00
   dad sp        ; $0420 39      
   mov d,m       ; $0421 56      
   dcx h         ; $0422 2b      
   mov e,m       ; $0423 5e      
   dcx h         ; $0424 2b      
   push d        ; $0425 d5      
   mov d,m       ; $0426 56      
   dcx h         ; $0427 2b      
   mov e,m       ; $0428 5e      
   push d        ; $0429 d5      
   jmp $02ef     ; $042a c3 ef 02

NFA_SP_40:         ; 042D
   .byte 3,"SP@"
   .word NFA_2OVER        ; 0415
_SP_40:            ; 0433
   lxi h,$0000   ; $0433 21 00 00
   dad sp        ; $0436 39      
   push h        ; $0437 e5      
   jmp $02ef     ; $0438 c3 ef 02

NFA_SP_21:         ; 043B
   .byte 3,"SP!"
   .word NFA_SP_40          ; 042D
_SP_21:            ; 0441
   pop h         ; $0441 e1      
   sphl          ; $0442 f9      
   jmp $02ef     ; $0443 c3 ef 02

NFA__2B:           ; 0446
   .byte 1,"+"
   .word NFA_SP_21          ; 043B
__2B:              ; 044A
   pop h         ; $044a e1      
   pop d         ; $044b d1      
   dad d         ; $044c 19      
   push h        ; $044d e5      
   jmp $02ef     ; $044e c3 ef 02

NFA__2D:           ; 0451
   .byte 1,"-"
   .word NFA__2B            ; 0446
__2D:              ; 0455
   pop h         ; $0455 e1      
   pop d         ; $0456 d1      
   mov a,e       ; $0457 7b      
   sub l         ; $0458 95      
   mov l,a       ; $0459 6f      
   mov a,d       ; $045a 7a      
   sbb h         ; $045b 9c      
   mov h,a       ; $045c 67      
   push h        ; $045d e5      
   jmp $02ef     ; $045e c3 ef 02

NFA_NEGATE:      ; 0461
   .byte 6,"NEGATE"
   .word NFA__2D            ; 0451
_NEGATE:         ; 046A
   pop h         ; $046a e1      
   call $058c    ; $046b cd 8c 05
   push h        ; $046e e5      
   jmp $02ef     ; $046f c3 ef 02

NFA_1_2B:          ; 0472
   .byte 2,"1+"
   .word NFA_NEGATE       ; 0461
_1_2B:             ; 0477
   pop h         ; $0477 e1      
   inx h         ; $0478 23      
   push h        ; $0479 e5      
   jmp $02ef     ; $047a c3 ef 02

NFA_2_2B:          ; 047D
   .byte 2,"2+"
   .word NFA_1_2B           ; 0472
_2_2B:             ; 0482
   pop h         ; $0482 e1      
   inx h         ; $0483 23      
   inx h         ; $0484 23      
   push h        ; $0485 e5      
   jmp $02ef     ; $0486 c3 ef 02

NFA_1_2D:          ; 0489
   .byte 2,"1-"
   .word NFA_2_2B           ; 047D
_1_2D:             ; 048E
   pop h         ; $048e e1      
   dcx h         ; $048f 2b      
   push h        ; $0490 e5      
   jmp $02ef     ; $0491 c3 ef 02

NFA_2_2D:          ; 0494
   .byte 2,"2-"
   .word NFA_1_2D           ; 0489
_2_2D:             ; 0499
   pop h         ; $0499 e1      
   dcx h         ; $049a 2b      
   dcx h         ; $049b 2b      
   push h        ; $049c e5      
   jmp $02ef     ; $049d c3 ef 02

NFA_2_2A:          ; 04A0
   .byte 2,"2*"
   .word NFA_2_2D           ; 0494
_2_2A:             ; 04A5
   pop h         ; $04a5 e1      
   dad h         ; $04a6 29      
   push h        ; $04a7 e5      
   jmp $02ef     ; $04a8 c3 ef 02

NFA_ABS:         ; 04AB
   .byte 3,"ABS"
   .word NFA_2_2A           ; 04A0
_ABS:            ; 04B1
   pop h         ; $04b1 e1      
   mov a,h       ; $04b2 7c      
   ora a         ; $04b3 b7      
   cm $058c      ; $04b4 fc 8c 05
   push h        ; $04b7 e5      
   jmp $02ef     ; $04b8 c3 ef 02

NFA_MIN:         ; 04BB
   .byte 3,"MIN"
   .word NFA_ABS          ; 04AB
_MIN:            ; 04C1
   pop d         ; $04c1 d1      
   pop h         ; $04c2 e1      
   push d        ; $04c3 d5      
   mov a,h       ; $04c4 7c      
   xra d         ; $04c5 aa      
   jp $04cd      ; $04c6 f2 cd 04
   xra d         ; $04c9 aa      
   jmp $04d1     ; $04ca c3 d1 04
   mov a,l       ; $04cd 7d      
   sub e         ; $04ce 93      
   mov a,h       ; $04cf 7c      
   sbb d         ; $04d0 9a      
   jp $02ef      ; $04d1 f2 ef 02
   xthl          ; $04d4 e3      
   jmp $02ef     ; $04d5 c3 ef 02

NFA_MAX:         ; 04D8
   .byte 3,"MAX"
   .word NFA_MIN          ; 04BB
_MAX:            ; 04DE
   pop h         ; $04de e1      
   pop d         ; $04df d1      
   push d        ; $04e0 d5      
   mov a,h       ; $04e1 7c      
   xra d         ; $04e2 aa      
   jp $04ea      ; $04e3 f2 ea 04
   xra h         ; $04e6 ac      
   jmp $04ee     ; $04e7 c3 ee 04
   mov a,e       ; $04ea 7b      
   sub l         ; $04eb 95      
   mov a,d       ; $04ec 7a      
   sbb h         ; $04ed 9c      
   jp $02ef      ; $04ee f2 ef 02
   xthl          ; $04f1 e3      
   jmp $02ef     ; $04f2 c3 ef 02

NFA_U_3C:          ; 04F5
   .byte 2,"U<"
   .word NFA_MAX          ; 04D8
_U_3C:             ; 04FA
   pop d         ; $04fa d1      
   pop h         ; $04fb e1      
   mov a,l       ; $04fc 7d      
   sub e         ; $04fd 93      
   mov a,h       ; $04fe 7c      
   sbb d         ; $04ff 9a      
   lxi h,$ffff   ; $0500 21 ff ff
   jc $0507      ; $0503 da 07 05
   inx h         ; $0506 23      
   push h        ; $0507 e5      
   jmp $02ef     ; $0508 c3 ef 02

NFA__3C:           ; 050B
   .byte 1,"<"
   .word NFA_U_3C           ; 04F5
__3C:              ; 050F
   pop h         ; $050f e1      
   pop d         ; $0510 d1      
   mov a,h       ; $0511 7c      
   xra d         ; $0512 aa      
   jp $0520      ; $0513 f2 20 05
   lxi h,$0000   ; $0516 21 00 00
   xra d         ; $0519 aa      
   jm $052b      ; $051a fa 2b 05
   jmp $052a     ; $051d c3 2a 05
   mov a,e       ; $0520 7b      
   sub l         ; $0521 95      
   mov a,d       ; $0522 7a      
   sbb h         ; $0523 9c      
   lxi h,$0000   ; $0524 21 00 00
   jp $052b      ; $0527 f2 2b 05
   dcx h         ; $052a 2b      
   push h        ; $052b e5      
   jmp $02ef     ; $052c c3 ef 02

NFA__3E:           ; 052F
   .byte 1,">"
   .word NFA__3C            ; 050B
__3E:              ; 0533
   pop d         ; $0533 d1      
   pop h         ; $0534 e1      
   jmp $0511     ; $0535 c3 11 05

NFA_0_3C:          ; 0538
   .byte 2,"0<"
   .word NFA__3E            ; 052F
_0_3C:             ; 053D
   pop h         ; $053d e1      
   mov a,h       ; $053e 7c      
   lxi h,$0000   ; $053f 21 00 00
   ora a         ; $0542 b7      
   jp $0547      ; $0543 f2 47 05
   dcx h         ; $0546 2b      
   push h        ; $0547 e5      
   jmp $02ef     ; $0548 c3 ef 02

NFA_0_3E:          ; 054B
   .byte 2,"0>"
   .word NFA_0_3C           ; 0538
_0_3E:             ; 0550
   pop d         ; $0550 d1      
   lxi h,$0000   ; $0551 21 00 00
   mov a,d       ; $0554 7a      
   ora a         ; $0555 b7      
   jm $055e      ; $0556 fa 5e 05
   ora e         ; $0559 b3      
   jz $055e      ; $055a ca 5e 05
   dcx h         ; $055d 2b      
   push h        ; $055e e5      
   jmp $02ef     ; $055f c3 ef 02

NFA__3D:           ; 0562
   .byte 1,"="
   .word NFA_0_3E           ; 054B
__3D:              ; 0566
   pop h         ; $0566 e1      
   pop d         ; $0567 d1      
   mov a,l       ; $0568 7d      
   sub e         ; $0569 93      
   mov e,a       ; $056a 5f      
   mov a,h       ; $056b 7c      
   sbb d         ; $056c 9a      
   lxi h,$0000   ; $056d 21 00 00
   ora e         ; $0570 b3      
   jnz $0575     ; $0571 c2 75 05
   dcx h         ; $0574 2b      
   push h        ; $0575 e5      
   jmp $02ef     ; $0576 c3 ef 02

NFA_0_3D:          ; 0579
   .byte 2,"0="
   .word NFA__3D            ; 0562
_0_3D:             ; 057E
   pop h         ; $057e e1      
   mov a,h       ; $057f 7c      
   lxi d,$0000   ; $0580 11 00 00
   ora l         ; $0583 b5      
   jnz $0588     ; $0584 c2 88 05
   dcx d         ; $0587 1b      
   push d        ; $0588 d5      
   jmp $02ef     ; $0589 c3 ef 02

   mov a,h       ; $058c 7c      
   cma           ; $058d 2f      
   mov h,a       ; $058e 67      
   mov a,l       ; $058f 7d      
   cma           ; $0590 2f      
   mov l,a       ; $0591 6f      
   inx h         ; $0592 23      
   ret           ; $0593 c9      

NFA__2DTRAILING:   ; 0594
   .byte 9,"-TRAILING"
   .word NFA_0_3D           ; 0579
__2DTRAILING:      ; 05A0
   pop d         ; $05a0 d1      
   mov a,e       ; $05a1 7b      
   ora a         ; $05a2 b7      
   jz $05b4      ; $05a3 ca b4 05
   pop h         ; $05a6 e1      
   push h        ; $05a7 e5      
   dad d         ; $05a8 19      
   dcx h         ; $05a9 2b      
   mov a,m       ; $05aa 7e      
   cpi $20       ; $05ab fe 20   
   jnz $05b4     ; $05ad c2 b4 05
   dcr e         ; $05b0 1d      
   jnz $05a9     ; $05b1 c2 a9 05
   push d        ; $05b4 d5      
   jmp $02ef     ; $05b5 c3 ef 02

NFA_2_2F:          ; 05B8
   .byte 2,"2/"
   .word NFA__2DTRAILING    ; 0594
_2_2F:             ; 05BD
   pop h         ; $05bd e1      
   mov a,h       ; $05be 7c      
   add a         ; $05bf 87      
   mov a,h       ; $05c0 7c      
   rar           ; $05c1 1f      
   mov h,a       ; $05c2 67      
   mov a,l       ; $05c3 7d      
   rar           ; $05c4 1f      
   mov l,a       ; $05c5 6f      
   push h        ; $05c6 e5      
   jmp $02ef     ; $05c7 c3 ef 02

NFA_D_2B:          ; 05CA
   .byte 2,"D+"
   .word NFA_2_2F           ; 05B8
_D_2B:             ; 05CF
   pop d         ; $05cf d1      
   pop h         ; $05d0 e1      
   xthl          ; $05d1 e3      
   dad d         ; $05d2 19      
   pop d         ; $05d3 d1      
   xthl          ; $05d4 e3      
   dad d         ; $05d5 19      
   xthl          ; $05d6 e3      
   jnc $05db     ; $05d7 d2 db 05
   inx h         ; $05da 23      
   push h        ; $05db e5      
   jmp $02ef     ; $05dc c3 ef 02

NFA_D_3C:          ; 05DF
   .byte 2,"D<"
   .word NFA_D_2B           ; 05CA
_D_3C:             ; 05E4
   pop d
   pop h         ; $05e5 e1      
   xthl          ; $05e6 e3      
   mov a,h       ; $05e7 7c      
   xra d         ; $05e8 aa      
   jp $05f8      ; $05e9 f2 f8 05
   lxi d,$0000   ; $05ec 11 00 00
   xra h         ; $05ef ac      
   pop h         ; $05f0 e1      
   pop h         ; $05f1 e1      
   jm $0612      ; $05f2 fa 12 06
   jmp $0611     ; $05f5 c3 11 06
   mov a,l       ; $05f8 7d      
   sub e         ; $05f9 93      
   mov l,a       ; $05fa 6f      
   mov a,h       ; $05fb 7c      
   sbb d         ; $05fc 9a      
   mov h,a       ; $05fd 67      
   pop d         ; $05fe d1      
   xthl          ; $05ff e3      
   mov a,l       ; $0600 7d      
   sub e         ; $0601 93      
   mov a,h       ; $0602 7c      
   sbb d         ; $0603 9a      
   pop h         ; $0604 e1      
   jnc $0609     ; $0605 d2 09 06
   dcx h         ; $0608 2b      
   mov a,h       ; $0609 7c      
   lxi d,$0000   ; $060a 11 00 00
   ora a         ; $060d b7      
   jp $0612      ; $060e f2 12 06
   dcx d         ; $0611 1b      
   push d        ; $0612 d5      
   jmp $02ef     ; $0613 c3 ef 02

NFA_DNEGATE:     ; 0616
   .byte 7,"DNEGATE"
   .word NFA_D_3C           ; 05DF
_DNEGATE:        ; 0620
   pop h         ; $0620 e1      
   xthl          ; $0621 e3      
   mvi d,$00     ; $0622 16 00   
   mov a,d       ; $0624 7a      
   sub l         ; $0625 95      
   mov l,a       ; $0626 6f      
   mov a,d       ; $0627 7a      
   sbb h         ; $0628 9c      
   mov h,a       ; $0629 67      
   xthl          ; $062a e3      
   mov a,d       ; $062b 7a      
   sbb l         ; $062c 9d      
   mov l,a       ; $062d 6f      
   mov a,d       ; $062e 7a      
   sbb h         ; $062f 9c      
   mov h,a       ; $0630 67      
   push h        ; $0631 e5      
   jmp $02ef     ; $0632 c3 ef 02

NFA__2DTEXT:     ; 0635
   .byte 5,"-TEXT"
   .word NFA_DNEGATE      ; 0616
__2DTEXT:        ; 063D - None
   mov h,b       ; $063d 60      
   mov l,c       ; $063e 69      
   pop d         ; $063f d1      
   pop b         ; $0640 c1      
   xthl          ; $0641 e3      
   xchg          ; $0642 eb      
   mov a,b       ; $0643 78      
   ora c         ; $0644 b1      
   jz $065d      ; $0645 ca 5d 06
   mov a,c       ; $0648 79      
   ora a         ; $0649 b7      
   jz $064e      ; $064a ca 4e 06
   inr b         ; $064d 04      
   ldax d        ; $064e 1a      
   sub m         ; $064f 96      
   jnz $065d     ; $0650 c2 5d 06
   inx d         ; $0653 13      
   inx h         ; $0654 23      
   dcr c         ; $0655 0d      
   jnz $064e     ; $0656 c2 4e 06
   dcr b         ; $0659 05      
   jnz $064e     ; $065a c2 4e 06
   mov l,a       ; $065d 6f      
   mvi h,$00     ; $065e 26 00   
   ora a         ; $0660 b7      
   jp $0665      ; $0661 f2 65 06
   dcr h         ; $0664 25      
   pop b         ; $0665 c1      
   push h        ; $0666 e5      
   jmp $02ef     ; $0667 c3 ef 02

NFA_ROLL:        ; 066A
   .byte 4,"ROLL"
   .word NFA_DNEGATE      ; 0616
_ROLL:           ; 0671
   pop h         ; $0671 e1      
   mov a,h       ; $0672 7c      
   ora l         ; $0673 b5      
   jz $02ef      ; $0674 ca ef 02
   dad h         ; $0677 29      
   xchg          ; $0678 eb      
   lxi h,$0000   ; $0679 21 00 00
   dad sp        ; $067c 39      
   dad d         ; $067d 19      
   push b        ; $067e c5      
   mov c,m       ; $067f 4e      
   inx h         ; $0680 23      
   mov b,m       ; $0681 46      
   push b        ; $0682 c5      
   mov b,h       ; $0683 44      
   mov c,l       ; $0684 4d      
   dcx b         ; $0685 0b      
   dcx b         ; $0686 0b      
   ldax b        ; $0687 0a      
   mov m,a       ; $0688 77      
   dcx b         ; $0689 0b      
   dcx h         ; $068a 2b      
   dcx d         ; $068b 1b      
   mov a,d       ; $068c 7a      
   ora e         ; $068d b3      
   jnz $0687     ; $068e c2 87 06
   pop h         ; $0691 e1      
   pop b         ; $0692 c1      
   xthl          ; $0693 e3      
   jmp $02ef     ; $0694 c3 ef 02

NFA__2A:           ; 0697
   .byte 1,"*"
   .word NFA_ROLL         ; 066A
__2A:              ; 069B
   mov h,b       ; 60   
   mov l,c       ; $069c 69      
   pop b         ; $069d c1      
   pop d         ; $069e d1      
   push h        ; $069f e5      
   lxi h,$0000   ; $06a0 21 00 00
   mov a,c       ; $06a3 79      
   mvi c,$08     ; $06a4 0e 08   
   call $06b4    ; $06a6 cd b4 06
   mov a,b       ; $06a9 78      
   mvi c,$08     ; $06aa 0e 08   
   call $06b4    ; $06ac cd b4 06
   pop b         ; $06af c1      
   push h        ; $06b0 e5      
   jmp $02ef     ; $06b1 c3 ef 02
   rar           ; $06b4 1f      
   jnc $06b9     ; $06b5 d2 b9 06
   dad d         ; $06b8 19      
   xchg          ; $06b9 eb      
   dad h         ; $06ba 29      
   xchg          ; $06bb eb      
   dcr c         ; $06bc 0d      
   jnz $06b4     ; $06bd c2 b4 06
   ret           ; $06c0 c9      

NFA_UM_2A:         ; 06C1
   .byte 3,"UM*"
   .word NFA__2A            ; 0697
_UM_2A:            ; 06C7
   pop h         ; $06c7 e1      
   pop d         ; $06c8 d1      
   push b        ; $06c9 c5      
   mov b,d       ; $06ca 42      
   mov c,e       ; $06cb 4b      
   call $06d5    ; $06cc cd d5 06
   pop b         ; $06cf c1      
   push d        ; $06d0 d5      
   push h        ; $06d1 e5      
   jmp $02ef     ; $06d2 c3 ef 02
   xra a         ; $06d5 af      
   mov d,a       ; $06d6 57      
   mov e,a       ; $06d7 5f      
   dad h         ; $06d8 29      
   rar           ; $06d9 1f      
   xchg          ; $06da eb      
   dad h         ; $06db 29      
   jnc $06e0     ; $06dc d2 e0 06
   inx d         ; $06df 13      
   ral           ; $06e0 17      
   jnc $06e9     ; $06e1 d2 e9 06
   dad b         ; $06e4 09      
   jnc $06e9     ; $06e5 d2 e9 06
   inx d         ; $06e8 13      
   xchg          ; $06e9 eb      
   adi $10       ; $06ea c6 10   
   jnc $06d8     ; $06ec d2 d8 06
   ret           ; $06ef c9      

NFA_DU_2FMOD:      ; 06F0
   .byte 6,"DU/MOD"
   .word NFA_UM_2A          ; 06C1
_DU_2FMOD:         ; 06F9
   lxi h,$354b   ; $06f9 21 4b 35
   mvi a,$04     ; $06fc 3e 04   
   pop d         ; $06fe d1      
   mov m,d       ; $06ff 72      
   inx h         ; $0700 23      
   mov m,e       ; $0701 73      
   inx h         ; $0702 23      
   dcr a         ; $0703 3d      
   jnz $06fe     ; $0704 c2 fe 06
   push b        ; $0707 c5      
   lxi b,$0005   ; $0708 01 05 00
   lxi h,$3545   ; $070b 21 45 35
   mvi e,$0a     ; $070e 1e 0a   
   push h        ; $0710 e5      
   call $07a1    ; $0711 cd a1 07
   dad b         ; $0714 09      
   mov m,a       ; $0715 77      
   call $077c    ; $0716 cd 7c 07
   inr b         ; $0719 04      
   dcr e         ; $071a 1d      
   jz $0769      ; $071b ca 69 07
   ani $f0       ; $071e e6 f0   
   jz $0716      ; $0720 ca 16 07
   dcr b         ; $0723 05      
   push b        ; $0724 c5      
   lxi h,$3545   ; $0725 21 45 35
   call $077c    ; $0728 cd 7c 07
   lxi h,$3549   ; $072b 21 49 35
   lxi d,$354e   ; $072e 11 4e 35
   push d        ; $0731 d5      
   push b        ; $0732 c5      
   call $0797    ; $0733 cd 97 07
   pop b         ; $0736 c1      
   pop h         ; $0737 e1      
   jc $074e      ; $0738 da 4e 07
   push b        ; $073b c5      
   lxi d,$3553   ; $073c 11 53 35
   dcx h         ; $073f 2b      
   dcx d         ; $0740 1b      
   ldax d        ; $0741 1a      
   sbb m         ; $0742 9e      
   stax d        ; $0743 12      
   dcr c         ; $0744 0d      
   jnz $073f     ; $0745 c2 3f 07
   dcx h         ; $0748 2b      
   inr m         ; $0749 34      
   pop b         ; $074a c1      
   jmp $072b     ; $074b c3 2b 07
   call $077c    ; $074e cd 7c 07
   dcr b         ; $0751 05      
   jnz $0725     ; $0752 c2 25 07
   lxi h,$3549   ; $0755 21 49 35
   call $07a1    ; $0758 cd a1 07
   pop b         ; $075b c1      
   mvi a,$0c     ; $075c 3e 0c   
   mvi c,$0a     ; $075e 0e 0a   
   sub b         ; $0760 90      
   mov b,a       ; $0761 47      
   call $077c    ; $0762 cd 7c 07
   dcr b         ; $0765 05      
   jnz $0762     ; $0766 c2 62 07
   pop h         ; $0769 e1      
   lxi h,$354c   ; $076a 21 4c 35
   pop b         ; $076d c1      
   mvi a,$04     ; $076e 3e 04   
   mov e,m       ; $0770 5e      
   dcx h         ; $0771 2b      
   mov d,m       ; $0772 56      
   dcx h         ; $0773 2b      
   push d        ; $0774 d5      
   dcr a         ; $0775 3d      
   jnz $0770     ; $0776 c2 70 07
   jmp $02ef     ; $0779 c3 ef 02
   push b        ; $077c c5      
   push d        ; $077d d5      
   mvi b,$00     ; $077e 06 00   
   dad b         ; $0780 09      
   xchg          ; $0781 eb      
   dcx d         ; $0782 1b      
   ldax d        ; $0783 1a      
   mov l,a       ; $0784 6f      
   mvi h,$00     ; $0785 26 00   
   dad h         ; $0787 29      
   dad h         ; $0788 29      
   dad h         ; $0789 29      
   dad h         ; $078a 29      
   mov a,l       ; $078b 7d      
   add b         ; $078c 80      
   stax d        ; $078d 12      
   mov b,h       ; $078e 44      
   dcr c         ; $078f 0d      
   jnz $0782     ; $0790 c2 82 07
   xchg          ; $0793 eb      
   pop d         ; $0794 d1      
   pop b         ; $0795 c1      
   ret           ; $0796 c9      
   ldax d        ; $0797 1a      
   cmp m         ; $0798 be      
   inx h         ; $0799 23      
   inx d         ; $079a 13      
   rnz           ; $079b c0      
   dcr c         ; $079c 0d      
   jnz $0797     ; $079d c2 97 07
   ret           ; $07a0 c9      
   xra a         ; $07a1 af      
   push h        ; $07a2 e5      
   push b        ; $07a3 c5      
   mov m,a       ; $07a4 77      
   inx h         ; $07a5 23      
   dcr c         ; $07a6 0d      
   jnz $07a4     ; $07a7 c2 a4 07
   pop b         ; $07aa c1      
   pop h         ; $07ab e1      
   ret           ; $07ac c9      
   mov a,h       ; $07ad 7c      
   ora l         ; $07ae b5      
   rz            ; $07af c8      
   lxi b,$0000   ; $07b0 01 00 00
   push b        ; $07b3 c5      
   mov a,e       ; $07b4 7b      
   sub l         ; $07b5 95      
   mov a,d       ; $07b6 7a      
   sbb h         ; $07b7 9c      
   jc $07c0      ; $07b8 da c0 07
   push h        ; $07bb e5      
   dad h         ; $07bc 29      
   jnc $07b4     ; $07bd d2 b4 07
   lxi h,$0000   ; $07c0 21 00 00
   pop b         ; $07c3 c1      
   mov a,b       ; $07c4 78      
   ora c         ; $07c5 b1      
   rz            ; $07c6 c8      
   dad h         ; $07c7 29      
   push d        ; $07c8 d5      
   mov a,e       ; $07c9 7b      
   sub c         ; $07ca 91      
   mov e,a       ; $07cb 5f      
   mov a,d       ; $07cc 7a      
   sbb b         ; $07cd 98      
   mov d,a       ; $07ce 57      
   jc $07d7      ; $07cf da d7 07
   inx h         ; $07d2 23      
   pop b         ; $07d3 c1      
   jmp $07c3     ; $07d4 c3 c3 07
   pop d         ; $07d7 d1      
   jmp $07c3     ; $07d8 c3 c3 07

NFA__2FMOD:        ; 07DB
   .byte 4,"/MOD"
   .word NFA_DU_2FMOD       ; 06F0
__2FMOD:           ; 07E2
   pop h         ; e1   
   pop d         ; $07e3 d1      
   push b        ; $07e4 c5      
   mov a,h       ; $07e5 7c      
   xra d         ; $07e6 aa      
   mov a,h       ; $07e7 7c      
   push psw      ; $07e8 f5      
   ora a         ; $07e9 b7      
   cm $058c      ; $07ea fc 8c 05
   push h        ; $07ed e5      
   mov a,d       ; $07ee 7a      
   ora a         ; $07ef b7      
   xchg          ; $07f0 eb      
   cm $058c      ; $07f1 fc 8c 05
   xchg          ; $07f4 eb      
   call $07ad    ; $07f5 cd ad 07
   pop b         ; $07f8 c1      
   mov a,d       ; $07f9 7a      
   ora e         ; $07fa b3      
   jnz $0808     ; $07fb c2 08 08
   pop psw       ; $07fe f1      
   cm $058c      ; $07ff fc 8c 05
   pop b         ; $0802 c1      
   push d        ; $0803 d5      
   push h        ; $0804 e5      
   jmp $02ef     ; $0805 c3 ef 02
   pop psw       ; $0808 f1      
   push psw      ; $0809 f5      
   jp $0817      ; $080a f2 17 08
   inx h         ; $080d 23      
   call $058c    ; $080e cd 8c 05
   mov a,c       ; $0811 79      
   sub e         ; $0812 93      
   mov e,a       ; $0813 5f      
   mov a,b       ; $0814 78      
   sbb d         ; $0815 9a      
   mov d,a       ; $0816 57      
   pop psw       ; $0817 f1      
   ora a         ; $0818 b7      
   xchg          ; $0819 eb      
   cm $058c      ; $081a fc 8c 05
   pop b         ; $081d c1      
   push h        ; $081e e5      
   push d        ; $081f d5      
   jmp $02ef     ; $0820 c3 ef 02

NFA_U_2FMOD:       ; 0823
   .byte 5,"U/MOD"
   .word NFA__2FMOD         ; 07DB
_U_2FMOD:          ; 082B
   pop h         ; $082b e1      
   pop d         ; $082c d1      
   push b        ; $082d c5      
   call $07ad    ; $082e cd ad 07
   pop b         ; $0831 c1      
   push d        ; $0832 d5      
   push h        ; $0833 e5      
   jmp $02ef     ; $0834 c3 ef 02

NFA__3FWORD:     ; 0837
   .byte 5,"?WORD"
   .word NFA_U_2FMOD        ; 0823
__3FWORD:        ; 083F - None
   pop h         ; $083f e1      
   pop d         ; $0840 d1      
   push b        ; $0841 c5      
   push d        ; $0842 d5      
   mvi b,$00     ; $0843 06 00   
   shld $3426    ; $0845 22 26 34
   mov e,m       ; $0848 5e      
   inx h         ; $0849 23      
   mov d,m       ; $084a 56      
   xchg          ; $084b eb      
   mov a,h       ; $084c 7c      
   ora l         ; $084d b5      
   jz $0881      ; $084e ca 81 08
   pop d         ; $0851 d1      
   push d        ; $0852 d5      
   push h        ; $0853 e5      
   mov a,m       ; $0854 7e      
   ani $7f       ; $0855 e6 7f   
   mov c,a       ; $0857 4f      
   ldax d        ; $0858 1a      
   cmp c         ; $0859 b9      
   jnz $0877     ; $085a c2 77 08
   ora c         ; $085d b1      
   jz $086c      ; $085e ca 6c 08
   inx h         ; $0861 23      
   inx d         ; $0862 13      
   ldax d        ; $0863 1a      
   cmp m         ; $0864 be      
   jnz $087c     ; $0865 c2 7c 08
   dcr c         ; $0868 0d      
   jnz $0861     ; $0869 c2 61 08
   pop h         ; $086c e1      
   pop d         ; $086d d1      
   pop b         ; $086e c1      
   push h        ; $086f e5      
   lxi h,$ffff   ; $0870 21 ff ff
   push h        ; $0873 e5      
   jmp $02ef     ; $0874 c3 ef 02
   mov a,c       ; $0877 79      
   ani $3f       ; $0878 e6 3f   
   mov c,a       ; $087a 4f      
   inx b         ; $087b 03      
   dad b         ; $087c 09      
   pop d         ; $087d d1      
   jmp $0845     ; $087e c3 45 08
   pop d         ; $0881 d1      
   pop b         ; $0882 c1      
   push d        ; $0883 d5      
   lxi h,$0000   ; $0884 21 00 00
   push h        ; $0887 e5      
   jmp $02ef     ; $0888 c3 ef 02

NFA_DIGIT:       ; 088B
   .byte 5,"DIGIT"
   .word NFA_U_2FMOD        ; 0823
_DIGIT:          ; 0893
   pop d         ; $0893 d1      
   pop h         ; $0894 e1      
   mov a,l       ; $0895 7d      
   cpi $30       ; $0896 fe 30   
   jm $08bb      ; $0898 fa bb 08
   cpi $3a       ; $089b fe 3a   
   jp $08af      ; $089d f2 af 08
   sui $30       ; $08a0 d6 30   
   cmp e         ; $08a2 bb      
   jp $08bb      ; $08a3 f2 bb 08
   mov l,a       ; $08a6 6f      
   push h        ; $08a7 e5      
   lxi h,$ffff   ; $08a8 21 ff ff
   push h        ; $08ab e5      
   jmp $02ef     ; $08ac c3 ef 02
   cpi $41       ; $08af fe 41   
   jm $08bb      ; $08b1 fa bb 08
   sui $41       ; $08b4 d6 41   
   adi $0a       ; $08b6 c6 0a   
   jmp $08a2     ; $08b8 c3 a2 08
   lxi h,$0000   ; $08bb 21 00 00
   push h        ; $08be e5      
   jmp $02ef     ; $08bf c3 ef 02

NFA_AND:         ; 08C2
   .byte 3,"AND"
   .word NFA_DIGIT        ; 088B
_AND:            ; 08C8
   pop h         ; $08c8 e1      
   pop d         ; $08c9 d1      
   mov a,e       ; $08ca 7b      
   ana l         ; $08cb a5      
   mov l,a       ; $08cc 6f      
   mov a,d       ; $08cd 7a      
   ana h         ; $08ce a4      
   mov h,a       ; $08cf 67      
   push h        ; $08d0 e5      
   jmp $02ef     ; $08d1 c3 ef 02

NFA_OR:          ; 08D4
   .byte 2,"OR"
   .word NFA_AND          ; 08C2
_OR:             ; 08D9
   pop h         ; e1
   pop d         ; $08da d1      
   mov a,e       ; $08db 7b      
   ora l         ; $08dc b5      
   mov l,a       ; $08dd 6f      
   mov a,d       ; $08de 7a      
   ora h         ; $08df b4      
   mov h,a       ; $08e0 67      
   push h        ; $08e1 e5      
   jmp $02ef     ; $08e2 c3 ef 02

NFA_XOR:         ; 08E5
   .byte 3,"XOR"
   .word NFA_OR           ; 08D4
_XOR:            ; 08EB
   pop h         ; e1
   pop d         ; $08ec d1      
   mov a,e       ; $08ed 7b      
   xra l         ; $08ee ad      
   mov l,a       ; $08ef 6f      
   mov a,d       ; $08f0 7a      
   xra h         ; $08f1 ac      
   mov h,a       ; $08f2 67      
   push h        ; $08f3 e5      
   jmp $02ef     ; $08f4 c3 ef 02

NFA_NOT:         ; 08F7
   .byte 3,"NOT"
   .word NFA_XOR          ; 08E5
_NOT:            ; 08FD
   pop h         ; $08fd e1      
   mov a,h       ; $08fe 7c      
   cma           ; $08ff 2f      
   mov h,a       ; $0900 67      
   mov a,l       ; $0901 7d      
   cma           ; $0902 2f      
   mov l,a       ; $0903 6f      
   push h        ; $0904 e5      
   jmp $02ef     ; $0905 c3 ef 02

NFA__3ER:          ; 0908
   .byte 2,">R"
   .word NFA_NOT          ; 08F7
__3ER:             ; 090D
   pop d         ; $090d d1      
   lhld $341e    ; $090e 2a 1e 34
   dcx h         ; $0911 2b      
   mov m,d       ; $0912 72      
   dcx h         ; $0913 2b      
   mov m,e       ; $0914 73      
   shld $341e    ; $0915 22 1e 34
   jmp $02ef     ; $0918 c3 ef 02

NFA_R_3E:          ; 091B
   .byte 2,"R>"
   .word NFA__3ER           ; 0908
_R_3E:             ; 0920
   lhld $341e    ; $0920 2a 1e 34
   mov e,m       ; $0923 5e      
   inx h         ; $0924 23      
   mov d,m       ; $0925 56      
   inx h         ; $0926 23      
   push d        ; $0927 d5      
   shld $341e    ; $0928 22 1e 34
   jmp $02ef     ; $092b c3 ef 02

NFA_R_40:          ; 092E
   .byte 2,"R@"
   .word NFA_R_3E           ; 091B
_R_40:             ; 0933
   lhld $341e    ; $0933 2a 1e 34
   mov e,m       ; $0936 5e      
   inx h         ; $0937 23      
   mov d,m       ; $0938 56      
   push d        ; $0939 d5      
   jmp $02ef     ; $093a c3 ef 02

NFA_RP_40:         ; 093D
   .byte 3,"RP@"
   .word NFA_R_40           ; 092E
_RP_40:            ; 0943
   lhld $341e    ; $0943 2a 1e 34
   push h        ; $0946 e5      
   jmp $02ef     ; $0947 c3 ef 02

NFA_RP_21:         ; 094A
   .byte 3,"RP!"
   .word NFA_RP_40          ; 093D
_RP_21:            ; 0950
   pop h         ; $0950 e1      
   shld $341e    ; $0951 22 1e 34
   jmp $02ef     ; $0954 c3 ef 02

NFA_RPICK:       ; 0957
   .byte 5,"RPICK"
   .word NFA_RP_21          ; 094A
_RPICK:          ; 095F
   pop h         ; $095f e1      
   dad h         ; $0960 29      
   xchg          ; $0961 eb      
   lhld $341e    ; $0962 2a 1e 34
   dad d         ; $0965 19      
   mov e,m       ; $0966 5e      
   inx h         ; $0967 23      
   mov d,m       ; $0968 56      
   push d        ; $0969 d5      
   jmp $02ef     ; $096a c3 ef 02

NFA_RDROP:       ; 096D
   .byte 5,"RDROP"
   .word NFA_RPICK        ; 0957
_RDROP:          ; 0975
   lhld $341e    ; $0975 2a 1e 34
   inx h         ; $0978 23      
   inx h         ; $0979 23      
   shld $341e    ; $097a 22 1e 34
   jmp $02ef     ; $097d c3 ef 02

NFA__40:           ; 0980
   .byte 1,"@"
   .word NFA_RDROP        ; 096D
__40:              ; 0984
   pop h         ; $0984 e1      
   mov e,m       ; $0985 5e      
   inx h         ; $0986 23      
   mov d,m       ; $0987 56      
   push d        ; $0988 d5      
   jmp $02ef     ; $0989 c3 ef 02

NFA_C_40:          ; 098C
   .byte 2,"C@"
   .word NFA__40            ; 0980
_C_40:             ; 0991
   pop h         ; $0991 e1      
   mov e,m       ; $0992 5e      
   mvi d,$00     ; $0993 16 00   
   push d        ; $0995 d5      
   jmp $02ef     ; $0996 c3 ef 02

NFA__21:           ; 0999
   .byte 1,"!"
   .word NFA_C_40           ; 098C
__21:              ; 099D
   pop h         ; $099d e1      
   pop d         ; $099e d1      
   mov m,e       ; $099f 73      
   inx h         ; $09a0 23      
   mov m,d       ; $09a1 72      
   jmp $02ef     ; $09a2 c3 ef 02

NFA_C_21:          ; 09A5
   .byte 2,"C!"
   .word NFA__21            ; 0999
_C_21:             ; 09AA
   pop h         ; $09aa e1      
   pop d         ; $09ab d1      
   mov m,e       ; $09ac 73      
   jmp $02ef     ; $09ad c3 ef 02

NFA_2_21:          ; 09B0
   .byte 2,"2!"
   .word NFA_C_21           ; 09A5
_2_21:             ; 09B5
   pop h         ; $09b5 e1      
   pop d         ; $09b6 d1      
   mov m,e       ; $09b7 73      
   inx h         ; $09b8 23      
   mov m,d       ; $09b9 72      
   inx h         ; $09ba 23      
   pop d         ; $09bb d1      
   mov m,e       ; $09bc 73      
   inx h         ; $09bd 23      
   mov m,d       ; $09be 72      
   jmp $02ef     ; $09bf c3 ef 02

NFA_2_40:          ; 09C2
   .byte 2,"2@"
   .word NFA_2_21           ; 09B0
_2_40:             ; 09C7
   pop h         ; $09c7 e1      
   mov e,m       ; $09c8 5e      
   inx h         ; $09c9 23      
   mov d,m       ; $09ca 56      
   inx h         ; $09cb 23      
   mov a,m       ; $09cc 7e      
   inx h         ; $09cd 23      
   mov h,m       ; $09ce 66      
   mov l,a       ; $09cf 6f      
   push h        ; $09d0 e5      
   push d        ; $09d1 d5      
   jmp $02ef     ; $09d2 c3 ef 02

NFA__2B_21:          ; 09D5
   .byte 2,"+!"
   .word NFA_2_40           ; 09C2
__2B_21:             ; 09DA
   pop h         ; $09da e1      
   pop d         ; $09db d1      
   mov a,m       ; $09dc 7e      
   add e         ; $09dd 83      
   mov m,a       ; $09de 77      
   inx h         ; $09df 23      
   mov a,m       ; $09e0 7e      
   adc d         ; $09e1 8a      
   mov m,a       ; $09e2 77      
   jmp $02ef     ; $09e3 c3 ef 02

NFA__2D_21:          ; 09E6
   .byte 2,"-!"
   .word NFA__2B_21           ; 09D5
__2D_21:             ; 09EB
   pop h         ; $09eb e1      
   pop d         ; $09ec d1      
   mov a,m       ; $09ed 7e      
   sub e         ; $09ee 93      
   mov m,a       ; $09ef 77      
   inx h         ; $09f0 23      
   mov a,m       ; $09f1 7e      
   sbb d         ; $09f2 9a      
   mov m,a       ; $09f3 77      
   jmp $02ef     ; $09f4 c3 ef 02

NFA_0_21:          ; 09F7
   .byte 2,"0!"
   .word NFA__2D_21           ; 09E6
_0_21:             ; 09FC
   sub a         ; $09fc 97      
   pop h         ; $09fd e1      
   mov m,a       ; $09fe 77      
   inx h         ; $09ff 23      
   mov m,a       ; $0a00 77      
   jmp $02ef     ; $0a01 c3 ef 02

NFA_1_2B_21:         ; 0A04
   .byte 3,"1+!"
   .word NFA_0_21           ; 09F7
_1_2B_21:            ; 0A0A
   pop h         ; $0a0a e1      
   inr m         ; $0a0b 34      
   jnz $02ef     ; $0a0c c2 ef 02
   inx h         ; $0a0f 23      
   inr m         ; $0a10 34      
   jmp $02ef     ; $0a11 c3 ef 02

NFA_1_2D_21:         ; 0A14
   .byte 3,"1-!"
   .word NFA_1_2B_21          ; 0A04
_1_2D_21:            ; 0A1A
   pop h         ; $0a1a e1      
   mov e,m       ; $0a1b 5e      
   inx h         ; $0a1c 23      
   mov d,m       ; $0a1d 56      
   dcx d         ; $0a1e 1b      
   mov m,d       ; $0a1f 72      
   dcx h         ; $0a20 2b      
   mov m,e       ; $0a21 73      
   jmp $02ef     ; $0a22 c3 ef 02

NFA_LIT:         ; 0A25
   .byte 3,"LIT"
   .word NFA_1_2D_21          ; 0A14
_LIT:            ; 0A2B
   ldax b        ; $0a2b 0a      
   mov l,a       ; $0a2c 6f      
   inx b         ; $0a2d 03      
   ldax b        ; $0a2e 0a      
   mov h,a       ; $0a2f 67      
   inx b         ; $0a30 03      
   push h        ; $0a31 e5      
   jmp $02ef     ; $0a32 c3 ef 02

NFA_DLIT:        ; 0A35
   .byte 4,"DLIT"
   .word NFA_LIT          ; 0A25
_DLIT:           ; 0A3C
   ldax b        ; $0a3c 0a      
   mov e,a       ; $0a3d 5f      
   inx b         ; $0a3e 03      
   ldax b        ; $0a3f 0a      
   mov d,a       ; $0a40 57      
   inx b         ; $0a41 03      
   ldax b        ; $0a42 0a      
   mov l,a       ; $0a43 6f      
   inx b         ; $0a44 03      
   ldax b        ; $0a45 0a      
   mov h,a       ; $0a46 67      
   inx b         ; $0a47 03      
   push h        ; $0a48 e5      
   push d        ; $0a49 d5      
   jmp $02ef     ; $0a4a c3 ef 02

NFA__28_22_29:   ; 0A4D
   .byte 3,"(\")"
   .word NFA_DLIT         ; 0A35
__28_22_29:      ; 0A53
   push b        ; $0a53 c5      
   ldax b        ; $0a54 0a      
   mov l,a       ; $0a55 6f      
   mvi h,$00     ; $0a56 26 00   
   inx h         ; $0a58 23      
   dad b         ; $0a59 09      
   mov b,h       ; $0a5a 44      
   mov c,l       ; $0a5b 4d      
   jmp $02ef     ; $0a5c c3 ef 02

NFA_BRANCH:      ; 0A5F
   .byte 6,"BRANCH"
   .word NFA__28_22_29          ; 0A4D
_BRANCH:         ; 0A68
   mov h,b       ; $0a68 60      
   mov l,c       ; $0a69 69      
   mov c,m       ; $0a6a 4e      
   inx h         ; $0a6b 23      
   mov b,m       ; $0a6c 46      
   jmp $02ef     ; $0a6d c3 ef 02

NFA__3FBRANCH:     ; 0A70
   .byte 7,"?BRANCH"
   .word NFA_BRANCH       ; 0A5F
__3FBRANCH:        ; 0A7A
   pop d         ; $0a7a d1      
   mov a,d       ; $0a7b 7a      
   ora e         ; $0a7c b3      
   jz _BRANCH    ; $0a7d ca 68 0a
   inx b         ; $0a80 03      
   inx b         ; $0a81 03      
   jmp $02ef     ; $0a82 c3 ef 02

NFA_N_3FBRANCH:    ; 0A85
   .byte 8,"N?BRANCH"
   .word NFA__3FBRANCH      ; 0A70
_N_3FBRANCH:       ; 0A90
   pop d         ; $0a90 d1      
   mov a,d       ; $0a91 7a      
   ora e         ; $0a92 b3      
   jnz _BRANCH   ; $0a93 c2 68 0a
   inx b         ; $0a96 03      
   inx b         ; $0a97 03      
   jmp $02ef     ; $0a98 c3 ef 02

NFA_I:           ; 0A9B
   .byte 1,"I"
   .word NFA_N_3FBRANCH     ; 0A85
_I:              ; 0A9F
   lhld $341e    ; $0a9f 2a 1e 34
   mov e,m       ; $0aa2 5e      
   inx h         ; $0aa3 23      
   mov d,m       ; $0aa4 56      
   push d        ; $0aa5 d5      
   jmp $02ef     ; $0aa6 c3 ef 02

NFA_J:           ; 0AA9
   .byte 1,"J"
   .word NFA_I            ; 0A9B
_J:              ; 0AAD
   lhld $341e    ; $0aad 2a 1e 34
   lxi d,$0006   ; $0ab0 11 06 00
   dad d         ; $0ab3 19      
   mov e,m       ; $0ab4 5e      
   inx h         ; $0ab5 23      
   mov d,m       ; $0ab6 56      
   push d        ; $0ab7 d5      
   jmp $02ef     ; $0ab8 c3 ef 02

NFA_K:           ; 0ABB
   .byte 1,"K"
   .word NFA_J            ; 0AA9
_K:              ; 0ABF
   lhld $341e    ; $0abf 2a 1e 34
   lxi d,$000c   ; $0ac2 11 0c 00
   dad d         ; $0ac5 19      
   mov e,m       ; $0ac6 5e      
   inx h         ; $0ac7 23      
   mov d,m       ; $0ac8 56      
   push d        ; $0ac9 d5      
   jmp $02ef     ; $0aca c3 ef 02

NFA_TOGGLE:      ; 0ACD
   .byte 6,"TOGGLE"
   .word NFA_K            ; 0ABB
_TOGGLE:         ; 0AD6
   pop d         ; $0ad6 d1      
   mov a,e       ; $0ad7 7b      
   pop h         ; $0ad8 e1      
   xra m         ; $0ad9 ae      
   mov m,a       ; $0ada 77      
   jmp $02ef     ; $0adb c3 ef 02

NFA__28DO_29:        ; 0ADE
   .byte 4,"(DO)"
   .word NFA_TOGGLE       ; 0ACD
__28DO_29:           ; 0AE5
   pop h         ; e1
   xthl          ; $0ae6 e3      
   push h        ; $0ae7 e5      
   lhld $341e    ; $0ae8 2a 1e 34
   ldax b        ; $0aeb 0a      
   mov d,a       ; $0aec 57      
   inx b         ; $0aed 03      
   ldax b        ; $0aee 0a      
   inx b         ; $0aef 03      
   dcx h         ; $0af0 2b      
   mov m,a       ; $0af1 77      
   dcx h         ; $0af2 2b      
   mov m,d       ; $0af3 72      
   pop d         ; $0af4 d1      
   dcx h         ; $0af5 2b      
   mov m,d       ; $0af6 72      
   dcx h         ; $0af7 2b      
   mov m,e       ; $0af8 73      
   pop d         ; $0af9 d1      
   dcx h         ; $0afa 2b      
   mov m,d       ; $0afb 72      
   dcx h         ; $0afc 2b      
   mov m,e       ; $0afd 73      
   shld $341e    ; $0afe 22 1e 34
   jmp $02ef     ; $0b01 c3 ef 02

NFA__28_3FDO_29:       ; 0B04
   .byte 5,"(?DO)"
   .word NFA__28DO_29         ; 0ADE
__28_3FDO_29:          ; 0B0C
   pop h         ; $0b0c e1      
   pop d         ; $0b0d d1      
   push d        ; $0b0e d5      
   push h        ; $0b0f e5      
   mov a,l       ; $0b10 7d      
   cmp e         ; $0b11 bb      
   jnz __28DO_29 ; $0b12 c2 e5 0a
   mov a,h       ; $0b15 7c      
   cmp d         ; $0b16 ba      
   jnz __28DO_29 ; $0b17 c2 e5 0a
   ldax b        ; $0b1a 0a      
   mov d,a       ; $0b1b 57      
   inx b         ; $0b1c 03      
   ldax b        ; $0b1d 0a      
   mov b,a       ; $0b1e 47      
   mov c,d       ; $0b1f 4a      
   pop h         ; $0b20 e1      
   pop h         ; $0b21 e1      
   jmp $02ef     ; $0b22 c3 ef 02

NFA__28LOOP_29:  ; 0B25
   .byte 6,"(LOOP)"
   .word NFA__28_3FDO_29        ; 0B04
__28LOOP_29:     ; 0B2E - 0B59
   lhld $341e    ; $0b2e 2a 1e 34
   mov e,m       ; $0b31 5e      
   inx h         ; $0b32 23      
   mov d,m       ; $0b33 56      
   inx h         ; $0b34 23      
   inx d         ; $0b35 13      
   mov a,m       ; $0b36 7e      
   inx h         ; $0b37 23      
   cmp e         ; $0b38 bb      
   jnz $0b4c     ; $0b39 c2 4c 0b
   mov a,m       ; $0b3c 7e      
   cmp d         ; $0b3d ba      
   jnz $0b4c     ; $0b3e c2 4c 0b
   inx h         ; $0b41 23      
   inx h         ; $0b42 23      
   inx h         ; $0b43 23      
   shld $341e    ; $0b44 22 1e 34
   inx b         ; $0b47 03      
   inx b         ; $0b48 03      
   jmp $02ef     ; $0b49 c3 ef 02
   dcx h         ; $0b4c 2b      
   dcx h         ; $0b4d 2b      
   mov m,d       ; $0b4e 72      
   dcx h         ; $0b4f 2b      
   mov m,e       ; $0b50 73      
   mov h,b       ; $0b51 60      
   mov l,c       ; $0b52 69      
   mov c,m       ; $0b53 4e      
   inx h         ; $0b54 23      
   mov b,m       ; $0b55 46      
   jmp $02ef     ; $0b56 c3 ef 02

NFA__28_2BLOOP_29:     ; 0B59
   .byte 7,"(+LOOP)"
   .word NFA__28LOOP_29       ; 0B25
__28_2BLOOP_29:        ; 0B63
   pop h         ; $0b63 e1      
   push b        ; $0b64 c5      
   xchg          ; $0b65 eb      
   lhld $341e    ; $0b66 2a 1e 34
   mov c,m       ; $0b69 4e      
   inx h         ; $0b6a 23      
   mov b,m       ; $0b6b 46      
   inx h         ; $0b6c 23      
   xchg          ; $0b6d eb      
   dad b         ; $0b6e 09      
   xchg          ; $0b6f eb      
   pop b         ; $0b70 c1      
   jmp $0b36     ; $0b71 c3 36 0b

NFA_CMOVE:       ; 0B74
   .byte 5,"CMOVE"
   .word NFA__28_2BLOOP_29      ; 0B59
_CMOVE:          ; 0B7C
   mov h,b       ; $0b7c 60      
   mov l,c       ; $0b7d 69      
   pop b         ; $0b7e c1      
   pop d         ; $0b7f d1      
   xthl          ; $0b80 e3      
   mov a,c       ; $0b81 79      
   ora b         ; $0b82 b0      
   jz $0b98      ; $0b83 ca 98 0b
   mov a,c       ; $0b86 79      
   ora a         ; $0b87 b7      
   jz $0b8c      ; $0b88 ca 8c 0b
   inr b         ; $0b8b 04      
   mov a,m       ; $0b8c 7e      
   stax d        ; $0b8d 12      
   inx h         ; $0b8e 23      
   inx d         ; $0b8f 13      
   dcr c         ; $0b90 0d      
   jnz $0b8c     ; $0b91 c2 8c 0b
   dcr b         ; $0b94 05      
   jnz $0b8c     ; $0b95 c2 8c 0b
   pop b         ; $0b98 c1      
   jmp $02ef     ; $0b99 c3 ef 02

NFA_CMOVE_3E:      ; 0B9C
   .byte 6,"CMOVE>"
   .word NFA_CMOVE        ; 0B74
_CMOVE_3E:         ; 0BA5
   mov h,b       ; $0ba5 60      
   mov l,c       ; $0ba6 69      
   pop b         ; $0ba7 c1      
   pop d         ; $0ba8 d1      
   xthl          ; $0ba9 e3      
   mov a,c       ; $0baa 79      
   ora b         ; $0bab b0      
   jz $0bc8      ; $0bac ca c8 0b
   dad b         ; $0baf 09      
   xchg          ; $0bb0 eb      
   dad b         ; $0bb1 09      
   mov a,c       ; $0bb2 79      
   ora a         ; $0bb3 b7      
   jz $0bb8      ; $0bb4 ca b8 0b
   inr b         ; $0bb7 04      
   dcx h         ; $0bb8 2b      
   dcx d         ; $0bb9 1b      
   ldax d        ; $0bba 1a      
   mov m,a       ; $0bbb 77      
   dcr c         ; $0bbc 0d      
   jnz $0bb8     ; $0bbd c2 b8 0b
   dcr b         ; $0bc0 05      
   jnz $0bb8     ; $0bc1 c2 b8 0b
   pop b         ; $0bc4 c1      
   jmp $02ef     ; $0bc5 c3 ef 02
   pop b         ; $0bc8 c1      
   jmp $02ef     ; $0bc9 c3 ef 02

NFA__3CCMOVE_3E:     ; 0BCC
   .byte 7,"<CMOVE>"
   .word NFA_CMOVE_3E       ; 0B9C
__3CCMOVE_3E:        ; 0BD6
   mov h,b       ; $0bd6 60      
   mov l,c       ; $0bd7 69      
   pop b         ; $0bd8 c1      
   pop d         ; $0bd9 d1      
   xthl          ; $0bda e3      
   mov a,c       ; $0bdb 79      
   ora b         ; $0bdc b0      
   jz $0bea      ; $0bdd ca ea 0b
   mov a,l       ; $0be0 7d      
   sub e         ; $0be1 93      
   mov a,h       ; $0be2 7c      
   sbb d         ; $0be3 9a      
   jnc $0b86     ; $0be4 d2 86 0b
   jmp $0baf     ; $0be7 c3 af 0b
   pop b         ; $0bea c1      
   jmp $02ef     ; $0beb c3 ef 02

NFA_FILL:        ; 0BEE
   .byte 4,"FILL"
   .word NFA__3CCMOVE_3E      ; 0BCC
_FILL:           ; 0BF5
   pop d         ; d1
   pop h         ; $0bf6 e1      
   mov a,h       ; $0bf7 7c      
   ora l         ; $0bf8 b5      
   jnz $0c00     ; $0bf9 c2 00 0c
   pop h         ; $0bfc e1      
   jmp $02ef     ; $0bfd c3 ef 02
   mov a,e       ; $0c00 7b      
   pop d         ; $0c01 d1      
   dcx h         ; $0c02 2b      
   push b        ; $0c03 c5      
   lxi b,$ffff   ; $0c04 01 ff ff
   stax d        ; $0c07 12      
   inx d         ; $0c08 13      
   dad b         ; $0c09 09      
   jc $0c07      ; $0c0a da 07 0c
   pop b         ; $0c0d c1      
   jmp $02ef     ; $0c0e c3 ef 02

NFA_0_3EBL:        ; 0C11
   .byte 4,"0>BL"
   .word NFA_FILL         ; 0BEE
_0_3EBL:           ; 0C18
   pop d         ; $0c18 d1      
   pop h         ; $0c19 e1      
   mov a,m       ; $0c1a 7e      
   ora a         ; $0c1b b7      
   jnz $0c21     ; $0c1c c2 21 0c
   mvi m,$20     ; $0c1f 36 20   
   inx h         ; $0c21 23      
   dcr e         ; $0c22 1d      
   jnz $0c1a     ; $0c23 c2 1a 0c
   jmp $02ef     ; $0c26 c3 ef 02

NFA_ENCLOSE:     ; 0C29
   .byte 7,"ENCLOSE"
   .word NFA_0_3EBL         ; 0C11
_ENCLOSE:        ; 0C33
   mov h,b       ; 60
   mov l,c       ; $0c34 69      
   pop b         ; $0c35 c1      
   pop d         ; $0c36 d1      
   xthl          ; $0c37 e3      
   xchg          ; $0c38 eb      
   dcx b         ; $0c39 0b      
   mov a,b       ; $0c3a 78      
   ora a         ; $0c3b b7      
   jm $0c69      ; $0c3c fa 69 0c
   mov a,m       ; $0c3f 7e      
   cmp e         ; $0c40 bb      
   dcx b         ; $0c41 0b      
   inx h         ; $0c42 23      
   jz $0c3a      ; $0c43 ca 3a 0c
   push h        ; $0c46 e5      
   mov a,b       ; $0c47 78      
   ora a         ; $0c48 b7      
   jm $0c54      ; $0c49 fa 54 0c
   mov a,m       ; $0c4c 7e      
   cmp e         ; $0c4d bb      
   dcx b         ; $0c4e 0b      
   inx h         ; $0c4f 23      
   jnz $0c47     ; $0c50 c2 47 0c
   dcx h         ; $0c53 2b      
   pop d         ; $0c54 d1      
   dcx d         ; $0c55 1b      
   pop b         ; $0c56 c1      
   push d        ; $0c57 d5      
   push h        ; $0c58 e5      
   mov a,l       ; $0c59 7d      
   sub e         ; $0c5a 93      
   mov l,a       ; $0c5b 6f      
   mov a,h       ; $0c5c 7c      
   sbb d         ; $0c5d 9a      
   mov h,a       ; $0c5e 67      
   xthl          ; $0c5f e3      
   inx h         ; $0c60 23      
   push h        ; $0c61 e5      
   lxi h,$ffff   ; $0c62 21 ff ff
   push h        ; $0c65 e5      
   jmp $02ef     ; $0c66 c3 ef 02
   pop b         ; $0c69 c1      
   lxi h,$0000   ; $0c6a 21 00 00
   push h        ; $0c6d e5      
   jmp $02ef     ; $0c6e c3 ef 02

NFA_BYE:         ; 0C71
   .byte 3,"BYE"
   .word NFA_ENCLOSE      ; 0C29
_BYE:            ; 0C77 - 0C82
   call _FCALL            ; 0C77
   .word _LIT             ; $0c7a 0A2B - LIT
   .word $F800            ; $0c7c F800
   .word _EXECUTE         ; $0c7e 032C - EXECUTE
   .word _EXIT            ; $0c80 0315 - EXIT

NFA__28EMIT_29:      ; 0C82
   .byte 6,"(EMIT)"
   .word NFA_BYE          ; 0C71
__28EMIT_29:         ; 0C8B
   pop h         ; $0c8b e1      
   push b        ; $0c8c c5      
   mov c,l       ; $0c8d 4d      
   call $f809    ; $0c8e cd 09 f8
   pop b         ; $0c91 c1      
   jmp $02ef     ; $0c92 c3 ef 02

NFA__28KEY_29:   ; 0C95
   .byte 5,"(KEY)"
   .word NFA__28EMIT_29       ; 0C82
__28KEY_29:      ; 0C9D - None
   push b        ; $0c9d c5      
   call $f803    ; $0c9e cd 03 f8
   mvi h,$00     ; $0ca1 26 00   
   mov l,a       ; $0ca3 6f      
   pop b         ; $0ca4 c1      
   push h        ; $0ca5 e5      
   jmp $02ef     ; $0ca6 c3 ef 02

NFA__28CR_29:    ; 0CA9
   .byte 4,"(CR)"
   .word NFA__28EMIT_29       ; 0C82
__28CR_29:       ; 0CB0 - 0CC1
   call _FCALL            ; 0CB0
   .word _LIT             ; 0CB3 0A2B - LIT
   .word $000D            ; 0CB5 000D
   .word _EMIT            ; 0CB7 153D - EMIT
   .word _LIT             ; 0CB9 0A2B - LIT
   .word $000A            ; 0CBB 000A
   .word _EMIT            ; 0CBD 153D - EMIT
   .word _EXIT            ; 0CBF 0315 - EXIT

NFA__3FTERMINAL:   ; 0CC1
   .byte 9,"?TERMINAL"
   .word NFA__28CR_29         ; 0CA9
__3FTERMINAL:      ; 0CCD
   push b        ; $0ccd c5      
   call $f812    ; $0cce cd 12 f8
   pop b         ; $0cd1 c1      
   lxi h,$0000   ; $0cd2 21 00 00
   ora a         ; $0cd5 b7      
   jz $0cda      ; $0cd6 ca da 0c
   dcx h         ; $0cd9 2b      
   push h        ; $0cda e5      
   jmp $02ef     ; $0cdb c3 ef 02

NFA__3FKEY:        ; 0CDE
   .byte 4,"?KEY"
   .word NFA__3FTERMINAL    ; 0CC1
__3FKEY:           ; 0CE5
   call $02e4    ; $0ce5 cd e4 02
   call $7a0c    ; $0ce8 cd 0c 7a
   ldax b        ; $0ceb 0a      
   ori $0c       ; $0cec f6 0c   
   sbb l         ; $0cee 9d      
   inr c         ; $0cef 0c      
   ani $0e       ; $0cf0 e6 0e   
   mov l,b       ; $0cf2 68      
   ldax b        ; $0cf3 0a      
   rm            ; $0cf4 f8      
   inr c         ; $0cf5 0c      
   di            ; $0cf6 f3      
   mvi c,$15     ; $0cf7 0e 15   
   inx b         ; $0cf9 03      

NFA_LEMIT:       ; 0CFA
   .byte 5,"LEMIT"
   .word NFA__3FKEY         ; 0CDE
_LEMIT:          ; 0D02 - None
   pop h         ; $0d02 e1      
   push b        ; $0d03 c5      
   mov c,l       ; $0d04 4d      
   call $f80f    ; $0d05 cd 0f f8
   pop b         ; $0d08 c1      
   jmp $02ef     ; $0d09 c3 ef 02

NFA_PRINT:       ; 0D0C
   .byte 5,"PRINT"
   .word NFA__3FKEY         ; 0CDE
_PRINT:          ; 0D14 - None
   call $02e4    ; $0d14 cd e4 02
   .word _LIT             ; $0d17 0A2B - LIT
   .word $0000            ; $0d19 0000
   .word __28_3FDO_29     ; $0d1b 0B0C - (?DO)
   .word $0D2B            ; $0d1d 0D2B
   .word _DUP             ; $0d1f 03D3 - DUP
   .word _C_40            ; $0d21 0991 - C@
   .word _LEMIT           ; $0d23 0D02 - LEMIT
   .word _1_2B            ; $0d25 0477 - 1+
   .word __28LOOP_29      ; $0d27 0B2E - (LOOP)
   .word $0D1F            ; $0d29 0D1F
   .word _DROP            ; $0d2b 0382 - DROP
   .word _EXIT            ; $0d2d 0315 - EXIT

NFA__28LEMIT_29: ; 0D2F
   .byte 7,"(LEMIT)"
   .word NFA__3FKEY         ; 0CDE
__28LEMIT_29:    ; 0D39 - None
   call $02e4    ; $0d39 cd e4 02
   .word _DUP             ; $0d3c 03D3 - DUP
   .word __28EMIT_29      ; $0d3e 0C8B - (EMIT)
   .word _LEMIT           ; $0d40 0D02 - LEMIT
   .word _EXIT            ; $0d42 0315 - EXIT

l0d44:
   shld $3422    ; $0d44 22 22 34
   lhld $341c    ; $0d47 2a 1c 34
   sphl          ; $0d4a f9      
   lhld $341a    ; $0d4b 2a 1a 34
   shld $341e    ; $0d4e 22 1e 34
   lxi b,l0178   ; $0d51 01 78 01 Адрес ФОРТ-программы
   jmp l02ef     ; $0d54 c3 ef 02 Передача управления

.storage 25,0x00

NFA_TITLE:       ; 0D70
   .byte 5,"TITLE"
   .word NFA__3FKEY         ; 0CDE
_TITLE:          ; 0D78
   call $02e4    ; $0d78 cd e4 02
   .word _CR              ; $0d7b 1566 - CR
   .word _LIT             ; $0d7d 0A2B - LIT
   .word $0012            ; $0d7f 0012
   .word _SPACES          ; $0d81 16D6 - SPACES
   .word __28_2E_22_29    ; $0d83 183E - (.")
   .byte 17,"fort-sistema ls-1"
   .word _CR              ; $0d97 1566 - CR
   .word _CR              ; $0d99 1566 - CR
   .word __28_2E_22_29    ; $0d9b 183E - (.")
   .byte 55,"standart FORTH-83 i assembler (C) niis~etma{ lgu, 1986."
   .word _CR              ; $0dd5 1566 - CR
   .word __28_2E_22_29    ; $0dd7 183E - (.")
   .byte 55,"redaktor, fajlowaq sistema, psewdografika i zagruz~ik -"
   .word _CR              ; $0e11 1566 - CR
   .word __28_2E_22_29    ; $0e13 183E - (.")
   .byte 55,"(C) lejdi s",0x17,"ft,  moskwa,   reg. udostowerenie A/225426."
   .word _CR              ; $0e4d 1566 - CR
   .word _CR              ; $0e4f 1566 - CR
   .word __28_2E_22_29    ; $0e51 183E - (.")
   .byte 55,"(C) lejdi C",0x17,"ft,  moskwa,   tel. 945-11-51,   i`nx 1988."
   .word _CR              ; $0e8b 1566 - CR
   .word _EXIT            ; $0e8d 0315 - EXIT

   mvi d,$3e     ; $0e8f 16 3e   
   .byte 0x18    ; $0e91 18      
   dcr d         ; $0e92 15      
   jpo $e2e9     ; $0e93 e2 e9 e2
   cpe $4fe9     ; $0e96 ec e9 4f
   mov d,h       ; $0e99 54      
   mov b,l       ; $0e9a 45      
   cpi $48       ; $0e9b fe 48   
   mov b,c       ; $0e9d 41      
   pop psw       ; $0e9e f1      
   .byte 0x20    ; $0e9f 20      
   rp            ; $0ea0 f0      
   cpe $202e     ; $0ea1 ec 2e 20
   cpo $202e     ; $0ea4 e4 2e 20
   sta $1566     ; $0ea7 32 66 15
   dcx h         ; $0eaa 2b      
   ldax b        ; $0eab 0a      
   ldax b        ; $0eac 0a      
   inr m         ; $0ead 34      
   add h         ; $0eae 84      
   dad b         ; $0eaf 09      
   rpo           ; $0eb0 e0      
   inx b         ; $0eb1 03      
   mov a,d       ; $0eb2 7a      
   ldax b        ; $0eb3 0a      
   cmp b         ; $0eb4 b8      
   mvi c,$2c     ; $0eb5 0e 2c   
   inx b         ; $0eb7 03      
   dcr d         ; $0eb8 15      
   inx b         ; $0eb9 03      

NFA__2D1:        ; 0EBA
   .byte 2,"-1"
   .word NFA_TITLE        ; 0D70
__2D1:           ; 0EBF - 0EC4
   call $0984    ; $0ebf cd 84 09
   .word $FFFF   ; $0ec2 ff ff

NFA_0:           ; 0EC4
   .byte 1,"0"
   .word NFA__2D1           ; 0EBA
_0:              ; 0EC8 - 0ECD
   call $0984    ; cd
   .word $0000

NFA_1:           ; 0ECD
   .byte 1,"1"
   .word NFA_0            ; 0EC4
_1:              ; 0ED1 - 0ED6
   call $0984    ; cd
   .word $0001

NFA_2:           ; 0ED6
   .byte 1,"2"
   .word NFA_1            ; 0ECD
_2:              ; 0EDA - 0EDF
   call $0984    ; $0eda cd 84 09
   .word $0002

NFA_TRUE:        ; 0EDF
   .byte 4,"TRUE"
   .word $0ED6   ; NFA_2            ; 0ED6
_TRUE:           ; 0EE6
   call $0984    ; $0ee6 cd 84 09
   rst 7         ; $0ee9 ff      
   rst 7         ; $0eea ff      

NFA_FALSE:       ; 0EEB
   .byte 5,"FALSE"
   .word NFA_TRUE         ; 0EDF
_FALSE:          ; 0EF3
   call $0984    ; cd   
   nop           ; $0ef6 00      
   nop           ; $0ef7 00      

NFA_HERE:        ; 0EF8
   .byte 4,"HERE"
   .word NFA_FALSE        ; 0EEB
_HERE:           ; 0EFF - 0F08
   call _FCALL            ; 0EFF
   .word _H               ; $0f02 01D1 - H
   .word __40             ; $0f04 0984 - @
   .word _EXIT            ; $0f06 0315 - EXIT

NFA_ALLOT:       ; 0F08
   .byte 5,"ALLOT"
   .word NFA_HERE         ; 0EF8
_ALLOT:          ; 0F10 - 0F19
   call _FCALL            ; 0F10
   .word _H               ; $0f13 01D1 - H
   .word __2B_21          ; $0f15 09DA - +!
   .word _EXIT            ; $0f17 0315 - EXIT

NFA__2C:         ; 0F19
   .byte 1,","
   .word NFA_ALLOT        ; 0F08
__2C:            ; 0F1D - 0F2A
   call _FCALL            ; 0F1D
   .word _HERE            ; $0f20 0EFF - HERE
   .word _2               ; $0f22 0EDA - 2
   .word _ALLOT           ; $0f24 0F10 - ALLOT
   .word __21             ; $0f26 099D - !
   .word _EXIT            ; $0f28 0315 - EXIT

NFA_C_2C:        ; 0F2A
   .byte 2,"C,"
   .word NFA__2C            ; 0F19
_C_2C:           ; 0F2F - 0F3C
   call _FCALL            ; 0F2F
   .word _HERE            ; $0f32 0EFF - HERE
   .word _1               ; $0f34 0ED1 - 1
   .word _ALLOT           ; $0f36 0F10 - ALLOT
   .word _C_21            ; $0f38 09AA - C!
   .word _EXIT            ; $0f3a 0315 - EXIT

NFA__22_2C:      ; 0F3C
   .byte 2,"\","
   .word NFA_C_2C           ; 0F2A
__22_2C:         ; 0F41 - 0F54
   call _FCALL            ; 0F41
   .word _HERE            ; $0f44 0EFF - HERE
   .word _OVER            ; $0f46 0362 - OVER
   .word _C_40            ; $0f48 0991 - C@
   .word _1_2B            ; $0f4a 0477 - 1+
   .word _DUP             ; $0f4c 03D3 - DUP
   .word _ALLOT           ; $0f4e 0F10 - ALLOT
   .word _CMOVE           ; $0f50 0B7C - CMOVE
   .word _EXIT            ; $0f52 0315 - EXIT

NFA_PAD:         ; 0F54
   .byte 3,"PAD"
   .word NFA__22_2C           ; 0F3C
_PAD:            ; 0F5A - 0F67
   call _FCALL            ; 0F5A
   .word _HERE            ; $0f5d 0EFF - HERE
   .word _LIT             ; $0f5f 0A2B - LIT
   .word $0054            ; $0f61 0054
   .word __2B             ; $0f63 044A - +
   .word _EXIT            ; $0f65 0315 - EXIT

NFA_COUNT:       ; 0F67
   .byte 5,"COUNT"
   .word NFA_PAD          ; 0F54
_COUNT:          ; 0F6F
   pop h         ; $0f6f e1      
   mvi d,$00     ; $0f70 16 00   
   mov e,m       ; $0f72 5e      
   inx h         ; $0f73 23      
   push h        ; $0f74 e5      
   push d        ; $0f75 d5      
   jmp $02ef     ; $0f76 c3 ef 02

NFA_COMPILE:     ; 0F79
   .byte 7,"COMPILE"
   .word NFA_COUNT        ; 0F67
_COMPILE:        ; 0F83 - 0F94
   call _FCALL            ; 0F83
   .word _R_3E            ; $0f86 0920 - R>
   .word _DUP             ; $0f88 03D3 - DUP
   .word _2_2B            ; $0f8a 0482 - 2+
   .word __3ER            ; $0f8c 090D - >R
   .word __40             ; $0f8e 0984 - @
   .word __2C             ; $0f90 0F1D - ,
   .word _EXIT            ; $0f92 0315 - EXIT

NFA_S_3ED:       ; 0F94
   .byte 3,"S>D"
   .word NFA_COMPILE      ; 0F79
_S_3ED:          ; 0F9A - 0FA3
   call _FCALL            ; 0F9A
   .word _DUP             ; $0f9d 03D3 - DUP
   .word _0_3C            ; $0f9f 053D - 0<
   .word _EXIT            ; $0fa1 0315 - EXIT

NFA_M_2A:        ; 0FA3
   .byte 2,"M*"
   .word NFA_S_3ED          ; 0F94
_M_2A:           ; 0FA8 - 0FC5
   call _FCALL            ; 0FA8
   .word _2DUP            ; $0fab 03F2 - 2DUP
   .word _XOR             ; $0fad 08EB - XOR
   .word __3ER            ; $0faf 090D - >R
   .word _ABS             ; $0fb1 04B1 - ABS
   .word _SWAP            ; $0fb3 038D - SWAP
   .word _ABS             ; $0fb5 04B1 - ABS
   .word _UM_2A           ; $0fb7 06C7 - UM*
   .word _R_3E            ; $0fb9 0920 - R>
   .word _0_3C            ; $0fbb 053D - 0<
   .word __3FBRANCH       ; $0fbd 0A7A - ?BRANCH
   .word $0FC3            ; $0fbf 0FC3
   .word _DNEGATE         ; $0fc1 0620 - DNEGATE
   .word _EXIT            ; $0fc3 0315 - EXIT

NFA__2F:         ; 0FC5
   .byte 1,"/"
   .word NFA_M_2A           ; 0FA3
__2F:            ; 0FC9 - 0FD2
   call _FCALL            ; 0FC9
   .word __2FMOD          ; $0fcc 07E2 - /MOD
   .word _PRESS           ; $0fce 0410 - PRESS
   .word _EXIT            ; $0fd0 0315 - EXIT

NFA_MOD:         ; 0FD2
   .byte 3,"MOD"
   .word NFA__2F            ; 0FC5
_MOD:            ; 0FD8 - 0FE1
   call _FCALL            ; 0FD8
   .word __2FMOD          ; $0fdb 07E2 - /MOD
   .word _DROP            ; $0fdd 0382 - DROP
   .word _EXIT            ; $0fdf 0315 - EXIT

NFA_DABS:        ; 0FE1
   .byte 4,"DABS"
   .word NFA_MOD          ; 0FD2
_DABS:           ; 0FE8 - 0FF7
   call _FCALL            ; 0FE8
   .word _DUP             ; $0feb 03D3 - DUP
   .word _0_3C            ; $0fed 053D - 0<
   .word __3FBRANCH       ; $0fef 0A7A - ?BRANCH
   .word $0FF5            ; $0ff1 0FF5
   .word _DNEGATE         ; $0ff3 0620 - DNEGATE
   .word _EXIT            ; $0ff5 0315 - EXIT

NFA_U_2F:        ; 0FF7
   .byte 2,"U/"
   .word NFA_DABS         ; 0FE1
_U_2F:           ; 0FFC - 1005
   call _FCALL            ; 0FFC
   .word _U_2FMOD         ; $0fff 082B - U/MOD
   .word _PRESS           ; $1001 0410 - PRESS
   .word _EXIT            ; $1003 0315 - EXIT

NFA_UM_2FMOD:    ; 1005
   .byte 6,"UM/MOD"
   .word NFA_U_2F           ; 0FF7
_UM_2FMOD:       ; 100E - 101B
   call _FCALL            ; 100E
   .word _0               ; $1011 0EC8 - 0
   .word _DU_2FMOD        ; $1013 06F9 - DU/MOD
   .word _DROP            ; $1015 0382 - DROP
   .word _PRESS           ; $1017 0410 - PRESS
   .word _EXIT            ; $1019 0315 - EXIT

NFA_M_2FMOD:     ; 101B
   .byte 5,"M/MOD"
   .word NFA_UM_2FMOD       ; 1005
_M_2FMOD:        ; 1023 - 106C
   call _FCALL            ; 1023
   .word __3FDUP          ; $1026 03E0 - ?DUP
   .word __3FBRANCH       ; $1028 0A7A - ?BRANCH
   .word $106A            ; $102a 106A
   .word _DUP             ; $102c 03D3 - DUP
   .word __3ER            ; $102e 090D - >R
   .word _2DUP            ; $1030 03F2 - 2DUP
   .word _XOR             ; $1032 08EB - XOR
   .word __3ER            ; $1034 090D - >R
   .word __3ER            ; $1036 090D - >R
   .word _DABS            ; $1038 0FE8 - DABS
   .word _R_40            ; $103a 0933 - R@
   .word _ABS             ; $103c 04B1 - ABS
   .word _UM_2FMOD        ; $103e 100E - UM/MOD
   .word _SWAP            ; $1040 038D - SWAP
   .word _R_3E            ; $1042 0920 - R>
   .word _0_3C            ; $1044 053D - 0<
   .word __3FBRANCH       ; $1046 0A7A - ?BRANCH
   .word $104C            ; $1048 104C
   .word _NEGATE          ; $104a 046A - NEGATE
   .word _SWAP            ; $104c 038D - SWAP
   .word _R_3E            ; $104e 0920 - R>
   .word _0_3C            ; $1050 053D - 0<
   .word __3FBRANCH       ; $1052 0A7A - ?BRANCH
   .word $1068            ; $1054 1068
   .word _NEGATE          ; $1056 046A - NEGATE
   .word _OVER            ; $1058 0362 - OVER
   .word __3FBRANCH       ; $105a 0A7A - ?BRANCH
   .word $1068            ; $105c 1068
   .word _1_2D            ; $105e 048E - 1-
   .word _R_40            ; $1060 0933 - R@
   .word _ROT             ; $1062 03B6 - ROT
   .word __2D             ; $1064 0455 - -
   .word _SWAP            ; $1066 038D - SWAP
   .word _RDROP           ; $1068 0975 - RDROP
   .word _EXIT            ; $106a 0315 - EXIT

NFA__2A_2FMOD:   ; 106C
   .byte 5,"*/MOD"
   .word NFA_M_2FMOD        ; 101B
__2A_2FMOD:      ; 1074 - 1081
   call _FCALL            ; 1074
   .word __3ER            ; $1077 090D - >R
   .word _M_2A            ; $1079 0FA8 - M*
   .word _R_3E            ; $107b 0920 - R>
   .word _M_2FMOD         ; $107d 1023 - M/MOD
   .word _EXIT            ; $107f 0315 - EXIT

NFA__2A_2F:      ; 1081
   .byte 2,"*/"
   .word NFA__2A_2FMOD        ; 106C
__2A_2F:         ; 1086 - 108F
   call _FCALL            ; 1086
   .word __2A_2FMOD       ; $1089 1074 - */MOD
   .word _PRESS           ; $108b 0410 - PRESS
   .word _EXIT            ; $108d 0315 - EXIT

NFA__3C_3E:      ; 108F
   .byte 2,"<>"
   .word NFA__2A_2F           ; 1081
__3C_3E:         ; 1094 - 109D
   call _FCALL            ; 1094
   .word __3D             ; $1097 0566 - =
   .word _0_3D            ; $1099 057E - 0=
   .word _EXIT            ; $109b 0315 - EXIT

NFA_QUIT:        ; 109D
   .byte 4,"QUIT"
   .word NFA__3C_3E           ; 108F
_QUIT:           ; 10A4 - 10CD
   call _FCALL            ; 10A4
   .word _LIT             ; $10a7 0A2B - LIT
   .word $3400            ; $10a9 3400
   .word __40             ; $10ab 0984 - @
   .word __3FDUP          ; $10ad 03E0 - ?DUP
   .word __3FBRANCH       ; $10af 0A7A - ?BRANCH
   .word $10B5            ; $10b1 10B5
   .word _EXECUTE         ; $10b3 032C - EXECUTE
   .word _R0              ; $10b5 01B4 - R0
   .word __40             ; $10b7 0984 - @
   .word _RP_21           ; $10b9 0950 - RP!
   .word $162A            ; $10bb 162A
   .word __5B             ; $10bd 1771 - [
   .word _FORTH           ; $10bf 3450 - FORTH
   .word _DEFINITIONS     ; $10c1 170A - DEFINITIONS
   .word _QUERY           ; $10c3 15F1 - QUERY
   .word _INTERPRET       ; $10c5 19C1 - INTERPRET
   .word _BRANCH          ; $10c7 0A68 - BRANCH
   .word $10C3            ; $10c9 10C3
   .word _EXIT            ; $10cb 0315 - EXIT

NFA_ABORT:       ; 10CD
   .byte 5,"ABORT"
   .word NFA_QUIT         ; 109D
_ABORT:          ; 10D5 - 113F
   call _FCALL            ; 10D5
   .word _LIT             ; $10d8 0A2B - LIT
   .word $3402            ; $10da 3402
   .word __40             ; $10dc 0984 - @
   .word __3FDUP          ; $10de 03E0 - ?DUP
   .word __3FBRANCH       ; $10e0 0A7A - ?BRANCH
   .word $10E6            ; $10e2 10E6
   .word _EXECUTE         ; $10e4 032C - EXECUTE
   .word _BLK             ; $10e6 02B1 - BLK
   .word __40             ; $10e8 0984 - @
   .word __3FDUP          ; $10ea 03E0 - ?DUP
   .word __3FBRANCH       ; $10ec 0A7A - ?BRANCH
   .word $1135            ; $10ee 1135
   .word _CR              ; $10f0 1566 - CR
   .word __28_2E_22_29    ; $10f2 183E - (.")
   .byte 14,"O",0xfb,0xe9,0xe2,"KA: ",0xfc,"KPAH "
   .word __2E             ; $1103 12FE - .
   .word __28_2E_22_29    ; $1105 183E - (.")
   .byte 7,"CTPOKA "
   .word __3EIN           ; $110f 0276 - >IN
   .word __40             ; $1111 0984 - @
   .word _LIT             ; $1113 0A2B - LIT
   .word $0040            ; $1115 0040
   .word _U_2F            ; $1117 0FFC - U/
   .word _DUP             ; $1119 03D3 - DUP
   .word __2E             ; $111b 12FE - .
   .word _CR              ; $111d 1566 - CR
   .word _BLK             ; $111f 02B1 - BLK
   .word __40             ; $1121 0984 - @
   .word _BLOCK           ; $1123 2CFD - BLOCK
   .word _SWAP            ; $1125 038D - SWAP
   .word _LIT             ; $1127 0A2B - LIT
   .word $0040            ; $1129 0040
   .word __2A             ; $112b 069B - *
   .word __2B             ; $112d 044A - +
   .word _LIT             ; $112f 0A2B - LIT
   .word $0040            ; $1131 0040
   .word _TYPE            ; $1133 157E - TYPE
   .word _S0              ; $1135 01BE - S0
   .word __40             ; $1137 0984 - @
   .word _SP_21           ; $1139 0441 - SP!
   .word _QUIT            ; $113b 10A4 - QUIT
   .word _EXIT            ; $113d 0315 - EXIT

NFA__28ABORT_22_29:; 113F
   .byte 8,"(ABORT\")"
   .word NFA_ABORT        ; 10CD
__28ABORT_22_29: ; 114A
   call $02e4    ; $114a cd e4 02
   .word __3FBRANCH       ; $114d 0A7A - ?BRANCH
   .word $1161            ; $114f 1161
   .word _HERE            ; $1151 0EFF - HERE
   .word _ID_2E           ; $1153 16ED - ID.
   .word _SPACE           ; $1155 16C4 - SPACE
   .word _R_3E            ; $1157 0920 - R>
   .word _ID_2E           ; $1159 16ED - ID.
   .word _ABORT           ; $115b 10D5 - ABORT
   .word _BRANCH          ; $115d 0A68 - BRANCH
   .word $116D            ; $115f 116D
   .word _R_3E            ; $1161 0920 - R>
   .word _DUP             ; $1163 03D3 - DUP
   .word _C_40            ; $1165 0991 - C@
   .word _1_2B            ; $1167 0477 - 1+
   .word __2B             ; $1169 044A - +
   .word __3ER            ; $116b 090D - >R
   .word _EXIT            ; $116d 0315 - EXIT

NFA_ABORT_22:    ; 116F
   .byte 0x86,"ABORT\"" ; IMMEDIATE
   .word NFA__28ABORT_22_29     ; 113F
_ABORT_22:       ; 1178 - 118B
   call _FCALL            ; 1178
   .word __3FCOMP         ; $117b 1C26 - ?COMP
   .word _COMPILE         ; $117d 0F83 - COMPILE
   .word __28ABORT_22_29  ; $117f 114A - (ABORT")
   .word _LIT             ; $1181 0A2B - LIT
   .word $0022            ; $1183 0022
   .word _WORD            ; $1185 13ED - WORD
   .word __22_2C          ; $1187 0F41 - ",
   .word _EXIT            ; $1189 0315 - EXIT

NFA__23_3E:      ; 118B
   .byte 2,"#>"
   .word NFA_ABORT_22       ; 116F
__23_3E:         ; 1190 - 11A1
   call _FCALL            ; 1190
   .word _2DROP           ; $1193 0403 - 2DROP
   .word _HLD             ; $1195 0249 - HLD
   .word __40             ; $1197 0984 - @
   .word _PAD             ; $1199 0F5A - PAD
   .word _OVER            ; $119b 0362 - OVER
   .word __2D             ; $119d 0455 - -
   .word _EXIT            ; $119f 0315 - EXIT

NFA__3C_23:      ; 11A1
   .byte 2,"<#"
   .word NFA__23_3E           ; 118B
__3C_23:         ; 11A6 - 11B1
   call _FCALL            ; 11A6
   .word _PAD             ; $11a9 0F5A - PAD
   .word _HLD             ; $11ab 0249 - HLD
   .word __21             ; $11ad 099D - !
   .word _EXIT            ; $11af 0315 - EXIT

NFA_HOLD:        ; 11B1
   .byte 4,"HOLD"
   .word NFA__3C_23           ; 11A1
_HOLD:           ; 11B8 - 11C7
   call _FCALL            ; 11B8
   .word _HLD             ; $11bb 0249 - HLD
   .word _1_2D_21         ; $11bd 0A1A - 1-!
   .word _HLD             ; $11bf 0249 - HLD
   .word __40             ; $11c1 0984 - @
   .word _C_21            ; $11c3 09AA - C!
   .word _EXIT            ; $11c5 0315 - EXIT

NFA_SIGN:        ; 11C7
   .byte 4,"SIGN"
   .word NFA_HOLD         ; 11B1
_SIGN:           ; 11CE - 11DF
   call _FCALL            ; 11CE
   .word _0_3C            ; $11d1 053D - 0<
   .word __3FBRANCH       ; $11d3 0A7A - ?BRANCH
   .word $11DD            ; $11d5 11DD
   .word _LIT             ; $11d7 0A2B - LIT
   .word $002D            ; $11d9 002D
   .word _HOLD            ; $11db 11B8 - HOLD
   .word _EXIT            ; $11dd 0315 - EXIT

NFA__3EDIG:      ; 11DF
   .byte 4,">DIG"
   .word NFA_SIGN         ; 11C7
__3EDIG:         ; 11E6 - 1205
   call _FCALL            ; 11E6
   .word _LIT             ; $11e9 0A2B - LIT
   .word $0009            ; $11eb 0009
   .word _OVER            ; $11ed 0362 - OVER
   .word _U_3C            ; $11ef 04FA - U<
   .word __3FBRANCH       ; $11f1 0A7A - ?BRANCH
   .word $11FD            ; $11f3 11FD
   .word _LIT             ; $11f5 0A2B - LIT
   .word $0037            ; $11f7 0037
   .word _BRANCH          ; $11f9 0A68 - BRANCH
   .word $1201            ; $11fb 1201
   .word _LIT             ; $11fd 0A2B - LIT
   .word $0030            ; $11ff 0030
   .word __2B             ; $1201 044A - +
   .word _EXIT            ; $1203 0315 - EXIT

NFA__23:         ; 1205
   .byte 1,"#"
   .word NFA__3EDIG         ; 11DF
__23:            ; 1209 - 1220
   call _FCALL            ; 1209
   .word _BASE            ; $120c 0208 - BASE
   .word __40             ; $120e 0984 - @
   .word _0               ; $1210 0EC8 - 0
   .word _DU_2FMOD        ; $1212 06F9 - DU/MOD
   .word _ROT             ; $1214 03B6 - ROT
   .word _DROP            ; $1216 0382 - DROP
   .word _ROT             ; $1218 03B6 - ROT
   .word __3EDIG          ; $121a 11E6 - >DIG
   .word _HOLD            ; $121c 11B8 - HOLD
   .word _EXIT            ; $121e 0315 - EXIT

NFA__23_2E:      ; 1220
   .byte 2,"#."
   .word NFA__23            ; 1205
__23_2E:         ; 1225 - 1236
   call _FCALL            ; 1225
   .word _BASE            ; $1228 0208 - BASE
   .word __40             ; $122a 0984 - @
   .word _U_2FMOD         ; $122c 082B - U/MOD
   .word _SWAP            ; $122e 038D - SWAP
   .word __3EDIG          ; $1230 11E6 - >DIG
   .word _HOLD            ; $1232 11B8 - HOLD
   .word _EXIT            ; $1234 0315 - EXIT

NFA__23_2ES:     ; 1236
   .byte 3,"#.S"
   .word NFA__23_2E           ; 1220
__23_2ES:        ; 123C - 124B
   call _FCALL            ; 123C
   .word __23_2E          ; $123f 1225 - #.
   .word _DUP             ; $1241 03D3 - DUP
   .word _0_3D            ; $1243 057E - 0=
   .word __3FBRANCH       ; $1245 0A7A - ?BRANCH
   .word $123F            ; $1247 123F
   .word _EXIT            ; $1249 0315 - EXIT

NFA__23S:        ; 124B
   .byte 2,"#S"
   .word NFA__23_2ES          ; 1236
__23S:           ; 1250 - 1261
   call _FCALL            ; 1250
   .word __23             ; $1253 1209 - #
   .word _2DUP            ; $1255 03F2 - 2DUP
   .word _OR              ; $1257 08D9 - OR
   .word _0_3D            ; $1259 057E - 0=
   .word __3FBRANCH       ; $125b 0A7A - ?BRANCH
   .word $1253            ; $125d 1253
   .word _EXIT            ; $125f 0315 - EXIT

NFA_D_2ER:       ; 1261
   .byte 3,"D.R"
   .word NFA__23S           ; 124B
_D_2ER:          ; 1267 - 1288
   call _FCALL            ; 1267
   .word __3ER            ; $126a 090D - >R
   .word _DUP             ; $126c 03D3 - DUP
   .word __3ER            ; $126e 090D - >R
   .word _DABS            ; $1270 0FE8 - DABS
   .word __3C_23          ; $1272 11A6 - <#
   .word __23S            ; $1274 1250 - #S
   .word _R_3E            ; $1276 0920 - R>
   .word _SIGN            ; $1278 11CE - SIGN
   .word __23_3E          ; $127a 1190 - #>
   .word _R_3E            ; $127c 0920 - R>
   .word _OVER            ; $127e 0362 - OVER
   .word __2D             ; $1280 0455 - -
   .word _SPACES          ; $1282 16D6 - SPACES
   .word _TYPE            ; $1284 157E - TYPE
   .word _EXIT            ; $1286 0315 - EXIT

NFA_D_2E:        ; 1288
   .byte 2,"D."
   .word NFA_D_2ER          ; 1261
_D_2E:           ; 128D - 12A6
   call _FCALL            ; 128D
   .word _DUP             ; $1290 03D3 - DUP
   .word __3ER            ; $1292 090D - >R
   .word _DABS            ; $1294 0FE8 - DABS
   .word __3C_23          ; $1296 11A6 - <#
   .word __23S            ; $1298 1250 - #S
   .word _R_3E            ; $129a 0920 - R>
   .word _SIGN            ; $129c 11CE - SIGN
   .word __23_3E          ; $129e 1190 - #>
   .word _TYPE            ; $12a0 157E - TYPE
   .word _SPACE           ; $12a2 16C4 - SPACE
   .word _EXIT            ; $12a4 0315 - EXIT

NFA__2ER:        ; 12A6
   .byte 2,".R"
   .word NFA_D_2E           ; 1288
__2ER:           ; 12AB - 12CE
   call _FCALL            ; 12AB
   .word __3ER            ; $12ae 090D - >R
   .word _DUP             ; $12b0 03D3 - DUP
   .word __3ER            ; $12b2 090D - >R
   .word _ABS             ; $12b4 04B1 - ABS
   .word __3C_23          ; $12b6 11A6 - <#
   .word __23_2ES         ; $12b8 123C - #.S
   .word _R_3E            ; $12ba 0920 - R>
   .word _SIGN            ; $12bc 11CE - SIGN
   .word _0               ; $12be 0EC8 - 0
   .word __23_3E          ; $12c0 1190 - #>
   .word _R_3E            ; $12c2 0920 - R>
   .word _OVER            ; $12c4 0362 - OVER
   .word __2D             ; $12c6 0455 - -
   .word _SPACES          ; $12c8 16D6 - SPACES
   .word _TYPE            ; $12ca 157E - TYPE
   .word _EXIT            ; $12cc 0315 - EXIT

NFA__2E0:        ; 12CE
   .byte 2,".0"
   .word NFA__2ER           ; 12A6
__2E0:           ; 12D3 - 12FA
   call _FCALL            ; 12D3
   .word __3ER            ; $12d6 090D - >R
   .word __3C_23          ; $12d8 11A6 - <#
   .word __23_2ES         ; $12da 123C - #.S
   .word _0               ; $12dc 0EC8 - 0
   .word __23_3E          ; $12de 1190 - #>
   .word _R_3E            ; $12e0 0920 - R>
   .word _OVER            ; $12e2 0362 - OVER
   .word __2D             ; $12e4 0455 - -
   .word _0               ; $12e6 0EC8 - 0
   .word __28_3FDO_29     ; $12e8 0B0C - (?DO)
   .word $12F6            ; $12ea 12F6
   .word _LIT             ; $12ec 0A2B - LIT
   .word $0030            ; $12ee 0030
   .word _EMIT            ; $12f0 153D - EMIT
   .word __28LOOP_29      ; $12f2 0B2E - (LOOP)
   .word $12EC            ; $12f4 12EC
   .word _TYPE            ; $12f6 157E - TYPE
   .word _EXIT            ; $12f8 0315 - EXIT

NFA__2E:         ; 12FA
   .byte 1,"."
   .word NFA__2E0           ; 12CE
__2E:            ; 12FE - 1319
   call _FCALL            ; 12FE
   .word _DUP             ; $1301 03D3 - DUP
   .word __3ER            ; $1303 090D - >R
   .word _ABS             ; $1305 04B1 - ABS
   .word __3C_23          ; $1307 11A6 - <#
   .word __23_2ES         ; $1309 123C - #.S
   .word _R_3E            ; $130b 0920 - R>
   .word _SIGN            ; $130d 11CE - SIGN
   .word _0               ; $130f 0EC8 - 0
   .word __23_3E          ; $1311 1190 - #>
   .word _TYPE            ; $1313 157E - TYPE
   .word _SPACE           ; $1315 16C4 - SPACE
   .word _EXIT            ; $1317 0315 - EXIT

NFA_U_2E:        ; 1319
   .byte 2,"U."
   .word NFA__2E            ; 12FA
_U_2E:           ; 131E - 1327
   call _FCALL            ; 131E
   .word _0               ; $1321 0EC8 - 0
   .word _D_2E            ; $1323 128D - D.
   .word _EXIT            ; $1325 0315 - EXIT

NFA_CFL:         ; 1327
   .byte 3,"CFL"
   .word NFA_U_2E           ; 1319
_CFL:            ; 132D - 1332
   call $0984    ; $132d cd 84 09
   inx b         ; $1330 03      
   nop           ; $1331 00      

NFA__3EBODY:     ; 1332
   .byte 5,">BODY"
   .word NFA_CFL          ; 1327
__3EBODY:        ; 133A - 1343
   call _FCALL            ; 133A
   .word _CFL             ; $133d 132D - CFL
   .word __2B             ; $133f 044A - +
   .word _EXIT            ; $1341 0315 - EXIT

NFA_BODY_3E:     ; 1343
   .byte 5,"BODY>"
   .word NFA__3EBODY        ; 1332
_BODY_3E:        ; 134B - 1354
   call _FCALL            ; 134B
   .word _CFL             ; $134e 132D - CFL
   .word __2D             ; $1350 0455 - -
   .word _EXIT            ; $1352 0315 - EXIT

NFA__3ELINK:     ; 1354
   .byte 5,">LINK"
   .word NFA_BODY_3E        ; 1343
__3ELINK:        ; 135C - 1363
   call _FCALL            ; 135C
   .word _2_2D            ; $135f 0499 - 2-
   .word _EXIT            ; $1361 0315 - EXIT

NFA_LINK_3E:     ; 1363
   .byte 5,"LINK>"
   .word NFA__3ELINK        ; 1354
_LINK_3E:        ; 136B - 1372
   call _FCALL            ; 136B
   .word _2_2B            ; $136e 0482 - 2+
   .word _EXIT            ; $1370 0315 - EXIT

NFA_N_3ELINK:    ; 1372
   .byte 6,"N>LINK"
   .word NFA_LINK_3E        ; 1363
_N_3ELINK:       ; 137B - 138A
   call _FCALL            ; 137B
   .word _COUNT           ; $137e 0F6F - COUNT
   .word _LIT             ; $1380 0A2B - LIT
   .word $003F            ; $1382 003F
   .word _AND             ; $1384 08C8 - AND
   .word __2B             ; $1386 044A - +
   .word _EXIT            ; $1388 0315 - EXIT

NFA_NAME_3E:     ; 138A
   .byte 5,"NAME>"
   .word NFA_N_3ELINK       ; 1372
_NAME_3E:        ; 1392 - 139B
   call _FCALL            ; 1392
   .word _N_3ELINK        ; $1395 137B - N>LINK
   .word _LINK_3E         ; $1397 136B - LINK>
   .word _EXIT            ; $1399 0315 - EXIT

NFA_L_3ENAME:    ; 139B
   .byte 6,"L>NAME"
   .word NFA_NAME_3E        ; 138A
_L_3ENAME:       ; 13A4 - 13D5
   call _FCALL            ; 13A4
   .word _LIT             ; $13a7 0A2B - LIT
   .word $0020            ; $13a9 0020
   .word _2               ; $13ab 0EDA - 2
   .word __28DO_29        ; $13ad 0AE5 - (DO)
   .word $13D3            ; $13af 13D3
   .word _DUP             ; $13b1 03D3 - DUP
   .word _I               ; $13b3 0A9F - I
   .word __2D             ; $13b5 0455 - -
   .word _C_40            ; $13b7 0991 - C@
   .word _LIT             ; $13b9 0A2B - LIT
   .word $007F            ; $13bb 007F
   .word _AND             ; $13bd 08C8 - AND
   .word _1_2B            ; $13bf 0477 - 1+
   .word _I               ; $13c1 0A9F - I
   .word __3D             ; $13c3 0566 - =
   .word __3FBRANCH       ; $13c5 0A7A - ?BRANCH
   .word $13CF            ; $13c7 13CF
   .word _I               ; $13c9 0A9F - I
   .word __2D             ; $13cb 0455 - -
   .word _LEAVE           ; $13cd 1C79 - LEAVE
   .word __28LOOP_29      ; $13cf 0B2E - (LOOP)
   .word $13B1            ; $13d1 13B1
   .word _EXIT            ; $13d3 0315 - EXIT

NFA__3ENAME:     ; 13D5
   .byte 5,">NAME"
   .word NFA_L_3ENAME       ; 139B
__3ENAME:        ; 13DD - 13E6
   call _FCALL            ; 13DD
   .word __3ELINK         ; $13e0 135C - >LINK
   .word _L_3ENAME        ; $13e2 13A4 - L>NAME
   .word _EXIT            ; $13e4 0315 - EXIT

NFA_WORD:        ; 13E6
   .byte 4,"WORD"
   .word NFA__3ENAME        ; 13D5
_WORD:           ; 13ED - 1468
   call _FCALL            ; 13ED
   .word _LIT             ; $13f0 0A2B - LIT
   .word $3416            ; $13f2 3416
   .word __40             ; $13f4 0984 - @
   .word __3FDUP          ; $13f6 03E0 - ?DUP
   .word __3FBRANCH       ; $13f8 0A7A - ?BRANCH
   .word $1400            ; $13fa 1400
   .word _EXECUTE         ; $13fc 032C - EXECUTE
   .word _EXIT            ; $13fe 0315 - EXIT
   .word _BLK             ; $1400 02B1 - BLK
   .word __40             ; $1402 0984 - @
   .word __3FDUP          ; $1404 03E0 - ?DUP
   .word __3FBRANCH       ; $1406 0A7A - ?BRANCH
   .word $1416            ; $1408 1416
   .word _BLOCK           ; $140a 2CFD - BLOCK
   .word _DUP             ; $140c 03D3 - DUP
   .word _INB             ; $140e 025F - INB
   .word __21             ; $1410 099D - !
   .word _BRANCH          ; $1412 0A68 - BRANCH
   .word $1418            ; $1414 1418
   .word _TIB             ; $1416 02CB - TIB
   .word __3EIN           ; $1418 0276 - >IN
   .word __40             ; $141a 0984 - @
   .word __2B             ; $141c 044A - +
   .word __23TIB          ; $141e 026B - #TIB
   .word __40             ; $1420 0984 - @
   .word __3EIN           ; $1422 0276 - >IN
   .word __40             ; $1424 0984 - @
   .word __2D             ; $1426 0455 - -
   .word _ENCLOSE         ; $1428 0C33 - ENCLOSE
   .word __3FBRANCH       ; $142a 0A7A - ?BRANCH
   .word $143C            ; $142c 143C
   .word _INB             ; $142e 025F - INB
   .word __40             ; $1430 0984 - @
   .word __2D             ; $1432 0455 - -
   .word __3EIN           ; $1434 0276 - >IN
   .word __21             ; $1436 099D - !
   .word _BRANCH          ; $1438 0A68 - BRANCH
   .word $1448            ; $143a 1448
   .word __23TIB          ; $143c 026B - #TIB
   .word __40             ; $143e 0984 - @
   .word __3EIN           ; $1440 0276 - >IN
   .word __21             ; $1442 099D - !
   .word _0               ; $1444 0EC8 - 0
   .word _0               ; $1446 0EC8 - 0
   .word _DUP             ; $1448 03D3 - DUP
   .word _HERE            ; $144a 0EFF - HERE
   .word _C_21            ; $144c 09AA - C!
   .word _HERE            ; $144e 0EFF - HERE
   .word _1_2B            ; $1450 0477 - 1+
   .word _SWAP            ; $1452 038D - SWAP
   .word _CMOVE           ; $1454 0B7C - CMOVE
   .word _HERE            ; $1456 0EFF - HERE
   .word _BL              ; $1458 16A6 - BL
   .word _OVER            ; $145a 0362 - OVER
   .word _DUP             ; $145c 03D3 - DUP
   .word _C_40            ; $145e 0991 - C@
   .word _1_2B            ; $1460 0477 - 1+
   .word __2B             ; $1462 044A - +
   .word _C_21            ; $1464 09AA - C!
   .word _EXIT            ; $1466 0315 - EXIT

NFA_C_2FL:       ; 1468
   .byte 3,"C/L"
   .word NFA_WORD         ; 13E6
_C_2FL:          ; 146E - 1473
   call $0984    ; $146e cd 84 09
   mov b,b       ; $1471 40      
   nop           ; $1472 00      

NFA_ST_2DC:      ; 1473
   .byte 4,"ST-C"
   .word $1468   ; NFA_C_2FL          ; 1468
_ST_2DC:         ; 147A - 147F
   call $0984    ; $147a cd 84 09
   .word $000d   ; $147d 000d      

NFA_B_2DSP:      ; 147F
   .byte 4,"B-SP"
   .word NFA_ST_2DC         ; 1473
_B_2DSP:         ; 1486 - 148B
   call $0984    ; $1486 cd 84 09
   .word 0x0008  ; $1489 0008      

NFA_C_3C_2D:     ; 148B
   .byte 3,"C<-"
   .word NFA_B_2DSP         ; 147F
_C_3C_2D:        ; 1491 - 1496
   call $0984    ; $1491 cd 84 09
   .word 0x0008  ; $1494 0008      

NFA_EXPECT:      ; 1496
   .byte 6,"EXPECT"
   .word NFA_C_3C_2D          ; 148B
_EXPECT:         ; 149F - 152C
   call _FCALL
   .word _LIT             ; 14A2 0A2B - LIT
   .word $3408            ; 14A4 3408
   .word __40             ; 14A6 0984 - @
   .word __3FDUP          ; 14A8 03E0 - ?DUP
   .word __3FBRANCH       ; 14AA 0A7A - ?BRANCH
   .word $14B2            ; 14AC 14B2
   .word _EXECUTE         ; 14AE 032C - EXECUTE
   .word _EXIT            ; 14B0 0315 - EXIT
   .word _OVER            ; 14B2 0362 - OVER
   .word _SWAP            ; 14B4 038D - SWAP
   .word _0               ; 14B6 0EC8 - 0
   .word __28_3FDO_29     ; 14B8 0B0C - (?DO)
   .word $1522            ; 14BA 1522
   .word _KEY             ; 14BC 1554 - KEY
   .word _DUP             ; 14BE 03D3 - DUP
   .word _B_2DSP          ; 14C0 1486 - B-SP
   .word __3D             ; 14C2 0566 - =
   .word _OVER            ; 14C4 0362 - OVER
   .word _C_3C_2D         ; 14C6 1491 - C<-
   .word __3D             ; 14C8 0566 - =
   .word _OR              ; 14CA 08D9 - OR
   .word __3FBRANCH       ; 14CC 0A7A - ?BRANCH
   .word $14FE            ; 14CE 14FE
   .word __3ER            ; 14D0 090D - >R
   .word _2DUP            ; 14D2 03F2 - 2DUP
   .word __3D             ; 14D4 0566 - =
   .word _N_3FBRANCH      ; 14D6 0A90 - N?BRANCH
   .word $14F2            ; 14D8 14F2
   .word _R_3E            ; 14DA 0920 - R>
   .word _DUP             ; 14DC 03D3 - DUP
   .word _EMIT            ; 14DE 153D - EMIT
   .word _BL              ; 14E0 16A6 - BL
   .word _EMIT            ; 14E2 153D - EMIT
   .word _EMIT            ; 14E4 153D - EMIT
   .word _1_2D            ; 14E6 048E - 1-
   .word _R_3E            ; 14E8 0920 - R>
   .word _1_2D            ; 14EA 048E - 1-
   .word __3ER            ; 14EC 090D - >R
   .word _BRANCH          ; 14EE 0A68 - BRANCH
   .word $14F4            ; 14F0 14F4
   .word _RDROP           ; 14F2 0975 - RDROP
   .word _R_3E            ; 14F4 0920 - R>
   .word _1_2D            ; 14F6 048E - 1-
   .word __3ER            ; 14F8 090D - >R
   .word _BRANCH          ; 14FA 0A68 - BRANCH
   .word $151E            ; 14FC 151E
   .word _DUP             ; 14FE 03D3 - DUP
   .word _ST_2DC          ; 1500 147A - ST-C
   .word __3D             ; 1502 0566 - =
   .word __3FBRANCH       ; 1504 0A7A - ?BRANCH
   .word $1514            ; 1506 1514
   .word _DROP            ; 1508 0382 - DROP
   .word _BL              ; 150A 16A6 - BL
   .word _EMIT            ; 150C 153D - EMIT
   .word _LEAVE           ; 150E 1C79 - LEAVE
   .word _BRANCH          ; 1510 0A68 - BRANCH
   .word $151E            ; 1512 151E
   .word _DUP             ; 1514 03D3 - DUP
   .word _EMIT            ; 1516 153D - EMIT
   .word _OVER            ; 1518 0362 - OVER
   .word _C_21            ; 151A 09AA - C!
   .word _1_2B            ; 151C 0477 - 1+
   .word __28LOOP_29      ; 151E 0B2E - (LOOP)
   .word $14BC            ; 1520 14BC
   .word _SWAP            ; 1522 038D - SWAP
   .word __2D             ; 1524 0455 - -
   .word _SPAN            ; 1526 029A - SPAN
   .word __21             ; 1528 099D - !
   .word _EXIT            ; 152A 0315 - EXIT

NFA_:            ; 152C
   .byte $80     ; "" (empty word) IMMEDIATE
   .word NFA_EXPECT       ; 1496
;_:               ; 152F - 1536
   call _FCALL
   .word _RDROP           ; 1532 0975 - RDROP
   .word _EXIT            ; 1534 0315 - EXIT

NFA_EMIT:        ; 1536
   .byte 4,"EMIT"
   .word NFA_             ; 152C
_EMIT:           ; 153D - 154E
   call _FCALL
   .word _LIT             ; 1540 0A2B - LIT
   .word $340E            ; 1542 340E
   .word __40             ; 1544 0984 - @
   .word _EXECUTE         ; 1546 032C - EXECUTE
   .word __3EOUT          ; 1548 02A6 - >OUT
   .word _1_2B_21         ; 154A 0A0A - 1+!
   .word _EXIT            ; 154C 0315 - EXIT

NFA_KEY:         ; 154E
   .byte 3,"KEY"
   .word NFA_EMIT         ; 1536
_KEY:            ; 1554 - 1561
   call _FCALL            ; 1554
   .word _LIT             ; 1557 0A2B - LIT
   .word $340C            ; 1559 340C
   .word __40             ; 155B 0984 - @
   .word _EXECUTE         ; 155D 032C - EXECUTE
   .word _EXIT            ; 155F 0315 - EXIT

NFA_CR:          ; 1561
   .byte 2,"CR"
   .word NFA_KEY          ; 154E
_CR:             ; 1566 - 1577
   call _FCALL            ; 1566
   .word _LIT             ; 1569 0A2B - LIT
   .word $3410            ; 156B 3410
   .word __40             ; 156D 0984 - @
   .word _EXECUTE         ; 156F 032C - EXECUTE
   .word __3EOUT          ; 1571 02A6 - >OUT
   .word _0_21            ; 1573 09FC - 0!
   .word _EXIT            ; 1575 0315 - EXIT

NFA_TYPE:        ; 1577
   .byte 4,"TYPE"
   .word NFA_CR           ; 1561
_TYPE:           ; 157E - 15A7
   call _FCALL
   .word _LIT             ; 1581 0A2B - LIT
   .word $3412            ; 1583 3412
   .word __40             ; 1585 0984 - @
   .word __3FDUP          ; 1587 03E0 - ?DUP
   .word __3FBRANCH       ; 1589 0A7A - ?BRANCH
   .word l1591            ; 158B 1591
   .word _EXECUTE         ; 158D 032C - EXECUTE
   .word _EXIT            ; 158F 0315 - EXIT
l1591:
   .word _0               ; 1591 0EC8 - 0
   .word __28_3FDO_29     ; 1593 0B0C - (?DO)
   .word l15A3            ; 1595 15A3
l1597:
   .word _DUP             ; 1597 03D3 - DUP
   .word _C_40            ; 1599 0991 - C@
   .word _EMIT            ; 159B 153D - EMIT
   .word _1_2B            ; 159D 0477 - 1+
   .word __28LOOP_29      ; 159F 0B2E - (LOOP)
   .word l1597            ; 15A1 1597
l15A3:
   .word _DROP            ; 15A3 0382 - DROP
   .word _EXIT            ; 15A5 0315 - EXIT

NFA_FORTH_2D83:  ; 15A7
   .byte 8,"FORTH-83"
   .word NFA_TYPE         ; 1577
_FORTH_2D83:     ; 15B2 - 15E9
   call _FCALL            ; 15B2
   .word _CR              ; $15b5 1566 - CR
   .word __28_2E_22_29    ; $15b7 183E - (.")
   .byte 17,"CTAHdAPT FORTH-83"
   .word _EXIT            ; $15cb 0315 - EXIT
   .word _NOT             ; $15cd 08FD - NOT
   .word _OR              ; $15cf 08D9 - OR
   .word __3FBRANCH       ; $15d1 0A7A - ?BRANCH
   .word $15DB            ; $15d3 15DB
   .word _DROP            ; $15d5 0382 - DROP
   .word _LIT             ; $15d7 0A2B - LIT
   .word $002E            ; $15d9 002E
   .word _EXIT            ; $15db 0315 - EXIT

.storage 12,0x00

NFA_QUERY:       ; 15E9
   .byte 5,"QUERY"
   .word NFA_FORTH_2D83     ; 15A7
_QUERY:          ; 15F1 - 166B
   call _FCALL            ; 15F1
   .word _CR              ; $15f4 1566 - CR
   .word _LIT             ; $15f6 0A2B - LIT
   .word $003E            ; $15f8 003E
   .word _EMIT            ; $15fa 153D - EMIT
   .word _TIB             ; $15fc 02CB - TIB
   .word _C_2FL           ; $15fe 146E - C/L
   .word _1_2D            ; $1600 048E - 1-
   .word _EXPECT          ; $1602 149F - EXPECT
   .word _SPAN            ; $1604 029A - SPAN
   .word __40             ; $1606 0984 - @
   .word _DUP             ; $1608 03D3 - DUP
   .word __23TIB          ; $160a 026B - #TIB
   .word __21             ; $160c 099D - !
   .word __3FBRANCH       ; $160e 0A7A - ?BRANCH
   .word $1614            ; $1610 1614
   .word _CR              ; $1612 1566 - CR
   .word __3EIN           ; $1614 0276 - >IN
   .word _0_21            ; $1616 09FC - 0!
   .word _TIB             ; $1618 02CB - TIB
   .word _INB             ; $161a 025F - INB
   .word __21             ; $161c 099D - !
   .word _EXIT            ; $161e 0315 - EXIT

NFA_CONSOLE:     ; 1620
   .byte 7,"CONSOLE"
   .word NFA_QUERY        ; 15E9
_CONSOLE:        ; 162A - None
l162a:
   call $02e4    ; $162a cd e4 02
   .word _LIT             ; $162d 0A2B - LIT
   .word $3414            ; $162f 3414
   .word __40             ; $1631 0984 - @
   .word __3FDUP          ; $1633 03E0 - ?DUP
   .word __3FBRANCH       ; $1635 0A7A - ?BRANCH
   .word $163D            ; $1637 163D
   .word _EXECUTE         ; $1639 032C - EXECUTE
   .word _EXIT            ; $163b 0315 - EXIT
   .word _BLK             ; $163d 02B1 - BLK
   .word _0_21            ; $163f 09FC - 0!
   .word _LIT             ; $1641 0A2B - LIT
   .word __28EMIT_29      ; $1643 0C8B - (EMIT)
   .word _LIT             ; $1645 0A2B - LIT
   .word $340E            ; $1647 340E
   .word __21             ; $1649 099D - !
   .word _LIT             ; $164b 0A2B - LIT
   .word __28KEY_29       ; $164d 0C9D - (KEY)
   .word _LIT             ; $164f 0A2B - LIT
   .word $340C            ; $1651 340C
   .word __21             ; $1653 099D - !
   .word _LIT             ; $1655 0A2B - LIT
   .word __28CR_29        ; $1657 0CB0 - (CR)
   .word _LIT             ; $1659 0A2B - LIT
   .word $3410            ; $165b 3410
   .word __21             ; $165d 099D - !
   .word _CR              ; $165f 1566 - CR
   .word __23TIB          ; $1661 026B - #TIB
   .word _0_21            ; $1663 09FC - 0!
   .word __3EIN           ; $1665 0276 - >IN
   .word _0_21            ; $1667 09FC - 0!
   .word _EXIT            ; $1669 0315 - EXIT

NFA__3BS:        ; 166B
   .byte 2,";S"
   .word NFA_QUERY        ; 15E9
__3BS:           ; 1670 - 1677
   call _FCALL            ; 1670
   .word _RDROP           ; $1673 0975 - RDROP
   .word _EXIT            ; $1675 0315 - EXIT

NFA_HEX:         ; 1677
   .byte 3,"HEX"
   .word NFA__3BS           ; 166B
_HEX:            ; 167D - 168A
   call _FCALL            ; 167D
   .word _LIT             ; $1680 0A2B - LIT
   .word $0010            ; $1682 0010
   .word _BASE            ; $1684 0208 - BASE
   .word __21             ; $1686 099D - !
   .word _EXIT            ; $1688 0315 - EXIT

NFA_DECIMAL:     ; 168A
   .byte 7,"DECIMAL"
   .word NFA_HEX          ; 1677
_DECIMAL:        ; 1694 - 16A1
   call _FCALL            ; 1694
   .word _LIT             ; $1697 0A2B - LIT
   .word $000A            ; $1699 000A
   .word _BASE            ; $169b 0208 - BASE
   .word __21             ; $169d 099D - !
   .word _EXIT            ; $169f 0315 - EXIT

NFA_BL:          ; 16A1
   .byte 2,"BL"
   .word NFA_DECIMAL      ; 168A
_BL:             ; 16A6 - 16AB
   call $0984    ; cd   
   .word 0x0020  ; $16a9 0020      

NFA_BLANK:       ; 16AB
   .byte 5,"BLANK"
   .word NFA_BL           ; 16A1
_BLANK:          ; 16B3 - 16BC
   call _FCALL            ; 16B3
   .word _BL              ; $16b6 16A6 - BL
   .word _FILL            ; $16b8 0BF5 - FILL
   .word _EXIT            ; $16ba 0315 - EXIT

NFA_SPACE:       ; 16BC
   .byte 5,"SPACE"
   .word NFA_BLANK        ; 16AB
_SPACE:          ; 16C4 - 16CD
   call _FCALL            ; 16C4
   .word _BL              ; $16c7 16A6 - BL
   .word _EMIT            ; $16c9 153D - EMIT
   .word _EXIT            ; $16cb 0315 - EXIT

NFA_SPACES:      ; 16CD
   .byte 6,"SPACES"
   .word NFA_SPACE        ; 16BC
_SPACES:         ; 16D6 - 16E7
   call _FCALL            ; 16D6
   .word _0               ; $16d9 0EC8 - 0
   .word __28_3FDO_29     ; $16db 0B0C - (?DO)
   .word $16E5            ; $16dd 16E5
   .word _SPACE           ; $16df 16C4 - SPACE
   .word __28LOOP_29      ; $16e1 0B2E - (LOOP)
   .word $16DF            ; $16e3 16DF
   .word _EXIT            ; $16e5 0315 - EXIT

NFA_ID_2E:       ; 16E7
   .byte 3,"ID."
   .word NFA_SPACES       ; 16CD
_ID_2E:          ; 16ED - 16FC
   call _FCALL            ; 16ED
   .word _COUNT           ; $16f0 0F6F - COUNT
   .word _LIT             ; $16f2 0A2B - LIT
   .word $003F            ; $16f4 003F
   .word _AND             ; $16f6 08C8 - AND
   .word _TYPE            ; $16f8 157E - TYPE
   .word _EXIT            ; $16fa 0315 - EXIT

NFA_DEFINITIONS: ; 16FC
   .byte 11,"DEFINITIONS"
   .word NFA_ID_2E          ; 16E7
_DEFINITIONS:    ; 170A - 1717
   call _FCALL            ; 170A
   .word _CONTEXT         ; $170d 0224 - CONTEXT
   .word __40             ; $170f 0984 - @
   .word _CURRENT         ; $1711 0233 - CURRENT
   .word __21             ; $1713 099D - !
   .word _EXIT            ; $1715 0315 - EXIT

NFA_LATEST:      ; 1717
   .byte 6,"LATEST"
   .word $16FC   ; NFA_DEFINITIONS  ; 16FC
_LATEST:         ; 1720 - 1757
   call _FCALL            ; 1720
   .word _CURRENT         ; $1723 0233 - CURRENT
   .word __40             ; $1725 0984 - @
   .word __40             ; $1727 0984 - @
   .word _EXIT            ; $1729 0315 - EXIT

NFA__21CF:       ; 172B
   .byte 3,"!CF"
   .word NFA_LATEST       ; 1717
__21CF:          ; 1731 - None
   call $02e4    ; $1731 cd e4 02
   .word _LIT             ; $1734 0A2B - LIT
   .word $00CD            ; $1736 00CD
   .word _OVER            ; $1738 0362 - OVER
   .word _C_21            ; $173a 09AA - C!
   .word _1_2B            ; $173c 0477 - 1+
   .word __21             ; $173e 099D - !
   .word _EXIT            ; $1740 0315 - EXIT

NFA__28_21CODE_29:; 1742
   .byte 7,"(!CODE)"
   .word NFA_LATEST       ; 1717
__28_21CODE_29:  ; 174C - None
   call $02e4    ; $174c cd e4 02
   .word _LATEST          ; $174f 1720 - LATEST
   .word _NAME_3E         ; $1751 1392 - NAME>
   .word __21CF           ; $1753 1731 - !CF
   .word _EXIT            ; $1755 0315 - EXIT

NFA_SMUDGE:      ; 1757
   .byte 6,"SMUDGE"
   .word NFA_LATEST       ; 1717
_SMUDGE:         ; 1760 - 176D
   call _FCALL            ; 1760
   .word _LATEST          ; $1763 1720 - LATEST
   .word _LIT             ; $1765 0A2B - LIT
   .word $0040            ; $1767 0040
   .word _TOGGLE          ; $1769 0AD6 - TOGGLE
   .word _EXIT            ; $176b 0315 - EXIT

NFA__5B:         ; 176D
   .byte 0x81,"[" ; IMMEDIATE
   .word NFA_SMUDGE       ; 1757
__5B:            ; 1771 - 177A
   call _FCALL            ; 1771
   .word _STATE           ; $1774 0215 - STATE
   .word _0_21            ; $1776 09FC - 0!
   .word _EXIT            ; $1778 0315 - EXIT

NFA__5D:         ; 177A
   .byte 1,"]"
   .word NFA__5B            ; 176D
__5D:            ; 177E - 1789
   call _FCALL            ; 177E
   .word __2D1            ; $1781 0EBF - -1
   .word _STATE           ; $1783 0215 - STATE
   .word __21             ; $1785 099D - !
   .word _EXIT            ; $1787 0315 - EXIT

NFA_FIND:        ; 1789
   .byte 4,"FIND"
   .word NFA__5D            ; 177A
_FIND:           ; 1790 - 1837
   call _FCALL            ; 1790
   .word _LIT             ; $1793 0A2B - LIT
   .word $3406            ; $1795 3406
   .word __40             ; $1797 0984 - @
   .word __3FDUP          ; $1799 03E0 - ?DUP
   .word __3FBRANCH       ; $179b 0A7A - ?BRANCH
   .word $17A3            ; $179d 17A3
   .word _EXECUTE         ; $179f 032C - EXECUTE
   .word _EXIT            ; $17a1 0315 - EXIT
   .word _CONTEXT         ; $17a3 0224 - CONTEXT
   .word __40             ; $17a5 0984 - @
   .word __3FWORD         ; $17a7 083F - ?WORD
   .word __3FBRANCH       ; $17a9 0A7A - ?BRANCH
   .word $17B3            ; $17ab 17B3
   .word _TRUE            ; $17ad 0EE6 - TRUE
   .word _BRANCH          ; $17af 0A68 - BRANCH
   .word $17CD            ; $17b1 17CD
   .word _CURRENT         ; $17b3 0233 - CURRENT
   .word __40             ; $17b5 0984 - @
   .word _DUP             ; $17b7 03D3 - DUP
   .word _CONTEXT         ; $17b9 0224 - CONTEXT
   .word __40             ; $17bb 0984 - @
   .word __3D             ; $17bd 0566 - =
   .word _N_3FBRANCH      ; $17bf 0A90 - N?BRANCH
   .word $17C9            ; $17c1 17C9
   .word __3FWORD         ; $17c3 083F - ?WORD
   .word _BRANCH          ; $17c5 0A68 - BRANCH
   .word $17CD            ; $17c7 17CD
   .word _DROP            ; $17c9 0382 - DROP
   .word _FALSE           ; $17cb 0EF3 - FALSE
   .word __3FBRANCH       ; $17cd 0A7A - ?BRANCH
   .word $17EF            ; $17cf 17EF
   .word _DUP             ; $17d1 03D3 - DUP
   .word _NAME_3E         ; $17d3 1392 - NAME>
   .word _SWAP            ; $17d5 038D - SWAP
   .word _C_40            ; $17d7 0991 - C@
   .word _LIT             ; $17d9 0A2B - LIT
   .word $0080            ; $17db 0080
   .word _AND             ; $17dd 08C8 - AND
   .word __3FBRANCH       ; $17df 0A7A - ?BRANCH
   .word $17E9            ; $17e1 17E9
   .word _1               ; $17e3 0ED1 - 1
   .word _BRANCH          ; $17e5 0A68 - BRANCH
   .word $17EB            ; $17e7 17EB
   .word __2D1            ; $17e9 0EBF - -1
   .word _BRANCH          ; $17eb 0A68 - BRANCH
   .word $17F1            ; $17ed 17F1
   .word _FALSE           ; $17ef 0EF3 - FALSE
   .word _EXIT            ; $17f1 0315 - EXIT

NFA__2BWORD:     ; 17F3
   .byte 5,"+WORD"
   .word NFA_FIND         ; 1789
__2BWORD:        ; 17FB - None
   call $02e4    ; $17fb cd e4 02
   .word _HERE            ; $17fe 0EFF - HERE
   .word _ROT             ; $1800 03B6 - ROT
   .word __22_2C          ; $1802 0F41 - ",
   .word _SWAP            ; $1804 038D - SWAP
   .word _DUP             ; $1806 03D3 - DUP
   .word __40             ; $1808 0984 - @
   .word __2C             ; $180a 0F1D - ,
   .word __21             ; $180c 099D - !
   .word _EXIT            ; $180e 0315 - EXIT

NFA__2DWORD:     ; 1810
   .byte 5,"-WORD"
   .word NFA_FIND         ; 1789
__2DWORD:        ; 1818 - None
   call $02e4    ; $1818 cd e4 02
   .word __3FWORD         ; $181b 083F - ?WORD
   .word __3FBRANCH       ; $181d 0A7A - ?BRANCH
   .word $1831            ; $181f 1831
   .word _N_3ELINK        ; $1821 137B - N>LINK
   .word __40             ; $1823 0984 - @
   .word _W_2DLINK        ; $1825 01FC - W-LINK
   .word __40             ; $1827 0984 - @
   .word __21             ; $1829 099D - !
   .word _TRUE            ; $182b 0EE6 - TRUE
   .word _BRANCH          ; $182d 0A68 - BRANCH
   .word $1835            ; $182f 1835
   .word _DROP            ; $1831 0382 - DROP
   .word _FALSE           ; $1833 0EF3 - FALSE
   .word _EXIT            ; $1835 0315 - EXIT

NFA__28_2E_22_29:; 1837
   .byte 4,"(.\")"
   .word NFA_FIND         ; 1789
__28_2E_22_29:   ; 183E - 1853
   call _FCALL            ; 183E
   .word _R_40            ; $1841 0933 - R@
   .word _COUNT           ; $1843 0F6F - COUNT
   .word _DUP             ; $1845 03D3 - DUP
   .word _1_2B            ; $1847 0477 - 1+
   .word _R_3E            ; $1849 0920 - R>
   .word __2B             ; $184b 044A - +
   .word __3ER            ; $184d 090D - >R
   .word _TYPE            ; $184f 157E - TYPE
   .word _EXIT            ; $1851 0315 - EXIT

NFA_ERASE:       ; 1853
   .byte 5,"ERASE"
   .word NFA__28_2E_22_29         ; 1837
_ERASE:          ; 185B - 1864
   call _FCALL            ; 185B
   .word _0               ; $185e 0EC8 - 0
   .word _FILL            ; $1860 0BF5 - FILL
   .word _EXIT            ; $1862 0315 - EXIT

NFA__27:         ; 1864
   .byte 1,"'"
   .word NFA_ERASE        ; 1853
__27:            ; 1868 - 187B
   call _FCALL            ; 1868
   .word _BL              ; $186b 16A6 - BL
   .word _WORD            ; $186d 13ED - WORD
   .word _FIND            ; $186f 1790 - FIND
   .word _0_3D            ; $1871 057E - 0=
   .word __28ABORT_22_29  ; $1873 114A - (ABORT")
   .byte 3,"-? "
   .word _EXIT            ; $1879 0315 - EXIT

NFA__5B_27_5D:   ; 187B
   .byte 0x83,"[']" ; IMMEDIATE
   .word NFA__27            ; 1864
__5B_27_5D:      ; 1881 - 188A
   call _FCALL            ; 1881
   .word __27             ; $1884 1868 - '
   .word _LITERAL         ; $1886 1894 - LITERAL
   .word _EXIT            ; $1888 0315 - EXIT

NFA_LITERAL:     ; 188A
   .byte 0x87,"LITERAL" ; IMMEDIATE
   .word NFA__5B_27_5D          ; 187B
_LITERAL:        ; 1894 - 18A7
   call _FCALL            ; 1894
   .word _STATE           ; $1897 0215 - STATE
   .word __40             ; $1899 0984 - @
   .word __3FBRANCH       ; $189b 0A7A - ?BRANCH
   .word $18A5            ; $189d 18A5
   .word _COMPILE         ; $189f 0F83 - COMPILE
   .word _LIT             ; $18a1 0A2B - LIT
   .word __2C             ; $18a3 0F1D - ,
   .word _EXIT            ; $18a5 0315 - EXIT

NFA_DLITERAL:    ; 18A7
   .byte 0x88,"DLITERAL" ; IMMEDIATE
   .word NFA_LITERAL      ; 188A
_DLITERAL:       ; 18B2 - 18C7
   call _FCALL            ; 18B2
   .word _STATE           ; $18b5 0215 - STATE
   .word __40             ; $18b7 0984 - @
   .word __3FBRANCH       ; $18b9 0A7A - ?BRANCH
   .word $18C5            ; $18bb 18C5
   .word _COMPILE         ; $18bd 0F83 - COMPILE
   .word _DLIT            ; $18bf 0A3C - DLIT
   .word __2C             ; $18c1 0F1D - ,
   .word __2C             ; $18c3 0F1D - ,
   .word _EXIT            ; $18c5 0315 - EXIT

NFA__5BCOMPILE_5D:; 18C7
   .byte 0x89,"[COMPILE]" ; IMMEDIATE
   .word NFA_DLITERAL     ; 18A7
__5BCOMPILE_5D:  ; 18D3 - 18DC
   call _FCALL            ; 18D3
   .word __27             ; $18d6 1868 - '
   .word __2C             ; $18d8 0F1D - ,
   .word _EXIT            ; $18da 0315 - EXIT

NFA_CONVERT:     ; 18DC
   .byte 7,"CONVERT"
   .word NFA__5BCOMPILE_5D    ; 18C7
_CONVERT:        ; 18E6 - 1925
   call _FCALL            ; 18E6
   .word _1_2B            ; $18e9 0477 - 1+
   .word _DUP             ; $18eb 03D3 - DUP
   .word __3ER            ; $18ed 090D - >R
   .word _C_40            ; $18ef 0991 - C@
   .word _BASE            ; $18f1 0208 - BASE
   .word __40             ; $18f3 0984 - @
   .word _DIGIT           ; $18f5 0893 - DIGIT
   .word __3FBRANCH       ; $18f7 0A7A - ?BRANCH
   .word $1921            ; $18f9 1921
   .word _SWAP            ; $18fb 038D - SWAP
   .word _BASE            ; $18fd 0208 - BASE
   .word __40             ; $18ff 0984 - @
   .word __2A             ; $1901 069B - *
   .word _ROT             ; $1903 03B6 - ROT
   .word _BASE            ; $1905 0208 - BASE
   .word __40             ; $1907 0984 - @
   .word _UM_2A           ; $1909 06C7 - UM*
   .word _D_2B            ; $190b 05CF - D+
   .word _DPL             ; $190d 023E - DPL
   .word __40             ; $190f 0984 - @
   .word _1_2B            ; $1911 0477 - 1+
   .word __3FBRANCH       ; $1913 0A7A - ?BRANCH
   .word $191B            ; $1915 191B
   .word _DPL             ; $1917 023E - DPL
   .word _1_2B_21         ; $1919 0A0A - 1+!
   .word _R_3E            ; $191b 0920 - R>
   .word _BRANCH          ; $191d 0A68 - BRANCH
   .word $18E9            ; $191f 18E9
   .word _R_3E            ; $1921 0920 - R>
   .word _EXIT            ; $1923 0315 - EXIT

NFA_NUMBER:      ; 1925
   .byte 6,"NUMBER"
   .word NFA_CONVERT      ; 18DC
_NUMBER:         ; 192E - 198A
   call _FCALL            ; 192E
   .word _0               ; $1931 0EC8 - 0
   .word _0               ; $1933 0EC8 - 0
   .word _ROT             ; $1935 03B6 - ROT
   .word _DUP             ; $1937 03D3 - DUP
   .word _1_2B            ; $1939 0477 - 1+
   .word _C_40            ; $193b 0991 - C@
   .word _LIT             ; $193d 0A2B - LIT
   .word $002D            ; $193f 002D
   .word __3D             ; $1941 0566 - =
   .word _DUP             ; $1943 03D3 - DUP
   .word __3ER            ; $1945 090D - >R
   .word __2D             ; $1947 0455 - -
   .word __2D1            ; $1949 0EBF - -1
   .word _DPL             ; $194b 023E - DPL
   .word __21             ; $194d 099D - !
   .word _CONVERT         ; $194f 18E6 - CONVERT
   .word _DUP             ; $1951 03D3 - DUP
   .word _DUP             ; $1953 03D3 - DUP
   .word _C_40            ; $1955 0991 - C@
   .word _BL              ; $1957 16A6 - BL
   .word __3C_3E          ; $1959 1094 - <>
   .word _SWAP            ; $195b 038D - SWAP
   .word _0_3D            ; $195d 057E - 0=
   .word _0_3D            ; $195f 057E - 0=
   .word _AND             ; $1961 08C8 - AND
   .word __3FBRANCH       ; $1963 0A7A - ?BRANCH
   .word $197E            ; $1965 197E
   .word _DUP             ; $1967 03D3 - DUP
   .word _C_40            ; $1969 0991 - C@
   .word _LIT             ; $196b 0A2B - LIT
   .word $002E            ; $196d 002E
   .word __3C_3E          ; $196f 1094 - <>
   .word __28ABORT_22_29  ; $1971 114A - (ABORT")
   .byte 4," -? "
   .word _0               ; $1978 0EC8 - 0
   .word _BRANCH          ; $197a 0A68 - BRANCH
   .word $194B            ; $197c 194B
   .word _DROP            ; $197e 0382 - DROP
   .word _R_3E            ; $1980 0920 - R>
   .word __3FBRANCH       ; $1982 0A7A - ?BRANCH
   .word $1988            ; $1984 1988
   .word _DNEGATE         ; $1986 0620 - DNEGATE
   .word _EXIT            ; $1988 0315 - EXIT

NFA__3FSTACK:    ; 198A
   .byte 6,"?STACK"
   .word NFA_NUMBER       ; 1925
__3FSTACK:       ; 1993 - 19B5
   call _FCALL            ; 1993
   .word _SP_40           ; $1996 0433 - SP@
   .word _S0              ; $1998 01BE - S0
   .word __40             ; $199a 0984 - @
   .word _SWAP            ; $199c 038D - SWAP
   .word _U_3C            ; $199e 04FA - U<
   .word __28ABORT_22_29  ; $19a0 114A - (ABORT")
   .byte 16,0xe9,"C",0xfe,"EP",0xf0,"AH",0xe9,"E CTEKA"
   .word _EXIT            ; $19b3 0315 - EXIT

NFA_INTERPRET:   ; 19B5
   .byte 9,"INTERPRET"
   .word NFA__3FSTACK       ; 198A
_INTERPRET:      ; 19C1 - 1A18
   call _FCALL            ; 19C1
   .word _LIT             ; $19c4 0A2B - LIT
   .word $3404            ; $19c6 3404
   .word __40             ; $19c8 0984 - @
   .word __3FDUP          ; $19ca 03E0 - ?DUP
   .word __3FBRANCH       ; $19cc 0A7A - ?BRANCH
   .word $19D4            ; $19ce 19D4
   .word _EXECUTE         ; $19d0 032C - EXECUTE
   .word _EXIT            ; $19d2 0315 - EXIT
   .word _BL              ; $19d4 16A6 - BL
   .word _WORD            ; $19d6 13ED - WORD
   .word _FIND            ; $19d8 1790 - FIND
   .word _DUP             ; $19da 03D3 - DUP
   .word __3FBRANCH       ; $19dc 0A7A - ?BRANCH
   .word $19F8            ; $19de 19F8
   .word _0_3C            ; $19e0 053D - 0<
   .word _STATE           ; $19e2 0215 - STATE
   .word __40             ; $19e4 0984 - @
   .word _AND             ; $19e6 08C8 - AND
   .word __3FBRANCH       ; $19e8 0A7A - ?BRANCH
   .word $19F2            ; $19ea 19F2
   .word __2C             ; $19ec 0F1D - ,
   .word _BRANCH          ; $19ee 0A68 - BRANCH
   .word $19F4            ; $19f0 19F4
   .word _EXECUTE         ; $19f2 032C - EXECUTE
   .word _BRANCH          ; $19f4 0A68 - BRANCH
   .word $1A10            ; $19f6 1A10
   .word _DROP            ; $19f8 0382 - DROP
   .word _NUMBER          ; $19fa 192E - NUMBER
   .word _DPL             ; $19fc 023E - DPL
   .word __40             ; $19fe 0984 - @
   .word _1_2B            ; $1a00 0477 - 1+
   .word __3FBRANCH       ; $1a02 0A7A - ?BRANCH
   .word $1A0C            ; $1a04 1A0C
   .word _DLITERAL        ; $1a06 18B2 - DLITERAL
   .word _BRANCH          ; $1a08 0A68 - BRANCH
   .word $1A10            ; $1a0a 1A10
   .word _DROP            ; $1a0c 0382 - DROP
   .word _LITERAL         ; $1a0e 1894 - LITERAL
   .word __3FSTACK        ; $1a10 1993 - ?STACK
   .word _BRANCH          ; $1a12 0A68 - BRANCH
   .word $19D4            ; $1a14 19D4
   .word _EXIT            ; $1a16 0315 - EXIT

NFA_CREATE:      ; 1A18
   .byte 6,"CREATE"
   .word NFA_INTERPRET    ; 19B5
_CREATE:         ; 1A21 - 1A62
   call _FCALL            ; 1A21
   .word _BL              ; $1a24 16A6 - BL
   .word _WORD            ; $1a26 13ED - WORD
   .word _WARNING         ; $1a28 02C0 - WARNING
   .word __40             ; $1a2a 0984 - @
   .word __3FBRANCH       ; $1a2c 0A7A - ?BRANCH
   .word $1A52            ; $1a2e 1A52
   .word _DUP             ; $1a30 03D3 - DUP
   .word _FIND            ; $1a32 1790 - FIND
   .word _PRESS           ; $1a34 0410 - PRESS
   .word __3FBRANCH       ; $1a36 0A7A - ?BRANCH
   .word $1A52            ; $1a38 1A52
   .word _DUP             ; $1a3a 03D3 - DUP
   .word _ID_2E           ; $1a3c 16ED - ID.
   .word __28_2E_22_29    ; $1a3e 183E - (.")
   .byte 15," ",0xf5,0xf6,"E O",0xf0,"PE",0xe4,"E",0xec,"EH "
   .word _CR              ; $1a50 1566 - CR
   .word _CURRENT         ; $1a52 0233 - CURRENT
   .word __40             ; $1a54 0984 - @
   .word $17FB            ; $1a56 17FB
   .word _CFL             ; $1a58 132D - CFL
   .word _ALLOT           ; $1a5a 0F10 - ALLOT
   .word _NEXT            ; $1a5c 02FD - NEXT
   .word $174C            ; $1a5e 174C - (!CODE)
   .word _EXIT            ; $1a60 0315 - EXIT

NFA__3CBUILDS:   ; 1A62
   .byte 7,"<BUILDS"
   .word NFA_CREATE       ; 1A18
__3CBUILDS:      ; 1A6C - 1A73
   call _FCALL            ; 1A6C
   .word _CREATE          ; $1a6f 1A21 - CREATE
   .word _EXIT            ; $1a71 0315 - EXIT

NFA__28DOES_3E_29:; 1A73
   .byte 7,"(DOES>)"
   .word NFA__3CBUILDS      ; 1A62
__28DOES_3E_29:  ; 1A7D - 1A86
   call _FCALL            ; 1A7D
   .word _R_3E            ; $1a80 0920 - R>
   .word __28_21CODE_29   ; $1a82 174C - (!CODE)
   .word _EXIT            ; $1a84 0315 - EXIT

NFA_DOES_3E:     ; 1A86
   .byte 0x85,"DOES>" ; IMMEDIATE
   .word NFA__28DOES_3E_29      ; 1A73
_DOES_3E:        ; 1A8E - 1AA1
   call _FCALL            ; 1A8E
   .word _COMPILE         ; $1a91 0F83 - COMPILE
   .word __28DOES_3E_29   ; $1a93 1A7D - (DOES>)
   .word _CALL            ; $1a95 0309 - CALL
   .word _HERE            ; $1a97 0EFF - HERE
   .word __21CF           ; $1a99 1731 - !CF
   .word _CFL             ; $1a9b 132D - CFL
   .word _ALLOT           ; $1a9d 0F10 - ALLOT
   .word _EXIT            ; $1a9f 0315 - EXIT

NFA_CONSTANT:    ; 1AA1
   .byte 8,"CONSTANT"
   .word NFA_DOES_3E        ; 1A86
_CONSTANT:       ; 1AAC - 1AD0
   call _FCALL            ; 1AAC
   .word _CREATE          ; $1aaf 1A21 - CREATE
   .word __2C             ; $1ab1 0F1D - ,
   .word _LIT             ; $1ab3 0A2B - LIT
   .word __40             ; $1ab5 0984 - @
   .word $174C            ; $1ab7 174C - (!CODE)
   .word _EXIT            ; $1ab9 0315 - EXIT

NFA_TOCODE:      ; 1ABB
   .byte 6,"TOCODE"
   .word NFA_CONSTANT     ; 1AA1
_TOCODE:         ; 1AC4 - None
   pop h         ; $1ac4 e1      
   dcx h         ; $1ac5 2b      
   dcx h         ; $1ac6 2b      
   dcx h         ; $1ac7 2b      
   dcx h         ; $1ac8 2b      
   pop d         ; $1ac9 d1      
   mov m,d       ; $1aca 72      
   dcx h         ; $1acb 2b      
   mov m,e       ; $1acc 73      
   jmp $02ef     ; $1acd c3 ef 02

NFA__40EXECUTE:  ; 1AD0
   .byte 8,"@EXECUTE"
   .word NFA_CONSTANT     ; 1AA1
__40EXECUTE:     ; 1ADB - 1AE1
   pop h         ; $1adb e1      
   mov e,m       ; $1adc 5e      
   inx h         ; $1add 23      
   mov d,m       ; $1ade 56      
   xchg          ; $1adf eb      
   pchl          ; $1ae0 e9      

NFA_QUAN:        ; 1AE1
   .byte 4,"QUAN"
   .word NFA__40EXECUTE     ; 1AD0
_QUAN:           ; 1AE8 - 1AFD
   call _FCALL            ; 1AE8
   .word _0               ; $1aeb 0EC8 - 0
   .word _CONSTANT        ; $1aed 1AAC - CONSTANT
   .word _LIT             ; $1aef 0A2B - LIT
   .word _TOCODE          ; $1af1 1AC4 - TOCODE
   .word _HERE            ; $1af3 0EFF - HERE
   .word _CFL             ; $1af5 132D - CFL
   .word _ALLOT           ; $1af7 0F10 - ALLOT
   .word __21CF           ; $1af9 1731 - !CF
   .word _EXIT            ; $1afb 0315 - EXIT

NFA_VECT:        ; 1AFD
   .byte 4,"VECT"
   .word NFA_QUAN         ; 1AE1
_VECT:           ; 1B04 - 1B11
   call _FCALL            ; 1B04
   .word _QUAN            ; $1b07 1AE8 - QUAN
   .word _LIT             ; $1b09 0A2B - LIT
   .word __40EXECUTE      ; $1b0b 1ADB - @EXECUTE
   .word __28_21CODE_29   ; $1b0d 174C - (!CODE)
   .word _EXIT            ; $1b0f 0315 - EXIT

NFA_TO:          ; 1B11
   .byte 0x82,"TO" ; IMMEDIATE
   .word NFA_VECT         ; 1AFD
_TO:             ; 1B16 - 1B47
   call _FCALL            ; 1B16
   .word _BL              ; $1b19 16A6 - BL
   .word _WORD            ; $1b1b 13ED - WORD
   .word _FIND            ; $1b1d 1790 - FIND
   .word __3FDUP          ; $1b1f 03E0 - ?DUP
   .word _0_3D            ; $1b21 057E - 0=
   .word __28ABORT_22_29  ; $1b23 114A - (ABORT")
   .byte 3," -?"
   .word _0_3C            ; $1b29 053D - 0<
   .word _STATE           ; $1b2b 0215 - STATE
   .word __40             ; $1b2d 0984 - @
   .word _AND             ; $1b2f 08C8 - AND
   .word __3FBRANCH       ; $1b31 0A7A - ?BRANCH
   .word $1B3F            ; $1b33 1B3F
   .word __3EBODY         ; $1b35 133A - >BODY
   .word _2_2B            ; $1b37 0482 - 2+
   .word __2C             ; $1b39 0F1D - ,
   .word _BRANCH          ; $1b3b 0A68 - BRANCH
   .word $1B45            ; $1b3d 1B45
   .word __3EBODY         ; $1b3f 133A - >BODY
   .word _2_2B            ; $1b41 0482 - 2+
   .word _EXECUTE         ; $1b43 032C - EXECUTE
   .word _EXIT            ; $1b45 0315 - EXIT

NFA_VARIABLE:    ; 1B47
   .byte 8,"VARIABLE"
   .word NFA_TO           ; 1B11
_VARIABLE:       ; 1B52 - 1B61
   call _FCALL            ; 1B52
   .word _CREATE          ; $1b55 1A21 - CREATE
   .word _0               ; $1b57 0EC8 - 0
   .word __2C             ; $1b59 0F1D - ,
   .word _NEXT            ; $1b5b 02FD - NEXT
   .word __28_21CODE_29   ; $1b5d 174C - (!CODE)
   .word _EXIT            ; $1b5f 0315 - EXIT

NFA_VOCABULARY:  ; 1B61
   .byte 10,"VOCABULARY"
   .word NFA_VARIABLE     ; 1B47
_VOCABULARY:     ; 1B6E - 1BA0
   call _FCALL            ; 1B6E
   .word _CREATE          ; $1b71 1A21 - CREATE
   .word _LIT             ; $1b73 0A2B - LIT
   .word $0001            ; $1b75 0001
   .word _C_2C            ; $1b77 0F2F - C,
   .word _LIT             ; $1b79 0A2B - LIT
   .word $0080            ; $1b7b 0080
   .word _C_2C            ; $1b7d 0F2F - C,
   .word _CURRENT         ; $1b7f 0233 - CURRENT
   .word __40             ; $1b81 0984 - @
   .word _2_2D            ; $1b83 0499 - 2-
   .word __2C             ; $1b85 0F1D - ,
   .word _HERE            ; $1b87 0EFF - HERE
   .word _VOC_2DLINK      ; $1b89 01E1 - VOC-LINK
   .word __40             ; $1b8b 0984 - @
   .word __2C             ; $1b8d 0F1D - ,
   .word _VOC_2DLINK      ; $1b8f 01E1 - VOC-LINK
   .word __21             ; $1b91 099D - !
   .word __28DOES_3E_29   ; $1b93 1A7D - (DOES>)
l1b95:
   call $02e4
   .word _2_2B            ; $1b98 0482 - 2+
   .word _CONTEXT         ; $1b9a 0224 - CONTEXT
   .word __21             ; $1b9c 099D - !
   .word _EXIT            ; $1b9e 0315 - EXIT

NFA_STRING:      ; 1BA0
   .byte 6,"STRING"
   .word NFA_VOCABULARY   ; 1B61
_STRING:         ; 1BA9 - 1BB6
   call _FCALL            ; 1BA9
   .word _CREATE          ; $1bac 1A21 - CREATE
   .word __22_2C          ; $1bae 0F41 - ",
   .word _NEXT            ; $1bb0 02FD - NEXT
   .word __28_21CODE_29   ; $1bb2 174C - (!CODE)
   .word _EXIT            ; $1bb4 0315 - EXIT

NFA__21CSP:      ; 1BB6
   .byte 4,"!CSP"
   .word $1BA0   ; NFA_STRING       ; 1BA0
__21CSP:         ; 1BBD - 1BC8
   call _FCALL            ; 1BBD
   .word _SP_40           ; $1bc0 0433 - SP@
   .word _CSP             ; $1bc2 0254 - CSP
   .word __21             ; $1bc4 099D - !
   .word _EXIT            ; $1bc6 0315 - EXIT

NFA__3FCSP:      ; 1BC8
   .byte 4,"?CSP"
   .word NFA__21CSP         ; 1BB6
__3FCSP:         ; 1BCF - 1BF0
   call _FCALL            ; 1BCF
   .word _SP_40           ; $1bd2 0433 - SP@
   .word _CSP             ; $1bd4 0254 - CSP
   .word __40             ; $1bd6 0984 - @
   .word _XOR             ; $1bd8 08EB - XOR
   .word __28ABORT_22_29  ; $1bda 114A - (ABORT")
   .byte 17,"C",0xe2,"O",0xea," CTEKA ",0xf0,"O CSP"
   .word _EXIT            ; $1bee 0315 - EXIT

NFA__3FEXEC:     ; 1BF0
   .byte 5,"?EXEC"
   .word NFA__3FCSP         ; 1BC8
__3FEXEC:        ; 1BF8 - 1C1E
   call _FCALL            ; 1BF8
   .word _STATE           ; $1bfb 0215 - STATE
   .word __40             ; $1bfd 0984 - @
   .word __28ABORT_22_29  ; $1bff 114A - (ABORT")
   .byte 26," TPE",0xe2,0xf5,"ET PE",0xf6,0xe9,"MA BypOlHEHiq"
   .word _EXIT            ; $1c1c 0315 - EXIT

NFA__3FCOMP:     ; 1C1E
   .byte 5,"?COMP"
   .word NFA__3FEXEC        ; 1BF0
__3FCOMP:        ; 1C26 - 1C4E
   call _FCALL            ; 1C26
   .word _STATE           ; $1c29 0215 - STATE
   .word __40             ; $1c2b 0984 - @
   .word _0_3D            ; $1c2d 057E - 0=
   .word __28ABORT_22_29  ; $1c2f 114A - (ABORT")
   .byte 26," TPEbuET PEviMA KOMpilqcii"
   .word _EXIT            ; $1c4c 0315 - EXIT

NFA__3FPAIRS:    ; 1C4E
   .byte 6,"?PAIRS"
   .word NFA__3FCOMP        ; 1C1E
__3FPAIRS:       ; 1C57 - 1C71
   call _FCALL            ; 1C57
   .word _XOR             ; $1c5a 08EB - XOR
   .word __28ABORT_22_29  ; $1c5c 114A - (ABORT")
   .byte 16," HE",0xf0,"APHA",0xf1," CKO",0xe2,"KA"
   .word _EXIT            ; $1c6f 0315 - EXIT

NFA_LEAVE:       ; 1C71
   .byte 5,"LEAVE"
   .word $1C4E   ; NFA__3FPAIRS       ; 1C4E
_LEAVE:          ; 1C79 - 1C84
   call $02e4    ; $1c79 cd e4 02
   .word _RDROP           ; 1C7C 0975 - RDROP
   .word _RDROP           ; 1C7E 0975 - RDROP
   .word _RDROP           ; 1C80 0975 - RDROP
   .word _EXIT            ; 1C82 0315 - EXIT

NFA__3A:         ; 1C84
   .byte 0x81,":" ; IMMEDIATE
   .word NFA_LEAVE        ; 1C71
__3A:            ; 1C88 - 1CA3
   call _FCALL            ; 1C88
   .word __3FEXEC         ; $1c8b 1BF8 - ?EXEC
   .word __21CSP          ; $1c8d 1BBD - !CSP
   .word _CURRENT         ; $1c8f 0233 - CURRENT
   .word __40             ; $1c91 0984 - @
   .word _CONTEXT         ; $1c93 0224 - CONTEXT
   .word __21             ; $1c95 099D - !
   .word _CREATE          ; $1c97 1A21 - CREATE
   .word _SMUDGE          ; $1c99 1760 - SMUDGE
   .word __5D             ; $1c9b 177E - ]
   .word _CALL            ; $1c9d 0309 - CALL
   .word __28_21CODE_29   ; $1c9f 174C - (!CODE)
   .word _EXIT            ; $1ca1 0315 - EXIT

NFA__3B:         ; 1CA3
   .byte 0x81,";"  ; IMMEDIATE
   .word NFA__3A            ; 1C84
__3B:            ; 1CA7 - 1CB8
   call _FCALL            ; 1CA7
   .word __3FCOMP         ; $1caa 1C26 - ?COMP
   .word __3FCSP          ; $1cac 1BCF - ?CSP
   .word _COMPILE         ; $1cae 0F83 - COMPILE
   .word _EXIT            ; $1cb0 0315 - EXIT
   .word _SMUDGE          ; $1cb2 1760 - SMUDGE
   .word __5B             ; $1cb4 1771 - [
   .word _EXIT            ; $1cb6 0315 - EXIT

NFA_IMMEDIATE:   ; 1CB8
   .byte 9,"IMMEDIATE"
   .word NFA__3B            ; 1CA3
_IMMEDIATE:      ; 1CC4 - 1CD1
   call _FCALL            ; 1CC4
   .word _LATEST          ; $1cc7 1720 - LATEST
   .word _LIT             ; $1cc9 0A2B - LIT
   .word $0080            ; $1ccb 0080
   .word _TOGGLE          ; $1ccd 0AD6 - TOGGLE
   .word _EXIT            ; $1ccf 0315 - EXIT

NFA_DEPTH:       ; 1CD1
   .byte 5,"DEPTH"
   .word NFA_IMMEDIATE    ; 1CB8
_DEPTH:          ; 1CD9 - 1CEE
   call _FCALL            ; 1CD9
   .word _SP_40           ; $1cdc 0433 - SP@
   .word _S0              ; $1cde 01BE - S0
   .word __40             ; $1ce0 0984 - @
   .word _SWAP            ; $1ce2 038D - SWAP
   .word __2D             ; $1ce4 0455 - -
   .word _2_2F            ; $1ce6 05BD - 2/
   .word _0               ; $1ce8 0EC8 - 0
   .word _MAX             ; $1cea 04DE - MAX
   .word _EXIT            ; $1cec 0315 - EXIT

NFA_C_22:        ; 1CEE
   .byte 0x82,"C\"" ; IMMEDIATE
   .word NFA_DEPTH        ; 1CD1
_C_22:           ; 1CF3 - 1D02
   call _FCALL            ; 1CF3
   .word _BL              ; $1cf6 16A6 - BL
   .word _WORD            ; $1cf8 13ED - WORD
   .word _1_2B            ; $1cfa 0477 - 1+
   .word _C_40            ; $1cfc 0991 - C@
   .word _LITERAL         ; $1cfe 1894 - LITERAL
   .word _EXIT            ; $1d00 0315 - EXIT

NFA__2E_22:      ; 1D02
   .byte 0x82,".\"" ; IMMEDIATE
   .word NFA_C_22           ; 1CEE
__2E_22:         ; 1D07 - 1D1A
   call _FCALL            ; 1D07
   .word __3FCOMP         ; $1d0a 1C26 - ?COMP
   .word _COMPILE         ; $1d0c 0F83 - COMPILE
   .word __28_2E_22_29    ; $1d0e 183E - (.")
   .word _LIT             ; $1d10 0A2B - LIT
   .word $0022            ; $1d12 0022
   .word _WORD            ; $1d14 13ED - WORD
   .word __22_2C          ; $1d16 0F41 - ",
   .word _EXIT            ; $1d18 0315 - EXIT

NFA__22:         ; 1D1A
   .byte 0x81,"\"" ; IMMEDIATE
   .word NFA__2E_22           ; 1D02
__22:            ; 1D1E - 1D4D
   call _FCALL            ; 1D1E
   .word _STATE           ; $1d21 0215 - STATE
   .word __40             ; $1d23 0984 - @
   .word __3FBRANCH       ; $1d25 0A7A - ?BRANCH
   .word $1D39            ; $1d27 1D39
   .word _COMPILE         ; $1d29 0F83 - COMPILE
   .word __28_22_29       ; $1d2b 0A53 - (")
   .word _LIT             ; $1d2d 0A2B - LIT
   .word $0022            ; $1d2f 0022
   .word _WORD            ; $1d31 13ED - WORD
   .word __22_2C          ; $1d33 0F41 - ",
   .word _BRANCH          ; $1d35 0A68 - BRANCH
   .word $1D4B            ; $1d37 1D4B
   .word _LIT             ; $1d39 0A2B - LIT
   .word $0022            ; $1d3b 0022
   .word _WORD            ; $1d3d 13ED - WORD
   .word _PAD             ; $1d3f 0F5A - PAD
   .word _OVER            ; $1d41 0362 - OVER
   .word _C_40            ; $1d43 0991 - C@
   .word _1_2B            ; $1d45 0477 - 1+
   .word _CMOVE           ; $1d47 0B7C - CMOVE
   .word _PAD             ; $1d49 0F5A - PAD
   .word _EXIT            ; $1d4b 0315 - EXIT

NFA__2E_28:      ; 1D4D
   .byte 0x82,".(" ; IMMEDIATE
   .word NFA__22            ; 1D1A
__2E_28:         ; 1D52 - 1D61
   call _FCALL            ; 1D52
   .word _LIT             ; $1d55 0A2B - LIT
   .word $0029            ; $1d57 0029
   .word _WORD            ; $1d59 13ED - WORD
   .word _COUNT           ; $1d5b 0F6F - COUNT
   .word _TYPE            ; $1d5d 157E - TYPE
   .word _EXIT            ; $1d5f 0315 - EXIT

NFA__3EMARK:     ; 1D61
   .byte 5,">MARK"
   .word NFA__2E_28           ; 1D4D
__3EMARK:        ; 1D69 - 1D74
   call _FCALL            ; 1D69
   .word _HERE            ; $1d6c 0EFF - HERE
   .word _0               ; $1d6e 0EC8 - 0
   .word __2C             ; $1d70 0F1D - ,
   .word _EXIT            ; $1d72 0315 - EXIT

NFA__3ERESOLVE:  ; 1D74
   .byte 8,">RESOLVE"
   .word NFA__3EMARK        ; 1D61
__3ERESOLVE:     ; 1D7F - 1D8A
   call _FCALL            ; 1D7F
   .word _HERE            ; $1d82 0EFF - HERE
   .word _SWAP            ; $1d84 038D - SWAP
   .word __21             ; $1d86 099D - !
   .word _EXIT            ; $1d88 0315 - EXIT

NFA__3CMARK:     ; 1D8A
   .byte 5,"<MARK"
   .word NFA__3ERESOLVE     ; 1D74
__3CMARK:        ; 1D92 - 1D99
   call _FCALL            ; 1D92
   .word _HERE            ; $1d95 0EFF - HERE
   .word _EXIT            ; $1d97 0315 - EXIT

NFA__3CRESOLVE:  ; 1D99
   .byte 8,"<RESOLVE"
   .word NFA__3CMARK        ; 1D8A
__3CRESOLVE:     ; 1DA4 - 1DAB
   call _FCALL            ; 1DA4
   .word __2C             ; $1da7 0F1D - ,
   .word _EXIT            ; $1da9 0315 - EXIT

NFA_IF:          ; 1DAB
   .byte 0x82,"IF" ; IMMEDIATE
   .word NFA__3CRESOLVE     ; 1D99
_IF:             ; 1DB0 - 1DBF
   call _FCALL            ; 1DB0
   .word __3FCOMP         ; $1db3 1C26 - ?COMP
   .word _COMPILE         ; $1db5 0F83 - COMPILE
   .word __3FBRANCH       ; $1db7 0A7A - ?BRANCH
   .word __3EMARK         ; $1db9 1D69 - >MARK
   .word _2               ; $1dbb 0EDA - 2
   .word _EXIT            ; $1dbd 0315 - EXIT

NFA_IFNOT:       ; 1DBF
   .byte 0x85,"IFNOT" ; IMMEDIATE
   .word NFA_IF           ; 1DAB
_IFNOT:          ; 1DC7 - 1DD6
   call _FCALL            ; 1DC7
   .word __3FCOMP         ; $1dca 1C26 - ?COMP
   .word _COMPILE         ; $1dcc 0F83 - COMPILE
   .word _N_3FBRANCH      ; $1dce 0A90 - N?BRANCH
   .word __3EMARK         ; $1dd0 1D69 - >MARK
   .word _2               ; $1dd2 0EDA - 2
   .word _EXIT            ; $1dd4 0315 - EXIT

NFA_ELSE:        ; 1DD6
   .byte 0x84,"ELSE" ; IMMEDIATE
   .word NFA_IFNOT        ; 1DBF
_ELSE:           ; 1DDD - 1DF4
   call _FCALL            ; 1DDD
   .word __3FCOMP         ; $1de0 1C26 - ?COMP
   .word _2               ; $1de2 0EDA - 2
   .word __3FPAIRS        ; $1de4 1C57 - ?PAIRS
   .word _COMPILE         ; $1de6 0F83 - COMPILE
   .word _BRANCH          ; $1de8 0A68 - BRANCH
   .word __3EMARK         ; $1dea 1D69 - >MARK
   .word _SWAP            ; $1dec 038D - SWAP
   .word __3ERESOLVE      ; $1dee 1D7F - >RESOLVE
   .word _2               ; $1df0 0EDA - 2
   .word _EXIT            ; $1df2 0315 - EXIT

NFA_THEN:        ; 1DF4
   .byte 0x84,"THEN" ; IMMEDIATE
   .word NFA_ELSE         ; 1DD6
_THEN:           ; 1DFB - 1E08
   call _FCALL            ; 1DFB
   .word __3FCOMP         ; $1dfe 1C26 - ?COMP
   .word _2               ; $1e00 0EDA - 2
   .word __3FPAIRS        ; $1e02 1C57 - ?PAIRS
   .word __3ERESOLVE      ; $1e04 1D7F - >RESOLVE
   .word _EXIT            ; $1e06 0315 - EXIT

NFA_BEGIN:       ; 1E08
   .byte 0x85,"BEGIN" ; IMMEDIATE
   .word NFA_THEN         ; 1DF4
_BEGIN:          ; 1E10 - 1E1B
   call _FCALL            ; 1E10
   .word __3FCOMP         ; $1e13 1C26 - ?COMP
   .word __3CMARK         ; $1e15 1D92 - <MARK
   .word _1               ; $1e17 0ED1 - 1
   .word _EXIT            ; $1e19 0315 - EXIT

NFA_AGAIN:       ; 1E1B
   .byte 0x85,"AGAIN" ; IMMEDIATE
   .word NFA_BEGIN        ; 1E08
_AGAIN:          ; 1E23 - 1E34
   call _FCALL            ; 1E23
   .word __3FCOMP         ; $1e26 1C26 - ?COMP
   .word _1               ; $1e28 0ED1 - 1
   .word __3FPAIRS        ; $1e2a 1C57 - ?PAIRS
   .word _COMPILE         ; $1e2c 0F83 - COMPILE
   .word _BRANCH          ; $1e2e 0A68 - BRANCH
   .word __3CRESOLVE      ; $1e30 1DA4 - <RESOLVE
   .word _EXIT            ; $1e32 0315 - EXIT

NFA_DO:          ; 1E34
   .byte 0x82,"DO" ; IMMEDIATE
   .word NFA_AGAIN        ; 1E1B
_DO:             ; 1E39 - 1E4C
   call _FCALL            ; 1E39
   .word __3FCOMP         ; $1e3c 1C26 - ?COMP
   .word _COMPILE         ; $1e3e 0F83 - COMPILE
   .word __28DO_29        ; $1e40 0AE5 - (DO)
   .word __3EMARK         ; $1e42 1D69 - >MARK
   .word __3CMARK         ; $1e44 1D92 - <MARK
   .word _LIT             ; $1e46 0A2B - LIT
   .word $0003            ; $1e48 0003
   .word _EXIT            ; $1e4a 0315 - EXIT

NFA__3FDO:       ; 1E4C
   .byte 0x83,"?DO" ; IMMEDIATE
   .word NFA_DO           ; 1E34
__3FDO:          ; 1E52 - 1E65
   call _FCALL            ; 1E52
   .word __3FCOMP         ; $1e55 1C26 - ?COMP
   .word _COMPILE         ; $1e57 0F83 - COMPILE
   .word __28_3FDO_29     ; $1e59 0B0C - (?DO)
   .word __3EMARK         ; $1e5b 1D69 - >MARK
   .word __3CMARK         ; $1e5d 1D92 - <MARK
   .word _LIT             ; $1e5f 0A2B - LIT
   .word $0003            ; $1e61 0003
   .word _EXIT            ; $1e63 0315 - EXIT

NFA_LOOP:        ; 1E65
   .byte 0x84,"LOOP" ; IMMEDIATE
   .word NFA__3FDO          ; 1E4C
_LOOP:           ; 1E6C - 1E81
   call _FCALL            ; 1E6C
   .word __3FCOMP         ; $1e6f 1C26 - ?COMP
   .word _LIT             ; $1e71 0A2B - LIT
   .word $0003            ; $1e73 0003
   .word __3FPAIRS        ; $1e75 1C57 - ?PAIRS
   .word _COMPILE         ; $1e77 0F83 - COMPILE
   .word __28LOOP_29      ; $1e79 0B2E - (LOOP)
   .word __3CRESOLVE      ; $1e7b 1DA4 - <RESOLVE
   .word __3ERESOLVE      ; $1e7d 1D7F - >RESOLVE
   .word _EXIT            ; $1e7f 0315 - EXIT

NFA__2BLOOP:     ; 1E81
   .byte 0x85,"+LOOP" ; IMMEDIATE
   .word NFA_LOOP         ; 1E65
__2BLOOP:        ; 1E89 - 1E9E
   call _FCALL            ; 1E89
   .word __3FCOMP         ; $1e8c 1C26 - ?COMP
   .word _LIT             ; $1e8e 0A2B - LIT
   .word $0003            ; $1e90 0003
   .word __3FPAIRS        ; $1e92 1C57 - ?PAIRS
   .word _COMPILE         ; $1e94 0F83 - COMPILE
   .word __28_2BLOOP_29   ; $1e96 0B63 - (+LOOP)
   .word __3CRESOLVE      ; $1e98 1DA4 - <RESOLVE
   .word __3ERESOLVE      ; $1e9a 1D7F - >RESOLVE
   .word _EXIT            ; $1e9c 0315 - EXIT

NFA_UNTIL:       ; 1E9E
   .byte 0x85,"UNTIL" ; IMMEDIATE
   .word NFA__2BLOOP        ; 1E81
_UNTIL:          ; 1EA6 - 1EB7
   call _FCALL            ; 1EA6
   .word __3FCOMP         ; $1ea9 1C26 - ?COMP
   .word _1               ; $1eab 0ED1 - 1
   .word __3FPAIRS        ; $1ead 1C57 - ?PAIRS
   .word _COMPILE         ; $1eaf 0F83 - COMPILE
   .word __3FBRANCH       ; $1eb1 0A7A - ?BRANCH
   .word __3CRESOLVE      ; $1eb3 1DA4 - <RESOLVE
   .word _EXIT            ; $1eb5 0315 - EXIT

NFA_WHILE:       ; 1EB7
   .byte 0x85,"WHILE" ; IMMEDIATE
   .word NFA_UNTIL        ; 1E9E
_WHILE:          ; 1EBF - 1ED0
   call _FCALL            ; 1EBF
   .word __3FCOMP         ; $1ec2 1C26 - ?COMP
   .word _1               ; $1ec4 0ED1 - 1
   .word __3FPAIRS        ; $1ec6 1C57 - ?PAIRS
   .word _1               ; $1ec8 0ED1 - 1
   .word _IF              ; $1eca 1DB0 - IF
   .word _2_2B            ; $1ecc 0482 - 2+
   .word _EXIT            ; $1ece 0315 - EXIT

NFA_REPEAT:      ; 1ED0
   .byte 0x86,"REPEAT" ; IMMEDIATE
   .word NFA_WHILE        ; 1EB7
_REPEAT:         ; 1ED9 - 1EEE
   call _FCALL            ; 1ED9
   .word __3FCOMP         ; $1edc 1C26 - ?COMP
   .word __3ER            ; $1ede 090D - >R
   .word __3ER            ; $1ee0 090D - >R
   .word _AGAIN           ; $1ee2 1E23 - AGAIN
   .word _R_3E            ; $1ee4 0920 - R>
   .word _R_3E            ; $1ee6 0920 - R>
   .word _2_2D            ; $1ee8 0499 - 2-
   .word _THEN            ; $1eea 1DFB - THEN
   .word _EXIT            ; $1eec 0315 - EXIT

NFA__3EPRT:      ; 1EEE
   .byte 4,">PRT"
   .word NFA_REPEAT       ; 1ED0
__3EPRT:         ; 1EF5 - 1F0A
   call _FCALL            ; 1EF5
   .word _DUP             ; $1ef8 03D3 - DUP
   .word _BL              ; $1efa 16A6 - BL
   .word _U_3C            ; $1efc 04FA - U<
   .word _OVER            ; $1efe 0362 - OVER
   .word _LIT             ; $1f00 0A2B - LIT
   .word $0080            ; $1f02 0080
   .word _U_3C            ; $1f04 04FA - U<
   .word _BRANCH          ; $1f06 0A68 - BRANCH
   .word $15CD            ; $1f08 15CD !!! !!! !!!

NFA_PTYPE:       ; 1F0A
   .byte 5,"PTYPE"
   .word NFA__3EPRT         ; 1EEE
_PTYPE:          ; 1F12 - 1F2D
   call _FCALL            ; 1F12
   .word _0               ; $1f15 0EC8 - 0
   .word __28_3FDO_29     ; $1f17 0B0C - (?DO)
   .word $1F29            ; $1f19 1F29
   .word _DUP             ; $1f1b 03D3 - DUP
   .word _C_40            ; $1f1d 0991 - C@
   .word __3EPRT          ; $1f1f 1EF5 - >PRT
   .word _EMIT            ; $1f21 153D - EMIT
   .word _1_2B            ; $1f23 0477 - 1+
   .word __28LOOP_29      ; $1f25 0B2E - (LOOP)
   .word $1F1B            ; $1f27 1F1B
   .word _DROP            ; $1f29 0382 - DROP
   .word _EXIT            ; $1f2b 0315 - EXIT

NFA_BREAK:       ; 1F2D
   .byte 5,"BREAK"
   .word NFA_PTYPE        ; 1F0A
_BREAK:          ; 1F35 - 1F5F
   call _FCALL            ; 1F35
   .word __3FKEY          ; $1f38 0CE5 - ?KEY
   .word __3FBRANCH       ; $1f3a 0A7A - ?BRANCH
   .word $1F5D            ; $1f3c 1F5D
   .word _DROP            ; $1f3e 0382 - DROP
   .word _KEY             ; $1f40 1554 - KEY
   .word _LIT             ; $1f42 0A2B - LIT
   .word $0043            ; $1f44 0043
   .word __3D             ; $1f46 0566 - =
   .word __3FDUP          ; $1f48 03E0 - ?DUP
   .word __3FBRANCH       ; $1f4a 0A7A - ?BRANCH
   .word $1F5D            ; $1f4c 1F5D
   .word _CR              ; $1f4e 1566 - CR
   .word __28ABORT_22_29  ; $1f50 114A - (ABORT")
   .byte 10," - ",0xf0,"PEPBAH"
   .word _EXIT            ; $1f5d 0315 - EXIT

NFA_DUMP:        ; 1F5F
   .byte 4,"DUMP"
   .word NFA_BREAK        ; 1F2D
_DUMP:           ; 1F66 - 1FC5
   call _FCALL            ; 1F66
   .word _LIT             ; $1f69 0A2B - LIT
   .word $0007            ; $1f6b 0007
   .word __2B             ; $1f6d 044A - +
   .word _LIT             ; $1f6f 0A2B - LIT
   .word $0008            ; $1f71 0008
   .word _U_2F            ; $1f73 0FFC - U/
   .word _0               ; $1f75 0EC8 - 0
   .word __28_3FDO_29     ; $1f77 0B0C - (?DO)
   .word $1FC1            ; $1f79 1FC1
   .word _CR              ; $1f7b 1566 - CR
   .word _BREAK           ; $1f7d 1F35 - BREAK
   .word _BASE            ; $1f7f 0208 - BASE
   .word __40             ; $1f81 0984 - @
   .word _SWAP            ; $1f83 038D - SWAP
   .word _HEX             ; $1f85 167D - HEX
   .word _DUP             ; $1f87 03D3 - DUP
   .word _LIT             ; $1f89 0A2B - LIT
   .word $0004            ; $1f8b 0004
   .word __2E0            ; $1f8d 12D3 - .0
   .word _SPACE           ; $1f8f 16C4 - SPACE
   .word _SPACE           ; $1f91 16C4 - SPACE
   .word _DUP             ; $1f93 03D3 - DUP
   .word _LIT             ; $1f95 0A2B - LIT
   .word $0008            ; $1f97 0008
   .word _0               ; $1f99 0EC8 - 0
   .word __28DO_29        ; $1f9b 0AE5 - (DO)
   .word $1FAF            ; $1f9d 1FAF
   .word _DUP             ; $1f9f 03D3 - DUP
   .word _C_40            ; $1fa1 0991 - C@
   .word _2               ; $1fa3 0EDA - 2
   .word __2E0            ; $1fa5 12D3 - .0
   .word _SPACE           ; $1fa7 16C4 - SPACE
   .word _1_2B            ; $1fa9 0477 - 1+
   .word __28LOOP_29      ; $1fab 0B2E - (LOOP)
   .word $1F9F            ; $1fad 1F9F
   .word _SWAP            ; $1faf 038D - SWAP
   .word _LIT             ; $1fb1 0A2B - LIT
   .word $0008            ; $1fb3 0008
   .word _PTYPE           ; $1fb5 1F12 - PTYPE
   .word _SWAP            ; $1fb7 038D - SWAP
   .word _BASE            ; $1fb9 0208 - BASE
   .word __21             ; $1fbb 099D - !
   .word __28LOOP_29      ; $1fbd 0B2E - (LOOP)
   .word $1F7B            ; $1fbf 1F7B
   .word _DROP            ; $1fc1 0382 - DROP
   .word _EXIT            ; $1fc3 0315 - EXIT

NFA_TRAIL:       ; 1FC5
   .byte 5,"TRAIL"
   .word NFA_DUMP         ; 1F5F
_TRAIL:          ; 1FCD - 202F
   call _FCALL            ; 1FCD
   .word _C_2FL           ; $1fd0 146E - C/L
   .word __3EOUT          ; $1fd2 02A6 - >OUT
   .word __40             ; $1fd4 0984 - @
   .word __2D             ; $1fd6 0455 - -
   .word _EXIT            ; $1fd8 0315 - EXIT

NFA_NLIST:       ; 1FDA
   .byte 5,"NLIST"
   .word NFA_TRAIL        ; 1FC5
_NLIST:          ; 1FE2 - None
   call $02e4    ; $1fe2 cd e4 02
   .word __40             ; $1fe5 0984 - @
   .word _DUP             ; $1fe7 03D3 - DUP
   .word __3FBRANCH       ; $1fe9 0A7A - ?BRANCH
   .word $202B            ; $1feb 202B
   .word _DUP             ; $1fed 03D3 - DUP
   .word _COUNT           ; $1fef 0F6F - COUNT
   .word _LIT             ; $1ff1 0A2B - LIT
   .word $003F            ; $1ff3 003F
   .word _AND             ; $1ff5 08C8 - AND
   .word _TRAIL           ; $1ff7 1FCD - TRAIL
   .word _OVER            ; $1ff9 0362 - OVER
   .word _U_3C            ; $1ffb 04FA - U<
   .word __3FBRANCH       ; $1ffd 0A7A - ?BRANCH
   .word $2003            ; $1fff 2003
   .word _CR              ; $2001 1566 - CR
   .word _DUP             ; $2003 03D3 - DUP
   .word _LIT             ; $2005 0A2B - LIT
   .word $0008            ; $2007 0008
   .word __2B             ; $2009 044A - +
   .word _LIT             ; $200b 0A2B - LIT
   .word $FFF8            ; $200d FFF8
   .word _AND             ; $200f 08C8 - AND
   .word _OVER            ; $2011 0362 - OVER
   .word __2D             ; $2013 0455 - -
   .word __2DROT          ; $2015 03C5 - -ROT
   .word _TYPE            ; $2017 157E - TYPE
   .word _TRAIL           ; $2019 1FCD - TRAIL
   .word _MIN             ; $201b 04C1 - MIN
   .word _0               ; $201d 0EC8 - 0
   .word _MAX             ; $201f 04DE - MAX
   .word _SPACES          ; $2021 16D6 - SPACES
   .word _N_3ELINK        ; $2023 137B - N>LINK
   .word _BREAK           ; $2025 1F35 - BREAK
   .word _BRANCH          ; $2027 0A68 - BRANCH
   .word $1FE5            ; $2029 1FE5
   .word _DROP            ; $202b 0382 - DROP
   .word _EXIT            ; $202d 0315 - EXIT

NFA_WORDS:       ; 202F
   .byte 5,"WORDS"
   .word NFA_TRAIL        ; 1FC5
_WORDS:          ; 2037 - 2042
   call _FCALL            ; 2037
   .word _CONTEXT         ; $203a 0224 - CONTEXT
   .word __40             ; $203c 0984 - @
   .word _NLIST           ; $203e 1FE2 - NLIST
   .word _EXIT            ; $2040 0315 - EXIT

NFA_VLIST:       ; 2042
   .byte 5,"VLIST"
   .word NFA_WORDS        ; 202F
_VLIST:          ; 204A - 2051
   call _FCALL            ; 204A
   .word _WORDS           ; $204d 2037 - WORDS
   .word _EXIT            ; $204f 0315 - EXIT

NFA__2D_2D:      ; 2051
   .byte 0x82,"--" ; IMMEDIATE
   .word NFA_VLIST        ; 2042
__2D_2D:         ; 2056 - 207F
   call _FCALL            ; 2056
   .word _BLK             ; $2059 02B1 - BLK
   .word __40             ; $205b 0984 - @
   .word __3FBRANCH       ; $205d 0A7A - ?BRANCH
   .word $2075            ; $205f 2075
   .word __3EIN           ; $2061 0276 - >IN
   .word __40             ; $2063 0984 - @
   .word _LIT             ; $2065 0A2B - LIT
   .word $003F            ; $2067 003F
   .word __2B             ; $2069 044A - +
   .word _LIT             ; $206b 0A2B - LIT
   .word $FFC0            ; $206d FFC0
   .word _AND             ; $206f 08C8 - AND
   .word _BRANCH          ; $2071 0A68 - BRANCH
   .word $2079            ; $2073 2079
   .word __23TIB          ; $2075 026B - #TIB
   .word __40             ; $2077 0984 - @
   .word __3EIN           ; $2079 0276 - >IN
   .word __21             ; $207b 099D - !
   .word _EXIT            ; $207d 0315 - EXIT

NFA_NOOP:        ; 207F
   .byte 4,"NOOP"
   .word NFA__2D_2D           ; 2051
_NOOP:           ; 2086 - 208B
   call _FCALL            ; 2086
   .word _EXIT            ; $2089 0315 - EXIT

NFA_S_2E:        ; 208B
   .byte 2,"S."
   .word NFA_NOOP         ; 207F
_S_2E:           ; 2090 - 20C7
   call _FCALL            ; 2090
   .word _DEPTH           ; $2093 1CD9 - DEPTH
   .word __3FDUP          ; $2095 03E0 - ?DUP
   .word __3FBRANCH       ; $2097 0A7A - ?BRANCH
   .word $20B9            ; $2099 20B9
   .word _1_2B            ; $209b 0477 - 1+
   .word _1               ; $209d 0ED1 - 1
   .word __28DO_29        ; $209f 0AE5 - (DO)
   .word $20B5            ; $20a1 20B5
   .word _S0              ; $20a3 01BE - S0
   .word __40             ; $20a5 0984 - @
   .word _I               ; $20a7 0A9F - I
   .word _2_2A            ; $20a9 04A5 - 2*
   .word __2D             ; $20ab 0455 - -
   .word __40             ; $20ad 0984 - @
   .word __2E             ; $20af 12FE - .
   .word __28LOOP_29      ; $20b1 0B2E - (LOOP)
   .word $20A3            ; $20b3 20A3
   .word _BRANCH          ; $20b5 0A68 - BRANCH
   .word $20C5            ; $20b7 20C5
   .word __28_2E_22_29    ; $20b9 183E - (.")
   .byte 9,"CTEK ",0xf0,0xf5,"CT"
   .word _EXIT            ; $20c5 0315 - EXIT

NFA__28:         ; 20C7
   .byte 0x81,"(" ; IMMEDIATE
   .word NFA_S_2E           ; 208B
__28:            ; 20CB - 20F7
   call _FCALL            ; 20CB
   .word _LIT             ; $20ce 0A2B - LIT
   .word $0029            ; $20d0 0029
   .word _WORD            ; $20d2 13ED - WORD
   .word _DROP            ; $20d4 0382 - DROP
   .word _EXIT            ; $20d6 0315 - EXIT

NFA__3FCURRENT:  ; 20D8
   .byte 8,"?CURRENT"
   .word NFA__28            ; 20C7
__3FCURRENT:     ; 20E3 - None
   call $02E4             ; $20e4 02E4
   .word _CURRENT         ; $20e6 0233 - CURRENT
   .word __40             ; $20e8 0984 - @
   .word __3FWORD         ; $20ea 083F - ?WORD
   .word _0_3D            ; $20ec 057E - 0=
   .word __28ABORT_22_29  ; $20ee 114A - (ABORT")
   .byte 4," - ?"
   .word _EXIT            ; $20f5 0315 - EXIT

NFA_SCRATCH:     ; 20F7
   .byte 0x87,"SCRATCH" ; IMMEDIATE
   .word NFA__28            ; 20C7
_SCRATCH:        ; 2101 - 211B
   call _FCALL            ; 2101
   .word __3FEXEC         ; $2104 1BF8 - ?EXEC
   .word _BL              ; $2106 16A6 - BL
   .word _WORD            ; $2108 13ED - WORD
   .word _CURRENT         ; $210a 0233 - CURRENT
   .word __40             ; $210c 0984 - @
   .word __2DWORD         ; $210e 1818 - -WORD
   .word _0_3D            ; $2110 057E - 0=
   .word __28ABORT_22_29  ; $2112 114A - (ABORT")
   .byte 4," - ?"
   .word _EXIT            ; $2119 0315 - EXIT

NFA_JOIN:        ; 211B
   .byte 0x84,"JOIN" ; IMMEDIATE
   .word NFA_SCRATCH      ; 20F7
_JOIN:           ; 2122 - 2139
   call _FCALL            ; 2122
   .word __3FEXEC         ; $2125 1BF8 - ?EXEC
   .word _BL              ; $2127 16A6 - BL
   .word _WORD            ; $2129 13ED - WORD
   .word __3FCURRENT      ; $212b 20E3 - ?CURRENT
   .word _N_3ELINK        ; $212d 137B - N>LINK
   .word __40             ; $212f 0984 - @
   .word _LATEST          ; $2131 1720 - LATEST
   .word _N_3ELINK        ; $2133 137B - N>LINK
   .word __21             ; $2135 099D - !
   .word _EXIT            ; $2137 0315 - EXIT

NFA_NEW:         ; 2139
   .byte 0x83,"NEW" ; IMMEDIATE
   .word NFA_JOIN         ; 211B
_NEW:            ; 213F - 2176
   call _FCALL            ; 213F
   .word __3FEXEC         ; $2142 1BF8 - ?EXEC
   .word _BL              ; $2144 16A6 - BL
   .word _WORD            ; $2146 13ED - WORD
   .word _DUP             ; $2148 03D3 - DUP
   .word __3FCURRENT      ; $214a 20E3 - ?CURRENT
   .word _CURRENT         ; $214c 0233 - CURRENT
   .word __40             ; $214e 0984 - @
   .word __3ER            ; $2150 090D - >R
   .word _DUP             ; $2152 03D3 - DUP
   .word _N_3ELINK        ; $2154 137B - N>LINK
   .word _CURRENT         ; $2156 0233 - CURRENT
   .word __21             ; $2158 099D - !
   .word _NAME_3E         ; $215a 1392 - NAME>
   .word _SWAP            ; $215c 038D - SWAP
   .word __3FCURRENT      ; $215e 20E3 - ?CURRENT
   .word _NAME_3E         ; $2160 1392 - NAME>
   .word _LIT             ; $2162 0A2B - LIT
   .word $00C3            ; $2164 00C3
   .word _OVER            ; $2166 0362 - OVER
   .word _C_21            ; $2168 09AA - C!
   .word _1_2B            ; $216a 0477 - 1+
   .word __21             ; $216c 099D - !
   .word _R_3E            ; $216e 0920 - R>
   .word _CURRENT         ; $2170 0233 - CURRENT
   .word __21             ; $2172 099D - !
   .word _EXIT            ; $2174 0315 - EXIT

NFA_FORGET:      ; 2176
   .byte 6,"FORGET"
   .word NFA_NEW          ; 2139
_FORGET:         ; 217F - 21EF
   call _FCALL            ; 217F
   .word _BL              ; $2182 16A6 - BL
   .word _WORD            ; $2184 13ED - WORD
   .word __3FCURRENT      ; $2186 20E3 - ?CURRENT
   .word _DUP             ; $2188 03D3 - DUP
   .word _FENCE           ; $218a 01EE - FENCE
   .word __40             ; $218c 0984 - @
   .word _U_3C            ; $218e 04FA - U<
   .word __28ABORT_22_29  ; $2190 114A - (ABORT")
   .byte 14,"B",0xf9,"XO",0xe4," ",0xfa,"A FENCE"
   .word __3ER            ; $21a1 090D - >R
   .word _VOC_2DLINK      ; $21a3 01E1 - VOC-LINK
   .word __40             ; $21a5 0984 - @
   .word _R_40            ; $21a7 0933 - R@
   .word _OVER            ; $21a9 0362 - OVER
   .word _U_3C            ; $21ab 04FA - U<
   .word __3FBRANCH       ; $21ad 0A7A - ?BRANCH
   .word $21C1            ; $21af 21C1
   .word _FORTH           ; $21b1 3450 - FORTH
   .word _DEFINITIONS     ; $21b3 170A - DEFINITIONS
   .word __40             ; $21b5 0984 - @
   .word _DUP             ; $21b7 03D3 - DUP
   .word _VOC_2DLINK      ; $21b9 01E1 - VOC-LINK
   .word __21             ; $21bb 099D - !
   .word _BRANCH          ; $21bd 0A68 - BRANCH
   .word $21A7            ; $21bf 21A7
   .word _DUP             ; $21c1 03D3 - DUP
   .word _LIT             ; $21c3 0A2B - LIT
   .word $0004            ; $21c5 0004
   .word __2D             ; $21c7 0455 - -
   .word _N_3ELINK        ; $21c9 137B - N>LINK
   .word __40             ; $21cb 0984 - @
   .word _DUP             ; $21cd 03D3 - DUP
   .word _R_40            ; $21cf 0933 - R@
   .word _U_3C            ; $21d1 04FA - U<
   .word __3FBRANCH       ; $21d3 0A7A - ?BRANCH
   .word $21C9            ; $21d5 21C9
   .word _OVER            ; $21d7 0362 - OVER
   .word _2_2D            ; $21d9 0499 - 2-
   .word __21             ; $21db 099D - !
   .word __40             ; $21dd 0984 - @
   .word __3FDUP          ; $21df 03E0 - ?DUP
   .word _0_3D            ; $21e1 057E - 0=
   .word __3FBRANCH       ; $21e3 0A7A - ?BRANCH
   .word $21C1            ; $21e5 21C1
   .word _R_3E            ; $21e7 0920 - R>
   .word _H               ; $21e9 01D1 - H
   .word __21             ; $21eb 099D - !
   .word _EXIT            ; $21ed 0315 - EXIT

NFA_ASSEMBLER:   ; 21EF
   .byte 9,"ASSEMBLER"
   .word NFA_FORGET       ; 2176
_ASSEMBLER:      ; 21FB - 28E3
   call l1b95    ; cd 95
   .byte $01     ; $21fe 01
   .byte $80
   .word $296f
   .word $3457   ; $2202 57      

   call $02e4    ; $2204 cd e4 02
   .word _2_2A            ; $2207 04A5 - 2*
   .word _2_2A            ; $2209 04A5 - 2*
   .word _2_2A            ; $220b 04A5 - 2*
   .word _EXIT            ; $220d 0315 - EXIT

   lxi b,$5348   ; $220f 01 48 53
   inr m         ; $2212 34      
   call $0984    ; $2213 cd 84 09
   inr b         ; $2216 04      
   nop           ; $2217 00      
   lxi b,$0f4c   ; $2218 01 4c 0f
   shld $84cd    ; $221b 22 cd 84
   dad b         ; $221e 09      
   dcr b         ; $221f 05      
   nop           ; $2220 00      
   lxi b,$1841   ; $2221 01 41 18
   shld $84cd    ; $2224 22 cd 84
   dad b         ; $2227 09      
   rlc           ; $2228 07      
   nop           ; $2229 00      
   inx b         ; $222a 03      
   mov d,b       ; $222b 50      
   mov d,e       ; $222c 53      
   mov d,a       ; $222d 57      
   lxi h,$cd22   ; $222e 21 22 cd
   add h         ; $2231 84      
   dad b         ; $2232 09      
   mvi b,$00     ; $2233 06 00   
   lxi b,$2a44   ; $2235 01 44 2a
   shld $84cd    ; $2238 22 cd 84
   dad b         ; $223b 09      
   stax b        ; $223c 02      
   nop           ; $223d 00      
   lxi b,$3545   ; $223e 01 45 35
   shld $84cd    ; $2241 22 cd 84
   dad b         ; $2244 09      
   inx b         ; $2245 03      
   nop           ; $2246 00      
   lxi b,$3e42   ; $2247 01 42 3e
   shld $84cd    ; $224a 22 cd 84
   dad b         ; $224d 09      
   nop           ; $224e 00      
   nop           ; $224f 00      
   lxi b,$4743   ; $2250 01 43 47
   shld $84cd    ; $2253 22 cd 84
   dad b         ; $2256 09      
   lxi b,$0100   ; $2257 01 00 01
   mov c,l       ; $225a 4d      
   mov d,b       ; $225b 50      
   shld $84cd    ; $225c 22 cd 84
   dad b         ; $225f 09      
   mvi b,$00     ; $2260 06 00   
   stax b        ; $2262 02      
   mov d,e       ; $2263 53      
   mov d,b       ; $2264 50      
   mov e,c       ; $2265 59      
   shld $84cd    ; $2266 22 cd 84
   dad b         ; $2269 09      
   mvi b,$00     ; $226a 06 00   
   call $02e4    ; $226c cd e4 02
   .word _C_40            ; $226f 0991 - C@
   .word _C_2C            ; $2271 0F2F - C,
   .word _EXIT            ; $2273 0315 - EXIT

   call $02e4    ; $2275 cd e4 02
   .word _C_40            ; $2278 0991 - C@
   .word __2B             ; $227a 044A - +
   .word _C_2C            ; $227c 0F2F - C,
   .word _EXIT            ; $227e 0315 - EXIT

   call $02e4    ; $2280 cd e4 02
   .word _C_40            ; $2283 0991 - C@
   .word _SWAP            ; $2285 038D - SWAP
   .word $2204            ; $2287 2204
   .word __2B             ; $2289 044A - +
   .word _C_2C            ; $228b 0F2F - C,
   .word _EXIT            ; $228d 0315 - EXIT

   call $02e4    ; $228f cd e4 02
   sub c         ; $2292 91      
   dad b         ; $2293 09      
   cma           ; $2294 2f      
   rrc           ; $2295 0f      
   cma           ; $2296 2f      
   rrc           ; $2297 0f      
   dcr d         ; $2298 15      
   inx b         ; $2299 03      
   call $02e4    ; $229a cd e4 02
   sub c         ; $229d 91      
   dad b         ; $229e 09      
   cma           ; $229f 2f      
   rrc           ; $22a0 0f      
   dcr e         ; $22a1 1d      
   rrc           ; $22a2 0f      
   dcr d         ; $22a3 15      
   inx b         ; $22a4 03      
   call $0984    ; $22a5 cd 84 09
   ldax b        ; $22a8 0a      
   nop           ; $22a9 00      
   call $0984    ; $22aa cd 84 09
   mov d,e       ; $22ad 53      
   dcr m         ; $22ae 35      
   call $0984    ; $22af cd 84 09
   ldax b        ; $22b2 0a      
   nop           ; $22b3 00      
   call $0984    ; $22b4 cd 84 09
   mov a,l       ; $22b7 7d      
   dcr m         ; $22b8 35      
   call $02e4    ; $22b9 cd e4 02
   ana l         ; $22bc a5      
   shld $0ec8    ; $22bd 22 c8 0e
   push h        ; $22c0 e5      
   ldax b        ; $22c1 0a      
   rst 6         ; $22c2 f7      
   shld $0a9f    ; $22c3 22 9f 0a
   ana l         ; $22c6 a5      
   inr b         ; $22c7 04      
   ana l         ; $22c8 a5      
   inr b         ; $22c9 04      
   xra d         ; $22ca aa      
   shld $044a    ; $22cb 22 4a 04
   add h         ; $22ce 84      
   dad b         ; $22cf 09      
   mov c,d       ; $22d0 4a      
   lxi d,$4520   ; $22d1 11 20 45
   mov b,e       ; $22d4 43      
   mov d,h       ; $22d5 54      
   rm            ; $22d6 f8      
   .byte 0x20    ; $22d7 20      
   mov c,b       ; $22d8 48      
   mov b,l       ; $22d9 45      
   mov d,b       ; $22da 50      
   mov b,c       ; $22db 41      
   jm $4550      ; $22dc fa 50 45
   ei            ; $22df fb      
   mov b,l       ; $22e0 45      
   mov c,b       ; $22e1 48      
   mov c,b       ; $22e2 48      
   mov b,c       ; $22e3 41      
   pop psw       ; $22e4 f1      
   .byte 0x20    ; $22e5 20      
   mov b,e       ; $22e6 43      
   mov b,e       ; $22e7 43      
   sphl          ; $22e8 f9      
   cpe $414b     ; $22e9 ec 4b 41
   .byte 0x20    ; $22ec 20      
   mov b,d       ; $22ed 42      
   rp            ; $22ee f0      
   mov b,l       ; $22ef 45      
   mov d,b       ; $22f0 50      
   mov b,l       ; $22f1 45      
   cpo $0b2e     ; $22f2 e4 2e 0b
   cnz $1522     ; $22f5 c4 22 15
   inx b         ; $22f8 03      
   call $02e4    ; $22f9 cd e4 02
   xra d         ; $22fc aa      
   shld $22a5    ; $22fd 22 a5 22
   ana l         ; $2300 a5      
   inr b         ; $2301 04      
   ana l         ; $2302 a5      
   inr b         ; $2303 04      
   mov e,e       ; $2304 5b      
   .byte 0x18    ; $2305 18      
   ora h         ; $2306 b4      
   shld $22af    ; $2307 22 af 22
   mov m,a       ; $230a 77      
   inr b         ; $230b 04      
   ana l         ; $230c a5      
   inr b         ; $230d 04      
   mov e,e       ; $230e 5b      
   .byte 0x18    ; $230f 18      
   dcr d         ; $2310 15      
   inx b         ; $2311 03      
   call $02e4    ; $2312 cd e4 02
   ana l         ; $2315 a5      
   shld $0ec8    ; $2316 22 c8 0e
   push h        ; $2319 e5      
   ldax b        ; $231a 0a      
   mov b,a       ; $231b 47      
   inx h         ; $231c 23      
   sbb a         ; $231d 9f      
   ldax b        ; $231e 0a      
   ana l         ; $231f a5      
   inr b         ; $2320 04      
   ana l         ; $2321 a5      
   inr b         ; $2322 04      
   xra d         ; $2323 aa      
   shld $044a    ; $2324 22 4a 04
   jp $8403      ; $2327 f2 03 84
   dad b         ; $232a 09      
   mov h,m       ; $232b 66      
   dcr b         ; $232c 05      
   mov a,d       ; $232d 7a      
   ldax b        ; $232e 0a      
   mov b,c       ; $232f 41      
   inx h         ; $2330 23      
   rst 7         ; $2331 ff      
   mvi c,$62     ; $2332 0e 62   
   inx b         ; $2334 03      
   add d         ; $2335 82      
   inr b         ; $2336 04      
   add h         ; $2337 84      
   dad b         ; $2338 09      
   jc $fc09      ; $2339 da 09 fc
   dad b         ; $233c 09      
   mov l,b       ; $233d 68      
   ldax b        ; $233e 0a      
   mov b,e       ; $233f 43      
   inx h         ; $2340 23      
   add d         ; $2341 82      
   inx b         ; $2342 03      
   mvi l,$0b     ; $2343 2e 0b   
   dcr e         ; $2345 1d      
   inx h         ; $2346 23      
   dcr d         ; $2347 15      
   inx b         ; $2348 03      
   call $02e4    ; $2349 cd e4 02
   ana l         ; $234c a5      
   shld $0477    ; $234d 22 77 04
   rz            ; $2350 c8      
   mvi c,$e5     ; $2351 0e e5   
   ldax b        ; $2353 0a      
   xra b         ; $2354 a8      
   inx h         ; $2355 23      
   ana l         ; $2356 a5      
   shld $0a9f    ; $2357 22 9f 0a
   mov h,m       ; $235a 66      
   dcr b         ; $235b 05      
   mov c,d       ; $235c 4a      
   lxi d,$431b   ; $235d 11 1b 43
   cpe $fbe9     ; $2360 ec e9 fb
   mov c,e       ; $2363 4b      
   mov c,a       ; $2364 4f      
   mov c,l       ; $2365 4d      
   .byte 0x20    ; $2366 20      
   mov c,l       ; $2367 4d      
   mov c,b       ; $2368 48      
   mov c,a       ; $2369 4f      
   rst 4         ; $236a e7      
   mov c,a       ; $236b 4f      
   .byte 0x20    ; $236c 20      
   mov b,e       ; $236d 43      
   mov b,e       ; $236e 43      
   sphl          ; $236f f9      
   cpe $4b4f     ; $2370 ec 4f 4b
   .byte 0x20    ; $2373 20      
   mov b,d       ; $2374 42      
   rp            ; $2375 f0      
   mov b,l       ; $2376 45      
   mov d,b       ; $2377 50      
   mov b,l       ; $2378 45      
   cpo $0a9f     ; $2379 e4 9f 0a
   ana l         ; $237c a5      
   inr b         ; $237d 04      
   ana l         ; $237e a5      
   inr b         ; $237f 04      
   xra d         ; $2380 aa      
   shld $044a    ; $2381 22 4a 04
   out $03       ; $2384 d3 03   
   add h         ; $2386 84      
   dad b         ; $2387 09      
   mov a,m       ; $2388 7e      
   dcr b         ; $2389 05      
   mov a,d       ; $238a 7a      
   ldax b        ; $238b 0a      
   ana d         ; $238c a2      
   inx h         ; $238d 23      
   jp $9d03      ; $238e f2 03 9d
   dad b         ; $2391 09      
   rst 7         ; $2392 ff      
   mvi c,$77     ; $2393 0e 77   
   inr b         ; $2395 04      
   adc l         ; $2396 8d      
   inx b         ; $2397 03      
   add d         ; $2398 82      
   inr b         ; $2399 04      
   sbb l         ; $239a 9d      
   dad b         ; $239b 09      
   mov a,c       ; $239c 79      
   inr e         ; $239d 1c      
   mov l,b       ; $239e 68      
   ldax b        ; $239f 0a      
   ana h         ; $23a0 a4      
   inx h         ; $23a1 23      
   add d         ; $23a2 82      
   inx b         ; $23a3 03      
   mvi l,$0b     ; $23a4 2e 0b   
   mov d,m       ; $23a6 56      
   inx h         ; $23a7 23      
   dcr d         ; $23a8 15      
   inx b         ; $23a9 03      
   call $02e4    ; $23aa cd e4 02
   lxi h,$1d1a   ; $23ad 21 1a 1d
   rrc           ; $23b0 0f      
   mov a,l       ; $23b1 7d      
   ldax d        ; $23b2 1a      
   call $02e4    ; $23b3 cd e4 02
   add h         ; $23b6 84      
   dad b         ; $23b7 09      
   stax d        ; $23b8 12      
   inx h         ; $23b9 23      
   rst 7         ; $23ba ff      
   mvi c,$8d     ; $23bb 0e 8d   
   inx b         ; $23bd 03      
   ana l         ; $23be a5      
   inr b         ; $23bf 04      
   ora h         ; $23c0 b4      
   shld $044a    ; $23c1 22 4a 04
   sbb l         ; $23c4 9d      
   dad b         ; $23c5 09      
   dcr d         ; $23c6 15      
   inx b         ; $23c7 03      
   call $02e4    ; $23c8 cd e4 02
   lxi h,$1d1a   ; $23cb 21 1a 1d
   rrc           ; $23ce 0f      
   mov a,l       ; $23cf 7d      
   ldax d        ; $23d0 1a      
   call $02e4    ; $23d1 cd e4 02
   add h         ; $23d4 84      
   dad b         ; $23d5 09      
   out $03       ; $23d6 d3 03   
   ana l         ; $23d8 a5      
   inr b         ; $23d9 04      
   ora h         ; $23da b4      
   shld $044a    ; $23db 22 4a 04
   add h         ; $23de 84      
   dad b         ; $23df 09      
   adc l         ; $23e0 8d      
   inx b         ; $23e1 03      
   mov h,d       ; $23e2 62      
   inx b         ; $23e3 03      
   mov a,m       ; $23e4 7e      
   dcr b         ; $23e5 05      
   mov a,d       ; $23e6 7a      
   ldax b        ; $23e7 0a      
   cpe $4923     ; $23e8 ec 23 49
   inx h         ; $23eb 23      
   add d         ; $23ec 82      
   inx b         ; $23ed 03      
   dcr d         ; $23ee 15      
   inx b         ; $23ef 03      
   inx b         ; $23f0 03      
   lxi sp,$3a23  ; $23f1 31 23 3a
   mov h,d       ; $23f4 62      
   shld $b3cd    ; $23f5 22 cd b3
   inx h         ; $23f8 23      
   lxi b,$0300   ; $23f9 01 00 03
   sta $3a23     ; $23fc 32 23 3a
   rp            ; $23ff f0      
   inx h         ; $2400 23      
   call $23b3    ; $2401 cd b3 23
   stax b        ; $2404 02      
   nop           ; $2405 00      
   inx b         ; $2406 03      
   inx sp        ; $2407 33      
   inx h         ; $2408 23      
   lda $23fb     ; $2409 3a fb 23
   call $23b3    ; $240c cd b3 23
   inx b         ; $240f 03      
   nop           ; $2410 00      
   inx b         ; $2411 03      
   inr m         ; $2412 34      
   inx h         ; $2413 23      
   lda $2406     ; $2414 3a 06 24
   call $23b3    ; $2417 cd b3 23
   inr b         ; $241a 04      
   nop           ; $241b 00      
   inx b         ; $241c 03      
   dcr m         ; $241d 35      
   inx h         ; $241e 23      
   lda $2411     ; $241f 3a 11 24
   call $23b3    ; $2422 cd b3 23
   dcr b         ; $2425 05      
   nop           ; $2426 00      
   inx b         ; $2427 03      
   mvi m,$23     ; $2428 36 23   
   lda $241c     ; $242a 3a 1c 24
   call $23b3    ; $242d cd b3 23
   mvi b,$00     ; $2430 06 00   
   inx b         ; $2432 03      
   stc           ; $2433 37      
   inx h         ; $2434 23      
   lda $2427     ; $2435 3a 27 24
   call $23b3    ; $2438 cd b3 23
   rlc           ; $243b 07      
   nop           ; $243c 00      
   inx b         ; $243d 03      
   .byte 0x38    ; $243e 38      
   inx h         ; $243f 23      
   lda $2432     ; $2440 3a 32 24
   call $23b3    ; $2443 cd b3 23
   .byte 0x08    ; $2446 08      
   nop           ; $2447 00      
   inx b         ; $2448 03      
   dad sp        ; $2449 39      
   inx h         ; $244a 23      
   lda $243d     ; $244b 3a 3d 24
   call $23b3    ; $244e cd b3 23
   dad b         ; $2451 09      
   nop           ; $2452 00      
   inr b         ; $2453 04      
   lxi sp,$2330  ; $2454 31 30 23
   lda $2448     ; $2457 3a 48 24
   call $23b3    ; $245a cd b3 23
   ldax b        ; $245d 0a      
   nop           ; $245e 00      
   stax b        ; $245f 02      
   lxi sp,$5323  ; $2460 31 23 53
   inr h         ; $2463 24      
   call $23d1    ; $2464 cd d1 23
   lxi b,$0200   ; $2467 01 00 02
   sta $5f23     ; $246a 32 23 5f
   inr h         ; $246d 24      
   call $23d1    ; $246e cd d1 23
   stax b        ; $2471 02      
   nop           ; $2472 00      
   stax b        ; $2473 02      
   inx sp        ; $2474 33      
   inx h         ; $2475 23      
   mov l,c       ; $2476 69      
   inr h         ; $2477 24      
   call $23d1    ; $2478 cd d1 23
   inx b         ; $247b 03      
   nop           ; $247c 00      
   stax b        ; $247d 02      
   inr m         ; $247e 34      
   inx h         ; $247f 23      
   mov m,e       ; $2480 73      
   inr h         ; $2481 24      
   call $23d1    ; $2482 cd d1 23
   inr b         ; $2485 04      
   nop           ; $2486 00      
   stax b        ; $2487 02      
   dcr m         ; $2488 35      
   inx h         ; $2489 23      
   mov a,l       ; $248a 7d      
   inr h         ; $248b 24      
   call $23d1    ; $248c cd d1 23
   dcr b         ; $248f 05      
   nop           ; $2490 00      
   stax b        ; $2491 02      
   mvi m,$23     ; $2492 36 23   
   add a         ; $2494 87      
   inr h         ; $2495 24      
   call $23d1    ; $2496 cd d1 23
   mvi b,$00     ; $2499 06 00   
   stax b        ; $249b 02      
   stc           ; $249c 37      
   inx h         ; $249d 23      
   sub c         ; $249e 91      
   inr h         ; $249f 24      
   call $23d1    ; $24a0 cd d1 23
   rlc           ; $24a3 07      
   nop           ; $24a4 00      
   stax b        ; $24a5 02      
   .byte 0x38    ; $24a6 38      
   inx h         ; $24a7 23      
   sbb e         ; $24a8 9b      
   inr h         ; $24a9 24      
   call $23d1    ; $24aa cd d1 23
   .byte 0x08    ; $24ad 08      
   nop           ; $24ae 00      
   stax b        ; $24af 02      
   dad sp        ; $24b0 39      
   inx h         ; $24b1 23      
   ana l         ; $24b2 a5      
   inr h         ; $24b3 24      
   call $23d1    ; $24b4 cd d1 23
   dad b         ; $24b7 09      
   nop           ; $24b8 00      
   inx b         ; $24b9 03      
   lxi sp,$2330  ; $24ba 31 30 23
   xra a         ; $24bd af      
   inr h         ; $24be 24      
   call $23d1    ; $24bf cd d1 23
   ldax b        ; $24c2 0a      
   nop           ; $24c3 00      
   inx b         ; $24c4 03      
   mov c,m       ; $24c5 4e      
   mov c,a       ; $24c6 4f      
   mov d,b       ; $24c7 50      
   cmp c         ; $24c8 b9      
   inr h         ; $24c9 24      
   call $226c    ; $24ca cd 6c 22
   nop           ; $24cd 00      
   inx b         ; $24ce 03      
   mov c,b       ; $24cf 48      
   mov c,h       ; $24d0 4c      
   mov d,h       ; $24d1 54      
   cnz $cd24     ; $24d2 c4 24 cd
   mov l,h       ; $24d5 6c      
   shld $0276    ; $24d6 22 76 02
   mov b,h       ; $24d9 44      
   mov c,c       ; $24da 49      
   aci $24       ; $24db ce 24   
   call $226c    ; $24dd cd 6c 22
   di            ; $24e0 f3      
   stax b        ; $24e1 02      
   mov b,l       ; $24e2 45      
   mov c,c       ; $24e3 49      
   rc            ; $24e4 d8      
   inr h         ; $24e5 24      
   call $226c    ; $24e6 cd 6c 22
   ei            ; $24e9 fb      
   inx b         ; $24ea 03      
   mov d,d       ; $24eb 52      
   mov c,h       ; $24ec 4c      
   mov b,e       ; $24ed 43      
   pop h         ; $24ee e1      
   inr h         ; $24ef 24      
   call $226c    ; $24f0 cd 6c 22
   rlc           ; $24f3 07      
   inx b         ; $24f4 03      
   mov d,d       ; $24f5 52      
   mov d,d       ; $24f6 52      
   mov b,e       ; $24f7 43      
   jpe $cd24     ; $24f8 ea 24 cd
   mov l,h       ; $24fb 6c      
   shld $030f    ; $24fc 22 0f 03
   mov d,d       ; $24ff 52      
   mov b,c       ; $2500 41      
   mov c,h       ; $2501 4c      
   cp $cd24      ; $2502 f4 24 cd
   mov l,h       ; $2505 6c      
   shld $0317    ; $2506 22 17 03
   mov d,d       ; $2509 52      
   mov b,c       ; $250a 41      
   mov d,d       ; $250b 52      
   cpi $24       ; $250c fe 24   
   call $226c    ; $250e cd 6c 22
   rar           ; $2511 1f      
   inr b         ; $2512 04      
   mov d,b       ; $2513 50      
   mov b,e       ; $2514 43      
   mov c,b       ; $2515 48      
   mov c,h       ; $2516 4c      
   .byte 0x08    ; $2517 08      
   dcr h         ; $2518 25      
   call $226c    ; $2519 cd 6c 22
   pchl          ; $251c e9      
   inr b         ; $251d 04      
   mov d,e       ; $251e 53      
   mov d,b       ; $251f 50      
   mov c,b       ; $2520 48      
   mov c,h       ; $2521 4c      
   stax d        ; $2522 12      
   dcr h         ; $2523 25      
   call $226c    ; $2524 cd 6c 22
   sphl          ; $2527 f9      
   inr b         ; $2528 04      
   mov e,b       ; $2529 58      
   mov d,h       ; $252a 54      
   mov c,b       ; $252b 48      
   mov c,h       ; $252c 4c      
   dcr e         ; $252d 1d      
   dcr h         ; $252e 25      
   call $226c    ; $252f cd 6c 22
   xthl          ; $2532 e3      
   inr b         ; $2533 04      
   mov e,b       ; $2534 58      
   mov b,e       ; $2535 43      
   mov c,b       ; $2536 48      
   mov b,a       ; $2537 47      
   .byte 0x28    ; $2538 28      
   dcr h         ; $2539 25      
   call $226c    ; $253a cd 6c 22
   xchg          ; $253d eb      
   inx b         ; $253e 03      
   mov b,h       ; $253f 44      
   mov b,c       ; $2540 41      
   mov b,c       ; $2541 41      
   inx sp        ; $2542 33      
   dcr h         ; $2543 25      
   call $226c    ; $2544 cd 6c 22
   daa           ; $2547 27      
   inx b         ; $2548 03      
   mov b,e       ; $2549 43      
   mov c,l       ; $254a 4d      
   mov b,c       ; $254b 41      
   mvi a,$25     ; $254c 3e 25   
   call $226c    ; $254e cd 6c 22
   cma           ; $2551 2f      
   inx b         ; $2552 03      
   mov d,e       ; $2553 53      
   mov d,h       ; $2554 54      
   mov b,e       ; $2555 43      
   mov c,b       ; $2556 48      
   dcr h         ; $2557 25      
   call $226c    ; $2558 cd 6c 22
   stc           ; $255b 37      
   inx b         ; $255c 03      
   mov b,e       ; $255d 43      
   mov c,l       ; $255e 4d      
   mov b,e       ; $255f 43      
   mov d,d       ; $2560 52      
   dcr h         ; $2561 25      
   call $226c    ; $2562 cd 6c 22
   cmc           ; $2565 3f      
   inx b         ; $2566 03      
   mov b,c       ; $2567 41      
   mov b,h       ; $2568 44      
   mov b,h       ; $2569 44      
   mov e,h       ; $256a 5c      
   dcr h         ; $256b 25      
   call $2275    ; $256c cd 75 22
   add b         ; $256f 80      
   inx b         ; $2570 03      
   mov b,c       ; $2571 41      
   mov b,h       ; $2572 44      
   mov b,e       ; $2573 43      
   mov h,m       ; $2574 66      
   dcr h         ; $2575 25      
   call $2275    ; $2576 cd 75 22
   adc b         ; $2579 88      
   inx b         ; $257a 03      
   mov d,e       ; $257b 53      
   mov d,l       ; $257c 55      
   mov b,d       ; $257d 42      
   mov m,b       ; $257e 70      
   dcr h         ; $257f 25      
   call $2275    ; $2580 cd 75 22
   sub b         ; $2583 90      
   inx b         ; $2584 03      
   mov d,e       ; $2585 53      
   mov b,d       ; $2586 42      
   mov b,d       ; $2587 42      
   mov a,d       ; $2588 7a      
   dcr h         ; $2589 25      
   call $2275    ; $258a cd 75 22
   sbb b         ; $258d 98      
   inx b         ; $258e 03      
   mov b,c       ; $258f 41      
   mov c,m       ; $2590 4e      
   mov b,c       ; $2591 41      
   add h         ; $2592 84      
   dcr h         ; $2593 25      
   call $2275    ; $2594 cd 75 22
   ana b         ; $2597 a0      
   inx b         ; $2598 03      
   mov e,b       ; $2599 58      
   mov d,d       ; $259a 52      
   mov b,c       ; $259b 41      
   adc m         ; $259c 8e      
   dcr h         ; $259d 25      
   call $2275    ; $259e cd 75 22
   xra b         ; $25a1 a8      
   inx b         ; $25a2 03      
   mov c,a       ; $25a3 4f      
   mov d,d       ; $25a4 52      
   mov b,c       ; $25a5 41      
   sbb b         ; $25a6 98      
   dcr h         ; $25a7 25      
   call $2275    ; $25a8 cd 75 22
   ora b         ; $25ab b0      
   inx b         ; $25ac 03      
   mov b,e       ; $25ad 43      
   mov c,l       ; $25ae 4d      
   mov d,b       ; $25af 50      
   ana d         ; $25b0 a2      
   dcr h         ; $25b1 25      
   call $2275    ; $25b2 cd 75 22
   cmp b         ; $25b5 b8      
   inx b         ; $25b6 03      
   mov b,h       ; $25b7 44      
   mov b,c       ; $25b8 41      
   mov b,h       ; $25b9 44      
   xra h         ; $25ba ac      
   dcr h         ; $25bb 25      
   call $2280    ; $25bc cd 80 22
   dad b         ; $25bf 09      
   inx b         ; $25c0 03      
   mov d,b       ; $25c1 50      
   mov c,a       ; $25c2 4f      
   mov d,b       ; $25c3 50      
   ora m         ; $25c4 b6      
   dcr h         ; $25c5 25      
   call $2280    ; $25c6 cd 80 22
   pop b         ; $25c9 c1      
   inr b         ; $25ca 04      
   mov d,b       ; $25cb 50      
   mov d,l       ; $25cc 55      
   mov d,e       ; $25cd 53      
   mov c,b       ; $25ce 48      
   rnz           ; $25cf c0      
   dcr h         ; $25d0 25      
   call $2280    ; $25d1 cd 80 22
   push b        ; $25d4 c5      
   inr b         ; $25d5 04      
   mov d,e       ; $25d6 53      
   mov d,h       ; $25d7 54      
   mov b,c       ; $25d8 41      
   mov e,b       ; $25d9 58      
   jz $cd25      ; $25da ca 25 cd
   add b         ; $25dd 80      
   shld $0402    ; $25de 22 02 04
   mov c,h       ; $25e1 4c      
   mov b,h       ; $25e2 44      
   mov b,c       ; $25e3 41      
   mov e,b       ; $25e4 58      
   push d        ; $25e5 d5      
   dcr h         ; $25e6 25      
   call $2280    ; $25e7 cd 80 22
   ldax b        ; $25ea 0a      
   inx b         ; $25eb 03      
   mov c,c       ; $25ec 49      
   mov c,m       ; $25ed 4e      
   mov d,d       ; $25ee 52      
   rpo           ; $25ef e0      
   dcr h         ; $25f0 25      
   call $2280    ; $25f1 cd 80 22
   inr b         ; $25f4 04      
   inx b         ; $25f5 03      
   mov b,h       ; $25f6 44      
   mov b,e       ; $25f7 43      
   mov d,d       ; $25f8 52      
   xchg          ; $25f9 eb      
   dcr h         ; $25fa 25      
   call $2280    ; $25fb cd 80 22
   dcr b         ; $25fe 05      
   inx b         ; $25ff 03      
   mov c,c       ; $2600 49      
   mov c,m       ; $2601 4e      
   mov e,b       ; $2602 58      
   push psw      ; $2603 f5      
   dcr h         ; $2604 25      
   call $2280    ; $2605 cd 80 22
   inx b         ; $2608 03      
   inx b         ; $2609 03      
   mov b,h       ; $260a 44      
   mov b,e       ; $260b 43      
   mov e,b       ; $260c 58      
   rst 7         ; $260d ff      
   dcr h         ; $260e 25      
   call $2280    ; $260f cd 80 22
   dcx b         ; $2612 0b      
   inx b         ; $2613 03      
   mov d,d       ; $2614 52      
   mov d,e       ; $2615 53      
   mov d,h       ; $2616 54      
   dad b         ; $2617 09      
   mvi h,$cd     ; $2618 26 cd   
   add b         ; $261a 80      
   shld $03c7    ; $261b 22 c7 03
   mov c,a       ; $261e 4f      
   mov d,l       ; $261f 55      
   mov d,h       ; $2620 54      
   inx d         ; $2621 13      
   mvi h,$cd     ; $2622 26 cd   
   adc a         ; $2624 8f      
   shld $02d3    ; $2625 22 d3 02
   mov c,c       ; $2628 49      
   mov c,m       ; $2629 4e      
   dcr e         ; $262a 1d      
   mvi h,$cd     ; $262b 26 cd   
   adc a         ; $262d 8f      
   shld $03db    ; $262e 22 db 03
   mov b,c       ; $2631 41      
   mov b,h       ; $2632 44      
   mov c,c       ; $2633 49      
   daa           ; $2634 27      
   mvi h,$cd     ; $2635 26 cd   
   adc a         ; $2637 8f      
   shld $03c6    ; $2638 22 c6 03
   mov b,c       ; $263b 41      
   mov b,e       ; $263c 43      
   mov c,c       ; $263d 49      
   .byte 0x30    ; $263e 30      
   mvi h,$cd     ; $263f 26 cd   
   adc a         ; $2641 8f      
   shld $03ce    ; $2642 22 ce 03
   mov d,e       ; $2645 53      
   mov d,l       ; $2646 55      
   mov c,c       ; $2647 49      
   lda $cd26     ; $2648 3a 26 cd
   adc a         ; $264b 8f      
   shld $03d6    ; $264c 22 d6 03
   mov d,e       ; $264f 53      
   mov b,d       ; $2650 42      
   mov c,c       ; $2651 49      
   mov b,h       ; $2652 44      
   mvi h,$cd     ; $2653 26 cd   
   adc a         ; $2655 8f      
   shld $03de    ; $2656 22 de 03
   mov b,c       ; $2659 41      
   mov c,m       ; $265a 4e      
   mov c,c       ; $265b 49      
   mov c,m       ; $265c 4e      
   mvi h,$cd     ; $265d 26 cd   
   adc a         ; $265f 8f      
   shld $03e6    ; $2660 22 e6 03
   mov e,b       ; $2663 58      
   mov d,d       ; $2664 52      
   mov c,c       ; $2665 49      
   mov e,b       ; $2666 58      
   mvi h,$cd     ; $2667 26 cd   
   adc a         ; $2669 8f      
   shld $03ee    ; $266a 22 ee 03
   mov c,a       ; $266d 4f      
   mov d,d       ; $266e 52      
   mov c,c       ; $266f 49      
   mov h,d       ; $2670 62      
   mvi h,$cd     ; $2671 26 cd   
   adc a         ; $2673 8f      
   shld $03f6    ; $2674 22 f6 03
   mov b,e       ; $2677 43      
   mov d,b       ; $2678 50      
   mov c,c       ; $2679 49      
   mov l,h       ; $267a 6c      
   mvi h,$cd     ; $267b 26 cd   
   adc a         ; $267d 8f      
   shld $04fe    ; $267e 22 fe 04
   mov d,e       ; $2681 53      
   mov c,b       ; $2682 48      
   mov c,h       ; $2683 4c      
   mov b,h       ; $2684 44      
   hlt           ; $2685 76      
   mvi h,$cd     ; $2686 26 cd   
   sbb d         ; $2688 9a      
   shld $0422    ; $2689 22 22 04
   mov c,h       ; $268c 4c      
   mov c,b       ; $268d 48      
   mov c,h       ; $268e 4c      
   mov b,h       ; $268f 44      
   add b         ; $2690 80      
   mvi h,$cd     ; $2691 26 cd   
   sbb d         ; $2693 9a      
   shld $032a    ; $2694 22 2a 03
   mov d,e       ; $2697 53      
   mov d,h       ; $2698 54      
   mov b,c       ; $2699 41      
   adc e         ; $269a 8b      
   mvi h,$cd     ; $269b 26 cd   
   sbb d         ; $269d 9a      
   shld $0332    ; $269e 22 32 03
   mov c,h       ; $26a1 4c      
   mov b,h       ; $26a2 44      
   mov b,c       ; $26a3 41      
   sub m         ; $26a4 96      
   mvi h,$cd     ; $26a5 26 cd   
   sbb d         ; $26a7 9a      
   shld $033a    ; $26a8 22 3a 03
   mov b,e       ; $26ab 43      
   mov c,m       ; $26ac 4e      
   mov e,d       ; $26ad 5a      
   ana b         ; $26ae a0      
   mvi h,$cd     ; $26af 26 cd   
   sbb d         ; $26b1 9a      
   shld $02c4    ; $26b2 22 c4 02
   mov b,e       ; $26b5 43      
   mov e,d       ; $26b6 5a      
   xra d         ; $26b7 aa      
   mvi h,$cd     ; $26b8 26 cd   
   sbb d         ; $26ba 9a      
   shld $03cc    ; $26bb 22 cc 03
   mov b,e       ; $26be 43      
   mov c,m       ; $26bf 4e      
   mov b,e       ; $26c0 43      
   ora h         ; $26c1 b4      
   mvi h,$cd     ; $26c2 26 cd   
   sbb d         ; $26c4 9a      
   shld $02d4    ; $26c5 22 d4 02
   mov b,e       ; $26c8 43      
   mov b,e       ; $26c9 43      
   cmp l         ; $26ca bd      
   mvi h,$cd     ; $26cb 26 cd   
   sbb d         ; $26cd 9a      
   shld $03dc    ; $26ce 22 dc 03
   mov b,e       ; $26d1 43      
   mov d,b       ; $26d2 50      
   mov c,a       ; $26d3 4f      
   rst 0         ; $26d4 c7      
   mvi h,$cd     ; $26d5 26 cd   
   sbb d         ; $26d7 9a      
   shld $03e4    ; $26d8 22 e4 03
   mov b,e       ; $26db 43      
   mov d,b       ; $26dc 50      
   mov b,l       ; $26dd 45      
   rnc           ; $26de d0      
   mvi h,$cd     ; $26df 26 cd   
   sbb d         ; $26e1 9a      
   shld $02ec    ; $26e2 22 ec 02
   mov b,e       ; $26e5 43      
   mov d,b       ; $26e6 50      
   jc $cd26      ; $26e7 da 26 cd
   sbb d         ; $26ea 9a      
   shld $02f4    ; $26eb 22 f4 02
   mov b,e       ; $26ee 43      
   mov c,l       ; $26ef 4d      
   cpo $cd26     ; $26f0 e4 26 cd
   sbb d         ; $26f3 9a      
   shld $04fc    ; $26f4 22 fc 04
   mov b,e       ; $26f7 43      
   mov b,c       ; $26f8 41      
   mov c,h       ; $26f9 4c      
   mov c,h       ; $26fa 4c      
   .byte 0xed    ; $26fb ed      
   mvi h,$cd     ; $26fc 26 cd   
   sbb d         ; $26fe 9a      
   shld $03cd    ; $26ff 22 cd 03
   mov d,d       ; $2702 52      
   mov b,l       ; $2703 45      
   mov d,h       ; $2704 54      
   ori $26       ; $2705 f6 26   
   call $226c    ; $2707 cd 6c 22
   ret           ; $270a c9      
   inx b         ; $270b 03      
   mov c,d       ; $270c 4a      
   mov c,l       ; $270d 4d      
   mov d,b       ; $270e 50      
   lxi b,$cd27   ; $270f 01 27 cd
   sbb d         ; $2712 9a      
   shld $03c3    ; $2713 22 c3 03
   mov d,d       ; $2716 52      
   mov c,m       ; $2717 4e      
   mov e,d       ; $2718 5a      
   dcx b         ; $2719 0b      
   daa           ; $271a 27      
   call $226c    ; $271b cd 6c 22
   rnz           ; $271e c0      
   stax b        ; $271f 02      
   mov d,d       ; $2720 52      
   mov e,d       ; $2721 5a      
   dcr d         ; $2722 15      
   daa           ; $2723 27      
   call $226c    ; $2724 cd 6c 22
   rz            ; $2727 c8      
   inx b         ; $2728 03      
   mov d,d       ; $2729 52      
   mov c,m       ; $272a 4e      
   mov b,e       ; $272b 43      
   rar           ; $272c 1f      
   daa           ; $272d 27      
   call $226c    ; $272e cd 6c 22
   rnc           ; $2731 d0      
   stax b        ; $2732 02      
   mov d,d       ; $2733 52      
   mov b,e       ; $2734 43      
   .byte 0x28    ; $2735 28      
   daa           ; $2736 27      
   call $226c    ; $2737 cd 6c 22
   rc            ; $273a d8      
   inx b         ; $273b 03      
   mov d,d       ; $273c 52      
   mov d,b       ; $273d 50      
   mov c,a       ; $273e 4f      
   sta $cd27     ; $273f 32 27 cd
   mov l,h       ; $2742 6c      
   shld $03e0    ; $2743 22 e0 03
   mov d,d       ; $2746 52      
   mov d,b       ; $2747 50      
   mov b,l       ; $2748 45      
   dcx sp        ; $2749 3b      
   daa           ; $274a 27      
   call $226c    ; $274b cd 6c 22
   rpe           ; $274e e8      
   stax b        ; $274f 02      
   mov d,d       ; $2750 52      
   mov d,b       ; $2751 50      
   mov b,l       ; $2752 45      
   daa           ; $2753 27      
   call $226c    ; $2754 cd 6c 22
   rp            ; $2757 f0      
   stax b        ; $2758 02      
   mov d,d       ; $2759 52      
   mov c,l       ; $275a 4d      
   mov c,a       ; $275b 4f      
   daa           ; $275c 27      
   call $226c    ; $275d cd 6c 22
   rm            ; $2760 f8      
   inx b         ; $2761 03      
   mov c,d       ; $2762 4a      
   mov c,m       ; $2763 4e      
   mov e,d       ; $2764 5a      
   mov e,b       ; $2765 58      
   daa           ; $2766 27      
   call $229a    ; $2767 cd 9a 22
   jnz $4a02     ; $276a c2 02 4a
   mov e,d       ; $276d 5a      
   mov h,c       ; $276e 61      
   daa           ; $276f 27      
   call $229a    ; $2770 cd 9a 22
   jz $4a03      ; $2773 ca 03 4a
   mov c,m       ; $2776 4e      
   mov b,e       ; $2777 43      
   mov l,e       ; $2778 6b      
   daa           ; $2779 27      
   call $229a    ; $277a cd 9a 22
   jnc $4a02     ; $277d d2 02 4a
   mov b,e       ; $2780 43      
   mov m,h       ; $2781 74      
   daa           ; $2782 27      
   call $229a    ; $2783 cd 9a 22
   jc $4a03      ; $2786 da 03 4a
   mov d,b       ; $2789 50      
   mov c,a       ; $278a 4f      
   mov a,m       ; $278b 7e      
   daa           ; $278c 27      
   call $229a    ; $278d cd 9a 22
   jpo $4a03     ; $2790 e2 03 4a
   mov d,b       ; $2793 50      
   mov b,l       ; $2794 45      
   add a         ; $2795 87      
   daa           ; $2796 27      
   call $229a    ; $2797 cd 9a 22
   jpe $4a02     ; $279a ea 02 4a
   mov d,b       ; $279d 50      
   sub c         ; $279e 91      
   daa           ; $279f 27      
   call $229a    ; $27a0 cd 9a 22
   jp $4a02      ; $27a3 f2 02 4a
   mov c,l       ; $27a6 4d      
   sbb e         ; $27a7 9b      
   daa           ; $27a8 27      
   call $229a    ; $27a9 cd 9a 22
   jm $4d03      ; $27ac fa 03 4d
   mov c,a       ; $27af 4f      
   mov d,m       ; $27b0 56      
   ana h         ; $27b1 a4      
   daa           ; $27b2 27      
   call $02e4    ; $27b3 cd e4 02
   adc l         ; $27b6 8d      
   inx b         ; $27b7 03      
   inr b         ; $27b8 04      
   shld $0a2b    ; $27b9 22 2b 0a
   mov b,b       ; $27bc 40      
   nop           ; $27bd 00      
   mov c,d       ; $27be 4a      
   inr b         ; $27bf 04      
   mov c,d       ; $27c0 4a      
   inr b         ; $27c1 04      
   cma           ; $27c2 2f      
   rrc           ; $27c3 0f      
   dcr d         ; $27c4 15      
   inx b         ; $27c5 03      
   inx b         ; $27c6 03      
   mov c,l       ; $27c7 4d      
   mov d,m       ; $27c8 56      
   mov c,c       ; $27c9 49      
   xra l         ; $27ca ad      
   daa           ; $27cb 27      
   call $02e4    ; $27cc cd e4 02
   adc l         ; $27cf 8d      
   inx b         ; $27d0 03      
   inr b         ; $27d1 04      
   shld $0a2b    ; $27d2 22 2b 0a
   mvi b,$00     ; $27d5 06 00   
   mov c,d       ; $27d7 4a      
   inr b         ; $27d8 04      
   cma           ; $27d9 2f      
   rrc           ; $27da 0f      
   cma           ; $27db 2f      
   rrc           ; $27dc 0f      
   dcr d         ; $27dd 15      
   inx b         ; $27de 03      
   inx b         ; $27df 03      
   mov c,h       ; $27e0 4c      
   mov e,b       ; $27e1 58      
   mov c,c       ; $27e2 49      
   adi $27       ; $27e3 c6 27   
   call $02e4    ; $27e5 cd e4 02
   adc l         ; $27e8 8d      
   inx b         ; $27e9 03      
   inr b         ; $27ea 04      
   shld $0ed1    ; $27eb 22 d1 0e
   mov c,d       ; $27ee 4a      
   inr b         ; $27ef 04      
   cma           ; $27f0 2f      
   rrc           ; $27f1 0f      
   dcr e         ; $27f2 1d      
   rrc           ; $27f3 0f      
   dcr d         ; $27f4 15      
   inx b         ; $27f5 03      
   stax b        ; $27f6 02      
   .byte 0x30    ; $27f7 30      
   dcr a         ; $27f8 3d      
   rst 3         ; $27f9 df      
   daa           ; $27fa 27      
   call $0984    ; $27fb cd 84 09
   jnz $0200     ; $27fe c2 00 02
   mov b,e       ; $2801 43      
   mov d,e       ; $2802 53      
   ori $27       ; $2803 f6 27   
   call $0984    ; $2805 cd 84 09
   jnc $0200     ; $2808 d2 00 02
   mov d,b       ; $280b 50      
   mov b,l       ; $280c 45      
   nop           ; $280d 00      
   .byte 0x28    ; $280e 28      
   call $0984    ; $280f cd 84 09
   jpo $0200     ; $2812 e2 00 02
   .byte 0x30    ; $2815 30      
   inr a         ; $2816 3c      
   ldax b        ; $2817 0a      
   .byte 0x28    ; $2818 28      
   call $0984    ; $2819 cd 84 09
   jp $0300      ; $281c f2 00 03
   mov c,m       ; $281f 4e      
   mov c,a       ; $2820 4f      
   mov d,h       ; $2821 54      
   inr d         ; $2822 14      
   .byte 0x28    ; $2823 28      
   call $02e4    ; $2824 cd e4 02
   dcx h         ; $2827 2b      
   ldax b        ; $2828 0a      
   .byte 0x08    ; $2829 08      
   nop           ; $282a 00      
   mov c,d       ; $282b 4a      
   inr b         ; $282c 04      
   dcr d         ; $282d 15      
   inx b         ; $282e 03      
   inr b         ; $282f 04      
   mov d,h       ; $2830 54      
   mov c,b       ; $2831 48      
   mov b,l       ; $2832 45      
   mov c,m       ; $2833 4e      
   mvi e,$28     ; $2834 1e 28   
   call $02e4    ; $2836 cd e4 02
   jc $570e      ; $2839 da 0e 57
   inr e         ; $283c 1c      
   rst 7         ; $283d ff      
   mvi c,$8d     ; $283e 0e 8d   
   inx b         ; $2840 03      
   sbb l         ; $2841 9d      
   dad b         ; $2842 09      
   dcr d         ; $2843 15      
   inx b         ; $2844 03      
   stax b        ; $2845 02      
   mov c,c       ; $2846 49      
   mov b,m       ; $2847 46      
   cma           ; $2848 2f      
   .byte 0x28    ; $2849 28      
   call $02e4    ; $284a cd e4 02
   cma           ; $284d 2f      
   rrc           ; $284e 0f      
   rst 7         ; $284f ff      
   mvi c,$c8     ; $2850 0e c8   
   mvi c,$1d     ; $2852 0e 1d   
   rrc           ; $2854 0f      
   jc $150e      ; $2855 da 0e 15
   inx b         ; $2858 03      
   inr b         ; $2859 04      
   mov b,l       ; $285a 45      
   mov c,h       ; $285b 4c      
   mov d,e       ; $285c 53      
   mov b,l       ; $285d 45      
   mov b,l       ; $285e 45      
   .byte 0x28    ; $285f 28      
   call $02e4    ; $2860 cd e4 02
   jc $570e      ; $2863 da 0e 57
   inr e         ; $2866 1c      
   dcx h         ; $2867 2b      
   ldax b        ; $2868 0a      
   jmp $4a00     ; $2869 c3 00 4a
   .byte 0x28    ; $286c 28      
   ora m         ; $286d b6      
   inx b         ; $286e 03      
   adc l         ; $286f 8d      
   inx b         ; $2870 03      
   mvi m,$28     ; $2871 36 28   
   jc $150e      ; $2873 da 0e 15
   inx b         ; $2876 03      
   dcr b         ; $2877 05      
   mov b,d       ; $2878 42      
   mov b,l       ; $2879 45      
   mov b,a       ; $287a 47      
   mov c,c       ; $287b 49      
   mov c,m       ; $287c 4e      
   mov e,c       ; $287d 59      
   .byte 0x28    ; $287e 28      
   call $02e4    ; $287f cd e4 02
   rst 7         ; $2882 ff      
   mvi c,$d1     ; $2883 0e d1   
   mvi c,$15     ; $2885 0e 15   
   inx b         ; $2887 03      
   dcr b         ; $2888 05      
   mov d,l       ; $2889 55      
   mov c,m       ; $288a 4e      
   mov d,h       ; $288b 54      
   mov c,c       ; $288c 49      
   mov c,h       ; $288d 4c      
   mov m,a       ; $288e 77      
   .byte 0x28    ; $288f 28      
   call $02e4    ; $2890 cd e4 02
   adc l         ; $2893 8d      
   inx b         ; $2894 03      
   pop d         ; $2895 d1      
   mvi c,$57     ; $2896 0e 57   
   inr e         ; $2898 1c      
   cma           ; $2899 2f      
   rrc           ; $289a 0f      
   dcr e         ; $289b 1d      
   rrc           ; $289c 0f      
   dcr d         ; $289d 15      
   inx b         ; $289e 03      
   dcr b         ; $289f 05      
   mov b,c       ; $28a0 41      
   mov b,a       ; $28a1 47      
   mov b,c       ; $28a2 41      
   mov c,c       ; $28a3 49      
   mov c,m       ; $28a4 4e      
   adc b         ; $28a5 88      
   .byte 0x28    ; $28a6 28      
   call $02e4    ; $28a7 cd e4 02
   pop d         ; $28aa d1      
   mvi c,$57     ; $28ab 0e 57   
   inr e         ; $28ad 1c      
   lxi d,$1527   ; $28ae 11 27 15
   inx b         ; $28b1 03      
   dcr b         ; $28b2 05      
   mov d,a       ; $28b3 57      
   mov c,b       ; $28b4 48      
   mov c,c       ; $28b5 49      
   mov c,h       ; $28b6 4c      
   mov b,l       ; $28b7 45      
   sbb a         ; $28b8 9f      
   .byte 0x28    ; $28b9 28      
   call $02e4    ; $28ba cd e4 02
   mov c,d       ; $28bd 4a      
   .byte 0x28    ; $28be 28      
   jc $4a0e      ; $28bf da 0e 4a
   inr b         ; $28c2 04      
   dcr d         ; $28c3 15      
   inx b         ; $28c4 03      
   mvi b,$52     ; $28c5 06 52   
   mov b,l       ; $28c7 45      
   mov d,b       ; $28c8 50      
   mov b,l       ; $28c9 45      
   mov b,c       ; $28ca 41      
   mov d,h       ; $28cb 54      
   ora d         ; $28cc b2      
   .byte 0x28    ; $28cd 28      
   call $02e4    ; $28ce cd e4 02
   dcr c         ; $28d1 0d      
   dad b         ; $28d2 09      
   dcr c         ; $28d3 0d      
   dad b         ; $28d4 09      
   ana a         ; $28d5 a7      
   .byte 0x28    ; $28d6 28      
   .byte 0x20    ; $28d7 20      
   dad b         ; $28d8 09      
   .byte 0x20    ; $28d9 20      
   dad b         ; $28da 09      
   jc $550e      ; $28db da 0e 55
   inr b         ; $28de 04      
   mvi m,$28     ; $28df 36 28   
   dcr d         ; $28e1 15      
   inx b         ; $28e2 03      

NFA_BEG_2DASM:   ; 28E3
   .byte 7,"BEG-ASM"
   .word NFA_ASSEMBLER    ; 21EF
_BEG_2DASM:      ; 28ED - 28F8
   call _FCALL            ; 28ED
   .word $22F9            ; $28f0 22F9
   .word _ASSEMBLER       ; $28f2 21FB - ASSEMBLER
   .word __21CSP          ; $28f4 1BBD - !CSP
   .word _EXIT            ; $28f6 0315 - EXIT

NFA_END_2DASM:   ; 28F8
   .byte 7,"END-ASM"
   .word NFA_BEG_2DASM      ; 28E3
_END_2DASM:      ; 2902 - 2913
   call _FCALL            ; 2902
   .word $22B9            ; $2905 22B9
   .word __3FCSP          ; $2907 1BCF - ?CSP
   .word _CURRENT         ; $2909 0233 - CURRENT
   .word __40             ; $290b 0984 - @
   .word _CONTEXT         ; $290d 0224 - CONTEXT
   .word __21             ; $290f 099D - !
   .word _EXIT            ; $2911 0315 - EXIT

NFA_CODE:        ; 2913
   .byte 4,"CODE"
   .word NFA_END_2DASM      ; 28F8
_CODE:           ; 291A - 292B
   call _FCALL            ; 291A
   .word _CREATE          ; $291d 1A21 - CREATE
   .word _SMUDGE          ; $291f 1760 - SMUDGE
   .word _CFL             ; $2921 132D - CFL
   .word _NEGATE          ; $2923 046A - NEGATE
   .word _ALLOT           ; $2925 0F10 - ALLOT
   .word _BEG_2DASM       ; $2927 28ED - BEG-ASM
   .word _EXIT            ; $2929 0315 - EXIT

NFA__3BCODE:     ; 292B
   .byte 0x85,";CODE" ; IMMEDIATE
   .word NFA_CODE         ; 2913
__3BCODE:        ; 2933 - 2942
   call _FCALL            ; 2933
   .word __3FCOMP         ; $2936 1C26 - ?COMP
   .word _COMPILE         ; $2938 0F83 - COMPILE
   .word __28DOES_3E_29   ; $293a 1A7D - (DOES>)
   .word _BEG_2DASM       ; $293c 28ED - BEG-ASM
   .word __5B             ; $293e 1771 - [
   .word _EXIT            ; $2940 0315 - EXIT

NFA_END_2DCODE:  ; 2942
   .byte 8,"END-CODE"
   .word NFA__3BCODE        ; 292B
_END_2DCODE:     ; 294D - 2956
   call _FCALL            ; 294D
   .word _SMUDGE          ; $2950 1760 - SMUDGE
   .word _END_2DASM       ; $2952 2902 - END-ASM
   .word _EXIT            ; $2954 0315 - EXIT

NFA_LABEL:       ; 2956
   .byte 5,"LABEL"
   .word NFA_END_2DCODE     ; 2942
_LABEL:          ; 295E - 2982
   call _FCALL            ; 295E
   .word _VARIABLE        ; $2961 1B52 - VARIABLE
   .word _LIT             ; $2963 0A2B - LIT
   .word $FFFE            ; $2965 FFFE
   .word _ALLOT           ; $2967 0F10 - ALLOT
   .word _SMUDGE          ; $2969 1760 - SMUDGE
   .word _BEG_2DASM       ; $296b 28ED - BEG-ASM
   .word _EXIT            ; $296d 0315 - EXIT

   dcr b         ; $296f 05      
   mov c,m       ; $2970 4e      
   mov b,l       ; $2971 45      
   mov e,b       ; $2972 58      
   mov d,h       ; $2973 54      
   dcx sp        ; $2974 3b      
   push b        ; $2975 c5      
   .byte 0x28    ; $2976 28      
   call $02e4    ; $2977 cd e4 02
   .byte 0xfd    ; $297a fd      
   stax b        ; $297b 02      
   lxi d,$4d27   ; $297c 11 27 4d
   dad h         ; $297f 29      
   dcr d         ; $2980 15      
   inx b         ; $2981 03      

NFA__28OUT_29:   ; 2982
   .byte 5,"(OUT)"
   .word NFA_LABEL        ; 2956
__28OUT_29:      ; 298A - 29AB
   pop d         ; $298a d1      
   pop h         ; $298b e1      
   push b        ; $298c c5      
   lxi b,$0000   ; $298d 01 00 00
   call $f80c    ; $2990 cd 0c f8
   dcr b         ; $2993 05      
   jnz $2990     ; $2994 c2 90 29
   mvi c,$e6     ; $2997 0e e6   
   call $f80c    ; $2999 cd 0c f8
   mov c,m       ; $299c 4e      
   inx h         ; $299d 23      
   call $f80c    ; $299e cd 0c f8
   dcx d         ; $29a1 1b      
   mov a,d       ; $29a2 7a      
   ora e         ; $29a3 b3      
   jnz $299c     ; $29a4 c2 9c 29
   pop b         ; $29a7 c1      
   jmp $02ef     ; $29a8 c3 ef 02

NFA_BOUNDS:      ; 29AB
   .byte 6,"BOUNDS"
   .word NFA__28OUT_29        ; 2982
_BOUNDS:         ; 29B4 - 29FC
   call _FCALL            ; 29B4
   .word _OVER            ; $29b7 0362 - OVER
   .word __2B             ; $29b9 044A - +
   .word _SWAP            ; $29bb 038D - SWAP
   .word _EXIT            ; $29bd 0315 - EXIT

   call $02e4    ; $29bf cd e4 02
   .word _DUP             ; $29c2 03D3 - DUP
   .word _DBH             ; $29c4 2A4C - DBH
   .word __2B             ; $29c6 044A - +
   .word _0               ; $29c8 0EC8 - 0
   .word _SWAP            ; $29ca 038D - SWAP
   .word _B_2FBUF         ; $29cc 2A64 - B/BUF
   .word _BOUNDS          ; $29ce 29B4 - BOUNDS
   .word __28_3FDO_29     ; $29d0 0B0C - (?DO)
   .word $29DE            ; $29d2 29DE
   .word _I               ; $29d4 0A9F - I
   .word _C_40            ; $29d6 0991 - C@
   .word __2B             ; $29d8 044A - +
   .word __28LOOP_29      ; $29da 0B2E - (LOOP)
   .word $29D4            ; $29dc 29D4
   .word _EXIT            ; $29de 0315 - EXIT

   call $02e4    ; $29e0 cd e4 02
   .word __28_2E_22_29    ; $29e3 183E - (.")
   .byte 8,"(Y/...) "
   .word _KEY             ; $29ee 1554 - KEY
   .word _DUP             ; $29f0 03D3 - DUP
   .word _EMIT            ; $29f2 153D - EMIT
   .word _LIT             ; $29f4 0A2B - LIT
   .word $0059            ; $29f6 0059
   .word __3D             ; $29f8 0566 - =
   .word _EXIT            ; $29fa 0315 - EXIT

NFA_OUT:         ; 29FC
   .byte 3,"OUT"
   .word $29AB   ; NFA_BOUNDS       ; 29AB
_OUT:            ; 2A02 - 2A46
   call _FCALL            ; 2A02
   .word $29BF            ; $2a05 29BF
   .word _OVER            ; $2a07 0362 - OVER
   .word _DBC             ; $2a09 2B20 - DBC
   .word __21             ; $2a0b 099D - !
   .word _B_2FBUF         ; $2a0d 2A64 - B/BUF
   .word _DBH             ; $2a0f 2A4C - DBH
   .word __2B             ; $2a11 044A - +
   .word _CR              ; $2a13 1566 - CR
   .word __28_2E_22_29    ; $2a15 183E - (.")
   .byte 10,"ml<--blok "
   .word _OVER            ; $2a22 0362 - OVER
   .word __40             ; $2a24 0984 - @
   .word __2E             ; $2a26 12FE - .
   .word $29E0            ; $2a28 29E0
   .word __3FBRANCH       ; $2a2a 0A7A - ?BRANCH
   .word $2A32            ; $2a2c 2A32
   .word __28OUT_29       ; $2a2e 298A - (OUT)
   .word _EXIT            ; $2a30 0315 - EXIT
   .word _2DROP           ; $2a32 0403 - 2DROP
   .word _EXIT            ; $2a34 0315 - EXIT
   .word _EXIT            ; $2a36 0315 - EXIT

NFA_STFILE:      ; 2A38
   .byte 6,"STFILE"
   .word $2a09   ; NFA_             ; 2A09
_STFILE:         ; 2A41 - None
   call $02e4
   .word _EXIT            ; $2a44 0315 - EXIT

NFA_DBH:         ; 2A46
   .byte 3,"DBH"
   .word NFA_OUT          ; 29FC
_DBH:            ; 2A4C - 2A5C
   call $0984
   inr b         ; $2a4f 04      
   nop           ; $2a50 00      

NFA_DBT:         ; 2A51
   .byte 3,"DBT"
   .word NFA_DBH          ; 2A46
_DBT:            ; 2A57 - None
   call $0984
   .word $0002

NFA_B_2FBUF:     ; 2A5C
   .byte 5,"B/BUF"
   .word NFA_DBH          ; 2A46
_B_2FBUF:        ; 2A64 - 2A69
   call $0984
   nop           ; $2a67 00      
   inr b         ; $2a68 04      

NFA_HDBT:        ; 2A69
   .byte 4,"HDBT"
   .word NFA_B_2FBUF        ; 2A5C
_HDBT:           ; 2A70 - 2A83
   call $0984
   mvi b,$04     ; $2a73 06 04   

NFA__23BUFF1:    ; 2A75
   .byte 6,"#BUFF1"
   .word NFA_HDBT         ; 2A69
__23BUFF1:       ; 2A7E - None
   call $0984    ; $2a7e cd 84 09
   sbb e         ; $2a81 9b      
   dcr m         ; $2a82 35      

NFA_FIRST1:      ; 2A83
   .byte 6,"FIRST1"
   .word NFA_HDBT         ; 2A69
_FIRST1:         ; 2A8C - 2A91
   call $0984    ; $2a8c cd 84 09
   sbb l         ; $2a8f 9d      
   dcr m         ; $2a90 35      

NFA_LIMIT1:      ; 2A91
   .byte 6,"LIMIT1"
   .word NFA_FIRST1       ; 2A83
_LIMIT1:         ; 2A9A - 2AAB
   call $0984    ; $2a9a cd 84 09
   sbb a         ; $2a9d 9f      
   dcr m         ; $2a9e 35      

NFA_UR_2FW:      ; 2A9F
   .byte 4,"UR/W"
   .word NFA_LIMIT1       ; 2A91
_UR_2FW:         ; 2AA6 - None
   call $0984
   .word $35a1

NFA_PREV:        ; 2AAB
   .byte 4,"PREV"
   .word NFA_LIMIT1       ; 2A91
_PREV:           ; 2AB2 - 2AD0
   call $0984    ; cd 84
   ana e         ; $2ab5 a3      
   dcr m         ; $2ab6 35      

NFA_USE:         ; 2AB7
   .byte 3,"USE"
   .word NFA_PREV         ; 2AAB
_USE:            ; 2ABD - None
   call $0984
   .word $35a5

NFA_BB_2DCNT:    ; 2AC2
   .byte 6,"BB-CNT"
   .word NFA_PREV         ; 2AAB
_BB_2DCNT:       ; 2ACB - None
   call $0984
   .word $35a7

NFA_SCR:         ; 2AD0
   .byte 3,"SCR"
   .word NFA_PREV         ; 2AAB
_SCR:            ; 2AD6 - 2AF8
   call $0984    ; cd 84
   xra c         ; $2ad9 a9      
   dcr m         ; $2ada 35      

NFA_LCNT:        ; 2ADB
   .byte 4,"LCNT"
   .word NFA_SCR          ; 2AD0
_LCNT:           ; 2AE2 - 2AE7
   call $0984
   .word $35ab

NFA__23BUFF:     ; 2AE7
   .byte 5,"#BUFF"
   .word NFA_LCNT         ; 2ADB
__23BUFF:        ; 2AEF - None
   call $02e4    ; $2aef cd e4 02
   .word $2A7E            ; $2af2 2A7E
   .word __40             ; $2af4 0984 - @
   .word _EXIT            ; $2af6 0315 - EXIT

NFA_FIRST:       ; 2AF8
   .byte 5,"FIRST"
   .word NFA_SCR          ; 2AD0
_FIRST:          ; 2B00 - 2B09
   call _FCALL            ; 2B00
   .word _FIRST1          ; $2b03 2A8C - FIRST1
   .word __40             ; $2b05 0984 - @
   .word _EXIT            ; $2b07 0315 - EXIT

NFA_LIMIT:       ; 2B09
   .byte 5,"LIMIT"
   .word NFA_FIRST        ; 2AF8
_LIMIT:          ; 2B11 - 2B1A
   call _FCALL            ; 2B11
   .word _LIMIT1          ; $2b14 2A9A - LIMIT1
   .word __40             ; $2b16 0984 - @
   .word _EXIT            ; $2b18 0315 - EXIT

NFA_DBC:         ; 2B1A
   .byte 3,"DBC"
   .word NFA_LIMIT        ; 2B09
_DBC:            ; 2B20 - 2B38
   call _FCALL            ; 2B20
   .word _2_2B            ; $2b23 0482 - 2+
   .word _EXIT            ; $2b25 0315 - EXIT

NFA_R_2FW:       ; 2B27
   .byte 3,"R/W"
   .word NFA_DBC          ; 2B1A
_R_2FW:          ; 2B2D - None
   call $02e4
   .word $2AA6            ; $2b30 2AA6
   .word __40             ; $2b32 0984 - @
   .word _EXECUTE         ; $2b34 032C - EXECUTE
   .word _EXIT            ; $2b36 0315 - EXIT

NFA_EMPTY_2DBUFFERS:; 2B38
   .byte 13,"EMPTY-BUFFERS"
   .word NFA_DBC          ; 2B1A
_EMPTY_2DBUFFERS:; 2B48 - 2B7F
   call _FCALL            ; 2B48
   .word _FIRST           ; $2b4b 2B00 - FIRST
   .word _LIMIT           ; $2b4d 2B11 - LIMIT
   .word _OVER            ; $2b4f 0362 - OVER
   .word __2D             ; $2b51 0455 - -
   .word _ERASE           ; $2b53 185B - ERASE
   .word _LIMIT           ; $2b55 2B11 - LIMIT
   .word _FIRST           ; $2b57 2B00 - FIRST
   .word __28DO_29        ; $2b59 0AE5 - (DO)
   .word $2B6B            ; $2b5b 2B6B
   .word _LIT             ; $2b5d 0A2B - LIT
   .word $7FFF            ; $2b5f 7FFF
   .word _I               ; $2b61 0A9F - I
   .word __21             ; $2b63 099D - !
   .word _HDBT            ; $2b65 2A70 - HDBT
   .word __28_2BLOOP_29   ; $2b67 0B63 - (+LOOP)
   .word $2B5D            ; $2b69 2B5D
   .word _1               ; $2b6b 0ED1 - 1
   .word $2ACB            ; $2b6d 2ACB
   .word __21             ; $2b6f 099D - !
   .word _FIRST           ; $2b71 2B00 - FIRST
   .word _DUP             ; $2b73 03D3 - DUP
   .word _PREV            ; $2b75 2AB2 - PREV
   .word __21             ; $2b77 099D - !
   .word $2ABD            ; $2b79 2ABD
   .word __21             ; $2b7b 099D - !
   .word _EXIT            ; $2b7d 0315 - EXIT

NFA_SAVE_2DBUFFERS:; 2B7F
   .byte 12,"SAVE-BUFFERS"
   .word NFA_EMPTY_2DBUFFERS ; 2B38
_SAVE_2DBUFFERS: ; 2B8E - 2BCB
   call _FCALL            ; 2B8E
   .word _LIMIT           ; $2b91 2B11 - LIMIT
   .word _FIRST           ; $2b93 2B00 - FIRST
   .word __28DO_29        ; $2b95 0AE5 - (DO)
   .word $2BC9            ; $2b97 2BC9
   .word _I               ; $2b99 0A9F - I
   .word __40             ; $2b9b 0984 - @
   .word _LIT             ; $2b9d 0A2B - LIT
   .word $8000            ; $2b9f 8000
   .word _AND             ; $2ba1 08C8 - AND
   .word __3FBRANCH       ; $2ba3 0A7A - ?BRANCH
   .word $2BC3            ; $2ba5 2BC3
   .word _I               ; $2ba7 0A9F - I
   .word __40             ; $2ba9 0984 - @
   .word _LIT             ; $2bab 0A2B - LIT
   .word $7FFF            ; $2bad 7FFF
   .word _AND             ; $2baf 08C8 - AND
   .word _NOOP            ; $2bb1 2086 - NOOP
   .word _I               ; $2bb3 0A9F - I
   .word __21             ; $2bb5 099D - !
   .word _I               ; $2bb7 0A9F - I
   .word _NOOP            ; $2bb9 2086 - NOOP
   .word _NOOP            ; $2bbb 2086 - NOOP
   .word _NOOP            ; $2bbd 2086 - NOOP
   .word _NOOP            ; $2bbf 2086 - NOOP
   .word _OUT             ; $2bc1 2A02 - OUT
   .word _HDBT            ; $2bc3 2A70 - HDBT
   .word __28_2BLOOP_29   ; $2bc5 0B63 - (+LOOP)
   .word $2B99            ; $2bc7 2B99
   .word _EXIT            ; $2bc9 0315 - EXIT

NFA_FLUSH:       ; 2BCB
   .byte 5,"FLUSH"
   .word NFA_SAVE_2DBUFFERS ; 2B7F
_FLUSH:          ; 2BD3 - 2BDC
   call _FCALL            ; 2BD3
   .word _SAVE_2DBUFFERS  ; $2bd6 2B8E - SAVE-BUFFERS
   .word _EMPTY_2DBUFFERS ; $2bd8 2B48 - EMPTY-BUFFERS
   .word _EXIT            ; $2bda 0315 - EXIT

NFA_UPDATE:      ; 2BDC
   .byte 6,"UPDATE"
   .word NFA_FLUSH        ; 2BCB
_UPDATE:         ; 2BE5 - 2CBF
   call _FCALL            ; 2BE5
   .word _PREV            ; $2be8 2AB2 - PREV
   .word __40             ; $2bea 0984 - @
   .word _DUP             ; $2bec 03D3 - DUP
   .word __40             ; $2bee 0984 - @
   .word _LIT             ; $2bf0 0A2B - LIT
   .word $8000            ; $2bf2 8000
   .word _OR              ; $2bf4 08D9 - OR
   .word _SWAP            ; $2bf6 038D - SWAP
   .word __21             ; $2bf8 099D - !
   .word _EXIT            ; $2bfa 0315 - EXIT

   call $02e4    ; $2bfc cd e4 02
   mov m,b       ; $2bff 70      
   lhld $044a    ; $2c00 2a 4a 04
   out $03       ; $2c03 d3 03   
   lxi d,$662b   ; $2c05 11 2b 66
   dcr b         ; $2c08 05      
   mov a,d       ; $2c09 7a      
   ldax b        ; $2c0a 0a      
   lxi d,$822c   ; $2c0b 11 2c 82
   inx b         ; $2c0e 03      
   nop           ; $2c0f 00      
   dcx h         ; $2c10 2b      
   out $03       ; $2c11 d3 03   
   ora d         ; $2c13 b2      
   lhld $0984    ; $2c14 2a 84 09
   mov h,m       ; $2c17 66      
   dcr b         ; $2c18 05      
   mov a,m       ; $2c19 7e      
   dcr b         ; $2c1a 05      
   dcr d         ; $2c1b 15      
   inx b         ; $2c1c 03      
   call $02e4    ; $2c1d cd e4 02
   nop           ; $2c20 00      
   dcx h         ; $2c21 2b      
   cmp l         ; $2c22 bd      
   lhld $099d    ; $2c23 2a 9d 09
   ora d         ; $2c26 b2      
   lhld $0984    ; $2c27 2a 84 09
   jp $8403      ; $2c2a f2 03 84
   dad b         ; $2c2d 09      
   dcx h         ; $2c2e 2b      
   ldax b        ; $2c2f 0a      
   rst 7         ; $2c30 ff      
   mov a,a       ; $2c31 7f      
   rz            ; $2c32 c8      
   .byte 0x08    ; $2c33 08      
   mov h,m       ; $2c34 66      
   dcr b         ; $2c35 05      
   mov a,d       ; $2c36 7a      
   ldax b        ; $2c37 0a      
   mov b,b       ; $2c38 40      
   inr l         ; $2c39 2c      
   .byte 0x10    ; $2c3a 10      
   inr b         ; $2c3b 04      
   ani $0e       ; $2c3c e6 0e   
   dcr d         ; $2c3e 15      
   inx b         ; $2c3f 03      
   out $03       ; $2c40 d3 03   
   .byte 0x20    ; $2c42 20      
   dcx h         ; $2c43 2b      
   add h         ; $2c44 84      
   dad b         ; $2c45 09      
   cmp l         ; $2c46 bd      
   lhld $0984    ; $2c47 2a 84 09
   .byte 0x20    ; $2c4a 20      
   dcx h         ; $2c4b 2b      
   add h         ; $2c4c 84      
   dad b         ; $2c4d 09      
   jm $7a04      ; $2c4e fa 04 7a
   ldax b        ; $2c51 0a      
   mov e,d       ; $2c52 5a      
   inr l         ; $2c53 2c      
   out $03       ; $2c54 d3 03   
   cmp l         ; $2c56 bd      
   lhld $099d    ; $2c57 2a 9d 09
   cm $7e2b      ; $2c5a fc 2b 7e
   dcr b         ; $2c5d 05      
   mov a,d       ; $2c5e 7a      
   ldax b        ; $2c5f 0a      
   lhld $032c    ; $2c60 2a 2c 03
   inr b         ; $2c63 04      
   di            ; $2c64 f3      
   mvi c,$15     ; $2c65 0e 15   
   inx b         ; $2c67 03      
   call $02e4    ; $2c68 cd e4 02
   .byte 0xcb    ; $2c6b cb      
   lhld $0984    ; $2c6c 2a 84 09
   ora d         ; $2c6f b2      
   lhld $0984    ; $2c70 2a 84 09
   .byte 0x20    ; $2c73 20      
   dcx h         ; $2c74 2b      
   sbb l         ; $2c75 9d      
   dad b         ; $2c76 09      
   .byte 0xcb    ; $2c77 cb      
   lhld $0a0a    ; $2c78 2a 0a 0a
   dcr d         ; $2c7b 15      
   inx b         ; $2c7c 03      
   call $02e4    ; $2c7d cd e4 02
   out $03       ; $2c80 d3 03   
   add h         ; $2c82 84      
   dad b         ; $2c83 09      
   dcr a         ; $2c84 3d      
   dcr b         ; $2c85 05      
   mov a,d       ; $2c86 7a      
   ldax b        ; $2c87 0a      
   xra b         ; $2c88 a8      
   inr l         ; $2c89 2c      
   out $03       ; $2c8a d3 03   
   add h         ; $2c8c 84      
   dad b         ; $2c8d 09      
   dcx h         ; $2c8e 2b      
   ldax b        ; $2c8f 0a      
   rst 7         ; $2c90 ff      
   mov a,a       ; $2c91 7f      
   rz            ; $2c92 c8      
   .byte 0x08    ; $2c93 08      
   mov h,d       ; $2c94 62      
   inx b         ; $2c95 03      
   sbb l         ; $2c96 9d      
   dad b         ; $2c97 09      
   stax b        ; $2c98 02      
   lhld $0315    ; $2c99 2a 15 03
   add m         ; $2c9c 86      
   .byte 0x20    ; $2c9d 20      
   stax b        ; $2c9e 02      
   lhld $038d    ; $2c9f 2a 8d 03
   sbb l         ; $2ca2 9d      
   dad b         ; $2ca3 09      
   mov l,b       ; $2ca4 68      
   ldax b        ; $2ca5 0a      
   xra d         ; $2ca6 aa      
   inr l         ; $2ca7 2c      
   add d         ; $2ca8 82      
   inx b         ; $2ca9 03      
   dcr d         ; $2caa 15      
   inx b         ; $2cab 03      
   call $02e4    ; $2cac cd e4 02
   mov c,h       ; $2caf 4c      
   lhld $0455    ; $2cb0 2a 55 04
   cm $8d2b      ; $2cb3 fc 2b 8d
   inx b         ; $2cb6 03      
   mov c,h       ; $2cb7 4c      
   lhld $044a    ; $2cb8 2a 4a 04
   adc l         ; $2cbb 8d      
   inx b         ; $2cbc 03      
   dcr d         ; $2cbd 15      
   inx b         ; $2cbe 03      

NFA_BUFFER:      ; 2CBF
   .byte 6,"BUFFER"
   .word NFA_UPDATE       ; 2BDC
_BUFFER:         ; 2CC8 - 2CF5
   call _FCALL            ; 2CC8
   .word _DUP             ; $2ccb 03D3 - DUP
   .word $2C1D            ; $2ccd 2C1D
   .word __3FBRANCH       ; $2ccf 0A7A - ?BRANCH
   .word $2CD9            ; $2cd1 2CD9
   .word _PRESS           ; $2cd3 0410 - PRESS
   .word _BRANCH          ; $2cd5 0A68 - BRANCH
   .word $2CE7            ; $2cd7 2CE7
   .word $2ABD            ; $2cd9 2ABD
   .word __40             ; $2cdb 0984 - @
   .word _DUP             ; $2cdd 03D3 - DUP
   .word $2C7D            ; $2cdf 2C7D
   .word _SWAP            ; $2ce1 038D - SWAP
   .word _OVER            ; $2ce3 0362 - OVER
   .word __21             ; $2ce5 099D - !
   .word _DUP             ; $2ce7 03D3 - DUP
   .word _PREV            ; $2ce9 2AB2 - PREV
   .word __21             ; $2ceb 099D - !
   .word $2C68            ; $2ced 2C68
   .word _DBH             ; $2cef 2A4C - DBH
   .word __2B             ; $2cf1 044A - +
   .word _EXIT            ; $2cf3 0315 - EXIT

NFA_BLOCK:       ; 2CF5
   .byte 5,"BLOCK"
   .word NFA_BUFFER       ; 2CBF
_BLOCK:          ; 2CFD - 2D38
   call _FCALL            ; 2CFD
   .word _DUP             ; $2d00 03D3 - DUP
   .word $2C1D            ; $2d02 2C1D
   .word __3FBRANCH       ; $2d04 0A7A - ?BRANCH
   .word $2D0E            ; $2d06 2D0E
   .word _PRESS           ; $2d08 0410 - PRESS
   .word _BRANCH          ; $2d0a 0A68 - BRANCH
   .word $2D2A            ; $2d0c 2D2A
   .word $2ABD            ; $2d0e 2ABD
   .word __40             ; $2d10 0984 - @
   .word _DUP             ; $2d12 03D3 - DUP
   .word $2C7D            ; $2d14 2C7D
   .word _SWAP            ; $2d16 038D - SWAP
   .word _OVER            ; $2d18 0362 - OVER
   .word __21             ; $2d1a 099D - !
   .word _DUP             ; $2d1c 03D3 - DUP
   .word _NOOP            ; $2d1e 2086 - NOOP
   .word _NOOP            ; $2d20 2086 - NOOP
   .word _OVER            ; $2d22 0362 - OVER
   .word __40             ; $2d24 0984 - @
   .word _NOOP            ; $2d26 2086 - NOOP
   .word _IN              ; $2d28 2E59 - IN
   .word _DUP             ; $2d2a 03D3 - DUP
   .word _PREV            ; $2d2c 2AB2 - PREV
   .word __21             ; $2d2e 099D - !
   .word $2C68            ; $2d30 2C68
   .word _DBH             ; $2d32 2A4C - DBH
   .word __2B             ; $2d34 044A - +
   .word _EXIT            ; $2d36 0315 - EXIT

NFA_LIST:        ; 2D38
   .byte 4,"LIST"
   .word NFA_BLOCK        ; 2CF5
_LIST:           ; 2D3F - 2D8A
   call _FCALL            ; 2D3F
   .word _DUP             ; $2d42 03D3 - DUP
   .word _SCR             ; $2d44 2AD6 - SCR
   .word __21             ; $2d46 099D - !
   .word _DUP             ; $2d48 03D3 - DUP
   .word _CR              ; $2d4a 1566 - CR
   .word __28_2E_22_29    ; $2d4c 183E - (.")
   .byte 9," ",0xfc,"KPAH # "
   .word __2E             ; $2d58 12FE - .
   .word _BLOCK           ; $2d5a 2CFD - BLOCK
   .word _LIT             ; $2d5c 0A2B - LIT
   .word $0010            ; $2d5e 0010
   .word _0               ; $2d60 0EC8 - 0
   .word __28DO_29        ; $2d62 0AE5 - (DO)
   .word $2D86            ; $2d64 2D86
   .word _CR              ; $2d66 1566 - CR
   .word _I               ; $2d68 0A9F - I
   .word _2               ; $2d6a 0EDA - 2
   .word __2ER            ; $2d6c 12AB - .R
   .word _SPACE           ; $2d6e 16C4 - SPACE
   .word _SPACE           ; $2d70 16C4 - SPACE
   .word _DUP             ; $2d72 03D3 - DUP
   .word _LIT             ; $2d74 0A2B - LIT
   .word $0040            ; $2d76 0040
   .word _TYPE            ; $2d78 157E - TYPE
   .word _LIT             ; $2d7a 0A2B - LIT
   .word $0040            ; $2d7c 0040
   .word __2B             ; $2d7e 044A - +
   .word _BREAK           ; $2d80 1F35 - BREAK
   .word __28LOOP_29      ; $2d82 0B2E - (LOOP)
   .word $2D66            ; $2d84 2D66
   .word _DROP            ; $2d86 0382 - DROP
   .word _EXIT            ; $2d88 0315 - EXIT

NFA_LOAD:        ; 2D8A
   .byte 4,"LOAD"
   .word NFA_LIST         ; 2D38
_LOAD:           ; 2D91 - 2DF3
   call _FCALL            ; 2D91
   .word __3FDUP          ; $2d94 03E0 - ?DUP
   .word _N_3FBRANCH      ; $2d96 0A90 - N?BRANCH
   .word $2DB1            ; $2d98 2DB1
   .word _CR              ; $2d9a 1566 - CR
   .word __28_2E_22_29    ; $2d9c 183E - (.")
   .byte 16,0xfa,"A",0xe7,"P",0xf5,0xfa,"KA ",0xe2,0xec,"OKA 0"
   .word _ABORT           ; $2daf 10D5 - ABORT
   .word __23TIB          ; $2db1 026B - #TIB
   .word __40             ; $2db3 0984 - @
   .word __3ER            ; $2db5 090D - >R
   .word __3EIN           ; $2db7 0276 - >IN
   .word __40             ; $2db9 0984 - @
   .word __3ER            ; $2dbb 090D - >R
   .word $025F            ; $2dbd 025F
   .word __40             ; $2dbf 0984 - @
   .word __3ER            ; $2dc1 090D - >R
   .word _BLK             ; $2dc3 02B1 - BLK
   .word __40             ; $2dc5 0984 - @
   .word __3ER            ; $2dc7 090D - >R
   .word _BLK             ; $2dc9 02B1 - BLK
   .word __21             ; $2dcb 099D - !
   .word __3EIN           ; $2dcd 0276 - >IN
   .word _0_21            ; $2dcf 09FC - 0!
   .word _B_2FBUF         ; $2dd1 2A64 - B/BUF
   .word __23TIB          ; $2dd3 026B - #TIB
   .word __21             ; $2dd5 099D - !
   .word _INTERPRET       ; $2dd7 19C1 - INTERPRET
   .word _R_3E            ; $2dd9 0920 - R>
   .word _BLK             ; $2ddb 02B1 - BLK
   .word __21             ; $2ddd 099D - !
   .word _R_3E            ; $2ddf 0920 - R>
   .word $025F            ; $2de1 025F
   .word __21             ; $2de3 099D - !
   .word _R_3E            ; $2de5 0920 - R>
   .word __3EIN           ; $2de7 0276 - >IN
   .word __21             ; $2de9 099D - !
   .word _R_3E            ; $2deb 0920 - R>
   .word __23TIB          ; $2ded 026B - #TIB
   .word __21             ; $2def 099D - !
   .word _EXIT            ; $2df1 0315 - EXIT

NFA__2D_2D_3E:   ; 2DF3
   .byte 0x83,"-->" ; IMMEDIATE
   .word NFA_LOAD         ; 2D8A
__2D_2D_3E:      ; 2DF9 - 2E06
   call _FCALL            ; 2DF9
   .word _BLK             ; $2dfc 02B1 - BLK
   .word _1_2B_21         ; $2dfe 0A0A - 1+!
   .word __3EIN           ; $2e00 0276 - >IN
   .word _0_21            ; $2e02 09FC - 0!
   .word _EXIT            ; $2e04 0315 - EXIT

NFA_THRU:        ; 2E06
   .byte 4,"THRU"
   .word NFA__2D_2D_3E          ; 2DF3
_THRU:           ; 2E0D - 2E22
   call _FCALL            ; 2E0D
   .word _1_2B            ; $2e10 0477 - 1+
   .word _SWAP            ; $2e12 038D - SWAP
   .word __28DO_29        ; $2e14 0AE5 - (DO)
   .word $2E20            ; $2e16 2E20
   .word _I               ; $2e18 0A9F - I
   .word _LOAD            ; $2e1a 2D91 - LOAD
   .word __28LOOP_29      ; $2e1c 0B2E - (LOOP)
   .word $2E18            ; $2e1e 2E18
   .word _EXIT            ; $2e20 0315 - EXIT

NFA__28IN_29:    ; 2E22
   .byte 4,"(IN)"
   .word NFA_THRU         ; 2E06
__28IN_29:       ; 2E29 - 2E54
   pop d         ; $2e29 d1      
   mov h,b       ; $2e2a 60      
   mov l,c       ; $2e2b 69      
   pop b         ; $2e2c c1      
   xthl          ; $2e2d e3      
   push h        ; $2e2e e5      
   mvi a,$ff     ; $2e2f 3e ff   
   call $2ed9    ; $2e31 cd d9 2e
   mov h,a       ; $2e34 67      
   dad d         ; $2e35 19      
   xchg          ; $2e36 eb      
   pop h         ; $2e37 e1      
   mov a,d       ; $2e38 7a      
   ora e         ; $2e39 b3      
   jz $2e42      ; $2e3a ca 42 2e
   pop b         ; $2e3d c1      
   push d        ; $2e3e d5      
   jmp $02ef     ; $2e3f c3 ef 02
   mvi a,$08     ; $2e42 3e 08   
   call $f806    ; $2e44 cd 06 f8
   mov m,a       ; $2e47 77      
   inx h         ; $2e48 23      
   dcx b         ; $2e49 0b      
   mov a,b       ; $2e4a 78      
   ora c         ; $2e4b b1      
   jnz $2e42     ; $2e4c c2 42 2e
   pop b         ; $2e4f c1      
   push d        ; $2e50 d5      
   jmp $02ef     ; $2e51 c3 ef 02

NFA_IN:          ; 2E54
   .byte 2,"IN"
   .word NFA__28IN_29         ; 2E22
_IN:             ; 2E59 - 2EEC
   call _FCALL            ; 2E59
   .word _CR              ; $2e5c 1566 - CR
   .word __28_2E_22_29    ; $2e5e 183E - (.")
   .byte 10,"ml-->blok "
   .word _DUP             ; $2e6b 03D3 - DUP
   .word __2E             ; $2e6d 12FE - .
   .word $29E0            ; $2e6f 29E0
   .word _SPACE           ; $2e71 16C4 - SPACE
   .word _N_3FBRANCH      ; $2e73 0A90 - N?BRANCH
   .word $2E83            ; $2e75 2E83
   .word _DROP            ; $2e77 0382 - DROP
   .word _DBH             ; $2e79 2A4C - DBH
   .word __2B             ; $2e7b 044A - +
   .word _B_2FBUF         ; $2e7d 2A64 - B/BUF
   .word _BLANK           ; $2e7f 16B3 - BLANK
   .word _EXIT            ; $2e81 0315 - EXIT
   .word _OVER            ; $2e83 0362 - OVER
   .word _DBC             ; $2e85 2B20 - DBC
   .word $2EE2            ; $2e87 2EE2
   .word _B_2FBUF         ; $2e89 2A64 - B/BUF
   .word _DBH             ; $2e8b 2A4C - DBH
   .word __2B             ; $2e8d 044A - +
   .word _2_2D            ; $2e8f 0499 - 2-
   .word _SWAP            ; $2e91 038D - SWAP
   .word __28IN_29        ; $2e93 2E29 - (IN)
   .word _2DUP            ; $2e95 03F2 - 2DUP
   .word __2B             ; $2e97 044A - +
   .word __28_2E_22_29    ; $2e99 183E - (.")
   .byte 5,"blok "
   .word __2E             ; $2ea1 12FE - .
   .word _0_3D            ; $2ea3 057E - 0=
   .word _DUP             ; $2ea5 03D3 - DUP
   .word __3FBRANCH       ; $2ea7 0A7A - ?BRANCH
   .word $2ED1            ; $2ea9 2ED1
   .word _DROP            ; $2eab 0382 - DROP
   .word _OVER            ; $2ead 0362 - OVER
   .word $29BF            ; $2eaf 29BF
   .word _OVER            ; $2eb1 0362 - OVER
   .word _DBC             ; $2eb3 2B20 - DBC
   .word __40             ; $2eb5 0984 - @
   .word __3D             ; $2eb7 0566 - =
   .word _PRESS           ; $2eb9 0410 - PRESS
   .word _DUP             ; $2ebb 03D3 - DUP
   .word _N_3FBRANCH      ; $2ebd 0A90 - N?BRANCH
   .word $2ED1            ; $2ebf 2ED1
   .word __28_2E_22_29    ; $2ec1 183E - (.")
   .byte 13,"o{ibka wwoda "
   .word __3FBRANCH       ; $2ed1 0A7A - ?BRANCH
   .word $2E5C            ; $2ed3 2E5C
   .word _2DROP           ; $2ed5 0403 - 2DROP
   .word _EXIT            ; $2ed7 0315 - EXIT
   .word $06CD            ; $2ed9 06CD
   .word $6FF8            ; $2edb 6FF8
   .word $083E            ; $2edd 083E
   .word $06C3            ; $2edf 06C3
   .word $CDF8            ; $2ee1 CDF8
   .word $02E4            ; $2ee3 02E4
   .word _OVER            ; $2ee5 0362 - OVER
   .word _NEGATE          ; $2ee7 046A - NEGATE
   .word _EXIT            ; $2ee9 0315 - EXIT

   .byte $2e     ; $2eeb 2e

NFA__3E_3D:      ; 2EEC
   .byte 2,">="
   .word NFA_IN           ; 2E54
__3E_3D:         ; 2EF1 - 2EFA
   call _FCALL            ; 2EF1
   .word __3C             ; $2ef4 050F - <
   .word _0_3D            ; $2ef6 057E - 0=
   .word _EXIT            ; $2ef8 0315 - EXIT

NFA__3C_3D:      ; 2EFA
   .byte 2,"<="
   .word NFA__3E_3D           ; 2EEC
__3C_3D:         ; 2EFF - 2F08
   call _FCALL            ; 2EFF
   .word __3E             ; $2f02 0533 - >
   .word _0_3D            ; $2f04 057E - 0=
   .word _EXIT            ; $2f06 0315 - EXIT

NFA_U_3E:        ; 2F08
   .byte 2,"U>"
   .word NFA__3C_3D           ; 2EFA
_U_3E:           ; 2F0D - 2F16
   call _FCALL            ; 2F0D
   .word _SWAP            ; $2f10 038D - SWAP
   .word _U_3C            ; $2f12 04FA - U<
   .word _EXIT            ; $2f14 0315 - EXIT

NFA_CASE_3A:     ; 2F16
   .byte 5,"CASE:"
   .word NFA_U_3E           ; 2F08
_CASE_3A:        ; 2F1E - 2F38
   call _FCALL            ; 2F1E
   .word __3FEXEC         ; $2f21 1BF8 - ?EXEC
   .word _CREATE          ; $2f23 1A21 - CREATE
   .word _SMUDGE          ; $2f25 1760 - SMUDGE
   .word __5D             ; $2f27 177E - ]
   .word __28DOES_3E_29   ; $2f29 1A7D - (DOES>)
   call $02e4
   .word _SWAP            ; $2f2e 038D - SWAP
   .word _2_2A            ; $2f30 04A5 - 2*
   .word __2B             ; $2f32 044A - +
   .word __40EXECUTE      ; $2f34 1ADB - @EXECUTE
   .word _EXIT            ; $2f36 0315 - EXIT

NFA__3BCASE:     ; 2F38
   .byte 0x85,";CASE" ; IMMEDIATE
   .word NFA_CASE_3A        ; 2F16
__3BCASE:        ; 2F40 - 2F4B
   call _FCALL            ; 2F40
   .word __2D1            ; $2f43 0EBF - -1
   .word __2C             ; $2f45 0F1D - ,
   .word __3B             ; $2f47 1CA7 - ;
   .word _EXIT            ; $2f49 0315 - EXIT

NFA_CUR:         ; 2F4B
   .byte 3,"CUR"
   .word NFA__3BCASE        ; 2F38
_CUR:            ; 2F51 - 2F70
   pop d         ; $2f51 d1      
   pop h         ; $2f52 e1      
   push b        ; $2f53 c5      
   mvi c,$1b     ; $2f54 0e 1b   
   call $f809    ; $2f56 cd 09 f8
   mvi c,$59     ; $2f59 0e 59   
   call $f809    ; $2f5b cd 09 f8
   mov a,e       ; $2f5e 7b      
   adi $20       ; $2f5f c6 20   
   mov c,a       ; $2f61 4f      
   call $f809    ; $2f62 cd 09 f8
   mov a,l       ; $2f65 7d      
   adi $20       ; $2f66 c6 20   
   mov c,a       ; $2f68 4f      
   call $f809    ; $2f69 cd 09 f8
   pop b         ; $2f6c c1      
   jmp $02ef     ; $2f6d c3 ef 02

NFA_CLS:         ; 2F70
   .byte 3,"CLS"
   .word NFA_CUR          ; 2F4B
_CLS:            ; 2F76 - 2F80
   push b        ; $2f76 c5      
   mvi c,$1f     ; $2f77 0e 1f   
   call $f809    ; $2f79 cd 09 f8
   pop b         ; $2f7c c1      
   jmp $02ef     ; $2f7d c3 ef 02

NFA_BEEP:        ; 2F80
   .byte 4,"BEEP"
   .word NFA_CLS          ; 2F70
_BEEP:           ; 2F87 - 2FA0
   call _FCALL            ; 2F87
   .word _LIT             ; $2f8a 0A2B - LIT
   .word $0004            ; $2f8c 0004
   .word _0               ; $2f8e 0EC8 - 0
   .word __28DO_29        ; $2f90 0AE5 - (DO)
   .word $2F9E            ; $2f92 2F9E
   .word _LIT             ; $2f94 0A2B - LIT
   .word $0007            ; $2f96 0007
   .word _EMIT            ; $2f98 153D - EMIT
   .word __28LOOP_29      ; $2f9a 0B2E - (LOOP)
   .word $2F94            ; $2f9c 2F94
   .word _EXIT            ; $2f9e 0315 - EXIT

NFA_F_5E:        ; 2FA0
   .byte 2,"F^"
   .word NFA_BEEP         ; 2F80
_F_5E:           ; 2FA5 - 2FBB
   pop h         ; $2fa5 e1      
   lxi d,$fff7   ; $2fa6 11 f7 ff
   dad d         ; $2fa9 19      
   pop d         ; $2faa d1      
   mov m,e       ; $2fab 73      
   inx h         ; $2fac 23      
   mov m,d       ; $2fad 72      
   inx h         ; $2fae 23      
   pop d         ; $2faf d1      
   mov m,e       ; $2fb0 73      
   inx h         ; $2fb1 23      
   mov m,d       ; $2fb2 72      
   inx h         ; $2fb3 23      
   pop d         ; $2fb4 d1      
   mov m,e       ; $2fb5 73      
   inx h         ; $2fb6 23      
   mov m,d       ; $2fb7 72      
   jmp $02ef     ; $2fb8 c3 ef 02

NFA__28AT_29:    ; 2FBB
   .byte 4,"(AT)"
   .word $2FA0   ; NFA_F_5E           ; 2FA0
__28AT_29:       ; 2FC2 - 2FCB
   pop h         ; $2fc2 e1      
   lxi d,$fff8   ; $2fc3 11 f8 ff
   dad d         ; $2fc6 19      
   push h        ; $2fc7 e5      
   jmp $02ef     ; $2fc8 c3 ef 02

NFA_AT:          ; 2FCB
   .byte 0x82,"AT" ; IMMEDIATE
   .word NFA__28AT_29         ; 2FBB
_AT:             ; 2FD0 - 3002
   call _FCALL            ; 2FD0
   .word _BL              ; $2fd3 16A6 - BL
   .word _WORD            ; $2fd5 13ED - WORD
   .word _FIND            ; $2fd7 1790 - FIND
   .word __3FDUP          ; $2fd9 03E0 - ?DUP
   .word _0_3D            ; $2fdb 057E - 0=
   .word __28ABORT_22_29  ; $2fdd 114A - (ABORT")
   .byte 2,"-?"
   .word _0_3C            ; $2fe2 053D - 0<
   .word _STATE           ; $2fe4 0215 - STATE
   .word __40             ; $2fe6 0984 - @
   .word _AND             ; $2fe8 08C8 - AND
   .word __3FBRANCH       ; $2fea 0A7A - ?BRANCH
   .word $2FF8            ; $2fec 2FF8
   .word _LIT             ; $2fee 0A2B - LIT
   .word $0008            ; $2ff0 0008
   .word __2B             ; $2ff2 044A - +
   .word __2C             ; $2ff4 0F1D - ,
   .word _EXIT            ; $2ff6 0315 - EXIT
   .word _LIT             ; $2ff8 0A2B - LIT
   .word $0008            ; $2ffa 0008
   .word __2B             ; $2ffc 044A - +
   .word _EXECUTE         ; $2ffe 032C - EXECUTE
   .word _EXIT            ; $3000 0315 - EXIT

NFA_QUAN_2BVAR:  ; 3002
   .byte 8,"QUAN+VAR"
   .word NFA_AT           ; 2FCB
_QUAN_2BVAR:     ; 300D - 3020
   call _FCALL            ; 300D
   .word _QUAN            ; $3010 1AE8 - QUAN
   .word _LIT             ; $3012 0A2B - LIT
   .word $00CD            ; $3014 00CD
   .word _C_2C            ; $3016 0F2F - C,
   .word _LIT             ; $3018 0A2B - LIT
   .word __28AT_29        ; $301a 2FC2 - (AT)
   .word __2C             ; $301c 0F1D - ,
   .word _EXIT            ; $301e 0315 - EXIT

NFA_2_5E:        ; 3020
   .byte 2,"2^"
   .word NFA_QUAN_2BVAR     ; 3002
_2_5E:           ; 3025 - 3044
   call _FCALL            ; 3025
   .word _LIT             ; $3028 0A2B - LIT
   .word $0007            ; $302a 0007
   .word __2D             ; $302c 0455 - -
   .word _2_21            ; $302e 09B5 - 2!
   .word _EXIT            ; $3030 0315 - EXIT

NFA__7C:         ; 3032
   .byte 1,"|"
   .word NFA_2_5E           ; 3020
__7C:            ; 3036 - None
   call $0984    ; $3036 cd 84 09
   jnz $0177     ; $3039 c2 77 01
   mov c,h       ; $303c 4c      
   .byte 0x20    ; $303d 20      
   .byte 0x30    ; $303e 30      
   call $0984    ; $303f cd 84 09
   mov c,m       ; $3042 4e      
   nop           ; $3043 00      

NFA_X:           ; 3044
   .byte 1,"X"
   .word NFA_2_5E           ; 3020
_X:              ; 3048 - 3050
   call $0984    ; $3048 cd 84 09
   nop           ; $304b 00      
   nop           ; $304c 00      
   call $1ac4    ; $304d cd c4 1a

NFA_Y:           ; 3050
   .byte 1,"Y"
   .word NFA_X            ; 3044
_Y:              ; 3054 - 3074
   call $0984    ; $3054 cd 84 09
   nop           ; $3057 00      
   nop           ; $3058 00      
   call $1ac4    ; $3059 cd c4 1a

NFA_A:           ; 305C
   .byte 1,"A"
   .word NFA_Y            ; 3050
_A:              ; 3060 - None
   call $0984    ; $3060 cd 84 09
   nop           ; $3063 00      
   nop           ; $3064 00      
   call $1ac4    ; $3065 cd c4 1a

NFA_T:           ; 3068
   .byte 1,"T"
   .word NFA_Y            ; 3050
_T:              ; 306C - None
   call $0984    ; $306c cd 84 09
   rst 7         ; $306f ff      
   rst 7         ; $3070 ff      
   call $1ac4    ; $3071 cd c4 1a

NFA_PEN:         ; 3074
   .byte 3,"PEN"
   .word NFA_Y            ; 3050
_PEN:            ; 307A - 3083
   call _FCALL            ; 307A
   .word _TRUE            ; $307d 0EE6 - TRUE
   .word $3071            ; $307f 3071
   .word _EXIT            ; $3081 0315 - EXIT

NFA_GUM:         ; 3083
   .byte 3,"GUM"
   .word NFA_PEN          ; 3074
_GUM:            ; 3089 - 325C
   call _FCALL            ; 3089
   .word _FALSE           ; $308c 0EF3 - FALSE
   .word $3071            ; $308e 3071
   .word _EXIT            ; $3090 0315 - EXIT

NFA_G:           ; 3092
   .byte 1,"G"
   .word NFA_GUM          ; 3083
_G:              ; 3096 - None
   call $02e4
   .word _2_2F            ; $3099 05BD - 2/
   .word $303F            ; $309b 303F
   .word __2A             ; $309d 069B - *
   .word $3036            ; $309f 3036
   .word __2B             ; $30a1 044A - +
   .word _SWAP            ; $30a3 038D - SWAP
   .word _2_2F            ; $30a5 05BD - 2/
   .word __2B             ; $30a7 044A - +
   .word _EXIT            ; $30a9 0315 - EXIT

NFA__3FS:        ; 30AB
   .byte 2,"?S"
   .word NFA_GUM          ; 3083
__3FS:           ; 30B0 - None
   .word $D1E1            ; $30b0 D1E1
   .word $B77B            ; $30b2 B77B
   .word $C2C2            ; $30b4 C2C2
   .word $7C30            ; $30b6 7C30
   .word $D5B7            ; $30b8 D5B7
   .word $EFFA            ; $30ba EFFA
   .word $D102            ; $30bc D102
   .word $C3E5            ; $30be C3E5
   .word $02EF            ; $30c0 02EF
   .word $B77C            ; $30c2 B77C
   .word $FAE5            ; $30c4 FAE5
   .word $02EF            ; $30c6 02EF
   .word $11E1            ; $30c8 11E1
   .word $0000            ; $30ca 0000
   .word $C3D5            ; $30cc C3D5
   .word $02EF            ; $30ce 02EF
   .word $7901            ; $30d0 7901
   .word $3083            ; $30d2 3083
   .word $7BD1            ; $30d4 7BD1
   .word $01E6            ; $30d6 01E6
   .word $E2C2            ; $30d8 E2C2
   .word $1130            ; $30da 1130
   .word $0000            ; $30dc 0000
   .word $C3D5            ; $30de C3D5
   .word $02EF            ; $30e0 02EF
   .word $FF11            ; $30e2 FF11
   .word $D5FF            ; $30e4 D5FF
   .word $EFC3            ; $30e6 EFC3
   .word $0202            ; $30e8 0202
   .word $702B            ; $30ea 702B
   .word $3083            ; $30ec 3083
   .word $4B3A            ; $30ee 4B3A
   .word $A730            ; $30f0 A730
   .word $06C2            ; $30f2 06C2
   .word $3A31            ; $30f4 3A31
   .word $3057            ; $30f6 3057
   .word $C2A7            ; $30f8 C2A7
   .word $3101            ; $30fa 3101
   .word $0126            ; $30fc 0126
   .word $03C3            ; $30fe 03C3
   .word $2631            ; $3100 2631
   .word $C310            ; $3102 C310
   .word $3114            ; $3104 3114
   .word $573A            ; $3106 573A
   .word $A730            ; $3108 A730
   .word $12C2            ; $310a 12C2
   .word $2631            ; $310c 2631
   .word $C302            ; $310e C302
   .word $3114            ; $3110 3114
   .word $0426            ; $3112 0426
   .word $1AD1            ; $3114 1AD1
   .word $12B4            ; $3116 12B4
   .word $EFC3            ; $3118 EFC3
   .word $0202            ; $311a 0202
   .word $702D            ; $311c 702D
   .word $3083            ; $311e 3083
   .word $4B3A            ; $3120 4B3A
   .word $A730            ; $3122 A730
   .word $38C2            ; $3124 38C2
   .word $3A31            ; $3126 3A31
   .word $3057            ; $3128 3057
   .word $C2A7            ; $312a C2A7
   .word $3133            ; $312c 3133
   .word $FE26            ; $312e FE26
   .word $35C3            ; $3130 35C3
   .word $2631            ; $3132 2631
   .word $C3EF            ; $3134 C3EF
   .word $3146            ; $3136 3146
   .word $573A            ; $3138 573A
   .word $A730            ; $313a A730
   .word $44C2            ; $313c 44C2
   .word $2631            ; $313e 2631
   .word $C3FD            ; $3140 C3FD
   .word $3146            ; $3142 3146
   .word $FB26            ; $3144 FB26
   .word $1AD1            ; $3146 1AD1
   .word $12A4            ; $3148 12A4
   .word $EFC3            ; $314a EFC3
   .word $0102            ; $314c 0102
   .word $8370            ; $314e 8370
   .word $3A30            ; $3150 3A30
   .word $306F            ; $3152 306F
   .word $C2B7            ; $3154 C2B7
   .word $30EE            ; $3156 30EE
   .word $20C3            ; $3158 20C3
   .word $0131            ; $315a 0131
   .word $8357            ; $315c 8357
   .word $CD30            ; $315e CD30
   .word __40             ; $3160 0984 - @
   .word $0000            ; $3162 0000
   .word $C4CD            ; $3164 C4CD
   .word $011A            ; $3166 011A
   .word $8362            ; $3168 8362
   .word $CD30            ; $316a CD30
   .word __40             ; $316c 0984 - @
   .word $0000            ; $316e 0000
   .word $C4CD            ; $3170 C4CD
   .word $011A            ; $3172 011A
   .word $8367            ; $3174 8367
   .word $CD30            ; $3176 CD30
   .word __40             ; $3178 0984 - @
   .word $0000            ; $317a 0000
   .word $C4CD            ; $317c C4CD
   .word $011A            ; $317e 011A
   .word $8364            ; $3180 8364
   .word $CD30            ; $3182 CD30
   .word __40             ; $3184 0984 - @
   .word $0000            ; $3186 0000
   .word $C4CD            ; $3188 C4CD
   .word $011A            ; $318a 011A
   .word $8376            ; $318c 8376
   .word $CD30            ; $318e CD30
   .word __40             ; $3190 0984 - @
   .word $0000            ; $3192 0000
   .word $C4CD            ; $3194 C4CD
   .word $021A            ; $3196 021A
   .word $3124            ; $3198 3124
   .word $3083            ; $319a 3083
   .word $84CD            ; $319c 84CD
   .word $1A09            ; $319e 1A09
   .word $CD32            ; $31a0 CD32
   .word $1AC4            ; $31a2 1AC4
   .word $2402            ; $31a4 2402
   .word $8332            ; $31a6 8332
   .word $CD30            ; $31a8 CD30
   .word __40             ; $31aa 0984 - @
   .word $3220            ; $31ac 3220
   .word $C4CD            ; $31ae C4CD
   .word $021A            ; $31b0 021A
   .word $3424            ; $31b2 3424
   .word $3083            ; $31b4 3083
   .word $84CD            ; $31b6 84CD
   .word $3A09            ; $31b8 3A09
   .word $CD32            ; $31ba CD32
   .word $1AC4            ; $31bc 1AC4
   .word $2402            ; $31be 2402
   .word $8335            ; $31c0 8335
   .word $CD30            ; $31c2 CD30
   .word __40             ; $31c4 0984 - @
   .word $3240            ; $31c6 3240
   .word $C4CD            ; $31c8 C4CD
   .word $021A            ; $31ca 021A
   .word $5844            ; $31cc 5844
   .word $3083            ; $31ce 3083
   .word $84CD            ; $31d0 84CD
   .word $0009            ; $31d2 0009
   .word $CD00            ; $31d4 CD00
   .word $1AC4            ; $31d6 1AC4
   .word $4402            ; $31d8 4402
   .word $8359            ; $31da 8359
   .word $CD30            ; $31dc CD30
   .word __40             ; $31de 0984 - @
   .word $0000            ; $31e0 0000
   .word $C4CD            ; $31e2 C4CD
   .word $011A            ; $31e4 011A
   .word $8369            ; $31e6 8369
   .word $CD30            ; $31e8 CD30
   .word __40             ; $31ea 0984 - @
   .word $0000            ; $31ec 0000
   .word $C4CD            ; $31ee C4CD
   .word $011A            ; $31f0 011A
   .word $836A            ; $31f2 836A
   .word $CD30            ; $31f4 CD30
   .word __40             ; $31f6 0984 - @
   .word $0000            ; $31f8 0000
   .word $C4CD            ; $31fa C4CD
   .byte $1A              ; $31fc 1A

NFA__6C:         ; 31FD
   .byte 1,"l"
   .word NFA_GUM          ; 3083
__6C:            ; 3201 - None
   call $02E4             ; $3202 02E4
   .word _0               ; $3204 0EC8 - 0
   .word $3164            ; $3206 3164
   .word $316B            ; $3208 316B
   .word __2D1            ; $320a 0EBF - -1
   .word __28DO_29        ; $320c 0AE5 - (DO)
   .word $325A            ; $320e 325A
   .word $315F            ; $3210 315F
   .word $316B            ; $3212 316B
   .word __3C             ; $3214 050F - <
   .word _N_3FBRANCH      ; $3216 0A90 - N?BRANCH
   .word $3236            ; $3218 3236
   .word $0000            ; $321a 0000
   .word _NOT             ; $321c 08FD - NOT
   .word _DUP             ; $321e 03D3 - DUP
   .word $0000            ; $3220 0000
   .word $3060            ; $3222 3060
   .word _SWAP            ; $3224 038D - SWAP
   .word $3183            ; $3226 3183
   .word $30B0            ; $3228 30B0
   .word __2B             ; $322a 044A - +
   .word $3065            ; $322c 3065
   .word $315F            ; $322e 315F
   .word $316B            ; $3230 316B
   .word __2D             ; $3232 0455 - -
   .word $3164            ; $3234 3164
   .word $3060            ; $3236 3060
   .word $3151            ; $3238 3151
   .word $0000            ; $323a 0000
   .word _NOT             ; $323c 08FD - NOT
   .word _DUP             ; $323e 03D3 - DUP
   .word $0000            ; $3240 0000
   .word $3060            ; $3242 3060
   .word _SWAP            ; $3244 038D - SWAP
   .word $318F            ; $3246 318F
   .word $30B0            ; $3248 30B0
   .word __2B             ; $324a 044A - +
   .word $3065            ; $324c 3065
   .word $315F            ; $324e 315F
   .word $3177            ; $3250 3177
   .word __2B             ; $3252 044A - +
   .word $3164            ; $3254 3164
   .word __28LOOP_29      ; $3256 0B2E - (LOOP)
   .word $3210            ; $3258 3210
   .word _EXIT            ; $325a 0315 - EXIT

NFA_LINE:        ; 325C
   .byte 4,"LINE"
   .word NFA_GUM          ; 3083
_LINE:           ; 3263 - 3358
   call _FCALL            ; 3263
   .word _2DUP            ; $3266 03F2 - 2DUP
   .word _LIT             ; $3268 0A2B - LIT
   .word $0032            ; $326a 0032
   .word _U_3C            ; $326c 04FA - U<
   .word _SWAP            ; $326e 038D - SWAP
   .word _LIT             ; $3270 0A2B - LIT
   .word $0080            ; $3272 0080
   .word _U_3C            ; $3274 04FA - U<
   .word _AND             ; $3276 08C8 - AND
   .word _NOT             ; $3278 08FD - NOT
   .word __28ABORT_22_29  ; $327a 114A - (ABORT")
   .byte 23,"-newernyj argument LINE"
   .word _2DUP            ; $3294 03F2 - 2DUP
   .word _X               ; $3296 3048 - X
   .word _Y               ; $3298 3054 - Y
   .word $3096            ; $329a 3096
   .word $3065            ; $329c 3065
   .word _Y               ; $329e 3054 - Y
   .word __2D             ; $32a0 0455 - -
   .word $31E2            ; $32a2 31E2
   .word _X               ; $32a4 3048 - X
   .word __2D             ; $32a6 0455 - -
   .word $31D5            ; $32a8 31D5
   .word _1               ; $32aa 0ED1 - 1
   .word $31D0            ; $32ac 31D0
   .word _0_3E            ; $32ae 0550 - 0>
   .word _N_3FBRANCH      ; $32b0 0A90 - N?BRANCH
   .word $32B6            ; $32b2 32B6
   .word _NEGATE          ; $32b4 046A - NEGATE
   .word $31EE            ; $32b6 31EE
   .word $303F            ; $32b8 303F
   .word $31DD            ; $32ba 31DD
   .word _0_3E            ; $32bc 0550 - 0>
   .word _N_3FBRANCH      ; $32be 0A90 - N?BRANCH
   .word $32C4            ; $32c0 32C4
   .word _NEGATE          ; $32c2 046A - NEGATE
   .word $31FA            ; $32c4 31FA
   .word $31D0            ; $32c6 31D0
   .word _ABS             ; $32c8 04B1 - ABS
   .word $31DD            ; $32ca 31DD
   .word _ABS             ; $32cc 04B1 - ABS
   .word _2DUP            ; $32ce 03F2 - 2DUP
   .word _2DUP            ; $32d0 03F2 - 2DUP
   .word _MAX             ; $32d2 04DE - MAX
   .word $3170            ; $32d4 3170
   .word _MIN             ; $32d6 04C1 - MIN
   .word $317C            ; $32d8 317C
   .word __3E             ; $32da 0533 - >
   .word __3FBRANCH       ; $32dc 0A7A - ?BRANCH
   .word $3310            ; $32de 3310
   .word _LIT             ; $32e0 0A2B - LIT
   .word _Y               ; $32e2 3054 - Y
   .word _DUP             ; $32e4 03D3 - DUP
   .word $319C            ; $32e6 319C
   .word __21             ; $32e8 099D - !
   .word __3EBODY         ; $32ea 133A - >BODY
   .word _2_2B            ; $32ec 0482 - 2+
   .word $31A9            ; $32ee 31A9
   .word __21             ; $32f0 099D - !
   .word $31F5            ; $32f2 31F5
   .word $3188            ; $32f4 3188
   .word _LIT             ; $32f6 0A2B - LIT
   .word _X               ; $32f8 3048 - X
   .word _DUP             ; $32fa 03D3 - DUP
   .word $31B6            ; $32fc 31B6
   .word __21             ; $32fe 099D - !
   .word __3EBODY         ; $3300 133A - >BODY
   .word _2_2B            ; $3302 0482 - 2+
   .word $31C3            ; $3304 31C3
   .word __21             ; $3306 099D - !
   .word $31E9            ; $3308 31E9
   .word $3194            ; $330a 3194
   .word _BRANCH          ; $330c 0A68 - BRANCH
   .word $333C            ; $330e 333C
   .word _LIT             ; $3310 0A2B - LIT
   .word _X               ; $3312 3048 - X
   .word _DUP             ; $3314 03D3 - DUP
   .word $319C            ; $3316 319C
   .word __21             ; $3318 099D - !
   .word __3EBODY         ; $331a 133A - >BODY
   .word _2_2B            ; $331c 0482 - 2+
   .word $31A9            ; $331e 31A9
   .word __21             ; $3320 099D - !
   .word $31E9            ; $3322 31E9
   .word $3188            ; $3324 3188
   .word _LIT             ; $3326 0A2B - LIT
   .word _Y               ; $3328 3054 - Y
   .word _DUP             ; $332a 03D3 - DUP
   .word $31B6            ; $332c 31B6
   .word __21             ; $332e 099D - !
   .word __3EBODY         ; $3330 133A - >BODY
   .word _2_2B            ; $3332 0482 - 2+
   .word $31C3            ; $3334 31C3
   .word __21             ; $3336 099D - !
   .word $31F5            ; $3338 31F5
   .word $3194            ; $333a 3194
   .word _X               ; $333c 3048 - X
   .word _1               ; $333e 0ED1 - 1
   .word _AND             ; $3340 08C8 - AND
   .word _NEGATE          ; $3342 046A - NEGATE
   .word $304D            ; $3344 304D
   .word _Y               ; $3346 3054 - Y
   .word _1               ; $3348 0ED1 - 1
   .word _AND             ; $334a 08C8 - AND
   .word _NEGATE          ; $334c 046A - NEGATE
   .word $3059            ; $334e 3059
   .word $3201            ; $3350 3201
   .word $3059            ; $3352 3059
   .word $304D            ; $3354 304D
   .word _EXIT            ; $3356 0315 - EXIT

NFA_PLOT:        ; 3358
   .byte 4,"PLOT"
   .word NFA_LINE         ; 325C
_PLOT:           ; 335F - 3639
   call _FCALL            ; 335F
   .word _2DUP            ; $3362 03F2 - 2DUP
   .word _LIT             ; $3364 0A2B - LIT
   .word $0032            ; $3366 0032
   .word _U_3C            ; $3368 04FA - U<
   .word _SWAP            ; $336a 038D - SWAP
   .word _LIT             ; $336c 0A2B - LIT
   .word $0080            ; $336e 0080
   .word _U_3C            ; $3370 04FA - U<
   .word _AND             ; $3372 08C8 - AND
   .word _NOT             ; $3374 08FD - NOT
   .word __28ABORT_22_29  ; $3376 114A - (ABORT")
   .byte 23,"-newernyj argument PLOT"
   .word _2DUP            ; $3390 03F2 - 2DUP
   .word $30D4            ; $3392 30D4
   .word $3059            ; $3394 3059
   .word $30D4            ; $3396 30D4
   .word $304D            ; $3398 304D
   .word _2DUP            ; $339a 03F2 - 2DUP
   .word $3096            ; $339c 3096
   .word $3151            ; $339e 3151
   .word $3059            ; $33a0 3059
   .word $304D            ; $33a2 304D
   .word _EXIT            ; $33a4 0315 - EXIT

;NFA_BYE:         ; 33A6
   .byte 3,"BYE"
   .word NFA_PLOT         ; 3358
;_BYE:            ; 33AC - None
   nop           ; $33ac 00      
   nop           ; $33ad 00      
   nop           ; $33ae 00      
   nop           ; $33af 00      
   nop           ; $33b0 00      
   nop           ; $33b1 00      
   nop           ; $33b2 00      
   nop           ; $33b3 00      
   nop           ; $33b4 00      
   nop           ; $33b5 00      
   nop           ; $33b6 00      
   nop           ; $33b7 00      
   nop           ; $33b8 00      
   nop           ; $33b9 00      
   nop           ; $33ba 00      
   nop           ; $33bb 00      
   nop           ; $33bc 00      
   nop           ; $33bd 00      
   nop           ; $33be 00      
   nop           ; $33bf 00      
   nop           ; $33c0 00      
   nop           ; $33c1 00      
   nop           ; $33c2 00      
   nop           ; $33c3 00      
   nop           ; $33c4 00      
   nop           ; $33c5 00      
   nop           ; $33c6 00      
   lxi sp,$3900  ; $33c7 31 00 39
   nop           ; $33ca 00      
   lxi sp,$3900  ; $33cb 31 00 39
   nop           ; $33ce 00      
   lxi sp,$3900  ; $33cf 31 00 39
   nop           ; $33d2 00      
   lxi sp,$3900  ; $33d3 31 00 39
   nop           ; $33d6 00      
   lxi sp,$3900  ; $33d7 31 00 39
   nop           ; $33da 00      
   lxi sp,$3900  ; $33db 31 00 39
   nop           ; $33de 00      
   lxi sp,$3300  ; $33df 31 00 33
   inx sp        ; $33e2 33      
   dad sp        ; $33e3 39      
   lxi sp,$0039  ; $33e4 31 39 00
   lxi sp,$3900  ; $33e7 31 00 39
   nop           ; $33ea 00      
   lxi sp,$3900  ; $33eb 31 00 39
   nop           ; $33ee 00      
   lxi sp,$3900  ; $33ef 31 00 39
   nop           ; $33f2 00      
   lxi sp,$3900  ; $33f3 31 00 39
   inx sp        ; $33f6 33      
   inx sp        ; $33f7 33      
   mov b,c       ; $33f8 41      
   mvi m,$00     ; $33f9 36 00   
   lxi sp,$3900  ; $33fb 31 00 39
   nop           ; $33fe 00      
   lxi sp,$0000  ; $33ff 31 00 00
   nop           ; $3402 00      
   nop           ; $3403 00      
   nop           ; $3404 00      
   nop           ; $3405 00      
   nop           ; $3406 00      
   nop           ; $3407 00      
   nop           ; $3408 00      
   nop           ; $3409 00      
   nop           ; $340a 00      
   nop           ; $340b 00      
   sbb l         ; $340c 9d      
   inr c         ; $340d 0c      
   adc e         ; $340e 8b      
   inr c         ; $340f 0c      
   ora b         ; $3410 b0      
   inr c         ; $3411 0c      
   nop           ; $3412 00      
   nop           ; $3413 00      
   nop           ; $3414 00      
   nop           ; $3415 00      
   nop           ; $3416 00      
   nop           ; $3417 00      
   nop           ; $3418 00      
   nop           ; $3419 00      
   sbb c         ; $341a 99      
   inr m         ; $341b 34      
   cmc           ; $341c 3f      
   dcr m         ; $341d 35      
   adc l         ; $341e 8d      
   inr m         ; $341f 34      
   mov b,d       ; $3420 42      
   mov b,h       ; $3421 44      
   mov a,b       ; $3422 78      
   dcr a         ; $3423 3d      
   mov b,d       ; $3424 42      
   mov b,h       ; $3425 44      
   dcx sp        ; $3426 3b      
   dcr d         ; $3427 15      
   ldax b        ; $3428 0a      
   nop           ; $3429 00      
   nop           ; $342a 00      
   nop           ; $342b 00      
   mov d,l       ; $342c 55      
   inr m         ; $342d 34      
   mov d,l       ; $342e 55      
   inr m         ; $342f 34      
   rst 7         ; $3430 ff      
   rst 7         ; $3431 ff      
   inx d         ; $3432 13      
   mov b,a       ; $3433 47      
   dcr a         ; $3434 3d      
   dcr m         ; $3435 35      
   sbb l         ; $3436 9d      
   inr m         ; $3437 34      
   nop           ; $3438 00      
   nop           ; $3439 00      
   nop           ; $343a 00      
   nop           ; $343b 00      
   push psw      ; $343c f5      
   shld $0800    ; $343d 22 00 08
   mvi c,$00     ; $3440 0e 00   
   lxi b,$0000   ; $3442 01 00 00
   nop           ; $3445 00      
   rst 7         ; $3446 ff      
   rst 7         ; $3447 ff      
l3448:

NFA_FORTH:       ; 3448
   .byte 5,"FORTH"
   .word $0000
_FORTH:          ; 3450 - 01AF
   call $1b95    ; $3450 cd 95 1b
   .byte $01
   .byte $80
   .word $4386
   .word $0000

   dad sp        ; $3459 39      
   nop           ; $345a 00      
   lxi sp,$3900  ; $345b 31 00 39
   nop           ; $345e 00      
   lxi sp,$3900  ; $345f 31 00 39
   nop           ; $3462 00      
   sbb l         ; $3463 9d      
   dcr d         ; $3464 15      
   sbb l         ; $3465 9d      
   dcr d         ; $3466 15      
   lxi b,$2600   ; $3467 01 00 26
   rrc           ; $346a 0f      
   xra c         ; $346b a9      
   dcr e         ; $346c 1d      
   sta $9d1e     ; $346d 32 1e 9d
   dcr d         ; $3470 15      
   sbb l         ; $3471 9d      
   dcr d         ; $3472 15      
   nop           ; $3473 00      
   nop           ; $3474 00      
   add e         ; $3475 83      
   mov m,c       ; $3476 71      
   mov m,l       ; $3477 75      
   inr l         ; $3478 2c      
   mov m,l       ; $3479 75      
   inr l         ; $347a 2c      
   mov m,l       ; $347b 75      
   inr l         ; $347c 2c      
   sbb c         ; $347d 99      
   inx d         ; $347e 13      
   mov m,l       ; $347f 75      
   inr l         ; $3480 2c      
   mov m,l       ; $3481 75      
   inr l         ; $3482 2c      
   mov m,l       ; $3483 75      
   inr l         ; $3484 2c      
   sbb c         ; $3485 99      
   inx d         ; $3486 13      
   sbb l         ; $3487 9d      
   dcr d         ; $3488 15      
   lxi d,$9d00   ; $3489 11 00 9d
   dcr d         ; $348c 15      
   cmp m         ; $348d be      
   inr d         ; $348e 14      
   nop           ; $348f 00      
   nop           ; $3490 00      
   cmc           ; $3491 3f      
   nop           ; $3492 00      
   shld $0415    ; $3493 22 15 04
   mvi d,$c5     ; $3496 16 c5   
   .byte 0x10    ; $3498 10      
   dad sp        ; $3499 39      
   nop           ; $349a 00      
   lxi sp,$3400  ; $349b 31 00 34
   mvi m,$43     ; $349e 36 43   
   inr m         ; $34a0 34      
   .byte 0x20    ; $34a1 20      
   mov b,h       ; $34a2 44      
   mov b,l       ; $34a3 45      
   mov b,e       ; $34a4 43      
   mov c,c       ; $34a5 49      
   mov c,l       ; $34a6 4d      
   mov b,c       ; $34a7 41      
   mov c,h       ; $34a8 4c      
   .byte 0x20    ; $34a9 20      
   mvi l,$50     ; $34aa 2e 50   
   .byte 0x18    ; $34ac 18      
   .byte 0x18    ; $34ad 18      
   .byte 0x18    ; $34ae 18      
   .byte 0x18    ; $34af 18      
   .byte 0x18    ; $34b0 18      
   .byte 0x18    ; $34b1 18      
   .byte 0x18    ; $34b2 18      
   .byte 0x18    ; $34b3 18      
   .byte 0x18    ; $34b4 18      
   .byte 0x18    ; $34b5 18      
   dad d         ; $34b6 19      
   dad d         ; $34b7 19      
   dad d         ; $34b8 19      
   ldax d        ; $34b9 1a      
   ldax d        ; $34ba 1a      
   ldax d        ; $34bb 1a      
   ldax d        ; $34bc 1a      
   rar           ; $34bd 1f      
   ral           ; $34be 17      
   ral           ; $34bf 17      
   ral           ; $34c0 17      
   ral           ; $34c1 17      
   ral           ; $34c2 17      
   ral           ; $34c3 17      
   ral           ; $34c4 17      
   ral           ; $34c5 17      
   ral           ; $34c6 17      
   ral           ; $34c7 17      
   ral           ; $34c8 17      
   ral           ; $34c9 17      
   ral           ; $34ca 17      
   ral           ; $34cb 17      
   ral           ; $34cc 17      
   ral           ; $34cd 17      
   ral           ; $34ce 17      
   ral           ; $34cf 17      
   ral           ; $34d0 17      
   ral           ; $34d1 17      
   ral           ; $34d2 17      
   ral           ; $34d3 17      
   ral           ; $34d4 17      
   ral           ; $34d5 17      
   shld $2220    ; $34d6 22 20 22
   inr m         ; $34d9 34      
   dcr l         ; $34da 2d      
   mov b,l       ; $34db 45      
   dad b         ; $34dc 09      
   add h         ; $34dd 84      
   dad b         ; $34de 09      
   add h         ; $34df 84      
   dad b         ; $34e0 09      
   add h         ; $34e1 84      
   dad b         ; $34e2 09      
   add h         ; $34e3 84      
   dad b         ; $34e4 09      
   add h         ; $34e5 84      
   dad b         ; $34e6 09      
   add h         ; $34e7 84      
   dad b         ; $34e8 09      
   add h         ; $34e9 84      
   dad b         ; $34ea 09      
   add h         ; $34eb 84      
   dad b         ; $34ec 09      
   add h         ; $34ed 84      
   dad b         ; $34ee 09      
   add h         ; $34ef 84      
   dad b         ; $34f0 09      
   add h         ; $34f1 84      
   dad b         ; $34f2 09      
   add h         ; $34f3 84      
   dad b         ; $34f4 09      
   add h         ; $34f5 84      
   dad b         ; $34f6 09      
   add h         ; $34f7 84      
   dad b         ; $34f8 09      
   add h         ; $34f9 84      
   dad b         ; $34fa 09      
   add h         ; $34fb 84      
   dad b         ; $34fc 09      
   add h         ; $34fd 84      
   dad b         ; $34fe 09      
   add h         ; $34ff 84      
   dad b         ; $3500 09      
   add h         ; $3501 84      
   dad b         ; $3502 09      
   add h         ; $3503 84      
   dad b         ; $3504 09      
   add h         ; $3505 84      
   dad b         ; $3506 09      
   add h         ; $3507 84      
   dad b         ; $3508 09      
   add h         ; $3509 84      
   dad b         ; $350a 09      
   ana c         ; $350b a1      
   stc           ; $350c 37      
   ana c         ; $350d a1      
   ral           ; $350e 17      
   ana c         ; $350f a1      
   rlc           ; $3510 07      
   rnz           ; $3511 c0      
   inx b         ; $3512 03      
   .byte 0x20    ; $3513 20      
   nop           ; $3514 00      
   .byte 0x20    ; $3515 20      
   nop           ; $3516 00      
   xra l         ; $3517 ad      
   .byte 0xfd    ; $3518 fd      
   ori $fd       ; $3519 f6 fd   
   .byte 0x20    ; $351b 20      
   nop           ; $351c 00      
   .byte 0x20    ; $351d 20      
   nop           ; $351e 00      
   stc           ; $351f 37      
   nop           ; $3520 00      
   cnz $c446     ; $3521 c4 46 c4
   mvi e,$c4     ; $3524 1e c4   
   ldax b        ; $3526 0a      
   inx d         ; $3527 13      
   rlc           ; $3528 07      
   dcr d         ; $3529 15      
   cpi $15       ; $352a fe 15   
   cpi $3c       ; $352c fe 3c   
   .byte 0xfd    ; $352e fd      
   dcr d         ; $352f 15      
   cpi $2c       ; $3530 fe 2c   
   inx b         ; $3532 03      
   mov h,m       ; $3533 66      
   cpi $a1       ; $3534 fe a1   
   inr c         ; $3536 0c      
   mov e,a       ; $3537 5f      
   dcr d         ; $3538 15      
   sbb l         ; $3539 9d      
   inr m         ; $353a 34      
   sbb l         ; $353b 9d      
   inr m         ; $353c 34      
   lxi d,$3f00   ; $353d 11 00 3f
   dcr m         ; $3540 35      
   adc m         ; $3541 8e      
   mov l,h       ; $3542 6c      
   rst 7         ; $3543 ff      
   nop           ; $3544 00      
   nop           ; $3545 00      
   nop           ; $3546 00      
   nop           ; $3547 00      
   nop           ; $3548 00      
   nop           ; $3549 00      
   nop           ; $354a 00      
   nop           ; $354b 00      
   rrc           ; $354c 0f      
   nop           ; $354d 00      
   nop           ; $354e 00      
   nop           ; $354f 00      
   nop           ; $3550 00      
   nop           ; $3551 00      
   nop           ; $3552 00      
   nop           ; $3553 00      
   nop           ; $3554 00      
   nop           ; $3555 00      
   nop           ; $3556 00      
   nop           ; $3557 00      
   nop           ; $3558 00      
   nop           ; $3559 00      
   nop           ; $355a 00      
   nop           ; $355b 00      
   nop           ; $355c 00      
   nop           ; $355d 00      
   nop           ; $355e 00      
   nop           ; $355f 00      
   nop           ; $3560 00      
   nop           ; $3561 00      
   nop           ; $3562 00      
   nop           ; $3563 00      
   nop           ; $3564 00      
   nop           ; $3565 00      
   nop           ; $3566 00      
   nop           ; $3567 00      
   nop           ; $3568 00      
   nop           ; $3569 00      
   nop           ; $356a 00      
   nop           ; $356b 00      
   nop           ; $356c 00      
   nop           ; $356d 00      
   nop           ; $356e 00      
   nop           ; $356f 00      
   nop           ; $3570 00      
   nop           ; $3571 00      
   nop           ; $3572 00      
   nop           ; $3573 00      
   nop           ; $3574 00      
   nop           ; $3575 00      
   nop           ; $3576 00      
   nop           ; $3577 00      
   nop           ; $3578 00      
   nop           ; $3579 00      
   nop           ; $357a 00      
   rst 7         ; $357b ff      
   nop           ; $357c 00      
   nop           ; $357d 00      
   nop           ; $357e 00      
   nop           ; $357f 00      
   nop           ; $3580 00      
   nop           ; $3581 00      
   nop           ; $3582 00      
   nop           ; $3583 00      
   nop           ; $3584 00      
   nop           ; $3585 00      
   nop           ; $3586 00      
   nop           ; $3587 00      
   nop           ; $3588 00      
   nop           ; $3589 00      
   nop           ; $358a 00      
   nop           ; $358b 00      
   nop           ; $358c 00      
   nop           ; $358d 00      
   nop           ; $358e 00      
   nop           ; $358f 00      
   nop           ; $3590 00      
   nop           ; $3591 00      
   nop           ; $3592 00      
   nop           ; $3593 00      
   rst 7         ; $3594 ff      
   nop           ; $3595 00      
   nop           ; $3596 00      
   rst 7         ; $3597 ff      
   inx b         ; $3598 03      
   lxi b,$0200   ; $3599 01 00 02
   nop           ; $359c 00      
   mov m,h       ; $359d 74      
   mov h,l       ; $359e 65      
   adc h         ; $359f 8c      
   mov m,l       ; $35a0 75      
   sub h         ; $35a1 94      
   .byte 0x10    ; $35a2 10      
   mov m,h       ; $35a3 74      
   mov h,l       ; $35a4 65      
   mov m,h       ; $35a5 74      
   mov h,l       ; $35a6 65      
   lxi b,$0700   ; $35a7 01 00 07
   nop           ; $35aa 00      
   nop           ; $35ab 00      
   rst 7         ; $35ac ff      
   nop           ; $35ad 00      
   rst 6         ; $35ae f7      
   nop           ; $35af 00      
   rst 7         ; $35b0 ff      
   nop           ; $35b1 00      
   rst 7         ; $35b2 ff      
   nop           ; $35b3 00      
   rst 7         ; $35b4 ff      
   nop           ; $35b5 00      
   rst 7         ; $35b6 ff      
   nop           ; $35b7 00      
   rst 7         ; $35b8 ff      
   nop           ; $35b9 00      
   rst 7         ; $35ba ff      
   nop           ; $35bb 00      
   rst 7         ; $35bc ff      
   nop           ; $35bd 00      
   rst 7         ; $35be ff      
   nop           ; $35bf 00      
   nop           ; $35c0 00      
   rst 7         ; $35c1 ff      
   nop           ; $35c2 00      
   rst 7         ; $35c3 ff      
   nop           ; $35c4 00      
   rst 7         ; $35c5 ff      
   nop           ; $35c6 00      
   rst 7         ; $35c7 ff      
   nop           ; $35c8 00      
   rst 7         ; $35c9 ff      
   nop           ; $35ca 00      
   rst 7         ; $35cb ff      
   nop           ; $35cc 00      
   rst 7         ; $35cd ff      
   nop           ; $35ce 00      
   rst 7         ; $35cf ff      
   nop           ; $35d0 00      
   rst 7         ; $35d1 ff      
   nop           ; $35d2 00      
   rst 7         ; $35d3 ff      
   nop           ; $35d4 00      
   rst 7         ; $35d5 ff      
   nop           ; $35d6 00      
   rst 7         ; $35d7 ff      
   nop           ; $35d8 00      
   rst 7         ; $35d9 ff      
   nop           ; $35da 00      
   rst 7         ; $35db ff      
   nop           ; $35dc 00      
   rst 7         ; $35dd ff      
   nop           ; $35de 00      
   rst 7         ; $35df ff      
   nop           ; $35e0 00      
   rst 7         ; $35e1 ff      
   nop           ; $35e2 00      
   rst 7         ; $35e3 ff      
   nop           ; $35e4 00      
   rst 7         ; $35e5 ff      
   nop           ; $35e6 00      
   rst 7         ; $35e7 ff      
   nop           ; $35e8 00      
   rst 7         ; $35e9 ff      
   nop           ; $35ea 00      
   rst 7         ; $35eb ff      
   nop           ; $35ec 00      
   rst 7         ; $35ed ff      
   nop           ; $35ee 00      
   rst 7         ; $35ef ff      
   nop           ; $35f0 00      
   rst 7         ; $35f1 ff      
   nop           ; $35f2 00      
   rst 7         ; $35f3 ff      
   nop           ; $35f4 00      
   rst 7         ; $35f5 ff      
   nop           ; $35f6 00      
   rst 7         ; $35f7 ff      
   nop           ; $35f8 00      
   rst 7         ; $35f9 ff      
   nop           ; $35fa 00      
   rst 7         ; $35fb ff      
   nop           ; $35fc 00      
   rst 7         ; $35fd ff      
   nop           ; $35fe 00      
   rst 7         ; $35ff ff      
   nop           ; $3600 00      
   rst 7         ; $3601 ff      
   nop           ; $3602 00      
   mov b,h       ; $3603 44      
   nop           ; $3604 00      
   rst 6         ; $3605 f7      
   nop           ; $3606 00      
   rst 7         ; $3607 ff      
   nop           ; $3608 00      
   lxi b,$5873   ; $3609 01 73 58
   inx sp        ; $360c 33      
   call $0984    ; $360d cd 84 09
   mov d,h       ; $3610 54      
   mov b,h       ; $3611 44      
   call $1ac4    ; $3612 cd c4 1a
   lxi b,$096e   ; $3615 01 6e 09
   mvi m,$cd     ; $3618 36 cd   
   add h         ; $361a 84      
   dad b         ; $361b 09      
   adc e         ; $361c 8b      
   mov b,h       ; $361d 44      
   call $1ac4    ; $361e cd c4 1a
   lxi b,$1564   ; $3621 01 64 15
   mvi m,$cd     ; $3624 36 cd   
   add h         ; $3626 84      
   dad b         ; $3627 09      
   stc           ; $3628 37      
   nop           ; $3629 00      
   call $1ac4    ; $362a cd c4 1a
   lxi b,$2161   ; $362d 01 61 21
   mvi m,$cd     ; $3630 36 cd   
   in $1a        ; $3632 db 1a   
   sbb d         ; $3634 9a      
   .byte 0x38    ; $3635 38      
   call $1ac4    ; $3636 cd c4 1a

NFA_V_2DACT:     ; 3639
   .byte 5,"V-ACT"
   .word $3358   ; NFA_PLOT         ; 3358
_V_2DACT:        ; 3641 - 3664
   call $1adb    ; $3641 cd db 1a
   ana b         ; $3644 a0      
   dad sp        ; $3645 39      
   call $1ac4    ; $3646 cd c4 1a
   lxi b,$3970   ; $3649 01 70 39
   mvi m,$cd     ; $364c 36 cd   
   cpo $d302     ; $364e e4 02 d3
   inx b         ; $3651 03      
   add h         ; $3652 84      
   dad b         ; $3653 09      
   dcr c         ; $3654 0d      
   mvi m,$fa     ; $3655 36 fa   
   inr b         ; $3657 04      
   sub b         ; $3658 90      
   ldax b        ; $3659 0a      
   mov h,d       ; $365a 62      
   mvi m,$25     ; $365b 36 25   
   mvi m,$62     ; $365d 36 62   
   inx b         ; $365f 03      
   jc $1509      ; $3660 da 09 15
   inx b         ; $3663 03      

NFA_V_2DLIST:    ; 3664
   .byte 6,"V-LIST"
   .word NFA_V_2DACT        ; 3639
_V_2DLIST:       ; 366D - 38FD
   call _FCALL            ; 366D
   .word _VOC_2DLINK      ; $3670 01E1 - VOC-LINK
   .word __40             ; $3672 0984 - @
   .word __3FDUP          ; $3674 03E0 - ?DUP
   .word __3FBRANCH       ; $3676 0A7A - ?BRANCH
   .word $3680            ; $3678 3680
   .word _V_2DACT         ; $367a 3641 - V-ACT
   .word _BRANCH          ; $367c 0A68 - BRANCH
   .word $3672            ; $367e 3672
   .word _EXIT            ; $3680 0315 - EXIT

   lxi b,$6462   ; $3682 01 62 64
   mvi m,$cd     ; $3685 36 cd   
   cpo $d302     ; $3687 e4 02 d3
   inx b         ; $368a 03      
   sbb c         ; $368b 99      
   inr b         ; $368c 04      
   add h         ; $368d 84      
   dad b         ; $368e 09      
   out $03       ; $368f d3 03   
   dad d         ; $3691 19      
   mvi m,$fa     ; $3692 36 fa   
   inr b         ; $3694 04      
   mov h,d       ; $3695 62      
   inx b         ; $3696 03      
   add h         ; $3697 84      
   dad b         ; $3698 09      
   dcx h         ; $3699 2b      
   ldax b        ; $369a 0a      
   lxi b,$6680   ; $369b 01 80 66
   dcr b         ; $369e 05      
   .byte 0xd9    ; $369f d9      
   .byte 0x08    ; $36a0 08      
   sub b         ; $36a1 90      
   ldax b        ; $36a2 0a      
   ora c         ; $36a3 b1      
   mvi m,$31     ; $36a4 36 31   
   mvi m,$7b     ; $36a6 36 7b   
   inx d         ; $36a8 13      
   out $03       ; $36a9 d3 03   
   add h         ; $36ab 84      
   dad b         ; $36ac 09      
   sub b         ; $36ad 90      
   ldax b        ; $36ae 0a      
   adc l         ; $36af 8d      
   mvi m,$82     ; $36b0 36 82   
   inx b         ; $36b2 03      
   dcr d         ; $36b3 15      
   inx b         ; $36b4 03      
   lxi b,$8277   ; $36b5 01 77 82
   mvi m,$cd     ; $36b8 36 cd   
   cpo $d302     ; $36ba e4 02 d3
   inx b         ; $36bd 03      
   mov m,a       ; $36be 77      
   inr b         ; $36bf 04      
   add h         ; $36c0 84      
   dad b         ; $36c1 09      
   adc l         ; $36c2 8d      
   inx b         ; $36c3 03      
   sub c         ; $36c4 91      
   dad b         ; $36c5 09      
   dcr d         ; $36c6 15      
   inx b         ; $36c7 03      
   lxi b,$b567   ; $36c8 01 67 b5
   mvi m,$cd     ; $36cb 36 cd   
   cpo $b902     ; $36cd e4 02 b9
   mvi m,$2b     ; $36d0 36 2b   
   ldax b        ; $36d2 0a      
   call $6600    ; $36d3 cd 00 66
   dcr b         ; $36d6 05      
   push b        ; $36d7 c5      
   inx b         ; $36d8 03      
   mov h,m       ; $36d9 66      
   dcr b         ; $36da 05      
   rz            ; $36db c8      
   .byte 0x08    ; $36dc 08      
   dcr d         ; $36dd 15      
   inx b         ; $36de 03      
   lxi b,$c865   ; $36df 01 65 c8
   mvi m,$cd     ; $36e2 36 cd   
   add h         ; $36e4 84      
   dad b         ; $36e5 09      
   rst 7         ; $36e6 ff      
   rst 7         ; $36e7 ff      
   call $1ac4    ; $36e8 cd c4 1a
   lxi b,$df76   ; $36eb 01 76 df
   mvi m,$cd     ; $36ee 36 cd   
   add h         ; $36f0 84      
   dad b         ; $36f1 09      
   rst 7         ; $36f2 ff      
   rst 7         ; $36f3 ff      
   call $1ac4    ; $36f4 cd c4 1a
   lxi b,$eb7a   ; $36f7 01 7a eb
   mvi m,$cd     ; $36fa 36 cd   
   cpo $6202     ; $36fc e4 02 62
   inx b         ; $36ff 03      
   add d         ; $3700 82      
   inr b         ; $3701 04      
   dad b         ; $3702 09      
   inx b         ; $3703 03      
   adc l         ; $3704 8d      
   inx b         ; $3705 03      
   cz $9036      ; $3706 cc 36 90
   ldax b        ; $3709 0a      
   .byte 0x10    ; $370a 10      
   stc           ; $370b 37      
   di            ; $370c f3      
   mvi c,$f4     ; $370d 0e f4   
   mvi m,$15     ; $370f 36 15   
   inx b         ; $3711 03      
   lxi b,$f769   ; $3712 01 69 f7
   mvi m,$cd     ; $3715 36 cd   
   add h         ; $3717 84      
   dad b         ; $3718 09      
   nop           ; $3719 00      
   nop           ; $371a 00      
   call $1ac4    ; $371b cd c4 1a
   lxi b,$126b   ; $371e 01 6b 12
   stc           ; $3721 37      
   call $1adb    ; $3722 cd db 1a
   add m         ; $3725 86      
   .byte 0x20    ; $3726 20      
   call $1ac4    ; $3727 cd c4 1a
   lxi b,$1e6d   ; $372a 01 6d 1e
   stc           ; $372d 37      
   call $02e4    ; $372e cd e4 02
   out $03       ; $3731 d3 03   
   dcx h         ; $3733 2b      
   ldax b        ; $3734 0a      
   mov l,b       ; $3735 68      
   ldax b        ; $3736 0a      
   mov h,m       ; $3737 66      
   dcr b         ; $3738 05      
   mov h,d       ; $3739 62      
   inx b         ; $373a 03      
   dcx h         ; $373b 2b      
   ldax b        ; $373c 0a      
   inr c         ; $373d 0c      
   dcx b         ; $373e 0b      
   mov h,m       ; $373f 66      
   dcr b         ; $3740 05      
   .byte 0xd9    ; $3741 d9      
   .byte 0x08    ; $3742 08      
   mov h,d       ; $3743 62      
   inx b         ; $3744 03      
   dcx h         ; $3745 2b      
   ldax b        ; $3746 0a      
   sub b         ; $3747 90      
   ldax b        ; $3748 0a      
   mov h,m       ; $3749 66      
   dcr b         ; $374a 05      
   .byte 0xd9    ; $374b d9      
   .byte 0x08    ; $374c 08      
   mov h,d       ; $374d 62      
   inx b         ; $374e 03      
   dcx h         ; $374f 2b      
   ldax b        ; $3750 0a      
   mov a,d       ; $3751 7a      
   ldax b        ; $3752 0a      
   mov h,m       ; $3753 66      
   dcr b         ; $3754 05      
   .byte 0xd9    ; $3755 d9      
   .byte 0x08    ; $3756 08      
   mov h,d       ; $3757 62      
   inx b         ; $3758 03      
   dcx h         ; $3759 2b      
   ldax b        ; $375a 0a      
   push h        ; $375b e5      
   ldax b        ; $375c 0a      
   mov h,m       ; $375d 66      
   dcr b         ; $375e 05      
   .byte 0xd9    ; $375f d9      
   .byte 0x08    ; $3760 08      
   mov h,d       ; $3761 62      
   inx b         ; $3762 03      
   dcx h         ; $3763 2b      
   ldax b        ; $3764 0a      
   mvi l,$0b     ; $3765 2e 0b   
   mov h,m       ; $3767 66      
   dcr b         ; $3768 05      
   .byte 0xd9    ; $3769 d9      
   .byte 0x08    ; $376a 08      
   mov h,d       ; $376b 62      
   inx b         ; $376c 03      
   dcx h         ; $376d 2b      
   ldax b        ; $376e 0a      
   mov h,e       ; $376f 63      
   dcx b         ; $3770 0b      
   mov h,m       ; $3771 66      
   dcr b         ; $3772 05      
   .byte 0xd9    ; $3773 d9      
   .byte 0x08    ; $3774 08      
   dcr d         ; $3775 15      
   inx b         ; $3776 03      
   lxi b,$2a6f   ; $3777 01 6f 2a
   stc           ; $377a 37      
   call $02e4    ; $377b cd e4 02
   mov h,d       ; $377e 62      
   inx b         ; $377f 03      
   out $03       ; $3780 d3 03   
   add d         ; $3782 82      
   inr b         ; $3783 04      
   add h         ; $3784 84      
   dad b         ; $3785 09      
   dcr h         ; $3786 25      
   mvi m,$4a     ; $3787 36 4a   
   inr b         ; $3789 04      
   out $03       ; $378a d3 03   
   ora m         ; $378c b6      
   inx b         ; $378d 03      
   mov h,d       ; $378e 62      
   inx b         ; $378f 03      
   jm $7a04      ; $3790 fa 04 7a
   ldax b        ; $3793 0a      
   xra d         ; $3794 aa      
   stc           ; $3795 37      
   mvi d,$37     ; $3796 16 37   
   jm $9004      ; $3798 fa 04 90
   ldax b        ; $379b 0a      
   ana h         ; $379c a4      
   stc           ; $379d 37      
   dcx d         ; $379e 1b      
   stc           ; $379f 37      
   mov l,b       ; $37a0 68      
   ldax b        ; $37a1 0a      
   ana m         ; $37a2 a6      
   stc           ; $37a3 37      
   add d         ; $37a4 82      
   inx b         ; $37a5 03      
   mov l,b       ; $37a6 68      
   ldax b        ; $37a7 0a      
   xra h         ; $37a8 ac      
   stc           ; $37a9 37      
   inx b         ; $37aa 03      
   inr b         ; $37ab 04      
   jc $150e      ; $37ac da 0e 15
   inx b         ; $37af 03      
   lxi b,$7772   ; $37b0 01 72 77
   stc           ; $37b3 37      
   call $02e4    ; $37b4 cd e4 02
   out $03       ; $37b7 d3 03   
   lda $c813     ; $37b9 3a 13 c8
   mvi c,$1b     ; $37bc 0e 1b   
   stc           ; $37be 37      
   out $03       ; $37bf d3 03   
   add h         ; $37c1 84      
   dad b         ; $37c2 09      
   dcx h         ; $37c3 2b      
   ldax b        ; $37c4 0a      
   dcr d         ; $37c5 15      
   inx b         ; $37c6 03      
   mov h,m       ; $37c7 66      
   dcr b         ; $37c8 05      
   .byte 0xfd    ; $37c9 fd      
   .byte 0x08    ; $37ca 08      
   mvi d,$37     ; $37cb 16 37   
   .byte 0xd9    ; $37cd d9      
   .byte 0x08    ; $37ce 08      
   rst 5         ; $37cf ef      
   mvi m,$c8     ; $37d0 36 c8   
   .byte 0x08    ; $37d2 08      
   mov a,d       ; $37d3 7a      
   ldax b        ; $37d4 0a      
   mov h,e       ; $37d5 63      
   .byte 0x38    ; $37d6 38      
   mov c,l       ; $37d7 4d      
   mvi m,$d3     ; $37d8 36 d3   
   inx b         ; $37da 03      
   add d         ; $37db 82      
   inr b         ; $37dc 04      
   mvi d,$37     ; $37dd 16 37   
   jm $9004      ; $37df fa 04 90
   ldax b        ; $37e2 0a      
   pchl          ; $37e3 e9      
   stc           ; $37e4 37      
   rz            ; $37e5 c8      
   mvi c,$1b     ; $37e6 0e 1b   
   stc           ; $37e8 37      
   out $03       ; $37e9 d3 03   
   add h         ; $37eb 84      
   dad b         ; $37ec 09      
   out $03       ; $37ed d3 03   
   dcx h         ; $37ef 2b      
   ldax b        ; $37f0 0a      
   dcx h         ; $37f1 2b      
   ldax b        ; $37f2 0a      
   mov h,m       ; $37f3 66      
   dcr b         ; $37f4 05      
   mov a,d       ; $37f5 7a      
   ldax b        ; $37f6 0a      
   lxi b,$2b38   ; $37f7 01 38 2b
   ldax b        ; $37fa 0a      
   inr b         ; $37fb 04      
   nop           ; $37fc 00      
   mov l,b       ; $37fd 68      
   ldax b        ; $37fe 0a      
   mov e,e       ; $37ff 5b      
   .byte 0x38    ; $3800 38      
   out $03       ; $3801 d3 03   
   dcx h         ; $3803 2b      
   ldax b        ; $3804 0a      
   inr a         ; $3805 3c      
   ldax b        ; $3806 0a      
   mov h,m       ; $3807 66      
   dcr b         ; $3808 05      
   mov a,d       ; $3809 7a      
   ldax b        ; $380a 0a      
   dcr d         ; $380b 15      
   .byte 0x38    ; $380c 38      
   dcx h         ; $380d 2b      
   ldax b        ; $380e 0a      
   mvi b,$00     ; $380f 06 00   
   mov l,b       ; $3811 68      
   ldax b        ; $3812 0a      
   mov e,e       ; $3813 5b      
   .byte 0x38    ; $3814 38      
   out $03       ; $3815 d3 03   
   dcx h         ; $3817 2b      
   ldax b        ; $3818 0a      
   mvi a,$18     ; $3819 3e 18   
   mov h,m       ; $381b 66      
   dcr b         ; $381c 05      
   mov h,d       ; $381d 62      
   inx b         ; $381e 03      
   dcx h         ; $381f 2b      
   ldax b        ; $3820 0a      
   mov c,d       ; $3821 4a      
   lxi d,$0566   ; $3822 11 66 05
   .byte 0xd9    ; $3825 d9      
   .byte 0x08    ; $3826 08      
   mov a,d       ; $3827 7a      
   ldax b        ; $3828 0a      
   stc           ; $3829 37      
   .byte 0x38    ; $382a 38      
   mov h,d       ; $382b 62      
   inx b         ; $382c 03      
   add d         ; $382d 82      
   inr b         ; $382e 04      
   sub c         ; $382f 91      
   dad b         ; $3830 09      
   lda $6813     ; $3831 3a 13 68
   ldax b        ; $3834 0a      
   mov e,e       ; $3835 5b      
   .byte 0x38    ; $3836 38      
   mvi l,$37     ; $3837 2e 37   
   mov a,d       ; $3839 7a      
   ldax b        ; $383a 0a      
   mov b,e       ; $383b 43      
   .byte 0x38    ; $383c 38      
   mov a,e       ; $383d 7b      
   stc           ; $383e 37      
   mov l,b       ; $383f 68      
   ldax b        ; $3840 0a      
   mov e,e       ; $3841 5b      
   .byte 0x38    ; $3842 38      
   out $03       ; $3843 d3 03   
   dcx h         ; $3845 2b      
   ldax b        ; $3846 0a      
   mov a,l       ; $3847 7d      
   ldax d        ; $3848 1a      
   mov h,m       ; $3849 66      
   dcr b         ; $384a 05      
   mov a,d       ; $384b 7a      
   ldax b        ; $384c 0a      
   mov e,c       ; $384d 59      
   .byte 0x38    ; $384e 38      
   shld $2b37    ; $384f 22 37 2b
   ldax b        ; $3852 0a      
   dcr b         ; $3853 05      
   nop           ; $3854 00      
   mov l,b       ; $3855 68      
   ldax b        ; $3856 0a      
   mov e,e       ; $3857 5b      
   .byte 0x38    ; $3858 38      
   jc $100e      ; $3859 da 0e 10
   inr b         ; $385c 04      
   mov c,d       ; $385d 4a      
   inr b         ; $385e 04      
   mov l,b       ; $385f 68      
   ldax b        ; $3860 0a      
   cmp a         ; $3861 bf      
   stc           ; $3862 37      
   add d         ; $3863 82      
   inx b         ; $3864 03      
   dcr d         ; $3865 15      
   inx b         ; $3866 03      
   lxi b,$b074   ; $3867 01 74 b0
   stc           ; $386a 37      
   call $02e4    ; $386b cd e4 02
   out $03       ; $386e d3 03   
   cmp c         ; $3870 b9      
   mvi m,$2b     ; $3871 36 2b   
   ldax b        ; $3873 0a      
   call $6600    ; $3874 cd 00 66
   dcr b         ; $3877 05      
   adc l         ; $3878 8d      
   inx b         ; $3879 03      
   ora m         ; $387a b6      
   inx b         ; $387b 03      
   jm $c804      ; $387c fa 04 c8
   .byte 0x08    ; $387f 08      
   sub b         ; $3880 90      
   ldax b        ; $3881 0a      
   adc b         ; $3882 88      
   .byte 0x38    ; $3883 38      
   di            ; $3884 f3      
   mvi c,$f4     ; $3885 0e f4   
   mvi m,$15     ; $3887 36 15   
   inx b         ; $3889 03      
   lxi b,$6760   ; $388a 01 60 67
   .byte 0x38    ; $388d 38      
   call $1adb    ; $388e cd db 1a
   jp $cd3b      ; $3891 f2 3b cd
   cnz $011a     ; $3894 c4 1a 01
   mov m,l       ; $3897 75      
   adc d         ; $3898 8a      
   .byte 0x38    ; $3899 38      
   call $02e4    ; $389a cd e4 02
   out $03       ; $389d d3 03   
   mov h,m       ; $389f 66      
   dcr d         ; $38a0 15      
   .byte 0xed    ; $38a1 ed      
   mvi d,$e6     ; $38a2 16 e6   
   mvi c,$f4     ; $38a4 0e f4   
   mvi m,$d3     ; $38a6 36 d3   
   inx b         ; $38a8 03      
   sub d         ; $38a9 92      
   inx d         ; $38aa 13      
   out $03       ; $38ab d3 03   
   mov l,e       ; $38ad 6b      
   .byte 0x38    ; $38ae 38      
   dad b         ; $38af 09      
   inx b         ; $38b0 03      
   mov h,d       ; $38b1 62      
   inx b         ; $38b2 03      
   cz $7a36      ; $38b3 cc 36 7a
   ldax b        ; $38b6 0a      
   cmp e         ; $38b7 bb      
   .byte 0x38    ; $38b8 38      
   ora h         ; $38b9 b4      
   stc           ; $38ba 37      
   adc m         ; $38bb 8e      
   .byte 0x38    ; $38bc 38      
   rst 5         ; $38bd ef      
   mvi m,$90     ; $38be 36 90   
   ldax b        ; $38c0 0a      
   xthl          ; $38c1 e3      
   .byte 0x38    ; $38c2 38      
   dcx h         ; $38c3 2b      
   ldax b        ; $38c4 0a      
   lxi h,$a600   ; $38c5 21 00 a6
   stax b        ; $38c8 02      
   add h         ; $38c9 84      
   dad b         ; $38ca 09      
   mov d,l       ; $38cb 55      
   inr b         ; $38cc 04      
   sui $16       ; $38cd d6 16   
   mvi a,$18     ; $38cf 3e 18   
   dcr c         ; $38d1 0d      
   mov l,m       ; $38d2 6e      
   mov h,l       ; $38d3 65      
   mov m,b       ; $38d4 70      
   mov h,l       ; $38d5 65      
   mov m,d       ; $38d6 72      
   mov h,l       ; $38d7 65      
   mov l,l       ; $38d8 6d      
   mov h,l       ; $38d9 65      
   mov m,e       ; $38da 73      
   mov m,h       ; $38db 74      
   mov l,c       ; $38dc 69      
   mov l,l       ; $38dd 6d      
   mov l,a       ; $38de 6f      
   di            ; $38df f3      
   mvi c,$e8     ; $38e0 0e e8   
   mvi m,$82     ; $38e2 36 82   
   inx b         ; $38e4 03      
   out $03       ; $38e5 d3 03   
   dad d         ; $38e7 19      
   mvi m,$0d     ; $38e8 36 0d   
   cma           ; $38ea 2f      
   mov a,d       ; $38eb 7a      
   ldax b        ; $38ec 0a      
   rst 6         ; $38ed f7      
   .byte 0x38    ; $38ee 38      
   out $03       ; $38ef d3 03   
   mov a,e       ; $38f1 7b      
   inx d         ; $38f2 13      
   mov c,l       ; $38f3 4d      
   mvi m,$82     ; $38f4 36 82   
   inx b         ; $38f6 03      
   dcr m         ; $38f7 35      
   rar           ; $38f8 1f      
   mov h,m       ; $38f9 66      
   dcr d         ; $38fa 15      
   dcr d         ; $38fb 15      
   inx b         ; $38fc 03      

NFA_VOC_2E:      ; 38FD
   .byte 4,"VOC."
   .word $3664   ; NFA_V_2DLIST       ; 3664
_VOC_2E:         ; 3904 - 39AD
   call _FCALL            ; 3904
   .word _CR              ; $3907 1566 - CR
   .word _DUP             ; $3909 03D3 - DUP
   .word _2_2D            ; $390b 0499 - 2-
   .word _2_2D            ; $390d 0499 - 2-
   .word _BODY_3E         ; $390f 134B - BODY>
   .word __3ENAME         ; $3911 13DD - >NAME
   .word __28_2E_22_29    ; $3913 183E - (.")
   .byte 7,"spisok "
   .word _ID_2E           ; $391d 16ED - ID.
   .word _EXIT            ; $391f 0315 - EXIT

   .word $7901            ; $3921 7901
   .word $38FD            ; $3923 38FD
   .word $E4CD            ; $3925 E4CD
   .word $3E02            ; $3927 3E02
   .word $0D18            ; $3929 0D18
   .word $7720            ; $392b 7720
   .word $6779            ; $392d 6779
   .word $7572            ; $392f 7572
   .word $6176            ; $3931 6176
   .word $7465            ; $3933 7465
   .word $7173            ; $3935 7173
   .word $1520            ; $3937 1520
   .word $0103            ; $3939 0103
   .word $214E            ; $393b 214E
   .word $CD39            ; $393d CD39
   .word __40             ; $393f 0984 - @
   .word $0000            ; $3941 0000
   .word $C4CD            ; $3943 C4CD
   .word $011A            ; $3945 011A
   .word $3A66            ; $3947 3A66
   .word $CD39            ; $3949 CD39
   .word $02E4            ; $394b 02E4
   .word _DUP             ; $394d 03D3 - DUP
   .word _2_2D            ; $394f 0499 - 2-
   .word __40             ; $3951 0984 - @
   .word $3619            ; $3953 3619
   .word _U_3C            ; $3955 04FA - U<
   .word _OVER            ; $3957 0362 - OVER
   .word $3619            ; $3959 3619
   .word _U_3C            ; $395b 04FA - U<
   .word __3FBRANCH       ; $395d 0A7A - ?BRANCH
   .word $3988            ; $395f 3988
   .word __3FBRANCH       ; $3961 0A7A - ?BRANCH
   .word $3971            ; $3963 3971
   .word __28_2E_22_29    ; $3965 183E - (.")
   .byte 3," ne"
   .word $3925            ; $396b 3925
   .word _BRANCH          ; $396d 0A68 - BRANCH
   .word $3984            ; $396f 3984
   .word $393E            ; $3971 393E
   .word _1_2B            ; $3973 0477 - 1+
   .word $3943            ; $3975 3943
   .word $3925            ; $3977 3925
   .word __28_2E_22_29    ; $3979 183E - (.")
   .byte 8,"~asti~no"
   .word _BRANCH          ; $3984 0A68 - BRANCH
   .word $399A            ; $3986 399A
   .word _N_3FBRANCH      ; $3988 0A90 - N?BRANCH
   .word $399A            ; $398a 399A
   .word $3925            ; $398c 3925
   .word __28_2E_22_29    ; $398e 183E - (.")
   .byte 9,"polnostx`"
   .word _EXIT            ; $399a 0315 - EXIT

   .word $6801            ; $399c 6801
   .word $3946            ; $399e 3946
   .word $E4CD            ; $39a0 E4CD
   .word $0402            ; $39a2 0402
   .word $4A39            ; $39a4 4A39
   .word $6639            ; $39a6 6639
   .word $8615            ; $39a8 8615
   .word $1536            ; $39aa 1536
   .byte $03              ; $39ac 03

NFA_CSUM:        ; 39AD
   .byte 4,"CSUM"
   .word NFA_VOC_2E         ; 38FD
_CSUM:           ; 39B4 - 3AD0
   call _FCALL            ; 39B4
   .word _OVER            ; $39b7 0362 - OVER
   .word __2B             ; $39b9 044A - +
   .word _SWAP            ; $39bb 038D - SWAP
   .word _0               ; $39bd 0EC8 - 0
   .word __2DROT          ; $39bf 03C5 - -ROT
   .word __28DO_29        ; $39c1 0AE5 - (DO)
   .word $39CF            ; $39c3 39CF
   .word _I               ; $39c5 0A9F - I
   .word _C_40            ; $39c7 0991 - C@
   .word __2B             ; $39c9 044A - +
   .word __28LOOP_29      ; $39cb 0B2E - (LOOP)
   .word $39C5            ; $39cd 39C5
   .word _EXIT            ; $39cf 0315 - EXIT

   lxi b,$ad7b   ; $39d1 01 7b ad
   dad sp        ; $39d4 39      
   call $0984    ; $39d5 cd 84 09
   nop           ; $39d8 00      
   nop           ; $39d9 00      
   call $1ac4    ; $39da cd c4 1a
   lxi b,$d17e   ; $39dd 01 7e d1
   dad sp        ; $39e0 39      
   call $0984    ; $39e1 cd 84 09
   dcr a         ; $39e4 3d      
   lxi d,$c4cd   ; $39e5 11 cd c4
   ldax d        ; $39e8 1a      
   lxi b,$dd7d   ; $39e9 01 7d dd
   dad sp        ; $39ec 39      
   call $02e4    ; $39ed cd e4 02
   mvi a,$18     ; $39f0 3e 18   
   .byte 0x20    ; $39f2 20      
   mov a,d       ; $39f3 7a      
   mov h,c       ; $39f4 61      
   mov h,a       ; $39f5 67      
   mov m,d       ; $39f6 72      
   mov m,l       ; $39f7 75      
   mov a,d       ; $39f8 7a      
   mov l,e       ; $39f9 6b      
   mov h,c       ; $39fa 61      
   .byte 0x20    ; $39fb 20      
   mov m,a       ; $39fc 77      
   mov l,a       ; $39fd 6f      
   mov a,d       ; $39fe 7a      
   mov l,l       ; $39ff 6d      
   mov l,a       ; $3a00 6f      
   hlt           ; $3a01 76      
   mov l,m       ; $3a02 6e      
   mov h,c       ; $3a03 61      
   .byte 0x20    ; $3a04 20      
   mov m,h       ; $3a05 74      
   mov l,a       ; $3a06 6f      
   mov l,h       ; $3a07 6c      
   mov a,b       ; $3a08 78      
   mov l,e       ; $3a09 6b      
   mov l,a       ; $3a0a 6f      
   .byte 0x20    ; $3a0b 20      
   mov m,b       ; $3a0c 70      
   mov l,a       ; $3a0d 6f      
   .byte 0x20    ; $3a0e 20      
   mov h,c       ; $3a0f 61      
   mov h,h       ; $3a10 64      
   mvi l,$20     ; $3a11 2e 20   
   dcr c         ; $3a13 0d      
   mvi m,$7d     ; $3a14 36 7d   
   mvi d,$1e     ; $3a16 16 1e   
   inx d         ; $3a18 13      
   dcr d         ; $3a19 15      
   inx b         ; $3a1a 03      
   lxi b,$e96a   ; $3a1b 01 6a e9
   dad sp        ; $3a1e 39      
   call $02e4    ; $3a1f cd e4 02
   adc l         ; $3a22 8d      
   inx b         ; $3a23 03      
   mov h,d       ; $3a24 62      
   inx b         ; $3a25 03      
   sbb c         ; $3a26 99      
   inr b         ; $3a27 04      
   add h         ; $3a28 84      
   dad b         ; $3a29 09      
   jp $6603      ; $3a2a f2 03 66
   dcr b         ; $3a2d 05      
   mov a,d       ; $3a2e 7a      
   ldax b        ; $3a2f 0a      
   lda $823a     ; $3a30 3a 3a 82
   inx b         ; $3a33 03      
   adc l         ; $3a34 8d      
   inx b         ; $3a35 03      
   ani $0e       ; $3a36 e6 0e   
   dcr d         ; $3a38 15      
   inx b         ; $3a39 03      
   out $03       ; $3a3a d3 03   
   add h         ; $3a3c 84      
   dad b         ; $3a3d 09      
   dcx h         ; $3a3e 2b      
   ldax b        ; $3a3f 0a      
   lxi b,$9480   ; $3a40 01 80 94
   .byte 0x10    ; $3a43 10      
   mov a,d       ; $3a44 7a      
   ldax b        ; $3a45 0a      
   mov c,m       ; $3a46 4e      
   lda $137b     ; $3a47 3a 7b 13
   mov l,b       ; $3a4a 68      
   ldax b        ; $3a4b 0a      
   .byte 0x28    ; $3a4c 28      
   lda $0382     ; $3a4d 3a 82 03
   adc l         ; $3a50 8d      
   inx b         ; $3a51 03      
   di            ; $3a52 f3      
   mvi c,$15     ; $3a53 0e 15   
   inx b         ; $3a55 03      
   lxi b,$1b25   ; $3a56 01 25 1b
   lda $e4cd     ; $3a59 3a cd e4
   stax b        ; $3a5c 02      
   pop h         ; $3a5d e1      
   lxi b,$0984   ; $3a5e 01 84 09
   out $03       ; $3a61 d3 03   
   dcx h         ; $3a63 2b      
   ldax b        ; $3a64 0a      
   mov d,a       ; $3a65 57      
   inr m         ; $3a66 34      
   sub h         ; $3a67 94      
   .byte 0x10    ; $3a68 10      
   mov a,d       ; $3a69 7a      
   ldax b        ; $3a6a 0a      
   add c         ; $3a6b 81      
   lda $3a1f     ; $3a6c 3a 1f 3a
   mov a,d       ; $3a6f 7a      
   ldax b        ; $3a70 0a      
   mov a,l       ; $3a71 7d      
   lda $0499     ; $3a72 3a 99 04
   inr h         ; $3a75 24      
   stax b        ; $3a76 02      
   sbb l         ; $3a77 9d      
   dad b         ; $3a78 09      
   ldax b        ; $3a79 0a      
   ral           ; $3a7a 17      
   dcr d         ; $3a7b 15      
   inx b         ; $3a7c 03      
   mov l,b       ; $3a7d 68      
   ldax b        ; $3a7e 0a      
   mov e,a       ; $3a7f 5f      
   lda $0382     ; $3a80 3a 82 03
   mov d,b       ; $3a83 50      
   inr m         ; $3a84 34      
   ldax b        ; $3a85 0a      
   ral           ; $3a86 17      
   dcr d         ; $3a87 15      
   inx b         ; $3a88 03      
   lxi b,$5647   ; $3a89 01 47 56
   lda $84cd     ; $3a8c 3a cd 84
   dad b         ; $3a8f 09      
   stc           ; $3a90 37      
   nop           ; $3a91 00      
   call $1ac4    ; $3a92 cd c4 1a
   lxi b,$8951   ; $3a95 01 51 89
   lda $84cd     ; $3a98 3a cd 84
   dad b         ; $3a9b 09      
   nop           ; $3a9c 00      
   nop           ; $3a9d 00      
   call $1ac4    ; $3a9e cd c4 1a
   lxi b,$9578   ; $3aa1 01 78 95
   lda $e4cd     ; $3aa4 3a cd e4
   stax b        ; $3aa7 02      
   adc l         ; $3aa8 8d      
   inx b         ; $3aa9 03      
   sbb c         ; $3aaa 99      
   inr b         ; $3aab 04      
   out $03       ; $3aac d3 03   
   add h         ; $3aae 84      
   dad b         ; $3aaf 09      
   push b        ; $3ab0 c5      
   inx b         ; $3ab1 03      
   out $03       ; $3ab2 d3 03   
   cm $d309      ; $3ab4 fc 09 d3
   inx b         ; $3ab7 03      
   push b        ; $3ab8 c5      
   inx b         ; $3ab9 03      
   adc l         ; $3aba 8d      
   inx b         ; $3abb 03      
   add d         ; $3abc 82      
   inr b         ; $3abd 04      
   adc d         ; $3abe 8a      
   dad h         ; $3abf 29      
   sbb l         ; $3ac0 9d      
   dad b         ; $3ac1 09      
   dcr d         ; $3ac2 15      
   inx b         ; $3ac3 03      
   lxi b,$a14c   ; $3ac4 01 4c a1
   lda $84cd     ; $3ac7 3a cd 84
   dad b         ; $3aca 09      
   mov a,d       ; $3acb 7a      
   mov b,h       ; $3acc 44      
   call $1ac4    ; $3acd cd c4 1a

NFA_MSAVE:       ; 3AD0
   .byte 5,"MSAVE"
   .word NFA_CSUM         ; 39AD
_MSAVE:          ; 3AD8 - 3CBD
   call _FCALL            ; 3AD8
   .word __27             ; $3adb 1868 - '
   .word __3ENAME         ; $3add 13DD - >NAME
   .word _DUP             ; $3adf 03D3 - DUP
   .word _FENCE           ; $3ae1 01EE - FENCE
   .word __40             ; $3ae3 0984 - @
   .word _U_3C            ; $3ae5 04FA - U<
   .word __28ABORT_22_29  ; $3ae7 114A - (ABORT")
   .byte 14,"wyhod za FENCE"
   .word $3A5A            ; $3af8 3A5A
   .word _DUP             ; $3afa 03D3 - DUP
   .word $3612            ; $3afc 3612
   .word _DUP             ; $3afe 03D3 - DUP
   .word $361E            ; $3b00 361E
   .word _0               ; $3b02 0EC8 - 0
   .word $362A            ; $3b04 362A
   .word _TRUE            ; $3b06 0EE6 - TRUE
   .word $36E8            ; $3b08 36E8
   .word __2D1            ; $3b0a 0EBF - -1
   .word $3943            ; $3b0c 3943
   .word _LIT             ; $3b0e 0A2B - LIT
   .word $36FB            ; $3b10 36FB
   .word $3727            ; $3b12 3727
   .word _LIT             ; $3b14 0A2B - LIT
   .word $39A0            ; $3b16 39A0
   .word $3646            ; $3b18 3646
   .word _LIT             ; $3b1a 0A2B - LIT
   .word _NOOP            ; $3b1c 2086 - NOOP
   .word $3893            ; $3b1e 3893
   .word _LIT             ; $3b20 0A2B - LIT
   .word $389A            ; $3b22 389A
   .word $3636            ; $3b24 3636
   .word _V_2DLIST        ; $3b26 366D - V-LIST
   .word $393E            ; $3b28 393E
   .word _0_3E            ; $3b2a 0550 - 0>
   .word __3FBRANCH       ; $3b2c 0A7A - ?BRANCH
   .word $3B34            ; $3b2e 3B34
   .word _FALSE           ; $3b30 0EF3 - FALSE
   .word $36E8            ; $3b32 36E8
   .word _CR              ; $3b34 1566 - CR
   .word _CR              ; $3b36 1566 - CR
   .word $36E3            ; $3b38 36E3
   .word _N_3FBRANCH      ; $3b3a 0A90 - N?BRANCH
   .word $3B40            ; $3b3c 3B40
   .word $39ED            ; $3b3e 39ED
   .word _HERE            ; $3b40 0EFF - HERE
   .word $360D            ; $3b42 360D
   .word __2D             ; $3b44 0455 - -
   .word _DUP             ; $3b46 03D3 - DUP
   .word $3A92            ; $3b48 3A92
   .word _2DUP            ; $3b4a 03F2 - 2DUP
   .word _CSUM            ; $3b4c 39B4 - CSUM
   .word $39E6            ; $3b4e 39E6
   .word _OVER            ; $3b50 0362 - OVER
   .word _CR              ; $3b52 1566 - CR
   .word _ID_2E           ; $3b54 16ED - ID.
   .word __28_2E_22_29    ; $3b56 183E - (.")
   .byte 16," ",0x1c,0x1c,0x0e," ml (Y/...) "
   .word _KEY             ; $3b69 1554 - KEY
   .word _DUP             ; $3b6b 03D3 - DUP
   .word _EMIT            ; $3b6d 153D - EMIT
   .word _LIT             ; $3b6f 0A2B - LIT
   .word $0059            ; $3b71 0059
   .word __3C_3E          ; $3b73 1094 - <>
   .word __3FBRANCH       ; $3b75 0A7A - ?BRANCH
   .word $3B7D            ; $3b77 3B7D
   .word _2DROP           ; $3b79 0403 - 2DROP
   .word _EXIT            ; $3b7b 0315 - EXIT
   .word _OVER            ; $3b7d 0362 - OVER
   .word _LIT             ; $3b7f 0A2B - LIT
   .word $0020            ; $3b81 0020
   .word $3AA5            ; $3b83 3AA5
   .word _VOC_2DLINK      ; $3b85 01E1 - VOC-LINK
   .word __40             ; $3b87 0984 - @
   .word _DUP             ; $3b89 03D3 - DUP
   .word $360D            ; $3b8b 360D
   .word _U_3C            ; $3b8d 04FA - U<
   .word __3FBRANCH       ; $3b8f 0A7A - ?BRANCH
   .word $3B95            ; $3b91 3B95
   .word _0_3D            ; $3b93 057E - 0=
   .word $3A9E            ; $3b95 3A9E
   .word _0               ; $3b97 0EC8 - 0
   .word _VOC_2DLINK      ; $3b99 01E1 - VOC-LINK
   .word _PRESS           ; $3b9b 0410 - PRESS
   .word _DUP             ; $3b9d 03D3 - DUP
   .word __40             ; $3b9f 0984 - @
   .word _DUP             ; $3ba1 03D3 - DUP
   .word $360D            ; $3ba3 360D
   .word _U_3C            ; $3ba5 04FA - U<
   .word __3FBRANCH       ; $3ba7 0A7A - ?BRANCH
   .word $3B9B            ; $3ba9 3B9B
   .word _DROP            ; $3bab 0382 - DROP
   .word _DUP             ; $3bad 03D3 - DUP
   .word _VOC_2DLINK      ; $3baf 01E1 - VOC-LINK
   .word __3D             ; $3bb1 0566 - =
   .word __3FBRANCH       ; $3bb3 0A7A - ?BRANCH
   .word $3BB9            ; $3bb5 3BB9
   .word _0_3D            ; $3bb7 057E - 0=
   .word $39DA            ; $3bb9 39DA
   .word $39E1            ; $3bbb 39E1
   .word $360D            ; $3bbd 360D
   .word $3A8D            ; $3bbf 3A8D
   .word $36E3            ; $3bc1 36E3
   .word $3A99            ; $3bc3 3A99
   .word $39D5            ; $3bc5 39D5
   .word _LATEST          ; $3bc7 1720 - LATEST
   .word _0               ; $3bc9 0EC8 - 0
   .word _SP_40           ; $3bcb 0433 - SP@
   .word _LIT             ; $3bcd 0A2B - LIT
   .word $0010            ; $3bcf 0010
   .word __28OUT_29       ; $3bd1 298A - (OUT)
   .word _2DROP           ; $3bd3 0403 - 2DROP
   .word _2DROP           ; $3bd5 0403 - 2DROP
   .word _2DROP           ; $3bd7 0403 - 2DROP
   .word _2DROP           ; $3bd9 0403 - 2DROP
   .word $3AA5            ; $3bdb 3AA5
   .word _EXIT            ; $3bdd 0315 - EXIT

   .word $7C01            ; $3bdf 7C01
   .word $3AD0            ; $3be1 3AD0
   .word $E4CD            ; $3be3 E4CD
   .word $0402            ; $3be5 0402
   .word $6639            ; $3be7 6639
   .word $8615            ; $3be9 8615
   .word $1536            ; $3beb 1536
   .word $0103            ; $3bed 0103
   .word $DF63            ; $3bef DF63
   .word $CD3B            ; $3bf1 CD3B
   .word $02E4            ; $3bf3 02E4
   .word _LIT             ; $3bf5 0A2B - LIT
   .word __40EXECUTE      ; $3bf7 1ADB - @EXECUTE
   .word _OVER            ; $3bf9 0362 - OVER
   .word $36CC            ; $3bfb 36CC
   .word __3FBRANCH       ; $3bfd 0A7A - ?BRANCH
   .word $3C0B            ; $3bff 3C0B
   .word _DUP             ; $3c01 03D3 - DUP
   .word __3EBODY         ; $3c03 133A - >BODY
   .word $364D            ; $3c05 364D
   .word _DROP            ; $3c07 0382 - DROP
   .word _EXIT            ; $3c09 0315 - EXIT
   .word _LIT             ; $3c0b 0A2B - LIT
   .word $2F2B            ; $3c0d 2F2B
   .word _OVER            ; $3c0f 0362 - OVER
   .word $36CC            ; $3c11 36CC
   .word __3FBRANCH       ; $3c13 0A7A - ?BRANCH
   .word $3C31            ; $3c15 3C31
   .word _DUP             ; $3c17 03D3 - DUP
   .word __3EBODY         ; $3c19 133A - >BODY
   .word _DUP             ; $3c1b 03D3 - DUP
   .word __40             ; $3c1d 0984 - @
   .word __2D1            ; $3c1f 0EBF - -1
   .word __3C_3E          ; $3c21 1094 - <>
   .word __3FBRANCH       ; $3c23 0A7A - ?BRANCH
   .word $3C2F            ; $3c25 3C2F
   .word $364D            ; $3c27 364D
   .word _2_2B            ; $3c29 0482 - 2+
   .word _BRANCH          ; $3c2b 0A68 - BRANCH
   .word $3C1B            ; $3c2d 3C1B
   .word _DROP            ; $3c2f 0382 - DROP
   .word _EXIT            ; $3c31 0315 - EXIT

   .word $7101            ; $3c33 7101
   .word $3AD0            ; $3c35 3AD0
   .word $E4CD            ; $3c37 E4CD
   .word $FF02            ; $3c39 FF02
   .word $8D0E            ; $3c3b 8D0E
   .word $C83A            ; $3c3d C83A
   .word $290E            ; $3c3f 290E
   .word $822E            ; $3c41 822E
   .word $1903            ; $3c43 1903
   .word $8D36            ; $3c45 8D36
   .word $B43A            ; $3c47 B43A
   .word $E139            ; $3c49 E139
   .word $9439            ; $3c4b 9439
   .word $4A10            ; $3c4d 4A10
   .word $0611            ; $3c4f 0611
   .word $7B6F            ; $3c51 7B6F
   .word $6269            ; $3c53 6269
   .word $616B            ; $3c55 616B
   .word $3A8D            ; $3c57 3A8D
   .word _ALLOT           ; $3c59 0F10 - ALLOT
   .word $3A99            ; $3c5b 3A99
   .word __3FBRANCH       ; $3c5d 0A7A - ?BRANCH
   .word $3C97            ; $3c5f 3C97
   .word _VOC_2DLINK      ; $3c61 01E1 - VOC-LINK
   .word __40             ; $3c63 0984 - @
   .word $3A99            ; $3c65 3A99
   .word $3625            ; $3c67 3625
   .word __2B             ; $3c69 044A - +
   .word _VOC_2DLINK      ; $3c6b 01E1 - VOC-LINK
   .word __21             ; $3c6d 099D - !
   .word $39D5            ; $3c6f 39D5
   .word $3625            ; $3c71 3625
   .word __2B             ; $3c73 044A - +
   .word _DUP             ; $3c75 03D3 - DUP
   .word __2DROT          ; $3c77 03C5 - -ROT
   .word __21             ; $3c79 099D - !
   .word _VOC_2DLINK      ; $3c7b 01E1 - VOC-LINK
   .word __40             ; $3c7d 0984 - @
   .word _2_2D            ; $3c7f 0499 - 2-
   .word $364D            ; $3c81 364D
   .word _2_2B            ; $3c83 0482 - 2+
   .word _2DUP            ; $3c85 03F2 - 2DUP
   .word _U_3C            ; $3c87 04FA - U<
   .word __3FBRANCH       ; $3c89 0A7A - ?BRANCH
   .word $3C95            ; $3c8b 3C95
   .word $364D            ; $3c8d 364D
   .word __40             ; $3c8f 0984 - @
   .word _BRANCH          ; $3c91 0A68 - BRANCH
   .word $3C7F            ; $3c93 3C7F
   .word _2DROP           ; $3c95 0403 - 2DROP
   .word _LATEST          ; $3c97 1720 - LATEST
   .word $3AC8            ; $3c99 3AC8
   .word $3625            ; $3c9b 3625
   .word __2B             ; $3c9d 044A - +
   .word _CURRENT         ; $3c9f 0233 - CURRENT
   .word __40             ; $3ca1 0984 - @
   .word __21             ; $3ca3 099D - !
   .word $3619            ; $3ca5 3619
   .word _N_3ELINK        ; $3ca7 137B - N>LINK
   .word __21             ; $3ca9 099D - !
   .word _VOC_2DLINK      ; $3cab 01E1 - VOC-LINK
   .word __40             ; $3cad 0984 - @
   .word __3FDUP          ; $3caf 03E0 - ?DUP
   .word __3FBRANCH       ; $3cb1 0A7A - ?BRANCH
   .word $3CBB            ; $3cb3 3CBB
   .word $3BE3            ; $3cb5 3BE3
   .word _BRANCH          ; $3cb7 0A68 - BRANCH
   .word $3CAD            ; $3cb9 3CAD
   .word _EXIT            ; $3cbb 0315 - EXIT

NFA_MLOAD:       ; 3CBD
   .byte 5,"MLOAD"
   .word NFA_MSAVE        ; 3AD0
_MLOAD:          ; 3CC5 - 3D68
   call _FCALL            ; 3CC5
   .word __28_2E_22_29    ; $3cc8 183E - (.")
   .byte 15,"ml ",0x1c,0x1c,0x0e," (Y/...) "
   .word _KEY             ; $3cda 1554 - KEY
   .word _DUP             ; $3cdc 03D3 - DUP
   .word _EMIT            ; $3cde 153D - EMIT
   .word _LIT             ; $3ce0 0A2B - LIT
   .word $0059            ; $3ce2 0059
   .word __3C_3E          ; $3ce4 1094 - <>
   .word __3FBRANCH       ; $3ce6 0A7A - ?BRANCH
   .word $3CEC            ; $3ce8 3CEC
   .word _EXIT            ; $3cea 0315 - EXIT
   .word _SPACE           ; $3cec 16C4 - SPACE
   .word _PAD             ; $3cee 0F5A - PAD
   .word _DUP             ; $3cf0 03D3 - DUP
   .word _LIT             ; $3cf2 0A2B - LIT
   .word $0020            ; $3cf4 0020
   .word _0               ; $3cf6 0EC8 - 0
   .word __28IN_29        ; $3cf8 2E29 - (IN)
   .word _DROP            ; $3cfa 0382 - DROP
   .word _ID_2E           ; $3cfc 16ED - ID.
   .word _CR              ; $3cfe 1566 - CR
   .word _CALL            ; $3d00 0309 - CALL
   .word _0               ; $3d02 0EC8 - 0
   .word __28DO_29        ; $3d04 0AE5 - (DO)
   .word $3D0E            ; $3d06 3D0E
   .word _BREAK           ; $3d08 1F35 - BREAK
   .word __28LOOP_29      ; $3d0a 0B2E - (LOOP)
   .word $3D08            ; $3d0c 3D08
   .word _0               ; $3d0e 0EC8 - 0
   .word _DUP             ; $3d10 03D3 - DUP
   .word _2DUP            ; $3d12 03F2 - 2DUP
   .word _2DUP            ; $3d14 03F2 - 2DUP
   .word _DUP             ; $3d16 03D3 - DUP
   .word _SP_40           ; $3d18 0433 - SP@
   .word _LIT             ; $3d1a 0A2B - LIT
   .word $000E            ; $3d1c 000E
   .word _0               ; $3d1e 0EC8 - 0
   .word __28IN_29        ; $3d20 2E29 - (IN)
   .word _DROP            ; $3d22 0382 - DROP
   .word $3ACD            ; $3d24 3ACD
   .word $39DA            ; $3d26 39DA
   .word $3A9E            ; $3d28 3A9E
   .word $36E8            ; $3d2a 36E8
   .word $3A92            ; $3d2c 3A92
   .word $3612            ; $3d2e 3612
   .word $39E6            ; $3d30 39E6
   .word _HERE            ; $3d32 0EFF - HERE
   .word $361E            ; $3d34 361E
   .word $3619            ; $3d36 3619
   .word $360D            ; $3d38 360D
   .word __2D             ; $3d3a 0455 - -
   .word $362A            ; $3d3c 362A
   .word _TRUE            ; $3d3e 0EE6 - TRUE
   .word $36F4            ; $3d40 36F4
   .word _LIT             ; $3d42 0A2B - LIT
   .word $3BF2            ; $3d44 3BF2
   .word $3893            ; $3d46 3893
   .word _LIT             ; $3d48 0A2B - LIT
   .word $389A            ; $3d4a 389A
   .word $3636            ; $3d4c 3636
   .word _LIT             ; $3d4e 0A2B - LIT
   .word _NOOP            ; $3d50 2086 - NOOP
   .word $3727            ; $3d52 3727
   .word $3625            ; $3d54 3625
   .word _0_3D            ; $3d56 057E - 0=
   .word $36E3            ; $3d58 36E3
   .word _OR              ; $3d5a 08D9 - OR
   .word _N_3FBRANCH      ; $3d5c 0A90 - N?BRANCH
   .word $3D64            ; $3d5e 3D64
   .word $39ED            ; $3d60 39ED
   .word _ABORT           ; $3d62 10D5 - ABORT
   .word $3C37            ; $3d64 3C37
   .word _EXIT            ; $3d66 0315 - EXIT

NFA_EDITOR:      ; 3D68
   .byte 6,"EDITOR"
   .word NFA_MLOAD        ; 3CBD
_EDITOR:         ; 3D71 - 4386
   call $1b95    ; $3d71 cd 95 1b
   lxi b,$6f80   ; $3d74 01 80 6f
   mov b,e       ; $3d77 43      
   stax b        ; $3d78 02      
   shld $2602    ; $3d79 22 02 26
   mov b,c       ; $3d7c 41      
   mov d,e       ; $3d7d 53      
   inr m         ; $3d7e 34      
   call $0984    ; $3d7f cd 84 09
   sub l         ; $3d82 95      
   dcr m         ; $3d83 35      
   stax b        ; $3d84 02      
   mvi h,$42     ; $3d85 26 42   
   mov a,d       ; $3d87 7a      
   dcr a         ; $3d88 3d      
   call $0984    ; $3d89 cd 84 09
   rst 7         ; $3d8c ff      
   inx b         ; $3d8d 03      
   call $1ac4    ; $3d8e cd c4 1a
   stax b        ; $3d91 02      
   mvi h,$43     ; $3d92 26 43   
   add h         ; $3d94 84      
   dcr a         ; $3d95 3d      
   call $0984    ; $3d96 cd 84 09
   sbb c         ; $3d99 99      
   dcr m         ; $3d9a 35      
   dcr b         ; $3d9b 05      
   mov c,h       ; $3d9c 4c      
   cma           ; $3d9d 2f      
   mov d,e       ; $3d9e 53      
   mov b,e       ; $3d9f 43      
   mov d,d       ; $3da0 52      
   sub c         ; $3da1 91      
   dcr a         ; $3da2 3d      
   call $0984    ; $3da3 cd 84 09
   .byte 0x10    ; $3da6 10      
   nop           ; $3da7 00      
   lxi b,$9b44   ; $3da8 01 44 9b
   dcr a         ; $3dab 3d      
   call $02e4    ; $3dac cd e4 02
   adc c         ; $3daf 89      
   dcr a         ; $3db0 3d      
   mov c,d       ; $3db1 4a      
   inr b         ; $3db2 04      
   rz            ; $3db3 c8      
   mvi c,$de     ; $3db4 0e de   
   inr b         ; $3db6 04      
   mov h,h       ; $3db7 64      
   lhld $048e    ; $3db8 2a 8e 04
   pop b         ; $3dbb c1      
   inr b         ; $3dbc 04      
   adc m         ; $3dbd 8e      
   dcr a         ; $3dbe 3d      
   dcr d         ; $3dbf 15      
   inx b         ; $3dc0 03      
   lxi b,$a845   ; $3dc1 01 45 a8
   dcr a         ; $3dc4 3d      
   call $02e4    ; $3dc5 cd e4 02
   xra h         ; $3dc8 ac      
   dcr a         ; $3dc9 3d      
   adc c         ; $3dca 89      
   dcr a         ; $3dcb 3d      
   mov l,m       ; $3dcc 6e      
   inr d         ; $3dcd 14      
   jpo $da07     ; $3dce e2 07 da
   mvi c,$4a     ; $3dd1 0e 4a   
   inr b         ; $3dd3 04      
   mov d,c       ; $3dd4 51      
   cma           ; $3dd5 2f      
   dcr d         ; $3dd6 15      
   inx b         ; $3dd7 03      
   lxi b,$c146   ; $3dd8 01 46 c1
   dcr a         ; $3ddb 3d      
   call $02e4    ; $3ddc cd e4 02
   out $03       ; $3ddf d3 03   
   dcx h         ; $3de1 2b      
   ldax b        ; $3de2 0a      
   rar           ; $3de3 1f      
   nop           ; $3de4 00      
   inx sp        ; $3de5 33      
   dcr b         ; $3de6 05      
   mov a,d       ; $3de7 7a      
   ldax b        ; $3de8 0a      
   rst 5         ; $3de9 ef      
   dcr a         ; $3dea 3d      
   di            ; $3deb f3      
   mvi c,$15     ; $3dec 0e 15   
   inx b         ; $3dee 03      
   out $03       ; $3def d3 03   
   out $03       ; $3df1 d3 03   
   dcx h         ; $3df3 2b      
   ldax b        ; $3df4 0a      
   dcr b         ; $3df5 05      
   nop           ; $3df6 00      
   rrc           ; $3df7 0f      
   dcr b         ; $3df8 05      
   rz            ; $3df9 c8      
   .byte 0x08    ; $3dfa 08      
   mov a,d       ; $3dfb 7a      
   ldax b        ; $3dfc 0a      
   inx b         ; $3dfd 03      
   mvi a,$e6     ; $3dfe 3e e6   
   mvi c,$15     ; $3e00 0e 15   
   inx b         ; $3e02 03      
   out $03       ; $3e03 d3 03   
   dcx h         ; $3e05 2b      
   ldax b        ; $3e06 0a      
   .byte 0x08    ; $3e07 08      
   nop           ; $3e08 00      
   rz            ; $3e09 c8      
   .byte 0x08    ; $3e0a 08      
   sub b         ; $3e0b 90      
   ldax b        ; $3e0c 0a      
   inx d         ; $3e0d 13      
   mvi a,$f3     ; $3e0e 3e f3   
   mvi c,$15     ; $3e10 0e 15   
   inx b         ; $3e12 03      
   out $03       ; $3e13 d3 03   
   dcx h         ; $3e15 2b      
   ldax b        ; $3e16 0a      
   rrc           ; $3e17 0f      
   nop           ; $3e18 00      
   mov h,m       ; $3e19 66      
   dcr b         ; $3e1a 05      
   mov a,d       ; $3e1b 7a      
   ldax b        ; $3e1c 0a      
   daa           ; $3e1d 27      
   mvi a,$82     ; $3e1e 3e 82   
   inx b         ; $3e20 03      
   rz            ; $3e21 c8      
   mvi c,$e6     ; $3e22 0e e6   
   mvi c,$15     ; $3e24 0e 15   
   inx b         ; $3e26 03      
   out $03       ; $3e27 d3 03   
   cmp l         ; $3e29 bd      
   dcr b         ; $3e2a 05      
   dcx h         ; $3e2b 2b      
   ldax b        ; $3e2c 0a      
   mvi b,$00     ; $3e2d 06 00   
   mov h,m       ; $3e2f 66      
   dcr b         ; $3e30 05      
   mov a,d       ; $3e31 7a      
   ldax b        ; $3e32 0a      
   dad sp        ; $3e33 39      
   mvi a,$e6     ; $3e34 3e e6   
   mvi c,$15     ; $3e36 0e 15   
   inx b         ; $3e38 03      
   out $03       ; $3e39 d3 03   
   dcx h         ; $3e3b 2b      
   ldax b        ; $3e3c 0a      
   dcx b         ; $3e3d 0b      
   nop           ; $3e3e 00      
   rrc           ; $3e3f 0f      
   dcr b         ; $3e40 05      
   mov a,d       ; $3e41 7a      
   ldax b        ; $3e42 0a      
   mov c,l       ; $3e43 4d      
   mvi a,$99     ; $3e44 3e 99   
   inr b         ; $3e46 04      
   adc m         ; $3e47 8e      
   inr b         ; $3e48 04      
   ani $0e       ; $3e49 e6 0e   
   dcr d         ; $3e4b 15      
   inx b         ; $3e4c 03      
   out $03       ; $3e4d d3 03   
   dcx h         ; $3e4f 2b      
   ldax b        ; $3e50 0a      
   rrc           ; $3e51 0f      
   nop           ; $3e52 00      
   rrc           ; $3e53 0f      
   dcr b         ; $3e54 05      
   mov a,d       ; $3e55 7a      
   ldax b        ; $3e56 0a      
   mov e,l       ; $3e57 5d      
   mvi a,$f3     ; $3e58 3e f3   
   mvi c,$15     ; $3e5a 0e 15   
   inx b         ; $3e5c 03      
   dcx h         ; $3e5d 2b      
   ldax b        ; $3e5e 0a      
   .byte 0x10    ; $3e5f 10      
   nop           ; $3e60 00      
   mov d,l       ; $3e61 55      
   inr b         ; $3e62 04      
   out $03       ; $3e63 d3 03   
   cmp l         ; $3e65 bd      
   dcr b         ; $3e66 05      
   dcx h         ; $3e67 2b      
   ldax b        ; $3e68 0a      
   mvi b,$00     ; $3e69 06 00   
   mov h,m       ; $3e6b 66      
   dcr b         ; $3e6c 05      
   mov a,d       ; $3e6d 7a      
   ldax b        ; $3e6e 0a      
   mov a,e       ; $3e6f 7b      
   mvi a,$2b     ; $3e70 3e 2b   
   ldax b        ; $3e72 0a      
   .byte 0x10    ; $3e73 10      
   nop           ; $3e74 00      
   mov c,d       ; $3e75 4a      
   inr b         ; $3e76 04      
   di            ; $3e77 f3      
   mvi c,$15     ; $3e78 0e 15   
   inx b         ; $3e7a 03      
   ani $0e       ; $3e7b e6 0e   
   dcr d         ; $3e7d 15      
   inx b         ; $3e7e 03      
   lxi b,$d847   ; $3e7f 01 47 d8
   dcr a         ; $3e82 3d      
   call $02e4    ; $3e83 cd e4 02
   ora d         ; $3e86 b2      
   lhld $0984    ; $3e87 2a 84 09
   mov c,h       ; $3e8a 4c      
   lhld $044a    ; $3e8b 2a 4a 04
   mov c,d       ; $3e8e 4a      
   inr b         ; $3e8f 04      
   dcr d         ; $3e90 15      
   inx b         ; $3e91 03      
   lxi b,$7f4c   ; $3e92 01 4c 7f
   mvi a,$cd     ; $3e95 3e cd   
   cpo $8902     ; $3e97 e4 02 89
   dcr a         ; $3e9a 3d      
   add e         ; $3e9b 83      
   mvi a,$15     ; $3e9c 3e 15   
   inx b         ; $3e9e 03      
   lxi b,$924d   ; $3e9f 01 4d 92
   mvi a,$cd     ; $3ea2 3e cd   
   cpo $d102     ; $3ea4 e4 02 d1
   mvi c,$96     ; $3ea7 0e 96   
   dcr a         ; $3ea9 3d      
   sbb l         ; $3eaa 9d      
   dad b         ; $3eab 09      
   dcr d         ; $3eac 15      
   inx b         ; $3ead 03      
   lxi b,$9f4e   ; $3eae 01 4e 9f
   mvi a,$cd     ; $3eb1 3e cd   
   cpo $b602     ; $3eb3 e4 02 b6
   inx b         ; $3eb6 03      
   add e         ; $3eb7 83      
   mvi a,$b6     ; $3eb8 3e b6   
   inx b         ; $3eba 03      
   add e         ; $3ebb 83      
   mvi a,$b6     ; $3ebc 3e b6   
   inx b         ; $3ebe 03      
   sui $0b       ; $3ebf d6 0b   
   ana e         ; $3ec1 a3      
   mvi a,$15     ; $3ec2 3e 15   
   inx b         ; $3ec4 03      
   lxi b,$ae4f   ; $3ec5 01 4f ae
   mvi a,$cd     ; $3ec8 3e cd   
   cpo $6e02     ; $3eca e4 02 6e
   inr d         ; $3ecd 14      
   ret           ; $3ece c9      
   rrc           ; $3ecf 0f      
   dcr d         ; $3ed0 15      
   inx b         ; $3ed1 03      
   lxi b,$c550   ; $3ed2 01 50 c5
   mvi a,$cd     ; $3ed5 3e cd   
   cpo $6e02     ; $3ed7 e4 02 6e
   inr d         ; $3eda 14      
   sbb e         ; $3edb 9b      
   mvi b,$15     ; $3edc 06 15   
   inx b         ; $3ede 03      
   lxi b,$d251   ; $3edf 01 51 d2
   mvi a,$cd     ; $3ee2 3e cd   
   cpo $6e02     ; $3ee4 e4 02 6e
   inr d         ; $3ee7 14      
   adc l         ; $3ee8 8d      
   inx b         ; $3ee9 03      
   mov h,d       ; $3eea 62      
   inx b         ; $3eeb 03      
   rc            ; $3eec d8      
   rrc           ; $3eed 0f      
   mov d,l       ; $3eee 55      
   inr b         ; $3eef 04      
   dcr d         ; $3ef0 15      
   inx b         ; $3ef1 03      
   lxi b,$df52   ; $3ef2 01 52 df
   mvi a,$cd     ; $3ef5 3e cd   
   cpo $d302     ; $3ef7 e4 02 d3
   inx b         ; $3efa 03      
   add e         ; $3efb 83      
   mvi a,$8d     ; $3efc 3e 8d   
   inx b         ; $3efe 03      
   xthl          ; $3eff e3      
   mvi a,$7e     ; $3f00 3e 7e   
   dcr d         ; $3f02 15      
   dcr d         ; $3f03 15      
   inx b         ; $3f04 03      
   lxi b,$f253   ; $3f05 01 53 f2
   mvi a,$cd     ; $3f08 3e cd   
   cpo $c802     ; $3f0a e4 02 c8
   mvi c,$c5     ; $3f0d 0e c5   
   dcr a         ; $3f0f 3d      
   dcr d         ; $3f10 15      
   inx b         ; $3f11 03      
   lxi b,$0554   ; $3f12 01 54 05
   cmc           ; $3f15 3f      
   call $02e4    ; $3f16 cd e4 02
   sui $3e       ; $3f19 d6 3e   
   add e         ; $3f1b 83      
   mvi a,$6e     ; $3f1c 3e 6e   
   inr d         ; $3f1e 14      
   ana b         ; $3f1f a0      
   dcr b         ; $3f20 05      
   .byte 0x10    ; $3f21 10      
   inr b         ; $3f22 04      
   mov a,m       ; $3f23 7e      
   dcr b         ; $3f24 05      
   dcr d         ; $3f25 15      
   inx b         ; $3f26 03      
   lxi b,$1255   ; $3f27 01 55 12
   cmc           ; $3f2a 3f      
   call $02e4    ; $3f2b cd e4 02
   adc c         ; $3f2e 89      
   dcr a         ; $3f2f 3d      
   adc l         ; $3f30 8d      
   inx b         ; $3f31 03      
   sui $3e       ; $3f32 d6 3e   
   out $03       ; $3f34 d3 03   
   adc m         ; $3f36 8e      
   dcr a         ; $3f37 3d      
   dad b         ; $3f38 09      
   cmc           ; $3f39 3f      
   out $03       ; $3f3a d3 03   
   add e         ; $3f3c 83      
   mvi a,$8d     ; $3f3d 3e 8d   
   inx b         ; $3f3f 03      
   mov h,h       ; $3f40 64      
   lhld $038d    ; $3f41 2a 8d 03
   mov h,d       ; $3f44 62      
   inx b         ; $3f45 03      
   rc            ; $3f46 d8      
   rrc           ; $3f47 0f      
   mov d,l       ; $3f48 55      
   inr b         ; $3f49 04      
   mov a,m       ; $3f4a 7e      
   dcr d         ; $3f4b 15      
   adc m         ; $3f4c 8e      
   dcr a         ; $3f4d 3d      
   dad b         ; $3f4e 09      
   cmc           ; $3f4f 3f      
   dcr d         ; $3f50 15      
   inx b         ; $3f51 03      
   lxi b,$2756   ; $3f52 01 56 27
   cmc           ; $3f55 3f      
   call $02e4    ; $3f56 cd e4 02
   out $03       ; $3f59 d3 03   
   out $03       ; $3f5b d3 03   
   mov l,m       ; $3f5d 6e      
   inr d         ; $3f5e 14      
   mov c,d       ; $3f5f 4a      
   inr b         ; $3f60 04      
   mov h,h       ; $3f61 64      
   lhld $0362    ; $3f62 2a 62 03
   mov d,l       ; $3f65 55      
   inr b         ; $3f66 04      
   ora d         ; $3f67 b2      
   mvi a,$83     ; $3f68 3e 83   
   mvi a,$6e     ; $3f6a 3e 6e   
   inr d         ; $3f6c 14      
   ora e         ; $3f6d b3      
   mvi d,$a3     ; $3f6e 16 a3   
   mvi a,$15     ; $3f70 3e 15   
   inx b         ; $3f72 03      
   lxi b,$5257   ; $3f73 01 57 52
   cmc           ; $3f76 3f      
   call $02e4    ; $3f77 cd e4 02
   out $03       ; $3f7a d3 03   
   mov l,m       ; $3f7c 6e      
   inr d         ; $3f7d 14      
   mov c,d       ; $3f7e 4a      
   inr b         ; $3f7f 04      
   adc l         ; $3f80 8d      
   inx b         ; $3f81 03      
   mov h,d       ; $3f82 62      
   inx b         ; $3f83 03      
   mov h,h       ; $3f84 64      
   lhld $038d    ; $3f85 2a 8d 03
   mov d,l       ; $3f88 55      
   inr b         ; $3f89 04      
   ora d         ; $3f8a b2      
   mvi a,$a3     ; $3f8b 3e a3   
   dcr a         ; $3f8d 3d      
   adc m         ; $3f8e 8e      
   inr b         ; $3f8f 04      
   sui $3e       ; $3f90 d6 3e   
   add e         ; $3f92 83      
   mvi a,$6e     ; $3f93 3e 6e   
   inr d         ; $3f95 14      
   ora e         ; $3f96 b3      
   mvi d,$a3     ; $3f97 16 a3   
   mvi a,$15     ; $3f99 3e 15   
   inx b         ; $3f9b 03      
   lxi b,$7358   ; $3f9c 01 58 73
   cmc           ; $3f9f 3f      
   call $02e4    ; $3fa0 cd e4 02
   ana e         ; $3fa3 a3      
   dcr a         ; $3fa4 3d      
   adc m         ; $3fa5 8e      
   inr b         ; $3fa6 04      
   mvi d,$3f     ; $3fa7 16 3f   
   mov a,d       ; $3fa9 7a      
   ldax b        ; $3faa 0a      
   ora a         ; $3fab b7      
   cmc           ; $3fac 3f      
   out $03       ; $3fad d3 03   
   mov d,m       ; $3faf 56      
   cmc           ; $3fb0 3f      
   ret           ; $3fb1 c9      
   mvi a,$2b     ; $3fb2 3e 2b   
   cmc           ; $3fb4 3f      
   dcr d         ; $3fb5 15      
   inx b         ; $3fb6 03      
   add d         ; $3fb7 82      
   inx b         ; $3fb8 03      
   add a         ; $3fb9 87      
   cma           ; $3fba 2f      
   dcr d         ; $3fbb 15      
   inx b         ; $3fbc 03      
   lxi b,$9c59   ; $3fbd 01 59 9c
   cmc           ; $3fc0 3f      
   call $02e4    ; $3fc1 cd e4 02
   ret           ; $3fc4 c9      
   mvi a,$d3     ; $3fc5 3e d3   
   inx b         ; $3fc7 03      
   sui $3e       ; $3fc8 d6 3e   
   mov m,a       ; $3fca 77      
   cmc           ; $3fcb 3f      
   dcx h         ; $3fcc 2b      
   cmc           ; $3fcd 3f      
   dcr d         ; $3fce 15      
   inx b         ; $3fcf 03      
   lxi b,$bd5a   ; $3fd0 01 5a bd
   cmc           ; $3fd3 3f      
   call $02e4    ; $3fd4 cd e4 02
   out $03       ; $3fd7 d3 03   
   out $03       ; $3fd9 d3 03   
   mov m,a       ; $3fdb 77      
   inr b         ; $3fdc 04      
   mov h,d       ; $3fdd 62      
   inx b         ; $3fde 03      
   xthl          ; $3fdf e3      
   mvi a,$8e     ; $3fe0 3e 8e   
   inr b         ; $3fe2 04      
   ora d         ; $3fe3 b2      
   mvi a,$83     ; $3fe4 3e 83   
   mvi a,$aa     ; $3fe6 3e aa   
   dad b         ; $3fe8 09      
   dcr d         ; $3fe9 15      
   inx b         ; $3fea 03      
   lxi b,$d062   ; $3feb 01 62 d0
   cmc           ; $3fee 3f      
   call $02e4    ; $3fef cd e4 02
   out $03       ; $3ff2 d3 03   
   mov m,a       ; $3ff4 77      
   inr b         ; $3ff5 04      
   jp $e303      ; $3ff6 f2 03 e3
   mvi a,$b2     ; $3ff9 3e b2   
   mvi a,$d3     ; $3ffb 3e d3   
   inx b         ; $3ffd 03      
   xthl          ; $3ffe e3      
   mvi a,$4a     ; $3fff 3e 4a   
   inr b         ; $4001 04      
   adc m         ; $4002 8e      
   inr b         ; $4003 04      
   add e         ; $4004 83      
   mvi a,$a6     ; $4005 3e a6   
   mvi d,$8d     ; $4007 16 8d   
   inx b         ; $4009 03      
   xra d         ; $400a aa      
   dad b         ; $400b 09      
   dcr d         ; $400c 15      
   inx b         ; $400d 03      
   lxi b,$eb67   ; $400e 01 67 eb
   cmc           ; $4011 3f      
   call $02e4    ; $4012 cd e4 02
   pop d         ; $4015 d1      
   mvi c,$ac     ; $4016 0e ac   
   dcr a         ; $4018 3d      
   dcr d         ; $4019 15      
   inx b         ; $401a 03      
   lxi b,$0e64   ; $401b 01 64 0e
   mov b,b       ; $401e 40      
   call $02e4    ; $401f cd e4 02
   cmp a         ; $4022 bf      
   mvi c,$ac     ; $4023 0e ac   
   dcr a         ; $4025 3d      
   dcr d         ; $4026 15      
   inx b         ; $4027 03      
   lxi b,$1b76   ; $4028 01 76 1b
   mov b,b       ; $402b 40      
   call $02e4    ; $402c cd e4 02
   mov l,m       ; $402f 6e      
   inr d         ; $4030 14      
   mov l,d       ; $4031 6a      
   inr b         ; $4032 04      
   xra h         ; $4033 ac      
   dcr a         ; $4034 3d      
   dcr d         ; $4035 15      
   inx b         ; $4036 03      
   lxi b,$287a   ; $4037 01 7a 28
   mov b,b       ; $403a 40      
   call $02e4    ; $403b cd e4 02
   mov l,m       ; $403e 6e      
   inr d         ; $403f 14      
   xra h         ; $4040 ac      
   dcr a         ; $4041 3d      
   dcr d         ; $4042 15      
   inx b         ; $4043 03      
   lxi b,$3769   ; $4044 01 69 37
   mov b,b       ; $4047 40      
   call $02e4    ; $4048 cd e4 02
   adc c         ; $404b 89      
   dcr a         ; $404c 3d      
   ana b         ; $404d a0      
   cmc           ; $404e 3f      
   dcr d         ; $404f 15      
   inx b         ; $4050 03      
   lxi b,$446a   ; $4051 01 6a 44
   mov b,b       ; $4054 40      
   call $02e4    ; $4055 cd e4 02
   adc c         ; $4058 89      
   dcr a         ; $4059 3d      
   pop b         ; $405a c1      
   cmc           ; $405b 3f      
   dcr d         ; $405c 15      
   inx b         ; $405d 03      
   lxi b,$516c   ; $405e 01 6c 51
   mov b,b       ; $4061 40      
   call $02e4    ; $4062 cd e4 02
   adc c         ; $4065 89      
   dcr a         ; $4066 3d      
   out $03       ; $4067 d3 03   
   rst 5         ; $4069 ef      
   cmc           ; $406a 3f      
   ori $3e       ; $406b f6 3e   
   dcr d         ; $406d 15      
   inx b         ; $406e 03      
   lxi b,$5e75   ; $406f 01 75 5e
   mov b,b       ; $4072 40      
   call $02e4    ; $4073 cd e4 02
   adc c         ; $4076 89      
   dcr a         ; $4077 3d      
   ret           ; $4078 c9      
   mvi a,$77     ; $4079 3e 77   
   inr b         ; $407b 04      
   ana e         ; $407c a3      
   dcr a         ; $407d 3d      
   adc m         ; $407e 8e      
   inr b         ; $407f 04      
   pop b         ; $4080 c1      
   inr b         ; $4081 04      
   sui $3e       ; $4082 d6 3e   
   adc m         ; $4084 8e      
   dcr a         ; $4085 3d      
   dcr d         ; $4086 15      
   inx b         ; $4087 03      
   lxi b,$6f66   ; $4088 01 66 6f
   mov b,b       ; $408b 40      
   call $02e4    ; $408c cd e4 02
   mov h,h       ; $408f 64      
   lhld $3dc5    ; $4090 2a c5 3d
   mov h,m       ; $4093 66      
   dcr d         ; $4094 15      
   mov h,m       ; $4095 66      
   dcr d         ; $4096 15      
   mvi a,$18     ; $4097 3e 18   
   mvi b,$17     ; $4099 06 17   
   mov h,d       ; $409b 62      
   mov l,h       ; $409c 6c      
   mov l,a       ; $409d 6f      
   mov l,e       ; $409e 6b      
   .byte 0x20    ; $409f 20      
   sui $2a       ; $40a0 d6 2a   
   add h         ; $40a2 84      
   dad b         ; $40a3 09      
   cpi $12       ; $40a4 fe 12   
   sub m         ; $40a6 96      
   dcr a         ; $40a7 3d      
   add h         ; $40a8 84      
   dad b         ; $40a9 09      
   mov a,d       ; $40aa 7a      
   ldax b        ; $40ab 0a      
   ora h         ; $40ac b4      
   mov b,b       ; $40ad 40      
   push h        ; $40ae e5      
   dcx h         ; $40af 2b      
   mov l,b       ; $40b0 68      
   ldax b        ; $40b1 0a      
   cmp d         ; $40b2 ba      
   mov b,b       ; $40b3 40      
   mvi a,$18     ; $40b4 3e 18   
   inx b         ; $40b6 03      
   mov l,m       ; $40b7 6e      
   mov h,l       ; $40b8 65      
   .byte 0x20    ; $40b9 20      
   mvi a,$18     ; $40ba 3e 18   
   .byte 0x08    ; $40bc 08      
   mov l,c       ; $40bd 69      
   mov a,d       ; $40be 7a      
   mov l,l       ; $40bf 6d      
   mov h,l       ; $40c0 65      
   mov l,m       ; $40c1 6e      
   mov h,l       ; $40c2 65      
   mov l,m       ; $40c3 6e      
   ral           ; $40c4 17      
   mov m,l       ; $40c5 75      
   dad b         ; $40c6 09      
   mov m,l       ; $40c7 75      
   dad b         ; $40c8 09      
   mov m,l       ; $40c9 75      
   dad b         ; $40ca 09      
   dcr d         ; $40cb 15      
   inx b         ; $40cc 03      
   lxi b,$8863   ; $40cd 01 63 88
   mov b,b       ; $40d0 40      
   call $02e4    ; $40d1 cd e4 02
   dcx h         ; $40d4 2b      
   ldax b        ; $40d5 0a      
   .byte 0x08    ; $40d6 08      
   nop           ; $40d7 00      
   adc c         ; $40d8 89      
   dcr a         ; $40d9 3d      
   mov h,d       ; $40da 62      
   inx b         ; $40db 03      
   rc            ; $40dc d8      
   rrc           ; $40dd 0f      
   mov d,l       ; $40de 55      
   inr b         ; $40df 04      
   xra h         ; $40e0 ac      
   dcr a         ; $40e1 3d      
   dcr d         ; $40e2 15      
   inx b         ; $40e3 03      
   stax b        ; $40e4 02      
   mvi h,$2b     ; $40e5 26 2b   
   call $cd40    ; $40e7 cd 40 cd
   add h         ; $40ea 84      
   dad b         ; $40eb 09      
   lxi b,$cd00   ; $40ec 01 00 cd
   cnz $021a     ; $40ef c4 1a 02
   mvi h,$3f     ; $40f2 26 3f   
   cpo $cd40     ; $40f4 e4 40 cd
   in $1a        ; $40f7 db 1a   
   sub h         ; $40f9 94      
   .byte 0x10    ; $40fa 10      
   call $1ac4    ; $40fb cd c4 1a
   stax b        ; $40fe 02      
   mov d,h       ; $40ff 54      
   dcr a         ; $4100 3d      
   pop psw       ; $4101 f1      
   mov b,b       ; $4102 40      
   call $02e4    ; $4103 cd e4 02
   dcx h         ; $4106 2b      
   ldax b        ; $4107 0a      
   mov h,m       ; $4108 66      
   dcr b         ; $4109 05      
   ei            ; $410a fb      
   mov b,b       ; $410b 40      
   dcr d         ; $410c 15      
   inx b         ; $410d 03      
   stax b        ; $410e 02      
   mov d,h       ; $410f 54      
   mov e,m       ; $4110 5e      
   cpi $40       ; $4111 fe 40   
   call $02e4    ; $4113 cd e4 02
   dcx h         ; $4116 2b      
   ldax b        ; $4117 0a      
   sub h         ; $4118 94      
   .byte 0x10    ; $4119 10      
   ei            ; $411a fb      
   mov b,b       ; $411b 40      
   dcr d         ; $411c 15      
   inx b         ; $411d 03      
   lxi b,$0e7e   ; $411e 01 7e 0e
   mov b,c       ; $4121 41      
   call $02e4    ; $4122 cd e4 02
   jp $6603      ; $4125 f2 03 66
   dcr b         ; $4128 05      
   mov a,d       ; $4129 7a      
   ldax b        ; $412a 0a      
   dcr m         ; $412b 35      
   mov b,c       ; $412c 41      
   add d         ; $412d 82      
   inx b         ; $412e 03      
   inx b         ; $412f 03      
   inr b         ; $4130 04      
   rz            ; $4131 c8      
   mvi c,$15     ; $4132 0e 15   
   inx b         ; $4134 03      
   rz            ; $4135 c8      
   mvi c,$c5     ; $4136 0e c5   
   inx b         ; $4138 03      
   push h        ; $4139 e5      
   ldax b        ; $413a 0a      
   mov e,c       ; $413b 59      
   mov b,c       ; $413c 41      
   mov h,d       ; $413d 62      
   inx b         ; $413e 03      
   sbb a         ; $413f 9f      
   ldax b        ; $4140 0a      
   sub c         ; $4141 91      
   dad b         ; $4142 09      
   ori $40       ; $4143 f6 40   
   mov a,d       ; $4145 7a      
   ldax b        ; $4146 0a      
   mov c,a       ; $4147 4f      
   mov b,c       ; $4148 41      
   mov a,c       ; $4149 79      
   inr e         ; $414a 1c      
   mov l,b       ; $414b 68      
   ldax b        ; $414c 0a      
   mov d,e       ; $414d 53      
   mov b,c       ; $414e 41      
   pchl          ; $414f e9      
   mov b,b       ; $4150 40      
   mov c,d       ; $4151 4a      
   inr b         ; $4152 04      
   pchl          ; $4153 e9      
   mov b,b       ; $4154 40      
   mov h,e       ; $4155 63      
   dcx b         ; $4156 0b      
   dcr a         ; $4157 3d      
   mov b,c       ; $4158 41      
   .byte 0x10    ; $4159 10      
   inr b         ; $415a 04      
   dcr d         ; $415b 15      
   inx b         ; $415c 03      
   stax b        ; $415d 02      
   mov c,l       ; $415e 4d      
   mov c,h       ; $415f 4c      
   mvi e,$41     ; $4160 1e 41   
   call $02e4    ; $4162 cd e4 02
   ana m         ; $4165 a6      
   mvi d,$c8     ; $4166 16 c8   
   mvi c,$83     ; $4168 0e 83   
   mvi a,$96     ; $416a 3e 96   
   mvi a,$bf     ; $416c 3e bf   
   mvi c,$ee     ; $416e 0e ee   
   mov b,b       ; $4170 40      
   inx b         ; $4171 03      
   mov b,c       ; $4172 41      
   shld $0d41    ; $4173 22 41 0d
   dad b         ; $4176 09      
   ana m         ; $4177 a6      
   mvi d,$c8     ; $4178 16 c8   
   mvi c,$83     ; $417a 0e 83   
   mvi a,$96     ; $417c 3e 96   
   mvi a,$33     ; $417e 3e 33   
   dad b         ; $4180 09      
   mov c,d       ; $4181 4a      
   inr b         ; $4182 04      
   inx d         ; $4183 13      
   mov b,c       ; $4184 41      
   shld $2041    ; $4185 22 41 20
   dad b         ; $4188 09      
   mov c,d       ; $4189 4a      
   inr b         ; $418a 04      
   dcr c         ; $418b 0d      
   dad b         ; $418c 09      
   ana m         ; $418d a6      
   mvi d,$c8     ; $418e 16 c8   
   mvi c,$83     ; $4190 0e 83   
   mvi a,$96     ; $4192 3e 96   
   mvi a,$33     ; $4194 3e 33   
   dad b         ; $4196 09      
   mov c,d       ; $4197 4a      
   inr b         ; $4198 04      
   inx b         ; $4199 03      
   mov b,c       ; $419a 41      
   shld $2041    ; $419b 22 41 20
   dad b         ; $419e 09      
   mov c,d       ; $419f 4a      
   inr b         ; $41a0 04      
   out $03       ; $41a1 d3 03   
   sub m         ; $41a3 96      
   mvi a,$4a     ; $41a4 3e 4a   
   inr b         ; $41a6 04      
   sub c         ; $41a7 91      
   dad b         ; $41a8 09      
   ana m         ; $41a9 a6      
   mvi d,$66     ; $41aa 16 66   
   dcr b         ; $41ac 05      
   mov a,d       ; $41ad 7a      
   ldax b        ; $41ae 0a      
   ora e         ; $41af b3      
   mov b,c       ; $41b0 41      
   mov m,a       ; $41b1 77      
   inr b         ; $41b2 04      
   dcr d         ; $41b3 15      
   inx b         ; $41b4 03      
   stax b        ; $41b5 02      
   mov c,l       ; $41b6 4d      
   mov d,d       ; $41b7 52      
   mov e,l       ; $41b8 5d      
   mov b,c       ; $41b9 41      
   call $02e4    ; $41ba cd e4 02
   ana m         ; $41bd a6      
   mvi d,$64     ; $41be 16 64   
   lhld $048e    ; $41c0 2a 8e 04
   jp $8303      ; $41c3 f2 03 83
   mvi a,$96     ; $41c6 3e 96   
   mvi a,$d1     ; $41c8 3e d1   
   mvi c,$ee     ; $41ca 0e ee   
   mov b,b       ; $41cc 40      
   inx b         ; $41cd 03      
   mov b,c       ; $41ce 41      
   shld $0d41    ; $41cf 22 41 0d
   dad b         ; $41d2 09      
   add e         ; $41d3 83      
   mvi a,$96     ; $41d4 3e 96   
   mvi a,$33     ; $41d6 3e 33   
   dad b         ; $41d8 09      
   mov c,d       ; $41d9 4a      
   inr b         ; $41da 04      
   inx d         ; $41db 13      
   mov b,c       ; $41dc 41      
   shld $2041    ; $41dd 22 41 20
   dad b         ; $41e0 09      
   mov c,d       ; $41e1 4a      
   inr b         ; $41e2 04      
   dcr d         ; $41e3 15      
   inx b         ; $41e4 03      
   stax b        ; $41e5 02      
   mov d,d       ; $41e6 52      
   mov d,a       ; $41e7 57      
   ora l         ; $41e8 b5      
   mov b,c       ; $41e9 41      
   call $02e4    ; $41ea cd e4 02
   cmp d         ; $41ed ba      
   mov b,c       ; $41ee 41      
   xra h         ; $41ef ac      
   dcr a         ; $41f0 3d      
   dcr d         ; $41f1 15      
   inx b         ; $41f2 03      
   stax b        ; $41f3 02      
   mov c,h       ; $41f4 4c      
   mov d,a       ; $41f5 57      
   push h        ; $41f6 e5      
   mov b,c       ; $41f7 41      
   call $02e4    ; $41f8 cd e4 02
   mov h,d       ; $41fb 62      
   mov b,c       ; $41fc 41      
   xra h         ; $41fd ac      
   dcr a         ; $41fe 3d      
   dcr d         ; $41ff 15      
   inx b         ; $4200 03      
   stax b        ; $4201 02      
   mov b,h       ; $4202 44      
   mov b,e       ; $4203 43      
   di            ; $4204 f3      
   mov b,c       ; $4205 41      
   call $02e4    ; $4206 cd e4 02
   jp $4a03      ; $4209 f2 03 4a
   inr b         ; $420c 04      
   mov h,d       ; $420d 62      
   inx b         ; $420e 03      
   out $03       ; $420f d3 03   
   xthl          ; $4211 e3      
   mvi a,$b2     ; $4212 3e b2   
   mvi a,$d3     ; $4214 3e d3   
   inx b         ; $4216 03      
   xthl          ; $4217 e3      
   mvi a,$4a     ; $4218 3e 4a   
   inr b         ; $421a 04      
   mov h,d       ; $421b 62      
   inx b         ; $421c 03      
   mov d,l       ; $421d 55      
   inr b         ; $421e 04      
   add e         ; $421f 83      
   mvi a,$8d     ; $4220 3e 8d   
   inx b         ; $4222 03      
   ora e         ; $4223 b3      
   mvi d,$15     ; $4224 16 15   
   inx b         ; $4226 03      
   stax b        ; $4227 02      
   mov b,h       ; $4228 44      
   mov d,a       ; $4229 57      
   lxi b,$cd42   ; $422a 01 42 cd
   cpo $ba02     ; $422d e4 02 ba
   mov b,c       ; $4230 41      
   sub m         ; $4231 96      
   mvi a,$89     ; $4232 3e 89   
   dcr a         ; $4234 3d      
   xthl          ; $4235 e3      
   mvi a,$a0     ; $4236 3e a0   
   dcr b         ; $4238 05      
   .byte 0x10    ; $4239 10      
   inr b         ; $423a 04      
   pop b         ; $423b c1      
   inr b         ; $423c 04      
   adc c         ; $423d 89      
   dcr a         ; $423e 3d      
   mvi b,$42     ; $423f 06 42   
   adc c         ; $4241 89      
   dcr a         ; $4242 3d      
   ori $3e       ; $4243 f6 3e   
   dcr d         ; $4245 15      
   inx b         ; $4246 03      
   stax b        ; $4247 02      
   mov b,e       ; $4248 43      
   mov d,e       ; $4249 53      
   daa           ; $424a 27      
   mov b,d       ; $424b 42      
   call $02e4    ; $424c cd e4 02
   rz            ; $424f c8      
   mvi c,$8e     ; $4250 0e 8e   
   dcr a         ; $4252 3d      
   sub m         ; $4253 96      
   mvi a,$64     ; $4254 3e 64   
   lhld $16b3    ; $4256 2a b3 16
   rz            ; $4259 c8      
   mvi c,$2b     ; $425a 0e 2b   
   cmc           ; $425c 3f      
   ana e         ; $425d a3      
   mvi a,$15     ; $425e 3e 15   
   inx b         ; $4260 03      
   stax b        ; $4261 02      
   mov b,h       ; $4262 44      
   mov d,e       ; $4263 53      
   mov b,a       ; $4264 47      
   mov b,d       ; $4265 42      
   call $02e4    ; $4266 cd e4 02
   adc c         ; $4269 89      
   dcr a         ; $426a 3d      
   mov l,m       ; $426b 6e      
   inr d         ; $426c 14      
   jpo $2b07     ; $426d e2 07 2b
   ldax b        ; $4270 0a      
   .byte 0x20    ; $4271 20      
   nop           ; $4272 00      
   rz            ; $4273 c8      
   mvi c,$51     ; $4274 0e 51   
   cma           ; $4276 2f      
   jc $ab0e      ; $4277 da 0e ab
   stax d        ; $427a 12      
   dcx h         ; $427b 2b      
   ldax b        ; $427c 0a      
   dcx d         ; $427d 1b      
   nop           ; $427e 00      
   rz            ; $427f c8      
   mvi c,$51     ; $4280 0e 51   
   cma           ; $4282 2f      
   jc $ab0e      ; $4283 da 0e ab
   stax d        ; $4286 12      
   dcr d         ; $4287 15      
   inx b         ; $4288 03      
   lxi b,$617b   ; $4289 01 7b 61
   mov b,d       ; $428c 42      
   call $02e4    ; $428d cd e4 02
   adc c         ; $4290 89      
   dcr a         ; $4291 3d      
   out $03       ; $4292 d3 03   
   ret           ; $4294 c9      
   mvi a,$d6     ; $4295 3e d6   
   mvi a,$8e     ; $4297 3e 8e   
   dcr a         ; $4299 3d      
   sub m         ; $429a 96      
   mvi a,$6e     ; $429b 3e 6e   
   inr d         ; $429d 14      
   ora e         ; $429e b3      
   mvi d,$a3     ; $429f 16 a3   
   mvi a,$09     ; $42a1 3e 09   
   cmc           ; $42a3 3f      
   mov l,m       ; $42a4 6e      
   inr d         ; $42a5 14      
   sui $16       ; $42a6 d6 16   
   adc m         ; $42a8 8e      
   dcr a         ; $42a9 3d      
   dcr d         ; $42aa 15      
   inx b         ; $42ab 03      
   stax b        ; $42ac 02      
   mov b,l       ; $42ad 45      
   mov c,a       ; $42ae 4f      
   adc c         ; $42af 89      
   mov b,d       ; $42b0 42      
   call $02e4    ; $42b1 cd e4 02
   out $03       ; $42b4 d3 03   
   dcr a         ; $42b6 3d      
   dcr d         ; $42b7 15      
   sub m         ; $42b8 96      
   mvi a,$aa     ; $42b9 3e aa   
   dad b         ; $42bb 09      
   ana e         ; $42bc a3      
   mvi a,$d1     ; $42bd 3e d1   
   mvi c,$ac     ; $42bf 0e ac   
   dcr a         ; $42c1 3d      
   dcr d         ; $42c2 15      
   inx b         ; $42c3 03      
   stax b        ; $42c4 02      
   mov b,l       ; $42c5 45      
   mov c,c       ; $42c6 49      
   xra h         ; $42c7 ac      
   mov b,d       ; $42c8 42      
   call $02e4    ; $42c9 cd e4 02
   adc c         ; $42cc 89      
   dcr a         ; $42cd 3d      
   xthl          ; $42ce e3      
   mvi a,$96     ; $42cf 3e 96   
   mvi a,$62     ; $42d1 3e 62   
   inx b         ; $42d3 03      
   ana b         ; $42d4 a0      
   dcr b         ; $42d5 05      
   .byte 0x10    ; $42d6 10      
   inr b         ; $42d7 04      
   mov h,m       ; $42d8 66      
   dcr b         ; $42d9 05      
   sub b         ; $42da 90      
   ldax b        ; $42db 0a      
   cpe $8942     ; $42dc ec 42 89
   dcr a         ; $42df 3d      
   cnc $893f     ; $42e0 d4 3f 89
   dcr a         ; $42e3 3d      
   ori $3e       ; $42e4 f6 3e   
   pop d         ; $42e6 d1      
   mvi c,$ac     ; $42e7 0e ac   
   dcr a         ; $42e9 3d      
   dcr d         ; $42ea 15      
   inx b         ; $42eb 03      
   add d         ; $42ec 82      
   inx b         ; $42ed 03      
   add a         ; $42ee 87      
   cma           ; $42ef 2f      
   dcr d         ; $42f0 15      
   inx b         ; $42f1 03      
   stax b        ; $42f2 02      
   mvi h,$45     ; $42f3 26 45   
   cnz $cd42     ; $42f5 c4 42 cd
   in $1a        ; $42f8 db 1a   
   ora c         ; $42fa b1      
   mov b,d       ; $42fb 42      
   call $1ac4    ; $42fc cd c4 1a
   lxi b,$f270   ; $42ff 01 70 f2
   mov b,d       ; $4302 42      
   call $02e4    ; $4303 cd e4 02
   mov a,a       ; $4306 7f      
   dcr a         ; $4307 3d      
   pop d         ; $4308 d1      
   mvi c,$d6     ; $4309 0e d6   
   ldax b        ; $430b 0a      
   dcx h         ; $430c 2b      
   ldax b        ; $430d 0a      
   .byte 0x28    ; $430e 28      
   nop           ; $430f 00      
   rz            ; $4310 c8      
   mvi c,$51     ; $4311 0e 51   
   cma           ; $4313 2f      
   dcx h         ; $4314 2b      
   ldax b        ; $4315 0a      
   ora c         ; $4316 b1      
   mov b,d       ; $4317 42      
   cm $7f42      ; $4318 fc 42 7f
   dcr a         ; $431b 3d      
   add h         ; $431c 84      
   dad b         ; $431d 09      
   mov a,d       ; $431e 7a      
   ldax b        ; $431f 0a      
   inr a         ; $4320 3c      
   mov b,e       ; $4321 43      
   mvi a,$18     ; $4322 3e 18   
   rrc           ; $4324 0f      
   ral           ; $4325 17      
   mov m,d       ; $4326 72      
   mov h,l       ; $4327 65      
   hlt           ; $4328 76      
   mov l,c       ; $4329 69      
   mov l,l       ; $432a 6d      
   .byte 0x20    ; $432b 20      
   mov m,a       ; $432c 77      
   mov m,e       ; $432d 73      
   mov m,h       ; $432e 74      
   mov h,c       ; $432f 61      
   mov m,a       ; $4330 77      
   mov l,e       ; $4331 6b      
   mov l,c       ; $4332 69      
   ral           ; $4333 17      
   dcx h         ; $4334 2b      
   ldax b        ; $4335 0a      
   ret           ; $4336 c9      
   mov b,d       ; $4337 42      
   cm $1542      ; $4338 fc 42 15
   inx b         ; $433b 03      
   dcx h         ; $433c 2b      
   ldax b        ; $433d 0a      
   rrc           ; $433e 0f      
   nop           ; $433f 00      
   sui $16       ; $4340 d6 16   
   dcr d         ; $4342 15      
   inx b         ; $4343 03      
   lxi b,$ff7d   ; $4344 01 7d ff
   mov b,d       ; $4347 42      
   call $2f2b    ; $4348 cd 2b 2f
   mov h,d       ; $434b 62      
   mov b,b       ; $434c 40      
   mov c,b       ; $434d 48      
   mov b,b       ; $434e 40      
   rm            ; $434f f8      
   mov b,c       ; $4350 41      
   adc h         ; $4351 8c      
   mov b,b       ; $4352 40      
   jpe $1f41     ; $4353 ea 41 1f
   mov b,b       ; $4356 40      
   pop d         ; $4357 d1      
   mov b,b       ; $4358 40      
   mov d,l       ; $4359 55      
   mov b,b       ; $435a 40      
   stax d        ; $435b 12      
   mov b,b       ; $435c 40      
   inr l         ; $435d 2c      
   mov b,b       ; $435e 40      
   dcx sp        ; $435f 3b      
   mov b,b       ; $4360 40      
   inx b         ; $4361 03      
   mov b,e       ; $4362 43      
   mov c,h       ; $4363 4c      
   mov b,d       ; $4364 42      
   mov m,e       ; $4365 73      
   mov b,b       ; $4366 40      
   inr l         ; $4367 2c      
   mov b,d       ; $4368 42      
   adc l         ; $4369 8d      
   mov b,d       ; $436a 42      
   rst 7         ; $436b ff      
   rst 7         ; $436c ff      
   dcr d         ; $436d 15      
   inx b         ; $436e 03      
   lxi b,$4479   ; $436f 01 79 44
   mov b,e       ; $4372 43      
   call $02e4    ; $4373 cd e4 02
   mov d,h       ; $4376 54      
   dcr d         ; $4377 15      
   cc $7a3d      ; $4378 dc 3d 7a
   ldax b        ; $437b 0a      
   add d         ; $437c 82      
   mov b,e       ; $437d 43      
   mov c,b       ; $437e 48      
   mov b,e       ; $437f 43      
   dcr d         ; $4380 15      
   inx b         ; $4381 03      
   rst 6         ; $4382 f7      
   mov b,d       ; $4383 42      
   dcr d         ; $4384 15      
   inx b         ; $4385 03      

NFA_EDIT:        ; 4386
   .byte 4,"EDIT"
   .word NFA_EDITOR       ; 3D68
_EDIT:           ; 438D - 4442
   call _FCALL            ; 438D
   .word _DEPTH           ; $4390 1CD9 - DEPTH
   .word __3FBRANCH       ; $4392 0A7A - ?BRANCH
   .word $439A            ; $4394 439A
   .word _SCR             ; $4396 2AD6 - SCR
   .word __21             ; $4398 099D - !
   .word _SCR             ; $439a 2AD6 - SCR
   .word __40             ; $439c 0984 - @
   .word _0               ; $439e 0EC8 - 0
   .word _MAX             ; $43a0 04DE - MAX
   .word _BLOCK           ; $43a2 2CFD - BLOCK
   .word _DROP            ; $43a4 0382 - DROP
   .word _CLS             ; $43a6 2F76 - CLS
   .word $3D7F            ; $43a8 3D7F
   .word _0_21            ; $43aa 09FC - 0!
   .word _0               ; $43ac 0EC8 - 0
   .word $3D8E            ; $43ae 3D8E
   .word $3D96            ; $43b0 3D96
   .word _0_21            ; $43b2 09FC - 0!
   .word _LIT             ; $43b4 0A2B - LIT
   .word $000A            ; $43b6 000A
   .word _0               ; $43b8 0EC8 - 0
   .word _CUR             ; $43ba 2F51 - CUR
   .word __28_2E_22_29    ; $43bc 183E - (.")
   .byte 6,"|kran="
   .word _SCR             ; $43c5 2AD6 - SCR
   .word __40             ; $43c7 0984 - @
   .word _LIT             ; $43c9 0A2B - LIT
   .word $0005            ; $43cb 0005
   .word __2ER            ; $43cd 12AB - .R
   .word _LIT             ; $43cf 0A2B - LIT
   .word $0004            ; $43d1 0004
   .word _SPACES          ; $43d3 16D6 - SPACES
   .word __28_2E_22_29    ; $43d5 183E - (.")
   .byte 7,"X=   Y="
   .word _LIT             ; $43df 0A2B - LIT
   .word $42B1            ; $43e1 42B1
   .word $42FC            ; $43e3 42FC
   .word _B_2FBUF         ; $43e5 2A64 - B/BUF
   .word $3DC5            ; $43e7 3DC5
   .word _CR              ; $43e9 1566 - CR
   .word _SPACE           ; $43eb 16C4 - SPACE
   .word __28_2E_22_29    ; $43ed 183E - (.")
   .byte 62,"F3/F5-",0x1d,"/",0x0e," AP2-INS F2-SPLIT ^O-DEL ^~-DELWORD ps-DELLINE F4-END"
   .word _0               ; $442e 0EC8 - 0
   .word $3D8E            ; $4430 3D8E
   .word _0               ; $4432 0EC8 - 0
   .word $3F2B            ; $4434 3F2B
   .word $4266            ; $4436 4266
   .word $3F09            ; $4438 3F09
   .word $4373            ; $443a 4373
   .word _BRANCH          ; $443c 0A68 - BRANCH
   .word $4436            ; $443e 4436
   .word _EXIT            ; $4440 0315 - EXIT

NFA__6C_65_6A_64_69:; 4442
   .byte 5,"lejdi"
   .word $4386   ; NFA_EDIT         ; 4386
__6C_65_6A_64_69:; 444A - 453D
   call _FCALL            ; 444A
   .word _DUP             ; $444d 03D3 - DUP
   .word _SPACES          ; $444f 16D6 - SPACES
   .word __28_2E_22_29    ; $4451 183E - (.")
   .byte 25,"           ",0x03,"             "
   .word _CR              ; $446d 1566 - CR
   .word _DUP             ; $446f 03D3 - DUP
   .word _SPACES          ; $4471 16D6 - SPACES
   .word __28_2E_22_29    ; $4473 183E - (.")
   .byte 25,"  ",0x17,0x17," ",0x06,0x17,0x17,0x11,0x17,0x11,0x06,0x17,0x17,"  ",0x17,0x17,"  ",0x17,0x11,0x06,0x17,0x17
   .word _CR              ; $448f 1566 - CR
   .word _DUP             ; $4491 03D3 - DUP
   .word _SPACES          ; $4493 16D6 - SPACES
   .word __28_2E_22_29    ; $4495 183E - (.")
   .byte 25," ",0x04,0x11,0x06,0x10,0x06,0x17,"  ",0x17,0x11,0x17,0x7f,0x17," ",0x04,0x11,0x06,0x10," ",0x17,0x11,0x17,0x7f,0x17
   .word _CR              ; $44b1 1566 - CR
   .word _DUP             ; $44b3 03D3 - DUP
   .word _SPACES          ; $44b5 16D6 - SPACES
   .word __28_2E_22_29    ; $44b7 183E - (.")
   .byte 25," ",0x06,0x11,0x06,0x11,0x06,0x17,0x17,0x11,0x17,0x15,0x17,0x06,0x17," ",0x16,0x11,0x06,0x15," ",0x17,0x15,0x17,0x06,0x17
   .word _CR              ; $44d3 1566 - CR
   .word _DUP             ; $44d5 03D3 - DUP
   .word _SPACES          ; $44d7 16D6 - SPACES
   .word __28_2E_22_29    ; $44d9 183E - (.")
   .byte 25," ",0x17,0x01,0x02,0x17,0x06,0x17,"  ",0x17,0x17,0x11,0x06,0x17," ",0x17,"  ",0x17," ",0x17,0x17,0x11,0x06,0x17
   .word _CR              ; $44f5 1566 - CR
   .word _DUP             ; $44f7 03D3 - DUP
   .word _SPACES          ; $44f9 16D6 - SPACES
   .word __28_2E_22_29    ; $44fb 183E - (.")
   .byte 25,0x04,0x17,"  ",0x17,0x06,0x17,0x17,0x11,0x17,0x17,0x01,0x06,0x17,0x06,0x17,0x17,0x17,0x17,0x11,0x17,0x17,0x01,0x06,0x17
   .word _CR              ; $4517 1566 - CR
   .word _DUP             ; $4519 03D3 - DUP
   .word _SPACES          ; $451b 16D6 - SPACES
   .word __28_2E_22_29    ; $451d 183E - (.")
   .byte 25,"              ",0x02,0x01,"  ",0x02,0x01,"     "
   .word _CR              ; $4539 1566 - CR
   .word _EXIT            ; $453b 0315 - EXIT

NFA__74_75_66_65_6C_78:; 453D
   .byte 6,"tufelx"
   .word NFA__6C_65_6A_64_69        ; 4442
__74_75_66_65_6C_78:; 4546 - 45B9
   call _FCALL            ; 4546
   .word _DUP             ; $4549 03D3 - DUP
   .word _SPACES          ; $454b 16D6 - SPACES
   .word __28_2E_22_29    ; $454d 183E - (.")
   .byte 13,"         ",0x16,0x17,0x15," "
   .word _CR              ; $455d 1566 - CR
   .word _DUP             ; $455f 03D3 - DUP
   .word _SPACES          ; $4561 16D6 - SPACES
   .word __28_2E_22_29    ; $4563 183E - (.")
   .byte 13,"        ",0x16,0x17,0x17,0x17,0x17
   .word _CR              ; $4573 1566 - CR
   .word _DUP             ; $4575 03D3 - DUP
   .word _SPACES          ; $4577 16D6 - SPACES
   .word __28_2E_22_29    ; $4579 183E - (.")
   .byte 13,"   s",0x17,"ft    ",0x17,0x01
   .word _CR              ; $4589 1566 - CR
   .word _DUP             ; $458b 03D3 - DUP
   .word _SPACES          ; $458d 16D6 - SPACES
   .word __28_2E_22_29    ; $458f 183E - (.")
   .byte 13,"   ",0x04,0x17,0x17,0x01,"   ",0x06,0x11," "
   .word _CR              ; $459f 1566 - CR
   .word _DUP             ; $45a1 03D3 - DUP
   .word _SPACES          ; $45a3 16D6 - SPACES
   .word __28_2E_22_29    ; $45a5 183E - (.")
   .byte 13,0x04,0x14,0x17,0x17,0x17,0x01,"    ",0x06,"  "
   .word _CR              ; $45b5 1566 - CR
   .word _EXIT            ; $45b7 0315 - EXIT

NFA__73_6F_66_74:; 45B9
   .byte 4,"soft"
   .word NFA__74_75_66_65_6C_78       ; 453D
__73_6F_66_74:   ; 45C0 - 464C
   call _FCALL            ; 45C0
   .word _DUP             ; $45c3 03D3 - DUP
   .word _SPACES          ; $45c5 16D6 - SPACES
   .word __28_2E_22_29    ; $45c7 183E - (.")
   .byte 18,0x04,0x17,0x17,0x11,0x04,0x17,0x17,0x15," ",0x14,0x16,0x17,0x14,0x10,0x06,0x17,0x17,0x17
   .word _CR              ; $45dc 1566 - CR
   .word _DUP             ; $45de 03D3 - DUP
   .word _SPACES          ; $45e0 16D6 - SPACES
   .word __28_2E_22_29    ; $45e2 183E - (.")
   .byte 18,0x06,0x17,0x06,0x15,0x06,0x17,0x06,0x17,0x06,0x17,0x17,0x17,0x17,0x17," ",0x06,0x17," "
   .word _CR              ; $45f7 1566 - CR
   .word _DUP             ; $45f9 03D3 - DUP
   .word _SPACES          ; $45fb 16D6 - SPACES
   .word __28_2E_22_29    ; $45fd 183E - (.")
   .byte 18,0x06,0x17,"  ",0x06,0x17,0x06,0x17,0x06,0x17,0x06,0x17,0x06,0x17," ",0x06,0x17," "
   .word _CR              ; $4612 1566 - CR
   .word _DUP             ; $4614 03D3 - DUP
   .word _SPACES          ; $4616 16D6 - SPACES
   .word __28_2E_22_29    ; $4618 183E - (.")
   .byte 18,0x06,0x17,0x06,0x13,0x06,0x17,0x06,0x17,0x06,0x17,0x16,0x17,0x16,0x17," ",0x06,0x17," "
   .word _CR              ; $462d 1566 - CR
   .word _DUP             ; $462f 03D3 - DUP
   .word _SPACES          ; $4631 16D6 - SPACES
   .word __28_2E_22_29    ; $4633 183E - (.")
   .byte 18,0x02,0x17,0x17,0x11,0x02,0x17,0x17,0x13," ",0x03,0x17,0x17,0x03,0x01," ",0x06,0x17," "
   .word _CR              ; $4648 1566 - CR
   .word _EXIT            ; $464a 0315 - EXIT

NFA_TRADE_2DMARK:; 464C
   .byte 10,"TRADE-MARK"
   .word NFA__73_6F_66_74         ; 45B9
_TRADE_2DMARK:   ; 4659 - None
   call $02e4    ; $4659 cd e4 02
   .word _CLS             ; $465c 2F76 - CLS
   .word _LIT             ; $465e 0A2B - LIT
   .word $000E            ; $4660 000E
   .word __6C_65_6A_64_69 ; $4662 444A - lejdi
   .word _CR              ; $4664 1566 - CR
   .word _CR              ; $4666 1566 - CR
   .word _LIT             ; $4668 0A2B - LIT
   .word $0006            ; $466a 0006
   .word __2B             ; $466c 044A - +
   .word __74_75_66_65_6C_78; $466e 4546 - tufelx
   .word _CR              ; $4670 1566 - CR
   .word _CR              ; $4672 1566 - CR
   .word _CR              ; $4674 1566 - CR
   .word _LIT             ; $4676 0A2B - LIT
   .word $0003            ; $4678 0003
   .word __2D             ; $467a 0455 - -
   .word __73_6F_66_74    ; $467c 45C0 - soft
   .word _GUM             ; $467e 3089 - GUM
   .word _LIT             ; $4680 0A2B - LIT
   .word $0036            ; $4682 0036
   .word _LIT             ; $4684 0A2B - LIT
   .word $0025            ; $4686 0025
   .word _PLOT            ; $4688 335F - PLOT
   .word _LIT             ; $468a 0A2B - LIT
   .word $003A            ; $468c 003A
   .word _LIT             ; $468e 0A2B - LIT
   .word $0025            ; $4690 0025
   .word _PLOT            ; $4692 335F - PLOT
   .word _LIT             ; $4694 0A2B - LIT
   .word $0036            ; $4696 0036
   .word _LIT             ; $4698 0A2B - LIT
   .word $002B            ; $469a 002B
   .word _PLOT            ; $469c 335F - PLOT
   .word _0               ; $469e 0EC8 - 0
   .word $304D            ; $46a0 304D
   .word _0               ; $46a2 0EC8 - 0
   .word $3059            ; $46a4 3059
   .word _PEN             ; $46a6 307A - PEN
   .word _LIT             ; $46a8 0A2B - LIT
   .word _CR              ; $46aa 1566 - CR
   .word _LIT             ; $46ac 0A2B - LIT
   .word $0D7B            ; $46ae 0D7B
   .word __21             ; $46b0 099D - !
   .word _LIT             ; $46b2 0A2B - LIT
   .word $9C40            ; $46b4 9C40
   .word _0               ; $46b6 0EC8 - 0
   .word __28DO_29        ; $46b8 0AE5 - (DO)
   .word $46C0            ; $46ba 46C0
   .word __28LOOP_29      ; $46bc 0B2E - (LOOP)
   .word $46BC            ; $46be 46BC
   .word _CLS             ; $46c0 2F76 - CLS
   .word _EXIT            ; $46c2 0315 - EXIT

.end
