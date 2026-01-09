; Форт

.target "8080"
.format "bin"
.org 0x0000
.storage 0x0100,0x00

   jmp l0106     ; $0100 c3 06 01
   jmp l0140     ; $0103 c3 40 01
l0106:
   lxi d,l019e   ; $0106 11 9e 01
   lxi h,l3448   ; $0109 21 48 34
   mvi b,$11     ; $010c 06 11   
l010e:
   ldax d        ; $010e 1a      
   mov m,a       ; $010f 77      
   inx h         ; $0110 23      
   inx d         ; $0111 13      
   dcr b         ; $0112 05      
   jnz l010e     ; $0113 c2 0e 01
   mvi b,$1a     ; $0116 06 1a   
   lxi h,$3400   ; $0118 21 00 34
   sub a         ; $011b 97      
l011c:
   mov m,a       ; $011c 77      
   inx h         ; $011d 23      
   dcr b         ; $011e 05      
   jnz l011c     ; $011f c2 1c 01
   lhld $02d0    ; $0122 2a d0 02
   shld $341a    ; $0125 22 1a 34
   lhld $02d2    ; $0128 2a d2 02
   shld $341c    ; $012b 22 1c 34
   lhld $02d4    ; $012e 2a d4 02
   shld $3420    ; $0131 22 20 34
   lhld $02d6    ; $0134 2a d6 02
   shld $3424    ; $0137 22 24 34
   lhld $02d8    ; $013a 2a d8 02
   jmp $0d44     ; $013d c3 44 0d
l0140:
   lhld $341c    ; $0140 2a 1c 34
   sphl          ; $0143 f9      
   lhld $341a    ; $0144 2a 1a 34
   shld $341e    ; $0147 22 1e 34
   lxi b,$015a   ; $014a 01 5a 01
   jmp $02ef     ; $014d c3 ef 02

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
   dcx h         ; $015a 2b      
   ldax b        ; $015b 0a      
   .byte $18     ; $015c 18      
   inr m         ; $015d 34      
   add h         ; $015e 84      
   dad b         ; $015f 09      
   rpo           ; $0160 e0      
   inx b         ; $0161 03      
   mov a,d       ; $0162 7a      
   ldax b        ; $0163 0a      
   mov l,d       ; $0164 6a      
   lxi b,$032c   ; $0165 01 2c 03
   dcr d         ; $0168 15      
   inx b         ; $0169 03      
   lhld $7816    ; $016a 2a 16 78
   dcr c         ; $016d 0d      
   ani $0e       ; $016e e6 0e   
   rnz           ; $0170 c0      
   stax b        ; $0171 02      
   sbb l         ; $0172 9d      
   dad b         ; $0173 09      
   sub h         ; $0174 94      
   mvi d,$a4     ; $0175 16 a4   
   .byte 0x10    ; $0177 10      
l0178:
   .word _LIT,$6574
   adc h         ; $017c 8c      
   lhld $099d    ; $017d 2a 9d 09
   dcx h         ; $0180 2b      
   ldax b        ; $0181 0a      
   adc h         ; $0182 8c      
   mov m,l       ; $0183 75      
   sbb d         ; $0184 9a      
   lhld $099d    ; $0185 2a 9d 09
   mov c,b       ; $0188 48      
   dcx h         ; $0189 2b      
   mov l,b       ; $018a 68      
   ldax b        ; $018b 0a      
   mov e,d       ; $018c 5a      
   lxi b,$2086   ; $018d 01 86 20
   add m         ; $0190 86      
   .byte 0x20    ; $0191 20      
   add m         ; $0192 86      
   .byte 0x20    ; $0193 20      
   ani $0e       ; $0194 e6 0e   
   rnz           ; $0196 c0      
   stax b        ; $0197 02      
   sbb l         ; $0198 9d      
   dad b         ; $0199 09      
   sub h         ; $019a 94      
   mvi d,$a4     ; $019b 16 a4   
   .byte 0x10    ; $019d 10      
l019e:
   .byte 5, "FORTH"
   .word 0x0000
_FORTH:
   call $1b95    ; $01a6 cd 95 1b
   lxi b,$8680   ; $01a9 01 80 86
   mov b,e       ; $01ac 43      
   nop           ; $01ad 00      
   nop           ; $01ae 00      
   stax b        ; $01af 02      
   mov d,d       ; $01b0 52      
   .byte 0x30    ; $01b1 30      
   mov c,b       ; $01b2 48      
   inr m         ; $01b3 34      
   call $0984    ; $01b4 cd 84 09
   ldax d        ; $01b7 1a      
   inr m         ; $01b8 34      
   stax b        ; $01b9 02      
   mov d,e       ; $01ba 53      
   .byte 0x30    ; $01bb 30      
   xra a         ; $01bc af      
   lxi b,$84cd   ; $01bd 01 cd 84
   dad b         ; $01c0 09      
   inr e         ; $01c1 1c      
   inr m         ; $01c2 34      
   stax b        ; $01c3 02      
   mov d,d       ; $01c4 52      
   mov d,b       ; $01c5 50      
   cmp c         ; $01c6 b9      
   lxi b,$84cd   ; $01c7 01 cd 84
   dad b         ; $01ca 09      
   mvi e,$34     ; $01cb 1e 34   
   lxi b,$c348   ; $01cd 01 48 c3
   lxi b,$84cd   ; $01d0 01 cd 84
   dad b         ; $01d3 09      
   .byte 0x20    ; $01d4 20      
   inr m         ; $01d5 34      
l01d6:
   .byte 8,"VOC-LINK"
   .word 0x01cd
_VOC_2DLINK:
   call $0984
   .word $3422

   .byte 5,"FENCE"
   .word $01d6
_FENCE:
   call $0984    ; $01ee cd 84 09
   .word $3424

   .byte 6,"W-LINK"
   .word $01e6
_W_2DLINK:
   call $0984    ; $01fc cd 84 09
   .word $3426

   inr b         ; $0201 04      
   mov b,d       ; $0202 42      
   mov b,c       ; $0203 41      
   mov d,e       ; $0204 53      
   mov b,l       ; $0205 45      
   ani $01       ; $0206 e6 01   
   call $0984    ; $0208 cd 84 09
   .byte 0x28    ; $020b 28      
   inr m         ; $020c 34      
   dcr b         ; $020d 05      
   mov d,e       ; $020e 53      
   mov d,h       ; $020f 54      
   mov b,c       ; $0210 41      
   mov d,h       ; $0211 54      
   mov b,l       ; $0212 45      
   lxi b,$cd02   ; $0213 01 02 cd
   add h         ; $0216 84      
   dad b         ; $0217 09      
   lhld $0734    ; $0218 2a 34 07
   mov b,e       ; $021b 43      
   mov c,a       ; $021c 4f      
   mov c,m       ; $021d 4e      
   mov d,h       ; $021e 54      
   mov b,l       ; $021f 45      
   mov e,b       ; $0220 58      
   mov d,h       ; $0221 54      
   dcr c         ; $0222 0d      
   stax b        ; $0223 02      
   call $0984    ; $0224 cd 84 09
   inr l         ; $0227 2c      
   inr m         ; $0228 34      
   rlc           ; $0229 07      
   mov b,e       ; $022a 43      
   mov d,l       ; $022b 55      
   mov d,d       ; $022c 52      
   mov d,d       ; $022d 52      
   mov b,l       ; $022e 45      
   mov c,m       ; $022f 4e      
   mov d,h       ; $0230 54      
   ldax d        ; $0231 1a      
   stax b        ; $0232 02      
   call $0984    ; $0233 cd 84 09
   mvi l,$34     ; $0236 2e 34   
   inx b         ; $0238 03      
   mov b,h       ; $0239 44      
   mov d,b       ; $023a 50      
   mov c,h       ; $023b 4c      
   dad h         ; $023c 29      
   stax b        ; $023d 02      
   call $0984    ; $023e cd 84 09
   .byte 0x30    ; $0241 30      
   inr m         ; $0242 34      
   inx b         ; $0243 03      
   mov c,b       ; $0244 48      
   mov c,h       ; $0245 4c      
   mov b,h       ; $0246 44      
   .byte 0x38    ; $0247 38      
   stax b        ; $0248 02      
   call $0984    ; $0249 cd 84 09
   sta $0334     ; $024c 32 34 03
   mov b,e       ; $024f 43      
   mov d,e       ; $0250 53      
   mov d,b       ; $0251 50      
   mov b,e       ; $0252 43      
   stax b        ; $0253 02      
   call $0984    ; $0254 cd 84 09
   inr m         ; $0257 34      
   inr m         ; $0258 34      
   inx b         ; $0259 03      
   mov c,c       ; $025a 49      
   mov c,m       ; $025b 4e      
   mov b,d       ; $025c 42      
   mov c,m       ; $025d 4e      
   stax b        ; $025e 02      
   call $0984    ; $025f cd 84 09
   mvi m,$34     ; $0262 36 34   
   inr b         ; $0264 04      
   inx h         ; $0265 23      
   mov d,h       ; $0266 54      
   mov c,c       ; $0267 49      
   mov b,d       ; $0268 42      
   mov c,m       ; $0269 4e      
   stax b        ; $026a 02      
   call $0984    ; $026b cd 84 09
   .byte 0x38    ; $026e 38      
   inr m         ; $026f 34      
   inx b         ; $0270 03      
   mvi a,$49     ; $0271 3e 49   
   mov c,m       ; $0273 4e      
   mov h,h       ; $0274 64      
   stax b        ; $0275 02      
   call $0984    ; $0276 cd 84 09
   lda $0434     ; $0279 3a 34 04
   mov c,a       ; $027c 4f      
   mov d,l       ; $027d 55      
   mov d,h       ; $027e 54      
   mov b,d       ; $027f 42      
   mov m,b       ; $0280 70      
   stax b        ; $0281 02      
   call $0984    ; $0282 cd 84 09
   inr a         ; $0285 3c      
   inr m         ; $0286 34      
   inr b         ; $0287 04      
   inx h         ; $0288 23      
   mov d,h       ; $0289 54      
   mov c,a       ; $028a 4f      
   mov b,d       ; $028b 42      
   mov m,b       ; $028c 70      
   stax b        ; $028d 02      
   call $0984    ; $028e cd 84 09
   mvi a,$34     ; $0291 3e 34   
   inr b         ; $0293 04      
   mov d,e       ; $0294 53      
   mov d,b       ; $0295 50      
   mov b,c       ; $0296 41      
   mov c,m       ; $0297 4e      
   mov m,b       ; $0298 70      
   stax b        ; $0299 02      
   call $0984    ; $029a cd 84 09
   mov b,b       ; $029d 40      
   inr m         ; $029e 34      
   inr b         ; $029f 04      
   mvi a,$4f     ; $02a0 3e 4f   
   mov d,l       ; $02a2 55      
   mov d,h       ; $02a3 54      
   sub e         ; $02a4 93      
   stax b        ; $02a5 02      
   call $0984    ; $02a6 cd 84 09
   mov b,d       ; $02a9 42      
   inr m         ; $02aa 34      
   inx b         ; $02ab 03      
   mov b,d       ; $02ac 42      
   mov c,h       ; $02ad 4c      
   mov c,e       ; $02ae 4b      
   sbb a         ; $02af 9f      
   stax b        ; $02b0 02      
   call $0984    ; $02b1 cd 84 09
   mov b,h       ; $02b4 44      
   inr m         ; $02b5 34      
   rlc           ; $02b6 07      
   mov d,a       ; $02b7 57      
   mov b,c       ; $02b8 41      
   mov d,d       ; $02b9 52      
   mov c,m       ; $02ba 4e      
   mov c,c       ; $02bb 49      
   mov c,m       ; $02bc 4e      
   mov b,a       ; $02bd 47      
   xra e         ; $02be ab      
   stax b        ; $02bf 02      
   call $0984    ; $02c0 cd 84 09
   mov b,m       ; $02c3 46      
   inr m         ; $02c4 34      
   inx b         ; $02c5 03      
   mov d,h       ; $02c6 54      
   mov c,c       ; $02c7 49      
   mov b,d       ; $02c8 42      
   ora m         ; $02c9 b6      
   stax b        ; $02ca 02      
   call $0984    ; $02cb cd 84 09
   sbb l         ; $02ce 9d      
   inr m         ; $02cf 34      
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
   inr b         ; $02da 04 ;COLD

   mov b,e       ; $02db 43      
   mov c,a       ; $02dc 4f      
   mov c,h       ; $02dd 4c      
   mov b,h       ; $02de 44      
   push b        ; $02df c5      
   stax b        ; $02e0 02      
   jmp $0106     ; $02e1 c3 06 01
l02e4:
   lhld $341e    ; $02e4 2a 1e 34
   dcx h         ; $02e7 2b      
   mov m,b       ; $02e8 70      
   dcx h         ; $02e9 2b      
   mov m,c       ; $02ea 71      
   shld $341e    ; $02eb 22 1e 34
   pop b         ; $02ee c1      
   ldax b        ; $02ef 0a      
   mov l,a       ; $02f0 6f      
   inx b         ; $02f1 03      
   ldax b        ; $02f2 0a      
   mov h,a       ; $02f3 67      
   inx b         ; $02f4 03      
   pchl          ; $02f5 e9      
l02f6:
   .byte 4,"NEXT"
   .word 0x02da
_NEXT:
   call $0984
   .word $02ef
l0302:
   .byte 4,"CALL"
   .word $02f6
_CALL:
   call $0984    ; $0309 cd 84 09
   .word $02e4

   .byte 4,"EXIT"
   stax b        ; $0313 02      
   inx b         ; $0314 03      
_EXIT:
   lhld $341e    ; $0315 2a 1e 34
   mov c,m       ; $0318 4e      
   inx h         ; $0319 23      
   mov b,m       ; $031a 46      
   inx h         ; $031b 23      
   shld $341e    ; $031c 22 1e 34
   jmp $02ef     ; $031f c3 ef 02

   .byte 7,"EXECUTE"
   mvi c,$03     ; $032a 0e 03   
_EXECUTE:
   ret           ; $032c c9      

   .byte 7,"ASMCALL"
;   .word
_ASMCALL:
   shld $2a03    ; $0335 22 03 2a
   mvi e,$34     ; $0338 1e 34   
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

   .byte 4,"OVER"
   .word $0322
_OVER:
   pop h
   pop d         ; $0363 d1      
   push d        ; $0364 d5      
   push h        ; $0365 e5      
   push d        ; $0366 d5      
   jmp $02ef     ; $0367 c3 ef 02

   .byte 4,"PICK"
   .word $035b
_PICK:
   pop h         ; $0371 e1      
   dad h         ; $0372 29      
   dad sp        ; $0373 39      
   mov e,m       ; $0374 5e      
   inx h         ; $0375 23      
   mov d,m       ; $0376 56      
   push d        ; $0377 d5      
   jmp $02ef     ; $0378 c3 ef 02

   .byte 4,"DROP"
   .word $036a
_DROP:
   pop h         ; $0382 e1      
   jmp $02ef     ; $0383 c3 ef 02

   .byte 4,"SWAP"
   .word $037b
_SWAP:
   pop h         ; $038d e1      
   xthl          ; $038e e3      
   push h        ; $038f e5      
   jmp $02ef     ; $0390 c3 ef 02

   .byte 5,"2SWAP"
   .word $0386
_2SWAP:
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

   .byte 3,"ROT"
   .word $0393
_ROT:
   pop d         ; $03b6 d1      
   pop h         ; $03b7 e1      
   xthl          ; $03b8 e3      
   push d        ; $03b9 d5      
   push h        ; $03ba e5      
   jmp $02ef     ; $03bb c3 ef 02

   .byte 4,"-ROT"
   .word $03b0
__2DROT:
   pop h         ; $03c5 e1      
   pop d         ; $03c6 d1      
   xthl          ; $03c7 e3      
   push h        ; $03c8 e5      
   push d        ; $03c9 d5      
   jmp $02ef     ; $03ca c3 ef 02

   inx b         ; $03cd 03      
   mov b,h       ; $03ce 44      
   mov d,l       ; $03cf 55      
   mov d,b       ; $03d0 50      
   cmp m         ; $03d1 be      
   inx b         ; $03d2 03      
   pop h         ; $03d3 e1      
   push h        ; $03d4 e5      
   push h        ; $03d5 e5      
   jmp $02ef     ; $03d6 c3 ef 02
   inr b         ; $03d9 04      
   cmc           ; $03da 3f      
   mov b,h       ; $03db 44      
   mov d,l       ; $03dc 55      
   mov d,b       ; $03dd 50      
   call $e103    ; $03de cd 03 e1
   push h        ; $03e1 e5      
   mov a,h       ; $03e2 7c      
   ora l         ; $03e3 b5      
   jz $02ef      ; $03e4 ca ef 02
   push h        ; $03e7 e5      
   jmp $02ef     ; $03e8 c3 ef 02
   inr b         ; $03eb 04      
   sta $5544     ; $03ec 32 44 55
   mov d,b       ; $03ef 50      
   .byte 0xd9    ; $03f0 d9      
   inx b         ; $03f1 03      
   pop h         ; $03f2 e1      
   pop d         ; $03f3 d1      
   push d        ; $03f4 d5      
   push h        ; $03f5 e5      
   push d        ; $03f6 d5      
   push h        ; $03f7 e5      
   jmp $02ef     ; $03f8 c3 ef 02
   dcr b         ; $03fb 05      
   sta $5244     ; $03fc 32 44 52
   mov c,a       ; $03ff 4f      
   mov d,b       ; $0400 50      
   xchg          ; $0401 eb      
   inx b         ; $0402 03      
   pop d         ; $0403 d1      
   pop d         ; $0404 d1      
   jmp $02ef     ; $0405 c3 ef 02
   dcr b         ; $0408 05      
   mov d,b       ; $0409 50      
   mov d,d       ; $040a 52      
   mov b,l       ; $040b 45      
   mov d,e       ; $040c 53      
   mov d,e       ; $040d 53      
   ei            ; $040e fb      
   inx b         ; $040f 03      
   pop h         ; $0410 e1      
   xthl          ; $0411 e3      
   jmp $02ef     ; $0412 c3 ef 02
   dcr b         ; $0415 05      
   sta $564f     ; $0416 32 4f 56
   mov b,l       ; $0419 45      
   mov d,d       ; $041a 52      
   .byte 0x08    ; $041b 08      
   inr b         ; $041c 04      
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
   inx b         ; $042d 03      
   mov d,e       ; $042e 53      
   mov d,b       ; $042f 50      
   mov b,b       ; $0430 40      
   dcr d         ; $0431 15      
   inr b         ; $0432 04      
   lxi h,$0000   ; $0433 21 00 00
   dad sp        ; $0436 39      
   push h        ; $0437 e5      
   jmp $02ef     ; $0438 c3 ef 02
   inx b         ; $043b 03      
   mov d,e       ; $043c 53      
   mov d,b       ; $043d 50      
   lxi h,$042d   ; $043e 21 2d 04
   pop h         ; $0441 e1      
   sphl          ; $0442 f9      
   jmp $02ef     ; $0443 c3 ef 02
   lxi b,$3b2b   ; $0446 01 2b 3b
   inr b         ; $0449 04      
   pop h         ; $044a e1      
   pop d         ; $044b d1      
   dad d         ; $044c 19      
   push h        ; $044d e5      
   jmp $02ef     ; $044e c3 ef 02
   lxi b,$462d   ; $0451 01 2d 46
   inr b         ; $0454 04      
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
   mvi b,$4e     ; $0461 06 4e   
   mov b,l       ; $0463 45      
   mov b,a       ; $0464 47      
   mov b,c       ; $0465 41      
   mov d,h       ; $0466 54      
   mov b,l       ; $0467 45      
   mov d,c       ; $0468 51      
   inr b         ; $0469 04      
   pop h         ; $046a e1      
   call $058c    ; $046b cd 8c 05
   push h        ; $046e e5      
   jmp $02ef     ; $046f c3 ef 02
   stax b        ; $0472 02      
   lxi sp,$612b  ; $0473 31 2b 61
   inr b         ; $0476 04      
   pop h         ; $0477 e1      
   inx h         ; $0478 23      
   push h        ; $0479 e5      
   jmp $02ef     ; $047a c3 ef 02
   stax b        ; $047d 02      
   sta $722b     ; $047e 32 2b 72
   inr b         ; $0481 04      
   pop h         ; $0482 e1      
   inx h         ; $0483 23      
   inx h         ; $0484 23      
   push h        ; $0485 e5      
   jmp $02ef     ; $0486 c3 ef 02
   stax b        ; $0489 02      
   lxi sp,$7d2d  ; $048a 31 2d 7d
   inr b         ; $048d 04      
   pop h         ; $048e e1      
   dcx h         ; $048f 2b      
   push h        ; $0490 e5      
   jmp $02ef     ; $0491 c3 ef 02
   stax b        ; $0494 02      
   sta $892d     ; $0495 32 2d 89
   inr b         ; $0498 04      
   pop h         ; $0499 e1      
   dcx h         ; $049a 2b      
   dcx h         ; $049b 2b      
   push h        ; $049c e5      
   jmp $02ef     ; $049d c3 ef 02
   stax b        ; $04a0 02      
   sta $942a     ; $04a1 32 2a 94
   inr b         ; $04a4 04      
   pop h         ; $04a5 e1      
   dad h         ; $04a6 29      
   push h        ; $04a7 e5      
   jmp $02ef     ; $04a8 c3 ef 02
   inx b         ; $04ab 03      
   mov b,c       ; $04ac 41      
   mov b,d       ; $04ad 42      
   mov d,e       ; $04ae 53      
   ana b         ; $04af a0      
   inr b         ; $04b0 04      
   pop h         ; $04b1 e1      
   mov a,h       ; $04b2 7c      
   ora a         ; $04b3 b7      
   cm $058c      ; $04b4 fc 8c 05
   push h        ; $04b7 e5      
   jmp $02ef     ; $04b8 c3 ef 02
   inx b         ; $04bb 03      
   mov c,l       ; $04bc 4d      
   mov c,c       ; $04bd 49      
   mov c,m       ; $04be 4e      
   xra e         ; $04bf ab      
   inr b         ; $04c0 04      
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
   inx b         ; $04d8 03      
   mov c,l       ; $04d9 4d      
   mov b,c       ; $04da 41      
   mov e,b       ; $04db 58      
   cmp e         ; $04dc bb      
   inr b         ; $04dd 04      
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
   stax b        ; $04f5 02      
   mov d,l       ; $04f6 55      
   inr a         ; $04f7 3c      
   rc            ; $04f8 d8      
   inr b         ; $04f9 04      
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
   lxi b,$f53c   ; $050b 01 3c f5
   inr b         ; $050e 04      
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
   lxi b,$0b3e   ; $052f 01 3e 0b
   dcr b         ; $0532 05      
   pop d         ; $0533 d1      
   pop h         ; $0534 e1      
   jmp $0511     ; $0535 c3 11 05
   stax b        ; $0538 02      
   .byte 0x30    ; $0539 30      
   inr a         ; $053a 3c      
   cma           ; $053b 2f      
   dcr b         ; $053c 05      
   pop h         ; $053d e1      
   mov a,h       ; $053e 7c      
   lxi h,$0000   ; $053f 21 00 00
   ora a         ; $0542 b7      
   jp $0547      ; $0543 f2 47 05
   dcx h         ; $0546 2b      
   push h        ; $0547 e5      
   jmp $02ef     ; $0548 c3 ef 02
   stax b        ; $054b 02      
   .byte 0x30    ; $054c 30      
   mvi a,$38     ; $054d 3e 38   
   dcr b         ; $054f 05      
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
   lxi b,$4b3d   ; $0562 01 3d 4b
   dcr b         ; $0565 05      
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
   stax b        ; $0579 02      
   .byte 0x30    ; $057a 30      
   dcr a         ; $057b 3d      
   mov h,d       ; $057c 62      
   dcr b         ; $057d 05      
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
   dad b         ; $0594 09      
   dcr l         ; $0595 2d      
   mov d,h       ; $0596 54      
   mov d,d       ; $0597 52      
   mov b,c       ; $0598 41      
   mov c,c       ; $0599 49      
   mov c,h       ; $059a 4c      
   mov c,c       ; $059b 49      
   mov c,m       ; $059c 4e      
   mov b,a       ; $059d 47      
   mov a,c       ; $059e 79      
   dcr b         ; $059f 05      
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
   stax b        ; $05b8 02      
   sta $942f     ; $05b9 32 2f 94
   dcr b         ; $05bc 05      
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
   stax b        ; $05ca 02      
   mov b,h       ; $05cb 44      
   dcx h         ; $05cc 2b      
   cmp b         ; $05cd b8      
   dcr b         ; $05ce 05      
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
   stax b        ; $05df 02      
   mov b,h       ; $05e0 44      
   inr a         ; $05e1 3c      
   jz $d105      ; $05e2 ca 05 d1
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
   rlc           ; $0616 07      
   mov b,h       ; $0617 44      
   mov c,m       ; $0618 4e      
   mov b,l       ; $0619 45      
   mov b,a       ; $061a 47      
   mov b,c       ; $061b 41      
   mov d,h       ; $061c 54      
   mov b,l       ; $061d 45      
   rst 3         ; $061e df      
   dcr b         ; $061f 05      
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
   dcr b         ; $0635 05      
   dcr l         ; $0636 2d      
   mov d,h       ; $0637 54      
   mov b,l       ; $0638 45      
   mov e,b       ; $0639 58      
   mov d,h       ; $063a 54      
   mvi d,$06     ; $063b 16 06   
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
   inr b         ; $066a 04      
   mov d,d       ; $066b 52      
   mov c,a       ; $066c 4f      
   mov c,h       ; $066d 4c      
   mov c,h       ; $066e 4c      
   mvi d,$06     ; $066f 16 06   
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
   lxi b,$6a2a   ; $0697 01 2a 6a
   mvi b,$60     ; $069a 06 60   
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
   inx b         ; $06c1 03      
   mov d,l       ; $06c2 55      
   mov c,l       ; $06c3 4d      
   lhld $0697    ; $06c4 2a 97 06
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
   mvi b,$44     ; $06f0 06 44   
   mov d,l       ; $06f2 55      
   cma           ; $06f3 2f      
   mov c,l       ; $06f4 4d      
   mov c,a       ; $06f5 4f      
   mov b,h       ; $06f6 44      
   pop b         ; $06f7 c1      
   mvi b,$21     ; $06f8 06 21   
   mov c,e       ; $06fa 4b      
   dcr m         ; $06fb 35      
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
   inr b         ; $07db 04      
   cma           ; $07dc 2f      
   mov c,l       ; $07dd 4d      
   mov c,a       ; $07de 4f      
   mov b,h       ; $07df 44      
   rp            ; $07e0 f0      
   mvi b,$e1     ; $07e1 06 e1   
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
   dcr b         ; $0823 05      
   mov d,l       ; $0824 55      
   cma           ; $0825 2f      
   mov c,l       ; $0826 4d      
   mov c,a       ; $0827 4f      
   mov b,h       ; $0828 44      
   in $07        ; $0829 db 07   
   pop h         ; $082b e1      
   pop d         ; $082c d1      
   push b        ; $082d c5      
   call $07ad    ; $082e cd ad 07
   pop b         ; $0831 c1      
   push d        ; $0832 d5      
   push h        ; $0833 e5      
   jmp $02ef     ; $0834 c3 ef 02
   dcr b         ; $0837 05      
   cmc           ; $0838 3f      
   mov d,a       ; $0839 57      
   mov c,a       ; $083a 4f      
   mov d,d       ; $083b 52      
   mov b,h       ; $083c 44      
   inx h         ; $083d 23      
   .byte 0x08    ; $083e 08      
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
   dcr b         ; $088b 05      
   mov b,h       ; $088c 44      
   mov c,c       ; $088d 49      
   mov b,a       ; $088e 47      
   mov c,c       ; $088f 49      
   mov d,h       ; $0890 54      
   inx h         ; $0891 23      
   .byte 0x08    ; $0892 08      
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
   inx b         ; $08c2 03      
   mov b,c       ; $08c3 41      
   mov c,m       ; $08c4 4e      
   mov b,h       ; $08c5 44      
   adc e         ; $08c6 8b      
   .byte 0x08    ; $08c7 08      
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
   stax b        ; $08d4 02      
   mov c,a       ; $08d5 4f      
   mov d,d       ; $08d6 52      
   jnz $e108     ; $08d7 c2 08 e1
   pop d         ; $08da d1      
   mov a,e       ; $08db 7b      
   ora l         ; $08dc b5      
   mov l,a       ; $08dd 6f      
   mov a,d       ; $08de 7a      
   ora h         ; $08df b4      
   mov h,a       ; $08e0 67      
   push h        ; $08e1 e5      
   jmp $02ef     ; $08e2 c3 ef 02
   inx b         ; $08e5 03      
   mov e,b       ; $08e6 58      
   mov c,a       ; $08e7 4f      
   mov d,d       ; $08e8 52      
   cnc $e108     ; $08e9 d4 08 e1
   pop d         ; $08ec d1      
   mov a,e       ; $08ed 7b      
   xra l         ; $08ee ad      
   mov l,a       ; $08ef 6f      
   mov a,d       ; $08f0 7a      
   xra h         ; $08f1 ac      
   mov h,a       ; $08f2 67      
   push h        ; $08f3 e5      
   jmp $02ef     ; $08f4 c3 ef 02
   inx b         ; $08f7 03      
   mov c,m       ; $08f8 4e      
   mov c,a       ; $08f9 4f      
   mov d,h       ; $08fa 54      
   push h        ; $08fb e5      
   .byte 0x08    ; $08fc 08      
   pop h         ; $08fd e1      
   mov a,h       ; $08fe 7c      
   cma           ; $08ff 2f      
   mov h,a       ; $0900 67      
   mov a,l       ; $0901 7d      
   cma           ; $0902 2f      
   mov l,a       ; $0903 6f      
   push h        ; $0904 e5      
   jmp $02ef     ; $0905 c3 ef 02
   stax b        ; $0908 02      
   mvi a,$52     ; $0909 3e 52   
   rst 6         ; $090b f7      
   .byte 0x08    ; $090c 08      
   pop d         ; $090d d1      
   lhld $341e    ; $090e 2a 1e 34
   dcx h         ; $0911 2b      
   mov m,d       ; $0912 72      
   dcx h         ; $0913 2b      
   mov m,e       ; $0914 73      
   shld $341e    ; $0915 22 1e 34
   jmp $02ef     ; $0918 c3 ef 02
   stax b        ; $091b 02      
   mov d,d       ; $091c 52      
   mvi a,$08     ; $091d 3e 08   
   dad b         ; $091f 09      
   lhld $341e    ; $0920 2a 1e 34
   mov e,m       ; $0923 5e      
   inx h         ; $0924 23      
   mov d,m       ; $0925 56      
   inx h         ; $0926 23      
   push d        ; $0927 d5      
   shld $341e    ; $0928 22 1e 34
   jmp $02ef     ; $092b c3 ef 02
   stax b        ; $092e 02      
   mov d,d       ; $092f 52      
   mov b,b       ; $0930 40      
   dcx d         ; $0931 1b      
   dad b         ; $0932 09      
   lhld $341e    ; $0933 2a 1e 34
   mov e,m       ; $0936 5e      
   inx h         ; $0937 23      
   mov d,m       ; $0938 56      
   push d        ; $0939 d5      
   jmp $02ef     ; $093a c3 ef 02
   inx b         ; $093d 03      
   mov d,d       ; $093e 52      
   mov d,b       ; $093f 50      
   mov b,b       ; $0940 40      
   mvi l,$09     ; $0941 2e 09   
   lhld $341e    ; $0943 2a 1e 34
   push h        ; $0946 e5      
   jmp $02ef     ; $0947 c3 ef 02
   inx b         ; $094a 03      
   mov d,d       ; $094b 52      
   mov d,b       ; $094c 50      
   lxi h,$093d   ; $094d 21 3d 09
   pop h         ; $0950 e1      
   shld $341e    ; $0951 22 1e 34
   jmp $02ef     ; $0954 c3 ef 02
   dcr b         ; $0957 05      
   mov d,d       ; $0958 52      
   mov d,b       ; $0959 50      
   mov c,c       ; $095a 49      
   mov b,e       ; $095b 43      
   mov c,e       ; $095c 4b      
   mov c,d       ; $095d 4a      
   dad b         ; $095e 09      
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
   dcr b         ; $096d 05      
   mov d,d       ; $096e 52      
   mov b,h       ; $096f 44      
   mov d,d       ; $0970 52      
   mov c,a       ; $0971 4f      
   mov d,b       ; $0972 50      
   mov d,a       ; $0973 57      
   dad b         ; $0974 09      
   lhld $341e    ; $0975 2a 1e 34
   inx h         ; $0978 23      
   inx h         ; $0979 23      
   shld $341e    ; $097a 22 1e 34
   jmp $02ef     ; $097d c3 ef 02
   lxi b,$6d40   ; $0980 01 40 6d
   dad b         ; $0983 09      
   pop h         ; $0984 e1      
   mov e,m       ; $0985 5e      
   inx h         ; $0986 23      
   mov d,m       ; $0987 56      
   push d        ; $0988 d5      
   jmp $02ef     ; $0989 c3 ef 02
   stax b        ; $098c 02      
   mov b,e       ; $098d 43      
   mov b,b       ; $098e 40      
   add b         ; $098f 80      
   dad b         ; $0990 09      
   pop h         ; $0991 e1      
   mov e,m       ; $0992 5e      
   mvi d,$00     ; $0993 16 00   
   push d        ; $0995 d5      
   jmp $02ef     ; $0996 c3 ef 02
   lxi b,$8c21   ; $0999 01 21 8c
   dad b         ; $099c 09      
   pop h         ; $099d e1      
   pop d         ; $099e d1      
   mov m,e       ; $099f 73      
   inx h         ; $09a0 23      
   mov m,d       ; $09a1 72      
   jmp $02ef     ; $09a2 c3 ef 02
   stax b        ; $09a5 02      
   mov b,e       ; $09a6 43      
   lxi h,$0999   ; $09a7 21 99 09
   pop h         ; $09aa e1      
   pop d         ; $09ab d1      
   mov m,e       ; $09ac 73      
   jmp $02ef     ; $09ad c3 ef 02
   stax b        ; $09b0 02      
   sta $a521     ; $09b1 32 21 a5
   dad b         ; $09b4 09      
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
   stax b        ; $09c2 02      
   sta $b040     ; $09c3 32 40 b0
   dad b         ; $09c6 09      
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
   stax b        ; $09d5 02      
   dcx h         ; $09d6 2b      
   lxi h,$09c2   ; $09d7 21 c2 09
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
   stax b        ; $09e6 02      
   dcr l         ; $09e7 2d      
   lxi h,$09d5   ; $09e8 21 d5 09
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
   stax b        ; $09f7 02      
   .byte 0x30    ; $09f8 30      
   lxi h,$09e6   ; $09f9 21 e6 09
   sub a         ; $09fc 97      
   pop h         ; $09fd e1      
   mov m,a       ; $09fe 77      
   inx h         ; $09ff 23      
   mov m,a       ; $0a00 77      
   jmp $02ef     ; $0a01 c3 ef 02
   inx b         ; $0a04 03      
   lxi sp,$212b  ; $0a05 31 2b 21
   rst 6         ; $0a08 f7      
   dad b         ; $0a09 09      
   pop h         ; $0a0a e1      
   inr m         ; $0a0b 34      
   jnz $02ef     ; $0a0c c2 ef 02
   inx h         ; $0a0f 23      
   inr m         ; $0a10 34      
   jmp $02ef     ; $0a11 c3 ef 02
   inx b         ; $0a14 03      
   lxi sp,$212d  ; $0a15 31 2d 21
   inr b         ; $0a18 04      
   ldax b        ; $0a19 0a      
   pop h         ; $0a1a e1      
   mov e,m       ; $0a1b 5e      
   inx h         ; $0a1c 23      
   mov d,m       ; $0a1d 56      
   dcx d         ; $0a1e 1b      
   mov m,d       ; $0a1f 72      
   dcx h         ; $0a20 2b      
   mov m,e       ; $0a21 73      
   jmp $02ef     ; $0a22 c3 ef 02

   .byte 3,"LIT"
   .word $0a14
_LIT:
   ldax b        ; $0a2b 0a      
   mov l,a       ; $0a2c 6f      
   inx b         ; $0a2d 03      
   ldax b        ; $0a2e 0a      
   mov h,a       ; $0a2f 67      
   inx b         ; $0a30 03      
   push h        ; $0a31 e5      
   jmp $02ef     ; $0a32 c3 ef 02

   inr b         ; $0a35 04      
   mov b,h       ; $0a36 44      
   mov c,h       ; $0a37 4c      
   mov c,c       ; $0a38 49      
   mov d,h       ; $0a39 54      
   dcr h         ; $0a3a 25      
   ldax b        ; $0a3b 0a      
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
   inx b         ; $0a4d 03      
   .byte 0x28    ; $0a4e 28      
   shld $3529    ; $0a4f 22 29 35
   ldax b        ; $0a52 0a      
   push b        ; $0a53 c5      
   ldax b        ; $0a54 0a      
   mov l,a       ; $0a55 6f      
   mvi h,$00     ; $0a56 26 00   
   inx h         ; $0a58 23      
   dad b         ; $0a59 09      
   mov b,h       ; $0a5a 44      
   mov c,l       ; $0a5b 4d      
   jmp $02ef     ; $0a5c c3 ef 02
   mvi b,$42     ; $0a5f 06 42   
   mov d,d       ; $0a61 52      
   mov b,c       ; $0a62 41      
   mov c,m       ; $0a63 4e      
   mov b,e       ; $0a64 43      
   mov c,b       ; $0a65 48      
   mov c,l       ; $0a66 4d      
   ldax b        ; $0a67 0a      
   mov h,b       ; $0a68 60      
   mov l,c       ; $0a69 69      
   mov c,m       ; $0a6a 4e      
   inx h         ; $0a6b 23      
   mov b,m       ; $0a6c 46      
   jmp $02ef     ; $0a6d c3 ef 02
   rlc           ; $0a70 07      
   cmc           ; $0a71 3f      
   mov b,d       ; $0a72 42      
   mov d,d       ; $0a73 52      
   mov b,c       ; $0a74 41      
   mov c,m       ; $0a75 4e      
   mov b,e       ; $0a76 43      
   mov c,b       ; $0a77 48      
   mov e,a       ; $0a78 5f      
   ldax b        ; $0a79 0a      
   pop d         ; $0a7a d1      
   mov a,d       ; $0a7b 7a      
   ora e         ; $0a7c b3      
   jz $0a68      ; $0a7d ca 68 0a
   inx b         ; $0a80 03      
   inx b         ; $0a81 03      
   jmp $02ef     ; $0a82 c3 ef 02
   .byte 0x08    ; $0a85 08      
   mov c,m       ; $0a86 4e      
   cmc           ; $0a87 3f      
   mov b,d       ; $0a88 42      
   mov d,d       ; $0a89 52      
   mov b,c       ; $0a8a 41      
   mov c,m       ; $0a8b 4e      
   mov b,e       ; $0a8c 43      
   mov c,b       ; $0a8d 48      
   mov m,b       ; $0a8e 70      
   ldax b        ; $0a8f 0a      
   pop d         ; $0a90 d1      
   mov a,d       ; $0a91 7a      
   ora e         ; $0a92 b3      
   jnz $0a68     ; $0a93 c2 68 0a
   inx b         ; $0a96 03      
   inx b         ; $0a97 03      
   jmp $02ef     ; $0a98 c3 ef 02
   lxi b,$8549   ; $0a9b 01 49 85
   ldax b        ; $0a9e 0a      
   lhld $341e    ; $0a9f 2a 1e 34
   mov e,m       ; $0aa2 5e      
   inx h         ; $0aa3 23      
   mov d,m       ; $0aa4 56      
   push d        ; $0aa5 d5      
   jmp $02ef     ; $0aa6 c3 ef 02
   lxi b,$9b4a   ; $0aa9 01 4a 9b
   ldax b        ; $0aac 0a      
   lhld $341e    ; $0aad 2a 1e 34
   lxi d,$0006   ; $0ab0 11 06 00
   dad d         ; $0ab3 19      
   mov e,m       ; $0ab4 5e      
   inx h         ; $0ab5 23      
   mov d,m       ; $0ab6 56      
   push d        ; $0ab7 d5      
   jmp $02ef     ; $0ab8 c3 ef 02
   lxi b,$a94b   ; $0abb 01 4b a9
   ldax b        ; $0abe 0a      
   lhld $341e    ; $0abf 2a 1e 34
   lxi d,$000c   ; $0ac2 11 0c 00
   dad d         ; $0ac5 19      
   mov e,m       ; $0ac6 5e      
   inx h         ; $0ac7 23      
   mov d,m       ; $0ac8 56      
   push d        ; $0ac9 d5      
   jmp $02ef     ; $0aca c3 ef 02
   mvi b,$54     ; $0acd 06 54   
   mov c,a       ; $0acf 4f      
   mov b,a       ; $0ad0 47      
   mov b,a       ; $0ad1 47      
   mov c,h       ; $0ad2 4c      
   mov b,l       ; $0ad3 45      
   cmp e         ; $0ad4 bb      
   ldax b        ; $0ad5 0a      
   pop d         ; $0ad6 d1      
   mov a,e       ; $0ad7 7b      
   pop h         ; $0ad8 e1      
   xra m         ; $0ad9 ae      
   mov m,a       ; $0ada 77      
   jmp $02ef     ; $0adb c3 ef 02
   inr b         ; $0ade 04      
   .byte 0x28    ; $0adf 28      
   mov b,h       ; $0ae0 44      
   mov c,a       ; $0ae1 4f      
   dad h         ; $0ae2 29      
   call $e10a    ; $0ae3 cd 0a e1
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
   dcr b         ; $0b04 05      
   .byte 0x28    ; $0b05 28      
   cmc           ; $0b06 3f      
   mov b,h       ; $0b07 44      
   mov c,a       ; $0b08 4f      
   dad h         ; $0b09 29      
   sbi $0a       ; $0b0a de 0a   
   pop h         ; $0b0c e1      
   pop d         ; $0b0d d1      
   push d        ; $0b0e d5      
   push h        ; $0b0f e5      
   mov a,l       ; $0b10 7d      
   cmp e         ; $0b11 bb      
   jnz $0ae5     ; $0b12 c2 e5 0a
   mov a,h       ; $0b15 7c      
   cmp d         ; $0b16 ba      
   jnz $0ae5     ; $0b17 c2 e5 0a
   ldax b        ; $0b1a 0a      
   mov d,a       ; $0b1b 57      
   inx b         ; $0b1c 03      
   ldax b        ; $0b1d 0a      
   mov b,a       ; $0b1e 47      
   mov c,d       ; $0b1f 4a      
   pop h         ; $0b20 e1      
   pop h         ; $0b21 e1      
   jmp $02ef     ; $0b22 c3 ef 02
   mvi b,$28     ; $0b25 06 28   
   mov c,h       ; $0b27 4c      
   mov c,a       ; $0b28 4f      
   mov c,a       ; $0b29 4f      
   mov d,b       ; $0b2a 50      
   dad h         ; $0b2b 29      
   inr b         ; $0b2c 04      
   dcx b         ; $0b2d 0b      
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
   rlc           ; $0b59 07      
   .byte 0x28    ; $0b5a 28      
   dcx h         ; $0b5b 2b      
   mov c,h       ; $0b5c 4c      
   mov c,a       ; $0b5d 4f      
   mov c,a       ; $0b5e 4f      
   mov d,b       ; $0b5f 50      
   dad h         ; $0b60 29      
   dcr h         ; $0b61 25      
   dcx b         ; $0b62 0b      
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
   dcr b         ; $0b74 05      
   mov b,e       ; $0b75 43      
   mov c,l       ; $0b76 4d      
   mov c,a       ; $0b77 4f      
   mov d,m       ; $0b78 56      
   mov b,l       ; $0b79 45      
   mov e,c       ; $0b7a 59      
   dcx b         ; $0b7b 0b      
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
   mvi b,$43     ; $0b9c 06 43   
   mov c,l       ; $0b9e 4d      
   mov c,a       ; $0b9f 4f      
   mov d,m       ; $0ba0 56      
   mov b,l       ; $0ba1 45      
   mvi a,$74     ; $0ba2 3e 74   
   dcx b         ; $0ba4 0b      
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
   rlc           ; $0bcc 07      
   inr a         ; $0bcd 3c      
   mov b,e       ; $0bce 43      
   mov c,l       ; $0bcf 4d      
   mov c,a       ; $0bd0 4f      
   mov d,m       ; $0bd1 56      
   mov b,l       ; $0bd2 45      
   mvi a,$9c     ; $0bd3 3e 9c   
   dcx b         ; $0bd5 0b      
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
   inr b         ; $0bee 04      
   mov b,m       ; $0bef 46      
   mov c,c       ; $0bf0 49      
   mov c,h       ; $0bf1 4c      
   mov c,h       ; $0bf2 4c      
   cz $d10b      ; $0bf3 cc 0b d1
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
   inr b         ; $0c11 04      
   .byte 0x30    ; $0c12 30      
   mvi a,$42     ; $0c13 3e 42   
   mov c,h       ; $0c15 4c      
   xri $0b       ; $0c16 ee 0b   
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
   rlc           ; $0c29 07      
   mov b,l       ; $0c2a 45      
   mov c,m       ; $0c2b 4e      
   mov b,e       ; $0c2c 43      
   mov c,h       ; $0c2d 4c      
   mov c,a       ; $0c2e 4f      
   mov d,e       ; $0c2f 53      
   mov b,l       ; $0c30 45      
   lxi d,$600c   ; $0c31 11 0c 60
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
   inx b         ; $0c71 03      
   mov b,d       ; $0c72 42      
   mov e,c       ; $0c73 59      
   mov b,l       ; $0c74 45      
   dad h         ; $0c75 29      
   inr c         ; $0c76 0c      
   call $02e4    ; $0c77 cd e4 02
   dcx h         ; $0c7a 2b      
   ldax b        ; $0c7b 0a      
   nop           ; $0c7c 00      
   rm            ; $0c7d f8      
   inr l         ; $0c7e 2c      
   inx b         ; $0c7f 03      
   dcr d         ; $0c80 15      
   inx b         ; $0c81 03      
   mvi b,$28     ; $0c82 06 28   
   mov b,l       ; $0c84 45      
   mov c,l       ; $0c85 4d      
   mov c,c       ; $0c86 49      
   mov d,h       ; $0c87 54      
   dad h         ; $0c88 29      
   mov m,c       ; $0c89 71      
   inr c         ; $0c8a 0c      
   pop h         ; $0c8b e1      
   push b        ; $0c8c c5      
   mov c,l       ; $0c8d 4d      
   call $f809    ; $0c8e cd 09 f8
   pop b         ; $0c91 c1      
   jmp $02ef     ; $0c92 c3 ef 02
   dcr b         ; $0c95 05      
   .byte 0x28    ; $0c96 28      
   mov c,e       ; $0c97 4b      
   mov b,l       ; $0c98 45      
   mov e,c       ; $0c99 59      
   dad h         ; $0c9a 29      
   add d         ; $0c9b 82      
   inr c         ; $0c9c 0c      
   push b        ; $0c9d c5      
   call $f803    ; $0c9e cd 03 f8
   mvi h,$00     ; $0ca1 26 00   
   mov l,a       ; $0ca3 6f      
   pop b         ; $0ca4 c1      
   push h        ; $0ca5 e5      
   jmp $02ef     ; $0ca6 c3 ef 02
   inr b         ; $0ca9 04      
   .byte 0x28    ; $0caa 28      
   mov b,e       ; $0cab 43      
   mov d,d       ; $0cac 52      
   dad h         ; $0cad 29      
   add d         ; $0cae 82      
   inr c         ; $0caf 0c      
   call $02e4    ; $0cb0 cd e4 02
   dcx h         ; $0cb3 2b      
   ldax b        ; $0cb4 0a      
   dcr c         ; $0cb5 0d      
   nop           ; $0cb6 00      
   dcr a         ; $0cb7 3d      
   dcr d         ; $0cb8 15      
   dcx h         ; $0cb9 2b      
   ldax b        ; $0cba 0a      
   ldax b        ; $0cbb 0a      
   nop           ; $0cbc 00      
   dcr a         ; $0cbd 3d      
   dcr d         ; $0cbe 15      
   dcr d         ; $0cbf 15      
   inx b         ; $0cc0 03      
   dad b         ; $0cc1 09      
   cmc           ; $0cc2 3f      
   mov d,h       ; $0cc3 54      
   mov b,l       ; $0cc4 45      
   mov d,d       ; $0cc5 52      
   mov c,l       ; $0cc6 4d      
   mov c,c       ; $0cc7 49      
   mov c,m       ; $0cc8 4e      
   mov b,c       ; $0cc9 41      
   mov c,h       ; $0cca 4c      
   xra c         ; $0ccb a9      
   inr c         ; $0ccc 0c      
   push b        ; $0ccd c5      
   call $f812    ; $0cce cd 12 f8
   pop b         ; $0cd1 c1      
   lxi h,$0000   ; $0cd2 21 00 00
   ora a         ; $0cd5 b7      
   jz $0cda      ; $0cd6 ca da 0c
   dcx h         ; $0cd9 2b      
   push h        ; $0cda e5      
   jmp $02ef     ; $0cdb c3 ef 02
   inr b         ; $0cde 04      
   cmc           ; $0cdf 3f      
   mov c,e       ; $0ce0 4b      
   mov b,l       ; $0ce1 45      
   mov e,c       ; $0ce2 59      
   pop b         ; $0ce3 c1      
   inr c         ; $0ce4 0c      
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
   dcr b         ; $0cfa 05      
   mov c,h       ; $0cfb 4c      
   mov b,l       ; $0cfc 45      
   mov c,l       ; $0cfd 4d      
   mov c,c       ; $0cfe 49      
   mov d,h       ; $0cff 54      
   sbi $0c       ; $0d00 de 0c   
   pop h         ; $0d02 e1      
   push b        ; $0d03 c5      
   mov c,l       ; $0d04 4d      
   call $f80f    ; $0d05 cd 0f f8
   pop b         ; $0d08 c1      
   jmp $02ef     ; $0d09 c3 ef 02
   dcr b         ; $0d0c 05      
   mov d,b       ; $0d0d 50      
   mov d,d       ; $0d0e 52      
   mov c,c       ; $0d0f 49      
   mov c,m       ; $0d10 4e      
   mov d,h       ; $0d11 54      
   sbi $0c       ; $0d12 de 0c   
   call $02e4    ; $0d14 cd e4 02
   dcx h         ; $0d17 2b      
   ldax b        ; $0d18 0a      
   nop           ; $0d19 00      
   nop           ; $0d1a 00      
   inr c         ; $0d1b 0c      
   dcx b         ; $0d1c 0b      
   dcx h         ; $0d1d 2b      
   dcr c         ; $0d1e 0d      
   out $03       ; $0d1f d3 03   
   sub c         ; $0d21 91      
   dad b         ; $0d22 09      
   stax b        ; $0d23 02      
   dcr c         ; $0d24 0d      
   mov m,a       ; $0d25 77      
   inr b         ; $0d26 04      
   mvi l,$0b     ; $0d27 2e 0b   
   rar           ; $0d29 1f      
   dcr c         ; $0d2a 0d      
   add d         ; $0d2b 82      
   inx b         ; $0d2c 03      
   dcr d         ; $0d2d 15      
   inx b         ; $0d2e 03      
   rlc           ; $0d2f 07      
   .byte 0x28    ; $0d30 28      
   mov c,h       ; $0d31 4c      
   mov b,l       ; $0d32 45      
   mov c,l       ; $0d33 4d      
   mov c,c       ; $0d34 49      
   mov d,h       ; $0d35 54      
   dad h         ; $0d36 29      
   sbi $0c       ; $0d37 de 0c   
   call $02e4    ; $0d39 cd e4 02
   out $03       ; $0d3c d3 03   
   adc e         ; $0d3e 8b      
   inr c         ; $0d3f 0c      
   stax b        ; $0d40 02      
   dcr c         ; $0d41 0d      
   dcr d         ; $0d42 15      
   inx b         ; $0d43 03      
l0d44:
   shld $3422    ; $0d44 22 22 34
   lhld $341c    ; $0d47 2a 1c 34
   sphl          ; $0d4a f9      
   lhld $341a    ; $0d4b 2a 1a 34
   shld $341e    ; $0d4e 22 1e 34
   lxi b,$0178   ; $0d51 01 78 01
   jmp $02ef     ; $0d54 c3 ef 02

   nop           ; $0d57 00      
   nop           ; $0d58 00      
   nop           ; $0d59 00      
   nop           ; $0d5a 00      
   nop           ; $0d5b 00      
   nop           ; $0d5c 00      
   nop           ; $0d5d 00      
   nop           ; $0d5e 00      
   nop           ; $0d5f 00      
   nop           ; $0d60 00      
   nop           ; $0d61 00      
   nop           ; $0d62 00      
   nop           ; $0d63 00      
   nop           ; $0d64 00      
   nop           ; $0d65 00      
   nop           ; $0d66 00      
   nop           ; $0d67 00      
   nop           ; $0d68 00      
   nop           ; $0d69 00      
   nop           ; $0d6a 00      
   nop           ; $0d6b 00      
   nop           ; $0d6c 00      
   nop           ; $0d6d 00      
   nop           ; $0d6e 00      
   nop           ; $0d6f 00      
   dcr b         ; $0d70 05      
   mov d,h       ; $0d71 54      
   mov c,c       ; $0d72 49      
   mov d,h       ; $0d73 54      
   mov c,h       ; $0d74 4c      
   mov b,l       ; $0d75 45      
   sbi $0c       ; $0d76 de 0c   
   call $02e4    ; $0d78 cd e4 02
   mov h,m       ; $0d7b 66      
   dcr d         ; $0d7c 15      
   dcx h         ; $0d7d 2b      
   ldax b        ; $0d7e 0a      
   stax d        ; $0d7f 12      
   nop           ; $0d80 00      
   sui $16       ; $0d81 d6 16   
   mvi a,$18     ; $0d83 3e 18   
   lxi d,$6f66   ; $0d85 11 66 6f
   mov m,d       ; $0d88 72      
   mov m,h       ; $0d89 74      
   dcr l         ; $0d8a 2d      
   mov m,e       ; $0d8b 73      
   mov l,c       ; $0d8c 69      
   mov m,e       ; $0d8d 73      
   mov m,h       ; $0d8e 74      
   mov h,l       ; $0d8f 65      
   mov l,l       ; $0d90 6d      
   mov h,c       ; $0d91 61      
   .byte 0x20    ; $0d92 20      
   mov l,h       ; $0d93 6c      
   mov m,e       ; $0d94 73      
   dcr l         ; $0d95 2d      
   lxi sp,$1566  ; $0d96 31 66 15
   mov h,m       ; $0d99 66      
   dcr d         ; $0d9a 15      
   mvi a,$18     ; $0d9b 3e 18   
   stc           ; $0d9d 37      
   mov m,e       ; $0d9e 73      
   mov m,h       ; $0d9f 74      
   mov h,c       ; $0da0 61      
   mov l,m       ; $0da1 6e      
   mov h,h       ; $0da2 64      
   mov h,c       ; $0da3 61      
   mov m,d       ; $0da4 72      
   mov m,h       ; $0da5 74      
   .byte 0x20    ; $0da6 20      
   mov b,m       ; $0da7 46      
   mov c,a       ; $0da8 4f      
   mov d,d       ; $0da9 52      
   mov d,h       ; $0daa 54      
   mov c,b       ; $0dab 48      
   dcr l         ; $0dac 2d      
   .byte 0x38    ; $0dad 38      
   inx sp        ; $0dae 33      
   .byte 0x20    ; $0daf 20      
   mov l,c       ; $0db0 69      
   .byte 0x20    ; $0db1 20      
   mov h,c       ; $0db2 61      
   mov m,e       ; $0db3 73      
   mov m,e       ; $0db4 73      
   mov h,l       ; $0db5 65      
   mov l,l       ; $0db6 6d      
   mov h,d       ; $0db7 62      
   mov l,h       ; $0db8 6c      
   mov h,l       ; $0db9 65      
   mov m,d       ; $0dba 72      
   .byte 0x20    ; $0dbb 20      
   .byte 0x28    ; $0dbc 28      
   mov b,e       ; $0dbd 43      
   dad h         ; $0dbe 29      
   .byte 0x20    ; $0dbf 20      
   mov l,m       ; $0dc0 6e      
   mov l,c       ; $0dc1 69      
   mov l,c       ; $0dc2 69      
   mov m,e       ; $0dc3 73      
   mov a,m       ; $0dc4 7e      
   mov h,l       ; $0dc5 65      
   mov m,h       ; $0dc6 74      
   mov l,l       ; $0dc7 6d      
   mov h,c       ; $0dc8 61      
   mov a,e       ; $0dc9 7b      
   .byte 0x20    ; $0dca 20      
   mov l,h       ; $0dcb 6c      
   mov h,a       ; $0dcc 67      
   mov m,l       ; $0dcd 75      
   inr l         ; $0dce 2c      
   .byte 0x20    ; $0dcf 20      
   lxi sp,$3839  ; $0dd0 31 39 38
   mvi m,$2e     ; $0dd3 36 2e   
   mov h,m       ; $0dd5 66      
   dcr d         ; $0dd6 15      
   mvi a,$18     ; $0dd7 3e 18   
   stc           ; $0dd9 37      
   mov m,d       ; $0dda 72      
   mov h,l       ; $0ddb 65      
   mov h,h       ; $0ddc 64      
   mov h,c       ; $0ddd 61      
   mov l,e       ; $0dde 6b      
   mov m,h       ; $0ddf 74      
   mov l,a       ; $0de0 6f      
   mov m,d       ; $0de1 72      
   inr l         ; $0de2 2c      
   .byte 0x20    ; $0de3 20      
   mov h,m       ; $0de4 66      
   mov h,c       ; $0de5 61      
   mov l,d       ; $0de6 6a      
   mov l,h       ; $0de7 6c      
   mov l,a       ; $0de8 6f      
   mov m,a       ; $0de9 77      
   mov h,c       ; $0dea 61      
   mov m,c       ; $0deb 71      
   .byte 0x20    ; $0dec 20      
   mov m,e       ; $0ded 73      
   mov l,c       ; $0dee 69      
   mov m,e       ; $0def 73      
   mov m,h       ; $0df0 74      
   mov h,l       ; $0df1 65      
   mov l,l       ; $0df2 6d      
   mov h,c       ; $0df3 61      
   inr l         ; $0df4 2c      
   .byte 0x20    ; $0df5 20      
   mov m,b       ; $0df6 70      
   mov m,e       ; $0df7 73      
   mov h,l       ; $0df8 65      
   mov m,a       ; $0df9 77      
   mov h,h       ; $0dfa 64      
   mov l,a       ; $0dfb 6f      
   mov h,a       ; $0dfc 67      
   mov m,d       ; $0dfd 72      
   mov h,c       ; $0dfe 61      
   mov h,m       ; $0dff 66      
   mov l,c       ; $0e00 69      
   mov l,e       ; $0e01 6b      
   mov h,c       ; $0e02 61      
   .byte 0x20    ; $0e03 20      
   mov l,c       ; $0e04 69      
   .byte 0x20    ; $0e05 20      
   mov a,d       ; $0e06 7a      
   mov h,c       ; $0e07 61      
   mov h,a       ; $0e08 67      
   mov m,d       ; $0e09 72      
   mov m,l       ; $0e0a 75      
   mov a,d       ; $0e0b 7a      
   mov a,m       ; $0e0c 7e      
   mov l,c       ; $0e0d 69      
   mov l,e       ; $0e0e 6b      
   .byte 0x20    ; $0e0f 20      
   dcr l         ; $0e10 2d      
   mov h,m       ; $0e11 66      
   dcr d         ; $0e12 15      
   mvi a,$18     ; $0e13 3e 18   
   stc           ; $0e15 37      
   .byte 0x28    ; $0e16 28      
   mov b,e       ; $0e17 43      
   dad h         ; $0e18 29      
   .byte 0x20    ; $0e19 20      
   mov l,h       ; $0e1a 6c      
   mov h,l       ; $0e1b 65      
   mov l,d       ; $0e1c 6a      
   mov h,h       ; $0e1d 64      
   mov l,c       ; $0e1e 69      
   .byte 0x20    ; $0e1f 20      
   mov m,e       ; $0e20 73      
   ral           ; $0e21 17      
   mov h,m       ; $0e22 66      
   mov m,h       ; $0e23 74      
   inr l         ; $0e24 2c      
   .byte 0x20    ; $0e25 20      
   .byte 0x20    ; $0e26 20      
   mov l,l       ; $0e27 6d      
   mov l,a       ; $0e28 6f      
   mov m,e       ; $0e29 73      
   mov l,e       ; $0e2a 6b      
   mov m,a       ; $0e2b 77      
   mov h,c       ; $0e2c 61      
   inr l         ; $0e2d 2c      
   .byte 0x20    ; $0e2e 20      
   .byte 0x20    ; $0e2f 20      
   .byte 0x20    ; $0e30 20      
   mov m,d       ; $0e31 72      
   mov h,l       ; $0e32 65      
   mov h,a       ; $0e33 67      
   mvi l,$20     ; $0e34 2e 20   
   mov m,l       ; $0e36 75      
   mov h,h       ; $0e37 64      
   mov l,a       ; $0e38 6f      
   mov m,e       ; $0e39 73      
   mov m,h       ; $0e3a 74      
   mov l,a       ; $0e3b 6f      
   mov m,a       ; $0e3c 77      
   mov h,l       ; $0e3d 65      
   mov m,d       ; $0e3e 72      
   mov h,l       ; $0e3f 65      
   mov l,m       ; $0e40 6e      
   mov l,c       ; $0e41 69      
   mov h,l       ; $0e42 65      
   .byte 0x20    ; $0e43 20      
   mov b,c       ; $0e44 41      
   cma           ; $0e45 2f      
   sta $3532     ; $0e46 32 32 35
   inr m         ; $0e49 34      
   sta $2e36     ; $0e4a 32 36 2e
   mov h,m       ; $0e4d 66      
   dcr d         ; $0e4e 15      
   mov h,m       ; $0e4f 66      
   dcr d         ; $0e50 15      
   mvi a,$18     ; $0e51 3e 18   
   stc           ; $0e53 37      
   .byte 0x28    ; $0e54 28      
   mov b,e       ; $0e55 43      
   dad h         ; $0e56 29      
   .byte 0x20    ; $0e57 20      
   mov l,h       ; $0e58 6c      
   mov h,l       ; $0e59 65      
   mov l,d       ; $0e5a 6a      
   mov h,h       ; $0e5b 64      
   mov l,c       ; $0e5c 69      
   .byte 0x20    ; $0e5d 20      
   mov b,e       ; $0e5e 43      
   ral           ; $0e5f 17      
   mov h,m       ; $0e60 66      
   mov m,h       ; $0e61 74      
   inr l         ; $0e62 2c      
   .byte 0x20    ; $0e63 20      
   .byte 0x20    ; $0e64 20      
   mov l,l       ; $0e65 6d      
   mov l,a       ; $0e66 6f      
   mov m,e       ; $0e67 73      
   mov l,e       ; $0e68 6b      
   mov m,a       ; $0e69 77      
   mov h,c       ; $0e6a 61      
   inr l         ; $0e6b 2c      
   .byte 0x20    ; $0e6c 20      
   .byte 0x20    ; $0e6d 20      
   .byte 0x20    ; $0e6e 20      
   mov m,h       ; $0e6f 74      
   mov h,l       ; $0e70 65      
   mov l,h       ; $0e71 6c      
   mvi l,$20     ; $0e72 2e 20   
   dad sp        ; $0e74 39      
   inr m         ; $0e75 34      
   dcr m         ; $0e76 35      
   dcr l         ; $0e77 2d      
   lxi sp,$2d31  ; $0e78 31 31 2d
   dcr m         ; $0e7b 35      
   lxi sp,$202c  ; $0e7c 31 2c 20
   .byte 0x20    ; $0e7f 20      
   .byte 0x20    ; $0e80 20      
   mov l,c       ; $0e81 69      
   mov h,b       ; $0e82 60      
   mov l,m       ; $0e83 6e      
   mov a,b       ; $0e84 78      
   .byte 0x20    ; $0e85 20      
   lxi sp,$3839  ; $0e86 31 39 38
   .byte 0x38    ; $0e89 38      
   mvi l,$66     ; $0e8a 2e 66   
   dcr d         ; $0e8c 15      
   dcr d         ; $0e8d 15      
   inx b         ; $0e8e 03      
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
   stax b        ; $0eba 02      
   dcr l         ; $0ebb 2d      
   lxi sp,$0d70  ; $0ebc 31 70 0d
   call $0984    ; $0ebf cd 84 09
   rst 7         ; $0ec2 ff      
   rst 7         ; $0ec3 ff      
   lxi b,$ba30   ; $0ec4 01 30 ba
   mvi c,$cd     ; $0ec7 0e cd   
   add h         ; $0ec9 84      
   dad b         ; $0eca 09      
   nop           ; $0ecb 00      
   nop           ; $0ecc 00      
   lxi b,$c431   ; $0ecd 01 31 c4
   mvi c,$cd     ; $0ed0 0e cd   
   add h         ; $0ed2 84      
   dad b         ; $0ed3 09      
   lxi b,$0100   ; $0ed4 01 00 01
   sta $0ecd     ; $0ed7 32 cd 0e
   call $0984    ; $0eda cd 84 09
   stax b        ; $0edd 02      
   nop           ; $0ede 00      
   inr b         ; $0edf 04      
   mov d,h       ; $0ee0 54      
   mov d,d       ; $0ee1 52      
   mov d,l       ; $0ee2 55      
   mov b,l       ; $0ee3 45      
   sui $0e       ; $0ee4 d6 0e   
   call $0984    ; $0ee6 cd 84 09
   rst 7         ; $0ee9 ff      
   rst 7         ; $0eea ff      
   dcr b         ; $0eeb 05      
   mov b,m       ; $0eec 46      
   mov b,c       ; $0eed 41      
   mov c,h       ; $0eee 4c      
   mov d,e       ; $0eef 53      
   mov b,l       ; $0ef0 45      
   rst 3         ; $0ef1 df      
   mvi c,$cd     ; $0ef2 0e cd   
   add h         ; $0ef4 84      
   dad b         ; $0ef5 09      
   nop           ; $0ef6 00      
   nop           ; $0ef7 00      
   inr b         ; $0ef8 04      
   mov c,b       ; $0ef9 48      
   mov b,l       ; $0efa 45      
   mov d,d       ; $0efb 52      
   mov b,l       ; $0efc 45      
   xchg          ; $0efd eb      
   mvi c,$cd     ; $0efe 0e cd   
   cpo $d102     ; $0f00 e4 02 d1
   lxi b,$0984   ; $0f03 01 84 09
   dcr d         ; $0f06 15      
   inx b         ; $0f07 03      
   dcr b         ; $0f08 05      
   mov b,c       ; $0f09 41      
   mov c,h       ; $0f0a 4c      
   mov c,h       ; $0f0b 4c      
   mov c,a       ; $0f0c 4f      
   mov d,h       ; $0f0d 54      
   rm            ; $0f0e f8      
   mvi c,$cd     ; $0f0f 0e cd   
   cpo $d102     ; $0f11 e4 02 d1
   lxi b,$09da   ; $0f14 01 da 09
   dcr d         ; $0f17 15      
   inx b         ; $0f18 03      
   lxi b,$082c   ; $0f19 01 2c 08
   rrc           ; $0f1c 0f      
   call $02e4    ; $0f1d cd e4 02
   rst 7         ; $0f20 ff      
   mvi c,$da     ; $0f21 0e da   
   mvi c,$10     ; $0f23 0e 10   
   rrc           ; $0f25 0f      
   sbb l         ; $0f26 9d      
   dad b         ; $0f27 09      
   dcr d         ; $0f28 15      
   inx b         ; $0f29 03      
   stax b        ; $0f2a 02      
   mov b,e       ; $0f2b 43      
   inr l         ; $0f2c 2c      
   dad d         ; $0f2d 19      
   rrc           ; $0f2e 0f      
   call $02e4    ; $0f2f cd e4 02
   rst 7         ; $0f32 ff      
   mvi c,$d1     ; $0f33 0e d1   
   mvi c,$10     ; $0f35 0e 10   
   rrc           ; $0f37 0f      
   xra d         ; $0f38 aa      
   dad b         ; $0f39 09      
   dcr d         ; $0f3a 15      
   inx b         ; $0f3b 03      
   stax b        ; $0f3c 02      
   shld $2a2c    ; $0f3d 22 2c 2a
   rrc           ; $0f40 0f      
   call $02e4    ; $0f41 cd e4 02
   rst 7         ; $0f44 ff      
   mvi c,$62     ; $0f45 0e 62   
   inx b         ; $0f47 03      
   sub c         ; $0f48 91      
   dad b         ; $0f49 09      
   mov m,a       ; $0f4a 77      
   inr b         ; $0f4b 04      
   out $03       ; $0f4c d3 03   
   .byte 0x10    ; $0f4e 10      
   rrc           ; $0f4f 0f      
   mov a,h       ; $0f50 7c      
   dcx b         ; $0f51 0b      
   dcr d         ; $0f52 15      
   inx b         ; $0f53 03      
   inx b         ; $0f54 03      
   mov d,b       ; $0f55 50      
   mov b,c       ; $0f56 41      
   mov b,h       ; $0f57 44      
   inr a         ; $0f58 3c      
   rrc           ; $0f59 0f      
   call $02e4    ; $0f5a cd e4 02
   rst 7         ; $0f5d ff      
   mvi c,$2b     ; $0f5e 0e 2b   
   ldax b        ; $0f60 0a      
   mov d,h       ; $0f61 54      
   nop           ; $0f62 00      
   mov c,d       ; $0f63 4a      
   inr b         ; $0f64 04      
   dcr d         ; $0f65 15      
   inx b         ; $0f66 03      
   dcr b         ; $0f67 05      
   mov b,e       ; $0f68 43      
   mov c,a       ; $0f69 4f      
   mov d,l       ; $0f6a 55      
   mov c,m       ; $0f6b 4e      
   mov d,h       ; $0f6c 54      
   mov d,h       ; $0f6d 54      
   rrc           ; $0f6e 0f      
   pop h         ; $0f6f e1      
   mvi d,$00     ; $0f70 16 00   
   mov e,m       ; $0f72 5e      
   inx h         ; $0f73 23      
   push h        ; $0f74 e5      
   push d        ; $0f75 d5      
   jmp $02ef     ; $0f76 c3 ef 02
   rlc           ; $0f79 07      
   mov b,e       ; $0f7a 43      
   mov c,a       ; $0f7b 4f      
   mov c,l       ; $0f7c 4d      
   mov d,b       ; $0f7d 50      
   mov c,c       ; $0f7e 49      
   mov c,h       ; $0f7f 4c      
   mov b,l       ; $0f80 45      
   mov h,a       ; $0f81 67      
   rrc           ; $0f82 0f      
   call $02e4    ; $0f83 cd e4 02
   .byte 0x20    ; $0f86 20      
   dad b         ; $0f87 09      
   out $03       ; $0f88 d3 03   
   add d         ; $0f8a 82      
   inr b         ; $0f8b 04      
   dcr c         ; $0f8c 0d      
   dad b         ; $0f8d 09      
   add h         ; $0f8e 84      
   dad b         ; $0f8f 09      
   dcr e         ; $0f90 1d      
   rrc           ; $0f91 0f      
   dcr d         ; $0f92 15      
   inx b         ; $0f93 03      
   inx b         ; $0f94 03      
   mov d,e       ; $0f95 53      
   mvi a,$44     ; $0f96 3e 44   
   mov a,c       ; $0f98 79      
   rrc           ; $0f99 0f      
   call $02e4    ; $0f9a cd e4 02
   out $03       ; $0f9d d3 03   
   dcr a         ; $0f9f 3d      
   dcr b         ; $0fa0 05      
   dcr d         ; $0fa1 15      
   inx b         ; $0fa2 03      
   stax b        ; $0fa3 02      
   mov c,l       ; $0fa4 4d      
   lhld $0f94    ; $0fa5 2a 94 0f
   call $02e4    ; $0fa8 cd e4 02
   jp $eb03      ; $0fab f2 03 eb
   .byte 0x08    ; $0fae 08      
   dcr c         ; $0faf 0d      
   dad b         ; $0fb0 09      
   ora c         ; $0fb1 b1      
   inr b         ; $0fb2 04      
   adc l         ; $0fb3 8d      
   inx b         ; $0fb4 03      
   ora c         ; $0fb5 b1      
   inr b         ; $0fb6 04      
   rst 0         ; $0fb7 c7      
   mvi b,$20     ; $0fb8 06 20   
   dad b         ; $0fba 09      
   dcr a         ; $0fbb 3d      
   dcr b         ; $0fbc 05      
   mov a,d       ; $0fbd 7a      
   ldax b        ; $0fbe 0a      
   jmp $200f     ; $0fbf c3 0f 20
   mvi b,$15     ; $0fc2 06 15   
   inx b         ; $0fc4 03      
   lxi b,$a32f   ; $0fc5 01 2f a3
   rrc           ; $0fc8 0f      
   call $02e4    ; $0fc9 cd e4 02
   jpo $1007     ; $0fcc e2 07 10
   inr b         ; $0fcf 04      
   dcr d         ; $0fd0 15      
   inx b         ; $0fd1 03      
   inx b         ; $0fd2 03      
   mov c,l       ; $0fd3 4d      
   mov c,a       ; $0fd4 4f      
   mov b,h       ; $0fd5 44      
   push b        ; $0fd6 c5      
   rrc           ; $0fd7 0f      
   call $02e4    ; $0fd8 cd e4 02
   jpo $8207     ; $0fdb e2 07 82
   inx b         ; $0fde 03      
   dcr d         ; $0fdf 15      
   inx b         ; $0fe0 03      
   inr b         ; $0fe1 04      
   mov b,h       ; $0fe2 44      
   mov b,c       ; $0fe3 41      
   mov b,d       ; $0fe4 42      
   mov d,e       ; $0fe5 53      
   jnc $cd0f     ; $0fe6 d2 0f cd
   cpo $d302     ; $0fe9 e4 02 d3
   inx b         ; $0fec 03      
   dcr a         ; $0fed 3d      
   dcr b         ; $0fee 05      
   mov a,d       ; $0fef 7a      
   ldax b        ; $0ff0 0a      
   push psw      ; $0ff1 f5      
   rrc           ; $0ff2 0f      
   .byte 0x20    ; $0ff3 20      
   mvi b,$15     ; $0ff4 06 15   
   inx b         ; $0ff6 03      
   stax b        ; $0ff7 02      
   mov d,l       ; $0ff8 55      
   cma           ; $0ff9 2f      
   pop h         ; $0ffa e1      
   rrc           ; $0ffb 0f      
   call $02e4    ; $0ffc cd e4 02
   dcx h         ; $0fff 2b      
   .byte 0x08    ; $1000 08      
   .byte 0x10    ; $1001 10      
   inr b         ; $1002 04      
   dcr d         ; $1003 15      
   inx b         ; $1004 03      
   mvi b,$55     ; $1005 06 55   
   mov c,l       ; $1007 4d      
   cma           ; $1008 2f      
   mov c,l       ; $1009 4d      
   mov c,a       ; $100a 4f      
   mov b,h       ; $100b 44      
   rst 6         ; $100c f7      
   rrc           ; $100d 0f      
   call $02e4    ; $100e cd e4 02
   rz            ; $1011 c8      
   mvi c,$f9     ; $1012 0e f9   
   mvi b,$82     ; $1014 06 82   
   inx b         ; $1016 03      
   .byte 0x10    ; $1017 10      
   inr b         ; $1018 04      
   dcr d         ; $1019 15      
   inx b         ; $101a 03      
   dcr b         ; $101b 05      
   mov c,l       ; $101c 4d      
   cma           ; $101d 2f      
   mov c,l       ; $101e 4d      
   mov c,a       ; $101f 4f      
   mov b,h       ; $1020 44      
   dcr b         ; $1021 05      
   .byte 0x10    ; $1022 10      
   call $02e4    ; $1023 cd e4 02
   rpo           ; $1026 e0      
   inx b         ; $1027 03      
   mov a,d       ; $1028 7a      
   ldax b        ; $1029 0a      
   mov l,d       ; $102a 6a      
   .byte 0x10    ; $102b 10      
   out $03       ; $102c d3 03   
   dcr c         ; $102e 0d      
   dad b         ; $102f 09      
   jp $eb03      ; $1030 f2 03 eb
   .byte 0x08    ; $1033 08      
   dcr c         ; $1034 0d      
   dad b         ; $1035 09      
   dcr c         ; $1036 0d      
   dad b         ; $1037 09      
   rpe           ; $1038 e8      
   rrc           ; $1039 0f      
   inx sp        ; $103a 33      
   dad b         ; $103b 09      
   ora c         ; $103c b1      
   inr b         ; $103d 04      
   mvi c,$10     ; $103e 0e 10   
   adc l         ; $1040 8d      
   inx b         ; $1041 03      
   .byte 0x20    ; $1042 20      
   dad b         ; $1043 09      
   dcr a         ; $1044 3d      
   dcr b         ; $1045 05      
   mov a,d       ; $1046 7a      
   ldax b        ; $1047 0a      
   mov c,h       ; $1048 4c      
   .byte 0x10    ; $1049 10      
   mov l,d       ; $104a 6a      
   inr b         ; $104b 04      
   adc l         ; $104c 8d      
   inx b         ; $104d 03      
   .byte 0x20    ; $104e 20      
   dad b         ; $104f 09      
   dcr a         ; $1050 3d      
   dcr b         ; $1051 05      
   mov a,d       ; $1052 7a      
   ldax b        ; $1053 0a      
   mov l,b       ; $1054 68      
   .byte 0x10    ; $1055 10      
   mov l,d       ; $1056 6a      
   inr b         ; $1057 04      
   mov h,d       ; $1058 62      
   inx b         ; $1059 03      
   mov a,d       ; $105a 7a      
   ldax b        ; $105b 0a      
   mov l,b       ; $105c 68      
   .byte 0x10    ; $105d 10      
   adc m         ; $105e 8e      
   inr b         ; $105f 04      
   inx sp        ; $1060 33      
   dad b         ; $1061 09      
   ora m         ; $1062 b6      
   inx b         ; $1063 03      
   mov d,l       ; $1064 55      
   inr b         ; $1065 04      
   adc l         ; $1066 8d      
   inx b         ; $1067 03      
   mov m,l       ; $1068 75      
   dad b         ; $1069 09      
   dcr d         ; $106a 15      
   inx b         ; $106b 03      
   dcr b         ; $106c 05      
   lhld $4d2f    ; $106d 2a 2f 4d
   mov c,a       ; $1070 4f      
   mov b,h       ; $1071 44      
   dcx d         ; $1072 1b      
   .byte 0x10    ; $1073 10      
   call $02e4    ; $1074 cd e4 02
   dcr c         ; $1077 0d      
   dad b         ; $1078 09      
   xra b         ; $1079 a8      
   rrc           ; $107a 0f      
   .byte 0x20    ; $107b 20      
   dad b         ; $107c 09      
   inx h         ; $107d 23      
   .byte 0x10    ; $107e 10      
   dcr d         ; $107f 15      
   inx b         ; $1080 03      
   stax b        ; $1081 02      
   lhld $6c2f    ; $1082 2a 2f 6c
   .byte 0x10    ; $1085 10      
   call $02e4    ; $1086 cd e4 02
   mov m,h       ; $1089 74      
   .byte 0x10    ; $108a 10      
   .byte 0x10    ; $108b 10      
   inr b         ; $108c 04      
   dcr d         ; $108d 15      
   inx b         ; $108e 03      
   stax b        ; $108f 02      
   inr a         ; $1090 3c      
   mvi a,$81     ; $1091 3e 81   
   .byte 0x10    ; $1093 10      
   call $02e4    ; $1094 cd e4 02
   mov h,m       ; $1097 66      
   dcr b         ; $1098 05      
   mov a,m       ; $1099 7e      
   dcr b         ; $109a 05      
   dcr d         ; $109b 15      
   inx b         ; $109c 03      
   inr b         ; $109d 04      
   mov d,c       ; $109e 51      
   mov d,l       ; $109f 55      
   mov c,c       ; $10a0 49      
   mov d,h       ; $10a1 54      
   adc a         ; $10a2 8f      
   .byte 0x10    ; $10a3 10      
   call $02e4    ; $10a4 cd e4 02
   dcx h         ; $10a7 2b      
   ldax b        ; $10a8 0a      
   nop           ; $10a9 00      
   inr m         ; $10aa 34      
   add h         ; $10ab 84      
   dad b         ; $10ac 09      
   rpo           ; $10ad e0      
   inx b         ; $10ae 03      
   mov a,d       ; $10af 7a      
   ldax b        ; $10b0 0a      
   ora l         ; $10b1 b5      
   .byte 0x10    ; $10b2 10      
   inr l         ; $10b3 2c      
   inx b         ; $10b4 03      
   ora h         ; $10b5 b4      
   lxi b,$0984   ; $10b6 01 84 09
   mov d,b       ; $10b9 50      
   dad b         ; $10ba 09      
   lhld $7116    ; $10bb 2a 16 71
   ral           ; $10be 17      
   mov d,b       ; $10bf 50      
   inr m         ; $10c0 34      
   ldax b        ; $10c1 0a      
   ral           ; $10c2 17      
   pop psw       ; $10c3 f1      
   dcr d         ; $10c4 15      
   pop b         ; $10c5 c1      
   dad d         ; $10c6 19      
   mov l,b       ; $10c7 68      
   ldax b        ; $10c8 0a      
   jmp $1510     ; $10c9 c3 10 15
   inx b         ; $10cc 03      
   dcr b         ; $10cd 05      
   mov b,c       ; $10ce 41      
   mov b,d       ; $10cf 42      
   mov c,a       ; $10d0 4f      
   mov d,d       ; $10d1 52      
   mov d,h       ; $10d2 54      
   sbb l         ; $10d3 9d      
   .byte 0x10    ; $10d4 10      
   call $02e4    ; $10d5 cd e4 02
   dcx h         ; $10d8 2b      
   ldax b        ; $10d9 0a      
   stax b        ; $10da 02      
   inr m         ; $10db 34      
   add h         ; $10dc 84      
   dad b         ; $10dd 09      
   rpo           ; $10de e0      
   inx b         ; $10df 03      
   mov a,d       ; $10e0 7a      
   ldax b        ; $10e1 0a      
   ani $10       ; $10e2 e6 10   
   inr l         ; $10e4 2c      
   inx b         ; $10e5 03      
   ora c         ; $10e6 b1      
   stax b        ; $10e7 02      
   add h         ; $10e8 84      
   dad b         ; $10e9 09      
   rpo           ; $10ea e0      
   inx b         ; $10eb 03      
   mov a,d       ; $10ec 7a      
   ldax b        ; $10ed 0a      
   dcr m         ; $10ee 35      
   lxi d,$1566   ; $10ef 11 66 15
   mvi a,$18     ; $10f2 3e 18   
   mvi c,$4f     ; $10f4 0e 4f   
   ei            ; $10f6 fb      
   pchl          ; $10f7 e9      
   jpo $414b     ; $10f8 e2 4b 41
   lda $fc20     ; $10fb 3a 20 fc
   mov c,e       ; $10fe 4b      
   mov d,b       ; $10ff 50      
   mov b,c       ; $1100 41      
   mov c,b       ; $1101 48      
   .byte 0x20    ; $1102 20      
   cpi $12       ; $1103 fe 12   
   mvi a,$18     ; $1105 3e 18   
   rlc           ; $1107 07      
   mov b,e       ; $1108 43      
   mov d,h       ; $1109 54      
   mov d,b       ; $110a 50      
   mov c,a       ; $110b 4f      
   mov c,e       ; $110c 4b      
   mov b,c       ; $110d 41      
   .byte 0x20    ; $110e 20      
   hlt           ; $110f 76      
   stax b        ; $1110 02      
   add h         ; $1111 84      
   dad b         ; $1112 09      
   dcx h         ; $1113 2b      
   ldax b        ; $1114 0a      
   mov b,b       ; $1115 40      
   nop           ; $1116 00      
   cm $d30f      ; $1117 fc 0f d3
   inx b         ; $111a 03      
   cpi $12       ; $111b fe 12   
   mov h,m       ; $111d 66      
   dcr d         ; $111e 15      
   ora c         ; $111f b1      
   stax b        ; $1120 02      
   add h         ; $1121 84      
   dad b         ; $1122 09      
   .byte 0xfd    ; $1123 fd      
   inr l         ; $1124 2c      
   adc l         ; $1125 8d      
   inx b         ; $1126 03      
   dcx h         ; $1127 2b      
   ldax b        ; $1128 0a      
   mov b,b       ; $1129 40      
   nop           ; $112a 00      
   sbb e         ; $112b 9b      
   mvi b,$4a     ; $112c 06 4a   
   inr b         ; $112e 04      
   dcx h         ; $112f 2b      
   ldax b        ; $1130 0a      
   mov b,b       ; $1131 40      
   nop           ; $1132 00      
   mov a,m       ; $1133 7e      
   dcr d         ; $1134 15      
   cmp m         ; $1135 be      
   lxi b,$0984   ; $1136 01 84 09
   mov b,c       ; $1139 41      
   inr b         ; $113a 04      
   ana h         ; $113b a4      
   .byte 0x10    ; $113c 10      
   dcr d         ; $113d 15      
   inx b         ; $113e 03      
   .byte 0x08    ; $113f 08      
   .byte 0x28    ; $1140 28      
   mov b,c       ; $1141 41      
   mov b,d       ; $1142 42      
   mov c,a       ; $1143 4f      
   mov d,d       ; $1144 52      
   mov d,h       ; $1145 54      
   shld $cd29    ; $1146 22 29 cd
   .byte 0x10    ; $1149 10      
   call $02e4    ; $114a cd e4 02
   mov a,d       ; $114d 7a      
   ldax b        ; $114e 0a      
   mov h,c       ; $114f 61      
   lxi d,$0eff   ; $1150 11 ff 0e
   .byte 0xed    ; $1153 ed      
   mvi d,$c4     ; $1154 16 c4   
   mvi d,$20     ; $1156 16 20   
   dad b         ; $1158 09      
   .byte 0xed    ; $1159 ed      
   mvi d,$d5     ; $115a 16 d5   
   .byte 0x10    ; $115c 10      
   mov l,b       ; $115d 68      
   ldax b        ; $115e 0a      
   mov l,l       ; $115f 6d      
   lxi d,$0920   ; $1160 11 20 09
   out $03       ; $1163 d3 03   
   sub c         ; $1165 91      
   dad b         ; $1166 09      
   mov m,a       ; $1167 77      
   inr b         ; $1168 04      
   mov c,d       ; $1169 4a      
   inr b         ; $116a 04      
   dcr c         ; $116b 0d      
   dad b         ; $116c 09      
   dcr d         ; $116d 15      
   inx b         ; $116e 03      
   add m         ; $116f 86      
   mov b,c       ; $1170 41      
   mov b,d       ; $1171 42      
   mov c,a       ; $1172 4f      
   mov d,d       ; $1173 52      
   mov d,h       ; $1174 54      
   shld $113f    ; $1175 22 3f 11
   call $02e4    ; $1178 cd e4 02
   mvi h,$1c     ; $117b 26 1c   
   add e         ; $117d 83      
   rrc           ; $117e 0f      
   mov c,d       ; $117f 4a      
   lxi d,$0a2b   ; $1180 11 2b 0a
   shld $ed00    ; $1183 22 00 ed
   inx d         ; $1186 13      
   mov b,c       ; $1187 41      
   rrc           ; $1188 0f      
   dcr d         ; $1189 15      
   inx b         ; $118a 03      
   stax b        ; $118b 02      
   inx h         ; $118c 23      
   mvi a,$6f     ; $118d 3e 6f   
   lxi d,$e4cd   ; $118f 11 cd e4
   stax b        ; $1192 02      
   inx b         ; $1193 03      
   inr b         ; $1194 04      
   mov c,c       ; $1195 49      
   stax b        ; $1196 02      
   add h         ; $1197 84      
   dad b         ; $1198 09      
   mov e,d       ; $1199 5a      
   rrc           ; $119a 0f      
   mov h,d       ; $119b 62      
   inx b         ; $119c 03      
   mov d,l       ; $119d 55      
   inr b         ; $119e 04      
   dcr d         ; $119f 15      
   inx b         ; $11a0 03      
   stax b        ; $11a1 02      
   inr a         ; $11a2 3c      
   inx h         ; $11a3 23      
   adc e         ; $11a4 8b      
   lxi d,$e4cd   ; $11a5 11 cd e4
   stax b        ; $11a8 02      
   mov e,d       ; $11a9 5a      
   rrc           ; $11aa 0f      
   mov c,c       ; $11ab 49      
   stax b        ; $11ac 02      
   sbb l         ; $11ad 9d      
   dad b         ; $11ae 09      
   dcr d         ; $11af 15      
   inx b         ; $11b0 03      
   inr b         ; $11b1 04      
   mov c,b       ; $11b2 48      
   mov c,a       ; $11b3 4f      
   mov c,h       ; $11b4 4c      
   mov b,h       ; $11b5 44      
   ana c         ; $11b6 a1      
   lxi d,$e4cd   ; $11b7 11 cd e4
   stax b        ; $11ba 02      
   mov c,c       ; $11bb 49      
   stax b        ; $11bc 02      
   ldax d        ; $11bd 1a      
   ldax b        ; $11be 0a      
   mov c,c       ; $11bf 49      
   stax b        ; $11c0 02      
   add h         ; $11c1 84      
   dad b         ; $11c2 09      
   xra d         ; $11c3 aa      
   dad b         ; $11c4 09      
   dcr d         ; $11c5 15      
   inx b         ; $11c6 03      
   inr b         ; $11c7 04      
   mov d,e       ; $11c8 53      
   mov c,c       ; $11c9 49      
   mov b,a       ; $11ca 47      
   mov c,m       ; $11cb 4e      
   ora c         ; $11cc b1      
   lxi d,$e4cd   ; $11cd 11 cd e4
   stax b        ; $11d0 02      
   dcr a         ; $11d1 3d      
   dcr b         ; $11d2 05      
   mov a,d       ; $11d3 7a      
   ldax b        ; $11d4 0a      
   .byte 0xdd    ; $11d5 dd      
   lxi d,$0a2b   ; $11d6 11 2b 0a
   dcr l         ; $11d9 2d      
   nop           ; $11da 00      
   cmp b         ; $11db b8      
   lxi d,$0315   ; $11dc 11 15 03
   inr b         ; $11df 04      
   mvi a,$44     ; $11e0 3e 44   
   mov c,c       ; $11e2 49      
   mov b,a       ; $11e3 47      
   rst 0         ; $11e4 c7      
   lxi d,$e4cd   ; $11e5 11 cd e4
   stax b        ; $11e8 02      
   dcx h         ; $11e9 2b      
   ldax b        ; $11ea 0a      
   dad b         ; $11eb 09      
   nop           ; $11ec 00      
   mov h,d       ; $11ed 62      
   inx b         ; $11ee 03      
   jm $7a04      ; $11ef fa 04 7a
   ldax b        ; $11f2 0a      
   .byte 0xfd    ; $11f3 fd      
   lxi d,$0a2b   ; $11f4 11 2b 0a
   stc           ; $11f7 37      
   nop           ; $11f8 00      
   mov l,b       ; $11f9 68      
   ldax b        ; $11fa 0a      
   lxi b,$2b12   ; $11fb 01 12 2b
   ldax b        ; $11fe 0a      
   .byte 0x30    ; $11ff 30      
   nop           ; $1200 00      
   mov c,d       ; $1201 4a      
   inr b         ; $1202 04      
   dcr d         ; $1203 15      
   inx b         ; $1204 03      
   lxi b,$df23   ; $1205 01 23 df
   lxi d,$e4cd   ; $1208 11 cd e4
   stax b        ; $120b 02      
   .byte 0x08    ; $120c 08      
   stax b        ; $120d 02      
   add h         ; $120e 84      
   dad b         ; $120f 09      
   rz            ; $1210 c8      
   mvi c,$f9     ; $1211 0e f9   
   mvi b,$b6     ; $1213 06 b6   
   inx b         ; $1215 03      
   add d         ; $1216 82      
   inx b         ; $1217 03      
   ora m         ; $1218 b6      
   inx b         ; $1219 03      
   ani $11       ; $121a e6 11   
   cmp b         ; $121c b8      
   lxi d,$0315   ; $121d 11 15 03
   stax b        ; $1220 02      
   inx h         ; $1221 23      
   mvi l,$05     ; $1222 2e 05   
   stax d        ; $1224 12      
   call $02e4    ; $1225 cd e4 02
   .byte 0x08    ; $1228 08      
   stax b        ; $1229 02      
   add h         ; $122a 84      
   dad b         ; $122b 09      
   dcx h         ; $122c 2b      
   .byte 0x08    ; $122d 08      
   adc l         ; $122e 8d      
   inx b         ; $122f 03      
   ani $11       ; $1230 e6 11   
   cmp b         ; $1232 b8      
   lxi d,$0315   ; $1233 11 15 03
   inx b         ; $1236 03      
   inx h         ; $1237 23      
   mvi l,$53     ; $1238 2e 53   
   .byte 0x20    ; $123a 20      
   stax d        ; $123b 12      
   call $02e4    ; $123c cd e4 02
   dcr h         ; $123f 25      
   stax d        ; $1240 12      
   out $03       ; $1241 d3 03   
   mov a,m       ; $1243 7e      
   dcr b         ; $1244 05      
   mov a,d       ; $1245 7a      
   ldax b        ; $1246 0a      
   cmc           ; $1247 3f      
   stax d        ; $1248 12      
   dcr d         ; $1249 15      
   inx b         ; $124a 03      
   stax b        ; $124b 02      
   inx h         ; $124c 23      
   mov d,e       ; $124d 53      
   mvi m,$12     ; $124e 36 12   
   call $02e4    ; $1250 cd e4 02
   dad b         ; $1253 09      
   stax d        ; $1254 12      
   jp $d903      ; $1255 f2 03 d9
   .byte 0x08    ; $1258 08      
   mov a,m       ; $1259 7e      
   dcr b         ; $125a 05      
   mov a,d       ; $125b 7a      
   ldax b        ; $125c 0a      
   mov d,e       ; $125d 53      
   stax d        ; $125e 12      
   dcr d         ; $125f 15      
   inx b         ; $1260 03      
   inx b         ; $1261 03      
   mov b,h       ; $1262 44      
   mvi l,$52     ; $1263 2e 52   
   mov c,e       ; $1265 4b      
   stax d        ; $1266 12      
   call $02e4    ; $1267 cd e4 02
   dcr c         ; $126a 0d      
   dad b         ; $126b 09      
   out $03       ; $126c d3 03   
   dcr c         ; $126e 0d      
   dad b         ; $126f 09      
   rpe           ; $1270 e8      
   rrc           ; $1271 0f      
   ana m         ; $1272 a6      
   lxi d,$1250   ; $1273 11 50 12
   .byte 0x20    ; $1276 20      
   dad b         ; $1277 09      
   aci $11       ; $1278 ce 11   
   sub b         ; $127a 90      
   lxi d,$0920   ; $127b 11 20 09
   mov h,d       ; $127e 62      
   inx b         ; $127f 03      
   mov d,l       ; $1280 55      
   inr b         ; $1281 04      
   sui $16       ; $1282 d6 16   
   mov a,m       ; $1284 7e      
   dcr d         ; $1285 15      
   dcr d         ; $1286 15      
   inx b         ; $1287 03      
   stax b        ; $1288 02      
   mov b,h       ; $1289 44      
   mvi l,$61     ; $128a 2e 61   
   stax d        ; $128c 12      
   call $02e4    ; $128d cd e4 02
   out $03       ; $1290 d3 03   
   dcr c         ; $1292 0d      
   dad b         ; $1293 09      
   rpe           ; $1294 e8      
   rrc           ; $1295 0f      
   ana m         ; $1296 a6      
   lxi d,$1250   ; $1297 11 50 12
   .byte 0x20    ; $129a 20      
   dad b         ; $129b 09      
   aci $11       ; $129c ce 11   
   sub b         ; $129e 90      
   lxi d,$157e   ; $129f 11 7e 15
   cnz $1516     ; $12a2 c4 16 15
   inx b         ; $12a5 03      
   stax b        ; $12a6 02      
   mvi l,$52     ; $12a7 2e 52   
   adc b         ; $12a9 88      
   stax d        ; $12aa 12      
   call $02e4    ; $12ab cd e4 02
   dcr c         ; $12ae 0d      
   dad b         ; $12af 09      
   out $03       ; $12b0 d3 03   
   dcr c         ; $12b2 0d      
   dad b         ; $12b3 09      
   ora c         ; $12b4 b1      
   inr b         ; $12b5 04      
   ana m         ; $12b6 a6      
   lxi d,$123c   ; $12b7 11 3c 12
   .byte 0x20    ; $12ba 20      
   dad b         ; $12bb 09      
   aci $11       ; $12bc ce 11   
   rz            ; $12be c8      
   mvi c,$90     ; $12bf 0e 90   
   lxi d,$0920   ; $12c1 11 20 09
   mov h,d       ; $12c4 62      
   inx b         ; $12c5 03      
   mov d,l       ; $12c6 55      
   inr b         ; $12c7 04      
   sui $16       ; $12c8 d6 16   
   mov a,m       ; $12ca 7e      
   dcr d         ; $12cb 15      
   dcr d         ; $12cc 15      
   inx b         ; $12cd 03      
   stax b        ; $12ce 02      
   mvi l,$30     ; $12cf 2e 30   
   ana m         ; $12d1 a6      
   stax d        ; $12d2 12      
   call $02e4    ; $12d3 cd e4 02
   dcr c         ; $12d6 0d      
   dad b         ; $12d7 09      
   ana m         ; $12d8 a6      
   lxi d,$123c   ; $12d9 11 3c 12
   rz            ; $12dc c8      
   mvi c,$90     ; $12dd 0e 90   
   lxi d,$0920   ; $12df 11 20 09
   mov h,d       ; $12e2 62      
   inx b         ; $12e3 03      
   mov d,l       ; $12e4 55      
   inr b         ; $12e5 04      
   rz            ; $12e6 c8      
   mvi c,$0c     ; $12e7 0e 0c   
   dcx b         ; $12e9 0b      
   ori $12       ; $12ea f6 12   
   dcx h         ; $12ec 2b      
   ldax b        ; $12ed 0a      
   .byte 0x30    ; $12ee 30      
   nop           ; $12ef 00      
   dcr a         ; $12f0 3d      
   dcr d         ; $12f1 15      
   mvi l,$0b     ; $12f2 2e 0b   
   cpe $7e12     ; $12f4 ec 12 7e
   dcr d         ; $12f7 15      
   dcr d         ; $12f8 15      
   inx b         ; $12f9 03      
   lxi b,$ce2e   ; $12fa 01 2e ce
   stax d        ; $12fd 12      
   call $02e4    ; $12fe cd e4 02
   out $03       ; $1301 d3 03   
   dcr c         ; $1303 0d      
   dad b         ; $1304 09      
   ora c         ; $1305 b1      
   inr b         ; $1306 04      
   ana m         ; $1307 a6      
   lxi d,$123c   ; $1308 11 3c 12
   .byte 0x20    ; $130b 20      
   dad b         ; $130c 09      
   aci $11       ; $130d ce 11   
   rz            ; $130f c8      
   mvi c,$90     ; $1310 0e 90   
   lxi d,$157e   ; $1312 11 7e 15
   cnz $1516     ; $1315 c4 16 15
   inx b         ; $1318 03      
   stax b        ; $1319 02      
   mov d,l       ; $131a 55      
   mvi l,$fa     ; $131b 2e fa   
   stax d        ; $131d 12      
   call $02e4    ; $131e cd e4 02
   rz            ; $1321 c8      
   mvi c,$8d     ; $1322 0e 8d   
   stax d        ; $1324 12      
   dcr d         ; $1325 15      
   inx b         ; $1326 03      
   inx b         ; $1327 03      
   mov b,e       ; $1328 43      
   mov b,m       ; $1329 46      
   mov c,h       ; $132a 4c      
   dad d         ; $132b 19      
   inx d         ; $132c 13      
   call $0984    ; $132d cd 84 09
   inx b         ; $1330 03      
   nop           ; $1331 00      
   dcr b         ; $1332 05      
   mvi a,$42     ; $1333 3e 42   
   mov c,a       ; $1335 4f      
   mov b,h       ; $1336 44      
   mov e,c       ; $1337 59      
   daa           ; $1338 27      
   inx d         ; $1339 13      
   call $02e4    ; $133a cd e4 02
   dcr l         ; $133d 2d      
   inx d         ; $133e 13      
   mov c,d       ; $133f 4a      
   inr b         ; $1340 04      
   dcr d         ; $1341 15      
   inx b         ; $1342 03      
   dcr b         ; $1343 05      
   mov b,d       ; $1344 42      
   mov c,a       ; $1345 4f      
   mov b,h       ; $1346 44      
   mov e,c       ; $1347 59      
   mvi a,$32     ; $1348 3e 32   
   inx d         ; $134a 13      
   call $02e4    ; $134b cd e4 02
   dcr l         ; $134e 2d      
   inx d         ; $134f 13      
   mov d,l       ; $1350 55      
   inr b         ; $1351 04      
   dcr d         ; $1352 15      
   inx b         ; $1353 03      
   dcr b         ; $1354 05      
   mvi a,$4c     ; $1355 3e 4c   
   mov c,c       ; $1357 49      
   mov c,m       ; $1358 4e      
   mov c,e       ; $1359 4b      
   mov b,e       ; $135a 43      
   inx d         ; $135b 13      
   call $02e4    ; $135c cd e4 02
   sbb c         ; $135f 99      
   inr b         ; $1360 04      
   dcr d         ; $1361 15      
   inx b         ; $1362 03      
   dcr b         ; $1363 05      
   mov c,h       ; $1364 4c      
   mov c,c       ; $1365 49      
   mov c,m       ; $1366 4e      
   mov c,e       ; $1367 4b      
   mvi a,$54     ; $1368 3e 54   
   inx d         ; $136a 13      
   call $02e4    ; $136b cd e4 02
   add d         ; $136e 82      
   inr b         ; $136f 04      
   dcr d         ; $1370 15      
   inx b         ; $1371 03      
   mvi b,$4e     ; $1372 06 4e   
   mvi a,$4c     ; $1374 3e 4c   
   mov c,c       ; $1376 49      
   mov c,m       ; $1377 4e      
   mov c,e       ; $1378 4b      
   mov h,e       ; $1379 63      
   inx d         ; $137a 13      
   call $02e4    ; $137b cd e4 02
   mov l,a       ; $137e 6f      
   rrc           ; $137f 0f      
   dcx h         ; $1380 2b      
   ldax b        ; $1381 0a      
   cmc           ; $1382 3f      
   nop           ; $1383 00      
   rz            ; $1384 c8      
   .byte 0x08    ; $1385 08      
   mov c,d       ; $1386 4a      
   inr b         ; $1387 04      
   dcr d         ; $1388 15      
   inx b         ; $1389 03      
   dcr b         ; $138a 05      
   mov c,m       ; $138b 4e      
   mov b,c       ; $138c 41      
   mov c,l       ; $138d 4d      
   mov b,l       ; $138e 45      
   mvi a,$72     ; $138f 3e 72   
   inx d         ; $1391 13      
   call $02e4    ; $1392 cd e4 02
   mov a,e       ; $1395 7b      
   inx d         ; $1396 13      
   mov l,e       ; $1397 6b      
   inx d         ; $1398 13      
   dcr d         ; $1399 15      
   inx b         ; $139a 03      
   mvi b,$4c     ; $139b 06 4c   
   mvi a,$4e     ; $139d 3e 4e   
   mov b,c       ; $139f 41      
   mov c,l       ; $13a0 4d      
   mov b,l       ; $13a1 45      
   adc d         ; $13a2 8a      
   inx d         ; $13a3 13      
   call $02e4    ; $13a4 cd e4 02
   dcx h         ; $13a7 2b      
   ldax b        ; $13a8 0a      
   .byte 0x20    ; $13a9 20      
   nop           ; $13aa 00      
   jc $e50e      ; $13ab da 0e e5
   ldax b        ; $13ae 0a      
   out $13       ; $13af d3 13   
   out $03       ; $13b1 d3 03   
   sbb a         ; $13b3 9f      
   ldax b        ; $13b4 0a      
   mov d,l       ; $13b5 55      
   inr b         ; $13b6 04      
   sub c         ; $13b7 91      
   dad b         ; $13b8 09      
   dcx h         ; $13b9 2b      
   ldax b        ; $13ba 0a      
   mov a,a       ; $13bb 7f      
   nop           ; $13bc 00      
   rz            ; $13bd c8      
   .byte 0x08    ; $13be 08      
   mov m,a       ; $13bf 77      
   inr b         ; $13c0 04      
   sbb a         ; $13c1 9f      
   ldax b        ; $13c2 0a      
   mov h,m       ; $13c3 66      
   dcr b         ; $13c4 05      
   mov a,d       ; $13c5 7a      
   ldax b        ; $13c6 0a      
   rst 1         ; $13c7 cf      
   inx d         ; $13c8 13      
   sbb a         ; $13c9 9f      
   ldax b        ; $13ca 0a      
   mov d,l       ; $13cb 55      
   inr b         ; $13cc 04      
   mov a,c       ; $13cd 79      
   inr e         ; $13ce 1c      
   mvi l,$0b     ; $13cf 2e 0b   
   ora c         ; $13d1 b1      
   inx d         ; $13d2 13      
   dcr d         ; $13d3 15      
   inx b         ; $13d4 03      
   dcr b         ; $13d5 05      
   mvi a,$4e     ; $13d6 3e 4e   
   mov b,c       ; $13d8 41      
   mov c,l       ; $13d9 4d      
   mov b,l       ; $13da 45      
   sbb e         ; $13db 9b      
   inx d         ; $13dc 13      
   call $02e4    ; $13dd cd e4 02
   mov e,h       ; $13e0 5c      
   inx d         ; $13e1 13      
   ana h         ; $13e2 a4      
   inx d         ; $13e3 13      
   dcr d         ; $13e4 15      
   inx b         ; $13e5 03      
   inr b         ; $13e6 04      
   mov d,a       ; $13e7 57      
   mov c,a       ; $13e8 4f      
   mov d,d       ; $13e9 52      
   mov b,h       ; $13ea 44      
   push d        ; $13eb d5      
   inx d         ; $13ec 13      
   call $02e4    ; $13ed cd e4 02
   dcx h         ; $13f0 2b      
   ldax b        ; $13f1 0a      
   mvi d,$34     ; $13f2 16 34   
   add h         ; $13f4 84      
   dad b         ; $13f5 09      
   rpo           ; $13f6 e0      
   inx b         ; $13f7 03      
   mov a,d       ; $13f8 7a      
   ldax b        ; $13f9 0a      
   nop           ; $13fa 00      
   inr d         ; $13fb 14      
   inr l         ; $13fc 2c      
   inx b         ; $13fd 03      
   dcr d         ; $13fe 15      
   inx b         ; $13ff 03      
   ora c         ; $1400 b1      
   stax b        ; $1401 02      
   add h         ; $1402 84      
   dad b         ; $1403 09      
   rpo           ; $1404 e0      
   inx b         ; $1405 03      
   mov a,d       ; $1406 7a      
   ldax b        ; $1407 0a      
   mvi d,$14     ; $1408 16 14   
   .byte 0xfd    ; $140a fd      
   inr l         ; $140b 2c      
   out $03       ; $140c d3 03   
   mov e,a       ; $140e 5f      
   stax b        ; $140f 02      
   sbb l         ; $1410 9d      
   dad b         ; $1411 09      
   mov l,b       ; $1412 68      
   ldax b        ; $1413 0a      
   .byte 0x18    ; $1414 18      
   inr d         ; $1415 14      
   .byte 0xcb    ; $1416 cb      
   stax b        ; $1417 02      
   hlt           ; $1418 76      
   stax b        ; $1419 02      
   add h         ; $141a 84      
   dad b         ; $141b 09      
   mov c,d       ; $141c 4a      
   inr b         ; $141d 04      
   mov l,e       ; $141e 6b      
   stax b        ; $141f 02      
   add h         ; $1420 84      
   dad b         ; $1421 09      
   hlt           ; $1422 76      
   stax b        ; $1423 02      
   add h         ; $1424 84      
   dad b         ; $1425 09      
   mov d,l       ; $1426 55      
   inr b         ; $1427 04      
   inx sp        ; $1428 33      
   inr c         ; $1429 0c      
   mov a,d       ; $142a 7a      
   ldax b        ; $142b 0a      
   inr a         ; $142c 3c      
   inr d         ; $142d 14      
   mov e,a       ; $142e 5f      
   stax b        ; $142f 02      
   add h         ; $1430 84      
   dad b         ; $1431 09      
   mov d,l       ; $1432 55      
   inr b         ; $1433 04      
   hlt           ; $1434 76      
   stax b        ; $1435 02      
   sbb l         ; $1436 9d      
   dad b         ; $1437 09      
   mov l,b       ; $1438 68      
   ldax b        ; $1439 0a      
   mov c,b       ; $143a 48      
   inr d         ; $143b 14      
   mov l,e       ; $143c 6b      
   stax b        ; $143d 02      
   add h         ; $143e 84      
   dad b         ; $143f 09      
   hlt           ; $1440 76      
   stax b        ; $1441 02      
   sbb l         ; $1442 9d      
   dad b         ; $1443 09      
   rz            ; $1444 c8      
   mvi c,$c8     ; $1445 0e c8   
   mvi c,$d3     ; $1447 0e d3   
   inx b         ; $1449 03      
   rst 7         ; $144a ff      
   mvi c,$aa     ; $144b 0e aa   
   dad b         ; $144d 09      
   rst 7         ; $144e ff      
   mvi c,$77     ; $144f 0e 77   
   inr b         ; $1451 04      
   adc l         ; $1452 8d      
   inx b         ; $1453 03      
   mov a,h       ; $1454 7c      
   dcx b         ; $1455 0b      
   rst 7         ; $1456 ff      
   mvi c,$a6     ; $1457 0e a6   
   mvi d,$62     ; $1459 16 62   
   inx b         ; $145b 03      
   out $03       ; $145c d3 03   
   sub c         ; $145e 91      
   dad b         ; $145f 09      
   mov m,a       ; $1460 77      
   inr b         ; $1461 04      
   mov c,d       ; $1462 4a      
   inr b         ; $1463 04      
   xra d         ; $1464 aa      
   dad b         ; $1465 09      
   dcr d         ; $1466 15      
   inx b         ; $1467 03      
   inx b         ; $1468 03      
   mov b,e       ; $1469 43      
   cma           ; $146a 2f      
   mov c,h       ; $146b 4c      
   ani $13       ; $146c e6 13   
   call $0984    ; $146e cd 84 09
   mov b,b       ; $1471 40      
   nop           ; $1472 00      
   inr b         ; $1473 04      
   mov d,e       ; $1474 53      
   mov d,h       ; $1475 54      
   dcr l         ; $1476 2d      
   mov b,e       ; $1477 43      
   mov l,b       ; $1478 68      
   inr d         ; $1479 14      
   call $0984    ; $147a cd 84 09
   dcr c         ; $147d 0d      
   nop           ; $147e 00      
   inr b         ; $147f 04      
   mov b,d       ; $1480 42      
   dcr l         ; $1481 2d      
   mov d,e       ; $1482 53      
   mov d,b       ; $1483 50      
   mov m,e       ; $1484 73      
   inr d         ; $1485 14      
   call $0984    ; $1486 cd 84 09
   .byte 0x08    ; $1489 08      
   nop           ; $148a 00      
   inx b         ; $148b 03      
   mov b,e       ; $148c 43      
   inr a         ; $148d 3c      
   dcr l         ; $148e 2d      
   mov a,a       ; $148f 7f      
   inr d         ; $1490 14      
   call $0984    ; $1491 cd 84 09
   .byte 0x08    ; $1494 08      
   nop           ; $1495 00      
   mvi b,$45     ; $1496 06 45   
   mov e,b       ; $1498 58      
   mov d,b       ; $1499 50      
   mov b,l       ; $149a 45      
   mov b,e       ; $149b 43      
   mov d,h       ; $149c 54      
   adc e         ; $149d 8b      
   inr d         ; $149e 14      
   call $02e4    ; $149f cd e4 02
   dcx h         ; $14a2 2b      
   ldax b        ; $14a3 0a      
   .byte 0x08    ; $14a4 08      
   inr m         ; $14a5 34      
   add h         ; $14a6 84      
   dad b         ; $14a7 09      
   rpo           ; $14a8 e0      
   inx b         ; $14a9 03      
   mov a,d       ; $14aa 7a      
   ldax b        ; $14ab 0a      
   ora d         ; $14ac b2      
   inr d         ; $14ad 14      
   inr l         ; $14ae 2c      
   inx b         ; $14af 03      
   dcr d         ; $14b0 15      
   inx b         ; $14b1 03      
   mov h,d       ; $14b2 62      
   inx b         ; $14b3 03      
   adc l         ; $14b4 8d      
   inx b         ; $14b5 03      
   rz            ; $14b6 c8      
   mvi c,$0c     ; $14b7 0e 0c   
   dcx b         ; $14b9 0b      
   shld $5415    ; $14ba 22 15 54
   dcr d         ; $14bd 15      
   out $03       ; $14be d3 03   
   add m         ; $14c0 86      
   inr d         ; $14c1 14      
   mov h,m       ; $14c2 66      
   dcr b         ; $14c3 05      
   mov h,d       ; $14c4 62      
   inx b         ; $14c5 03      
   sub c         ; $14c6 91      
   inr d         ; $14c7 14      
   mov h,m       ; $14c8 66      
   dcr b         ; $14c9 05      
   .byte 0xd9    ; $14ca d9      
   .byte 0x08    ; $14cb 08      
   mov a,d       ; $14cc 7a      
   ldax b        ; $14cd 0a      
   cpi $14       ; $14ce fe 14   
   dcr c         ; $14d0 0d      
   dad b         ; $14d1 09      
   jp $6603      ; $14d2 f2 03 66
   dcr b         ; $14d5 05      
   sub b         ; $14d6 90      
   ldax b        ; $14d7 0a      
   jp $2014      ; $14d8 f2 14 20
   dad b         ; $14db 09      
   out $03       ; $14dc d3 03   
   dcr a         ; $14de 3d      
   dcr d         ; $14df 15      
   ana m         ; $14e0 a6      
   mvi d,$3d     ; $14e1 16 3d   
   dcr d         ; $14e3 15      
   dcr a         ; $14e4 3d      
   dcr d         ; $14e5 15      
   adc m         ; $14e6 8e      
   inr b         ; $14e7 04      
   .byte 0x20    ; $14e8 20      
   dad b         ; $14e9 09      
   adc m         ; $14ea 8e      
   inr b         ; $14eb 04      
   dcr c         ; $14ec 0d      
   dad b         ; $14ed 09      
   mov l,b       ; $14ee 68      
   ldax b        ; $14ef 0a      
   cp $7514      ; $14f0 f4 14 75
   dad b         ; $14f3 09      
   .byte 0x20    ; $14f4 20      
   dad b         ; $14f5 09      
   adc m         ; $14f6 8e      
   inr b         ; $14f7 04      
   dcr c         ; $14f8 0d      
   dad b         ; $14f9 09      
   mov l,b       ; $14fa 68      
   ldax b        ; $14fb 0a      
   mvi e,$15     ; $14fc 1e 15   
   out $03       ; $14fe d3 03   
   mov a,d       ; $1500 7a      
   inr d         ; $1501 14      
   mov h,m       ; $1502 66      
   dcr b         ; $1503 05      
   mov a,d       ; $1504 7a      
   ldax b        ; $1505 0a      
   inr d         ; $1506 14      
   dcr d         ; $1507 15      
   add d         ; $1508 82      
   inx b         ; $1509 03      
   ana m         ; $150a a6      
   mvi d,$3d     ; $150b 16 3d   
   dcr d         ; $150d 15      
   mov a,c       ; $150e 79      
   inr e         ; $150f 1c      
   mov l,b       ; $1510 68      
   ldax b        ; $1511 0a      
   mvi e,$15     ; $1512 1e 15   
   out $03       ; $1514 d3 03   
   dcr a         ; $1516 3d      
   dcr d         ; $1517 15      
   mov h,d       ; $1518 62      
   inx b         ; $1519 03      
   xra d         ; $151a aa      
   dad b         ; $151b 09      
   mov m,a       ; $151c 77      
   inr b         ; $151d 04      
   mvi l,$0b     ; $151e 2e 0b   
   cmp h         ; $1520 bc      
   inr d         ; $1521 14      
   adc l         ; $1522 8d      
   inx b         ; $1523 03      
   mov d,l       ; $1524 55      
   inr b         ; $1525 04      
   sbb d         ; $1526 9a      
   stax b        ; $1527 02      
   sbb l         ; $1528 9d      
   dad b         ; $1529 09      
   dcr d         ; $152a 15      
   inx b         ; $152b 03      
   add b         ; $152c 80      
   sub m         ; $152d 96      
   inr d         ; $152e 14      
   call $02e4    ; $152f cd e4 02
   mov m,l       ; $1532 75      
   dad b         ; $1533 09      
   dcr d         ; $1534 15      
   inx b         ; $1535 03      
   inr b         ; $1536 04      
   mov b,l       ; $1537 45      
   mov c,l       ; $1538 4d      
   mov c,c       ; $1539 49      
   mov d,h       ; $153a 54      
   inr l         ; $153b 2c      
   dcr d         ; $153c 15      
   call $02e4    ; $153d cd e4 02
   dcx h         ; $1540 2b      
   ldax b        ; $1541 0a      
   mvi c,$34     ; $1542 0e 34   
   add h         ; $1544 84      
   dad b         ; $1545 09      
   inr l         ; $1546 2c      
   inx b         ; $1547 03      
   ana m         ; $1548 a6      
   stax b        ; $1549 02      
   ldax b        ; $154a 0a      
   ldax b        ; $154b 0a      
   dcr d         ; $154c 15      
   inx b         ; $154d 03      
   inx b         ; $154e 03      
   mov c,e       ; $154f 4b      
   mov b,l       ; $1550 45      
   mov e,c       ; $1551 59      
   mvi m,$15     ; $1552 36 15   
   call $02e4    ; $1554 cd e4 02
   dcx h         ; $1557 2b      
   ldax b        ; $1558 0a      
   inr c         ; $1559 0c      
   inr m         ; $155a 34      
   add h         ; $155b 84      
   dad b         ; $155c 09      
   inr l         ; $155d 2c      
   inx b         ; $155e 03      
   dcr d         ; $155f 15      
   inx b         ; $1560 03      
   stax b        ; $1561 02      
   mov b,e       ; $1562 43      
   mov d,d       ; $1563 52      
   mov c,m       ; $1564 4e      
   dcr d         ; $1565 15      
   call $02e4    ; $1566 cd e4 02
   dcx h         ; $1569 2b      
   ldax b        ; $156a 0a      
   .byte 0x10    ; $156b 10      
   inr m         ; $156c 34      
   add h         ; $156d 84      
   dad b         ; $156e 09      
   inr l         ; $156f 2c      
   inx b         ; $1570 03      
   ana m         ; $1571 a6      
   stax b        ; $1572 02      
   cm $1509      ; $1573 fc 09 15
   inx b         ; $1576 03      
   inr b         ; $1577 04      
   mov d,h       ; $1578 54      
   mov e,c       ; $1579 59      
   mov d,b       ; $157a 50      
   mov b,l       ; $157b 45      
   mov h,c       ; $157c 61      
   dcr d         ; $157d 15      
   call $02e4    ; $157e cd e4 02
   dcx h         ; $1581 2b      
   ldax b        ; $1582 0a      
   stax d        ; $1583 12      
   inr m         ; $1584 34      
   add h         ; $1585 84      
   dad b         ; $1586 09      
   rpo           ; $1587 e0      
   inx b         ; $1588 03      
   mov a,d       ; $1589 7a      
   ldax b        ; $158a 0a      
   sub c         ; $158b 91      
   dcr d         ; $158c 15      
   inr l         ; $158d 2c      
   inx b         ; $158e 03      
   dcr d         ; $158f 15      
   inx b         ; $1590 03      
   rz            ; $1591 c8      
   mvi c,$0c     ; $1592 0e 0c   
   dcx b         ; $1594 0b      
   ana e         ; $1595 a3      
   dcr d         ; $1596 15      
   out $03       ; $1597 d3 03   
   sub c         ; $1599 91      
   dad b         ; $159a 09      
   dcr a         ; $159b 3d      
   dcr d         ; $159c 15      
   mov m,a       ; $159d 77      
   inr b         ; $159e 04      
   mvi l,$0b     ; $159f 2e 0b   
   sub a         ; $15a1 97      
   dcr d         ; $15a2 15      
   add d         ; $15a3 82      
   inx b         ; $15a4 03      
   dcr d         ; $15a5 15      
   inx b         ; $15a6 03      
   .byte 0x08    ; $15a7 08      
   mov b,m       ; $15a8 46      
   mov c,a       ; $15a9 4f      
   mov d,d       ; $15aa 52      
   mov d,h       ; $15ab 54      
   mov c,b       ; $15ac 48      
   dcr l         ; $15ad 2d      
   .byte 0x38    ; $15ae 38      
   inx sp        ; $15af 33      
   mov m,a       ; $15b0 77      
   dcr d         ; $15b1 15      
   call $02e4    ; $15b2 cd e4 02
   mov h,m       ; $15b5 66      
   dcr d         ; $15b6 15      
   mvi a,$18     ; $15b7 3e 18   
   lxi d,$5443   ; $15b9 11 43 54
   mov b,c       ; $15bc 41      
   mov c,b       ; $15bd 48      
   mov h,h       ; $15be 64      
   mov b,c       ; $15bf 41      
   mov d,b       ; $15c0 50      
   mov d,h       ; $15c1 54      
   .byte 0x20    ; $15c2 20      
   mov b,m       ; $15c3 46      
   mov c,a       ; $15c4 4f      
   mov d,d       ; $15c5 52      
   mov d,h       ; $15c6 54      
   mov c,b       ; $15c7 48      
   dcr l         ; $15c8 2d      
   .byte 0x38    ; $15c9 38      
   inx sp        ; $15ca 33      
   dcr d         ; $15cb 15      
   inx b         ; $15cc 03      
   .byte 0xfd    ; $15cd fd      
   .byte 0x08    ; $15ce 08      
   .byte 0xd9    ; $15cf d9      
   .byte 0x08    ; $15d0 08      
   mov a,d       ; $15d1 7a      
   ldax b        ; $15d2 0a      
   in $15        ; $15d3 db 15   
   add d         ; $15d5 82      
   inx b         ; $15d6 03      
   dcx h         ; $15d7 2b      
   ldax b        ; $15d8 0a      
   mvi l,$00     ; $15d9 2e 00   
   dcr d         ; $15db 15      
   inx b         ; $15dc 03      
   nop           ; $15dd 00      
   nop           ; $15de 00      
   nop           ; $15df 00      
   nop           ; $15e0 00      
   nop           ; $15e1 00      
   nop           ; $15e2 00      
   nop           ; $15e3 00      
   nop           ; $15e4 00      
   nop           ; $15e5 00      
   nop           ; $15e6 00      
   nop           ; $15e7 00      
   nop           ; $15e8 00      
   dcr b         ; $15e9 05      
   mov d,c       ; $15ea 51      
   mov d,l       ; $15eb 55      
   mov b,l       ; $15ec 45      
   mov d,d       ; $15ed 52      
   mov e,c       ; $15ee 59      
   ana a         ; $15ef a7      
   dcr d         ; $15f0 15      
   call $02e4    ; $15f1 cd e4 02
   mov h,m       ; $15f4 66      
   dcr d         ; $15f5 15      
   dcx h         ; $15f6 2b      
   ldax b        ; $15f7 0a      
   mvi a,$00     ; $15f8 3e 00   
   dcr a         ; $15fa 3d      
   dcr d         ; $15fb 15      
   .byte 0xcb    ; $15fc cb      
   stax b        ; $15fd 02      
   mov l,m       ; $15fe 6e      
   inr d         ; $15ff 14      
   adc m         ; $1600 8e      
   inr b         ; $1601 04      
   sbb a         ; $1602 9f      
   inr d         ; $1603 14      
   sbb d         ; $1604 9a      
   stax b        ; $1605 02      
   add h         ; $1606 84      
   dad b         ; $1607 09      
   out $03       ; $1608 d3 03   
   mov l,e       ; $160a 6b      
   stax b        ; $160b 02      
   sbb l         ; $160c 9d      
   dad b         ; $160d 09      
   mov a,d       ; $160e 7a      
   ldax b        ; $160f 0a      
   inr d         ; $1610 14      
   mvi d,$66     ; $1611 16 66   
   dcr d         ; $1613 15      
   hlt           ; $1614 76      
   stax b        ; $1615 02      
   cm $cb09      ; $1616 fc 09 cb
   stax b        ; $1619 02      
   mov e,a       ; $161a 5f      
   stax b        ; $161b 02      
   sbb l         ; $161c 9d      
   dad b         ; $161d 09      
   dcr d         ; $161e 15      
   inx b         ; $161f 03      
   rlc           ; $1620 07      
   mov b,e       ; $1621 43      
   mov c,a       ; $1622 4f      
   mov c,m       ; $1623 4e      
   mov d,e       ; $1624 53      
   mov c,a       ; $1625 4f      
   mov c,h       ; $1626 4c      
   mov b,l       ; $1627 45      
   pchl          ; $1628 e9      
   dcr d         ; $1629 15      
   call $02e4    ; $162a cd e4 02
   dcx h         ; $162d 2b      
   ldax b        ; $162e 0a      
   inr d         ; $162f 14      
   inr m         ; $1630 34      
   add h         ; $1631 84      
   dad b         ; $1632 09      
   rpo           ; $1633 e0      
   inx b         ; $1634 03      
   mov a,d       ; $1635 7a      
   ldax b        ; $1636 0a      
   dcr a         ; $1637 3d      
   mvi d,$2c     ; $1638 16 2c   
   inx b         ; $163a 03      
   dcr d         ; $163b 15      
   inx b         ; $163c 03      
   ora c         ; $163d b1      
   stax b        ; $163e 02      
   cm $2b09      ; $163f fc 09 2b
   ldax b        ; $1642 0a      
   adc e         ; $1643 8b      
   inr c         ; $1644 0c      
   dcx h         ; $1645 2b      
   ldax b        ; $1646 0a      
   mvi c,$34     ; $1647 0e 34   
   sbb l         ; $1649 9d      
   dad b         ; $164a 09      
   dcx h         ; $164b 2b      
   ldax b        ; $164c 0a      
   sbb l         ; $164d 9d      
   inr c         ; $164e 0c      
   dcx h         ; $164f 2b      
   ldax b        ; $1650 0a      
   inr c         ; $1651 0c      
   inr m         ; $1652 34      
   sbb l         ; $1653 9d      
   dad b         ; $1654 09      
   dcx h         ; $1655 2b      
   ldax b        ; $1656 0a      
   ora b         ; $1657 b0      
   inr c         ; $1658 0c      
   dcx h         ; $1659 2b      
   ldax b        ; $165a 0a      
   .byte 0x10    ; $165b 10      
   inr m         ; $165c 34      
   sbb l         ; $165d 9d      
   dad b         ; $165e 09      
   mov h,m       ; $165f 66      
   dcr d         ; $1660 15      
   mov l,e       ; $1661 6b      
   stax b        ; $1662 02      
   cm $7609      ; $1663 fc 09 76
   stax b        ; $1666 02      
   cm $1509      ; $1667 fc 09 15
   inx b         ; $166a 03      
   stax b        ; $166b 02      
   dcx sp        ; $166c 3b      
   mov d,e       ; $166d 53      
   pchl          ; $166e e9      
   dcr d         ; $166f 15      
   call $02e4    ; $1670 cd e4 02
   mov m,l       ; $1673 75      
   dad b         ; $1674 09      
   dcr d         ; $1675 15      
   inx b         ; $1676 03      
   inx b         ; $1677 03      
   mov c,b       ; $1678 48      
   mov b,l       ; $1679 45      
   mov e,b       ; $167a 58      
   mov l,e       ; $167b 6b      
   mvi d,$cd     ; $167c 16 cd   
   cpo $2b02     ; $167e e4 02 2b
   ldax b        ; $1681 0a      
   .byte 0x10    ; $1682 10      
   nop           ; $1683 00      
   .byte 0x08    ; $1684 08      
   stax b        ; $1685 02      
   sbb l         ; $1686 9d      
   dad b         ; $1687 09      
   dcr d         ; $1688 15      
   inx b         ; $1689 03      
   rlc           ; $168a 07      
   mov b,h       ; $168b 44      
   mov b,l       ; $168c 45      
   mov b,e       ; $168d 43      
   mov c,c       ; $168e 49      
   mov c,l       ; $168f 4d      
   mov b,c       ; $1690 41      
   mov c,h       ; $1691 4c      
   mov m,a       ; $1692 77      
   mvi d,$cd     ; $1693 16 cd   
   cpo $2b02     ; $1695 e4 02 2b
   ldax b        ; $1698 0a      
   ldax b        ; $1699 0a      
   nop           ; $169a 00      
   .byte 0x08    ; $169b 08      
   stax b        ; $169c 02      
   sbb l         ; $169d 9d      
   dad b         ; $169e 09      
   dcr d         ; $169f 15      
   inx b         ; $16a0 03      
   stax b        ; $16a1 02      
   mov b,d       ; $16a2 42      
   mov c,h       ; $16a3 4c      
   adc d         ; $16a4 8a      
   mvi d,$cd     ; $16a5 16 cd   
   add h         ; $16a7 84      
   dad b         ; $16a8 09      
   .byte 0x20    ; $16a9 20      
   nop           ; $16aa 00      
   dcr b         ; $16ab 05      
   mov b,d       ; $16ac 42      
   mov c,h       ; $16ad 4c      
   mov b,c       ; $16ae 41      
   mov c,m       ; $16af 4e      
   mov c,e       ; $16b0 4b      
   ana c         ; $16b1 a1      
   mvi d,$cd     ; $16b2 16 cd   
   cpo $a602     ; $16b4 e4 02 a6
   mvi d,$f5     ; $16b7 16 f5   
   dcx b         ; $16b9 0b      
   dcr d         ; $16ba 15      
   inx b         ; $16bb 03      
   dcr b         ; $16bc 05      
   mov d,e       ; $16bd 53      
   mov d,b       ; $16be 50      
   mov b,c       ; $16bf 41      
   mov b,e       ; $16c0 43      
   mov b,l       ; $16c1 45      
   xra e         ; $16c2 ab      
   mvi d,$cd     ; $16c3 16 cd   
   cpo $a602     ; $16c5 e4 02 a6
   mvi d,$3d     ; $16c8 16 3d   
   dcr d         ; $16ca 15      
   dcr d         ; $16cb 15      
   inx b         ; $16cc 03      
   mvi b,$53     ; $16cd 06 53   
   mov d,b       ; $16cf 50      
   mov b,c       ; $16d0 41      
   mov b,e       ; $16d1 43      
   mov b,l       ; $16d2 45      
   mov d,e       ; $16d3 53      
   cmp h         ; $16d4 bc      
   mvi d,$cd     ; $16d5 16 cd   
   cpo $c802     ; $16d7 e4 02 c8
   mvi c,$0c     ; $16da 0e 0c   
   dcx b         ; $16dc 0b      
   push h        ; $16dd e5      
   mvi d,$c4     ; $16de 16 c4   
   mvi d,$2e     ; $16e0 16 2e   
   dcx b         ; $16e2 0b      
   rst 3         ; $16e3 df      
   mvi d,$15     ; $16e4 16 15   
   inx b         ; $16e6 03      
   inx b         ; $16e7 03      
   mov c,c       ; $16e8 49      
   mov b,h       ; $16e9 44      
   mvi l,$cd     ; $16ea 2e cd   
   mvi d,$cd     ; $16ec 16 cd   
   cpo $6f02     ; $16ee e4 02 6f
   rrc           ; $16f1 0f      
   dcx h         ; $16f2 2b      
   ldax b        ; $16f3 0a      
   cmc           ; $16f4 3f      
   nop           ; $16f5 00      
   rz            ; $16f6 c8      
   .byte 0x08    ; $16f7 08      
   mov a,m       ; $16f8 7e      
   dcr d         ; $16f9 15      
   dcr d         ; $16fa 15      
   inx b         ; $16fb 03      
   dcx b         ; $16fc 0b      
   mov b,h       ; $16fd 44      
   mov b,l       ; $16fe 45      
   mov b,m       ; $16ff 46      
   mov c,c       ; $1700 49      
   mov c,m       ; $1701 4e      
   mov c,c       ; $1702 49      
   mov d,h       ; $1703 54      
   mov c,c       ; $1704 49      
   mov c,a       ; $1705 4f      
   mov c,m       ; $1706 4e      
   mov d,e       ; $1707 53      
   rst 4         ; $1708 e7      
   mvi d,$cd     ; $1709 16 cd   
   cpo $2402     ; $170b e4 02 24
   stax b        ; $170e 02      
   add h         ; $170f 84      
   dad b         ; $1710 09      
   inx sp        ; $1711 33      
   stax b        ; $1712 02      
   sbb l         ; $1713 9d      
   dad b         ; $1714 09      
   dcr d         ; $1715 15      
   inx b         ; $1716 03      
   mvi b,$4c     ; $1717 06 4c   
   mov b,c       ; $1719 41      
   mov d,h       ; $171a 54      
   mov b,l       ; $171b 45      
   mov d,e       ; $171c 53      
   mov d,h       ; $171d 54      
   cm $cd16      ; $171e fc 16 cd
   cpo $3302     ; $1721 e4 02 33
   stax b        ; $1724 02      
   add h         ; $1725 84      
   dad b         ; $1726 09      
   add h         ; $1727 84      
   dad b         ; $1728 09      
   dcr d         ; $1729 15      
   inx b         ; $172a 03      
   inx b         ; $172b 03      
   lxi h,$4643   ; $172c 21 43 46
   ral           ; $172f 17      
   ral           ; $1730 17      
   call $02e4    ; $1731 cd e4 02
   dcx h         ; $1734 2b      
   ldax b        ; $1735 0a      
   call $6200    ; $1736 cd 00 62
   inx b         ; $1739 03      
   xra d         ; $173a aa      
   dad b         ; $173b 09      
   mov m,a       ; $173c 77      
   inr b         ; $173d 04      
   sbb l         ; $173e 9d      
   dad b         ; $173f 09      
   dcr d         ; $1740 15      
   inx b         ; $1741 03      
   rlc           ; $1742 07      
   .byte 0x28    ; $1743 28      
   lxi h,$4f43   ; $1744 21 43 4f
   mov b,h       ; $1747 44      
   mov b,l       ; $1748 45      
   dad h         ; $1749 29      
   ral           ; $174a 17      
   ral           ; $174b 17      
   call $02e4    ; $174c cd e4 02
   .byte 0x20    ; $174f 20      
   ral           ; $1750 17      
   sub d         ; $1751 92      
   inx d         ; $1752 13      
   lxi sp,$1517  ; $1753 31 17 15
   inx b         ; $1756 03      
   mvi b,$53     ; $1757 06 53   
   mov c,l       ; $1759 4d      
   mov d,l       ; $175a 55      
   mov b,h       ; $175b 44      
   mov b,a       ; $175c 47      
   mov b,l       ; $175d 45      
   ral           ; $175e 17      
   ral           ; $175f 17      
   call $02e4    ; $1760 cd e4 02
   .byte 0x20    ; $1763 20      
   ral           ; $1764 17      
   dcx h         ; $1765 2b      
   ldax b        ; $1766 0a      
   mov b,b       ; $1767 40      
   nop           ; $1768 00      
   sui $0a       ; $1769 d6 0a   
   dcr d         ; $176b 15      
   inx b         ; $176c 03      
   add c         ; $176d 81      
   mov e,e       ; $176e 5b      
   mov d,a       ; $176f 57      
   ral           ; $1770 17      
   call $02e4    ; $1771 cd e4 02
   dcr d         ; $1774 15      
   stax b        ; $1775 02      
   cm $1509      ; $1776 fc 09 15
   inx b         ; $1779 03      
   lxi b,$6d5d   ; $177a 01 5d 6d
   ral           ; $177d 17      
   call $02e4    ; $177e cd e4 02
   cmp a         ; $1781 bf      
   mvi c,$15     ; $1782 0e 15   
   stax b        ; $1784 02      
   sbb l         ; $1785 9d      
   dad b         ; $1786 09      
   dcr d         ; $1787 15      
   inx b         ; $1788 03      
   inr b         ; $1789 04      
   mov b,m       ; $178a 46      
   mov c,c       ; $178b 49      
   mov c,m       ; $178c 4e      
   mov b,h       ; $178d 44      
   mov a,d       ; $178e 7a      
   ral           ; $178f 17      
   call $02e4    ; $1790 cd e4 02
   dcx h         ; $1793 2b      
   ldax b        ; $1794 0a      
   mvi b,$34     ; $1795 06 34   
   add h         ; $1797 84      
   dad b         ; $1798 09      
   rpo           ; $1799 e0      
   inx b         ; $179a 03      
   mov a,d       ; $179b 7a      
   ldax b        ; $179c 0a      
   ana e         ; $179d a3      
   ral           ; $179e 17      
   inr l         ; $179f 2c      
   inx b         ; $17a0 03      
   dcr d         ; $17a1 15      
   inx b         ; $17a2 03      
   inr h         ; $17a3 24      
   stax b        ; $17a4 02      
   add h         ; $17a5 84      
   dad b         ; $17a6 09      
   cmc           ; $17a7 3f      
   .byte 0x08    ; $17a8 08      
   mov a,d       ; $17a9 7a      
   ldax b        ; $17aa 0a      
   ora e         ; $17ab b3      
   ral           ; $17ac 17      
   ani $0e       ; $17ad e6 0e   
   mov l,b       ; $17af 68      
   ldax b        ; $17b0 0a      
   call $3317    ; $17b1 cd 17 33
   stax b        ; $17b4 02      
   add h         ; $17b5 84      
   dad b         ; $17b6 09      
   out $03       ; $17b7 d3 03   
   inr h         ; $17b9 24      
   stax b        ; $17ba 02      
   add h         ; $17bb 84      
   dad b         ; $17bc 09      
   mov h,m       ; $17bd 66      
   dcr b         ; $17be 05      
   sub b         ; $17bf 90      
   ldax b        ; $17c0 0a      
   ret           ; $17c1 c9      
   ral           ; $17c2 17      
   cmc           ; $17c3 3f      
   .byte 0x08    ; $17c4 08      
   mov l,b       ; $17c5 68      
   ldax b        ; $17c6 0a      
   call $8217    ; $17c7 cd 17 82
   inx b         ; $17ca 03      
   di            ; $17cb f3      
   mvi c,$7a     ; $17cc 0e 7a   
   ldax b        ; $17ce 0a      
   rst 5         ; $17cf ef      
   ral           ; $17d0 17      
   out $03       ; $17d1 d3 03   
   sub d         ; $17d3 92      
   inx d         ; $17d4 13      
   adc l         ; $17d5 8d      
   inx b         ; $17d6 03      
   sub c         ; $17d7 91      
   dad b         ; $17d8 09      
   dcx h         ; $17d9 2b      
   ldax b        ; $17da 0a      
   add b         ; $17db 80      
   nop           ; $17dc 00      
   rz            ; $17dd c8      
   .byte 0x08    ; $17de 08      
   mov a,d       ; $17df 7a      
   ldax b        ; $17e0 0a      
   pchl          ; $17e1 e9      
   ral           ; $17e2 17      
   pop d         ; $17e3 d1      
   mvi c,$68     ; $17e4 0e 68   
   ldax b        ; $17e6 0a      
   xchg          ; $17e7 eb      
   ral           ; $17e8 17      
   cmp a         ; $17e9 bf      
   mvi c,$68     ; $17ea 0e 68   
   ldax b        ; $17ec 0a      
   pop psw       ; $17ed f1      
   ral           ; $17ee 17      
   di            ; $17ef f3      
   mvi c,$15     ; $17f0 0e 15   
   inx b         ; $17f2 03      
   dcr b         ; $17f3 05      
   dcx h         ; $17f4 2b      
   mov d,a       ; $17f5 57      
   mov c,a       ; $17f6 4f      
   mov d,d       ; $17f7 52      
   mov b,h       ; $17f8 44      
   adc c         ; $17f9 89      
   ral           ; $17fa 17      
   call $02e4    ; $17fb cd e4 02
   rst 7         ; $17fe ff      
   mvi c,$b6     ; $17ff 0e b6   
   inx b         ; $1801 03      
   mov b,c       ; $1802 41      
   rrc           ; $1803 0f      
   adc l         ; $1804 8d      
   inx b         ; $1805 03      
   out $03       ; $1806 d3 03   
   add h         ; $1808 84      
   dad b         ; $1809 09      
   dcr e         ; $180a 1d      
   rrc           ; $180b 0f      
   sbb l         ; $180c 9d      
   dad b         ; $180d 09      
   dcr d         ; $180e 15      
   inx b         ; $180f 03      
   dcr b         ; $1810 05      
   dcr l         ; $1811 2d      
   mov d,a       ; $1812 57      
   mov c,a       ; $1813 4f      
   mov d,d       ; $1814 52      
   mov b,h       ; $1815 44      
   adc c         ; $1816 89      
   ral           ; $1817 17      
   call $02e4    ; $1818 cd e4 02
   cmc           ; $181b 3f      
   .byte 0x08    ; $181c 08      
   mov a,d       ; $181d 7a      
   ldax b        ; $181e 0a      
   lxi sp,$7b18  ; $181f 31 18 7b
   inx d         ; $1822 13      
   add h         ; $1823 84      
   dad b         ; $1824 09      
   cm $8401      ; $1825 fc 01 84
   dad b         ; $1828 09      
   sbb l         ; $1829 9d      
   dad b         ; $182a 09      
   ani $0e       ; $182b e6 0e   
   mov l,b       ; $182d 68      
   ldax b        ; $182e 0a      
   dcr m         ; $182f 35      
   .byte 0x18    ; $1830 18      
   add d         ; $1831 82      
   inx b         ; $1832 03      
   di            ; $1833 f3      
   mvi c,$15     ; $1834 0e 15   
   inx b         ; $1836 03      
   inr b         ; $1837 04      
   .byte 0x28    ; $1838 28      
   mvi l,$22     ; $1839 2e 22   
   dad h         ; $183b 29      
   adc c         ; $183c 89      
   ral           ; $183d 17      
   call $02e4    ; $183e cd e4 02
   inx sp        ; $1841 33      
   dad b         ; $1842 09      
   mov l,a       ; $1843 6f      
   rrc           ; $1844 0f      
   out $03       ; $1845 d3 03   
   mov m,a       ; $1847 77      
   inr b         ; $1848 04      
   .byte 0x20    ; $1849 20      
   dad b         ; $184a 09      
   mov c,d       ; $184b 4a      
   inr b         ; $184c 04      
   dcr c         ; $184d 0d      
   dad b         ; $184e 09      
   mov a,m       ; $184f 7e      
   dcr d         ; $1850 15      
   dcr d         ; $1851 15      
   inx b         ; $1852 03      
   dcr b         ; $1853 05      
   mov b,l       ; $1854 45      
   mov d,d       ; $1855 52      
   mov b,c       ; $1856 41      
   mov d,e       ; $1857 53      
   mov b,l       ; $1858 45      
   stc           ; $1859 37      
   .byte 0x18    ; $185a 18      
   call $02e4    ; $185b cd e4 02
   rz            ; $185e c8      
   mvi c,$f5     ; $185f 0e f5   
   dcx b         ; $1861 0b      
   dcr d         ; $1862 15      
   inx b         ; $1863 03      
   lxi b,$5327   ; $1864 01 27 53
   .byte 0x18    ; $1867 18      
   call $02e4    ; $1868 cd e4 02
   ana m         ; $186b a6      
   mvi d,$ed     ; $186c 16 ed   
   inx d         ; $186e 13      
   sub b         ; $186f 90      
   ral           ; $1870 17      
   mov a,m       ; $1871 7e      
   dcr b         ; $1872 05      
   mov c,d       ; $1873 4a      
   lxi d,$2d03   ; $1874 11 03 2d
   cmc           ; $1877 3f      
   .byte 0x20    ; $1878 20      
   dcr d         ; $1879 15      
   inx b         ; $187a 03      
   add e         ; $187b 83      
   mov e,e       ; $187c 5b      
   daa           ; $187d 27      
   mov e,l       ; $187e 5d      
   mov h,h       ; $187f 64      
   .byte 0x18    ; $1880 18      
   call $02e4    ; $1881 cd e4 02
   mov l,b       ; $1884 68      
   .byte 0x18    ; $1885 18      
   sub h         ; $1886 94      
   .byte 0x18    ; $1887 18      
   dcr d         ; $1888 15      
   inx b         ; $1889 03      
   add a         ; $188a 87      
   mov c,h       ; $188b 4c      
   mov c,c       ; $188c 49      
   mov d,h       ; $188d 54      
   mov b,l       ; $188e 45      
   mov d,d       ; $188f 52      
   mov b,c       ; $1890 41      
   mov c,h       ; $1891 4c      
   mov a,e       ; $1892 7b      
   .byte 0x18    ; $1893 18      
   call $02e4    ; $1894 cd e4 02
   dcr d         ; $1897 15      
   stax b        ; $1898 02      
   add h         ; $1899 84      
   dad b         ; $189a 09      
   mov a,d       ; $189b 7a      
   ldax b        ; $189c 0a      
   ana l         ; $189d a5      
   .byte 0x18    ; $189e 18      
   add e         ; $189f 83      
   rrc           ; $18a0 0f      
   dcx h         ; $18a1 2b      
   ldax b        ; $18a2 0a      
   dcr e         ; $18a3 1d      
   rrc           ; $18a4 0f      
   dcr d         ; $18a5 15      
   inx b         ; $18a6 03      
   adc b         ; $18a7 88      
   mov b,h       ; $18a8 44      
   mov c,h       ; $18a9 4c      
   mov c,c       ; $18aa 49      
   mov d,h       ; $18ab 54      
   mov b,l       ; $18ac 45      
   mov d,d       ; $18ad 52      
   mov b,c       ; $18ae 41      
   mov c,h       ; $18af 4c      
   adc d         ; $18b0 8a      
   .byte 0x18    ; $18b1 18      
   call $02e4    ; $18b2 cd e4 02
   dcr d         ; $18b5 15      
   stax b        ; $18b6 02      
   add h         ; $18b7 84      
   dad b         ; $18b8 09      
   mov a,d       ; $18b9 7a      
   ldax b        ; $18ba 0a      
   push b        ; $18bb c5      
   .byte 0x18    ; $18bc 18      
   add e         ; $18bd 83      
   rrc           ; $18be 0f      
   inr a         ; $18bf 3c      
   ldax b        ; $18c0 0a      
   dcr e         ; $18c1 1d      
   rrc           ; $18c2 0f      
   dcr e         ; $18c3 1d      
   rrc           ; $18c4 0f      
   dcr d         ; $18c5 15      
   inx b         ; $18c6 03      
   adc c         ; $18c7 89      
   mov e,e       ; $18c8 5b      
   mov b,e       ; $18c9 43      
   mov c,a       ; $18ca 4f      
   mov c,l       ; $18cb 4d      
   mov d,b       ; $18cc 50      
   mov c,c       ; $18cd 49      
   mov c,h       ; $18ce 4c      
   mov b,l       ; $18cf 45      
   mov e,l       ; $18d0 5d      
   ana a         ; $18d1 a7      
   .byte 0x18    ; $18d2 18      
   call $02e4    ; $18d3 cd e4 02
   mov l,b       ; $18d6 68      
   .byte 0x18    ; $18d7 18      
   dcr e         ; $18d8 1d      
   rrc           ; $18d9 0f      
   dcr d         ; $18da 15      
   inx b         ; $18db 03      
   rlc           ; $18dc 07      
   mov b,e       ; $18dd 43      
   mov c,a       ; $18de 4f      
   mov c,m       ; $18df 4e      
   mov d,m       ; $18e0 56      
   mov b,l       ; $18e1 45      
   mov d,d       ; $18e2 52      
   mov d,h       ; $18e3 54      
   rst 0         ; $18e4 c7      
   .byte 0x18    ; $18e5 18      
   call $02e4    ; $18e6 cd e4 02
   mov m,a       ; $18e9 77      
   inr b         ; $18ea 04      
   out $03       ; $18eb d3 03   
   dcr c         ; $18ed 0d      
   dad b         ; $18ee 09      
   sub c         ; $18ef 91      
   dad b         ; $18f0 09      
   .byte 0x08    ; $18f1 08      
   stax b        ; $18f2 02      
   add h         ; $18f3 84      
   dad b         ; $18f4 09      
   sub e         ; $18f5 93      
   .byte 0x08    ; $18f6 08      
   mov a,d       ; $18f7 7a      
   ldax b        ; $18f8 0a      
   lxi h,$8d19   ; $18f9 21 19 8d
   inx b         ; $18fc 03      
   .byte 0x08    ; $18fd 08      
   stax b        ; $18fe 02      
   add h         ; $18ff 84      
   dad b         ; $1900 09      
   sbb e         ; $1901 9b      
   mvi b,$b6     ; $1902 06 b6   
   inx b         ; $1904 03      
   .byte 0x08    ; $1905 08      
   stax b        ; $1906 02      
   add h         ; $1907 84      
   dad b         ; $1908 09      
   rst 0         ; $1909 c7      
   mvi b,$cf     ; $190a 06 cf   
   dcr b         ; $190c 05      
   mvi a,$02     ; $190d 3e 02   
   add h         ; $190f 84      
   dad b         ; $1910 09      
   mov m,a       ; $1911 77      
   inr b         ; $1912 04      
   mov a,d       ; $1913 7a      
   ldax b        ; $1914 0a      
   dcx d         ; $1915 1b      
   dad d         ; $1916 19      
   mvi a,$02     ; $1917 3e 02   
   ldax b        ; $1919 0a      
   ldax b        ; $191a 0a      
   .byte 0x20    ; $191b 20      
   dad b         ; $191c 09      
   mov l,b       ; $191d 68      
   ldax b        ; $191e 0a      
   pchl          ; $191f e9      
   .byte 0x18    ; $1920 18      
   .byte 0x20    ; $1921 20      
   dad b         ; $1922 09      
   dcr d         ; $1923 15      
   inx b         ; $1924 03      
   mvi b,$4e     ; $1925 06 4e   
   mov d,l       ; $1927 55      
   mov c,l       ; $1928 4d      
   mov b,d       ; $1929 42      
   mov b,l       ; $192a 45      
   mov d,d       ; $192b 52      
   cc $cd18      ; $192c dc 18 cd
   cpo $c802     ; $192f e4 02 c8
   mvi c,$c8     ; $1932 0e c8   
   mvi c,$b6     ; $1934 0e b6   
   inx b         ; $1936 03      
   out $03       ; $1937 d3 03   
   mov m,a       ; $1939 77      
   inr b         ; $193a 04      
   sub c         ; $193b 91      
   dad b         ; $193c 09      
   dcx h         ; $193d 2b      
   ldax b        ; $193e 0a      
   dcr l         ; $193f 2d      
   nop           ; $1940 00      
   mov h,m       ; $1941 66      
   dcr b         ; $1942 05      
   out $03       ; $1943 d3 03   
   dcr c         ; $1945 0d      
   dad b         ; $1946 09      
   mov d,l       ; $1947 55      
   inr b         ; $1948 04      
   cmp a         ; $1949 bf      
   mvi c,$3e     ; $194a 0e 3e   
   stax b        ; $194c 02      
   sbb l         ; $194d 9d      
   dad b         ; $194e 09      
   ani $18       ; $194f e6 18   
   out $03       ; $1951 d3 03   
   out $03       ; $1953 d3 03   
   sub c         ; $1955 91      
   dad b         ; $1956 09      
   ana m         ; $1957 a6      
   mvi d,$94     ; $1958 16 94   
   .byte 0x10    ; $195a 10      
   adc l         ; $195b 8d      
   inx b         ; $195c 03      
   mov a,m       ; $195d 7e      
   dcr b         ; $195e 05      
   mov a,m       ; $195f 7e      
   dcr b         ; $1960 05      
   rz            ; $1961 c8      
   .byte 0x08    ; $1962 08      
   mov a,d       ; $1963 7a      
   ldax b        ; $1964 0a      
   mov a,m       ; $1965 7e      
   dad d         ; $1966 19      
   out $03       ; $1967 d3 03   
   sub c         ; $1969 91      
   dad b         ; $196a 09      
   dcx h         ; $196b 2b      
   ldax b        ; $196c 0a      
   mvi l,$00     ; $196d 2e 00   
   sub h         ; $196f 94      
   .byte 0x10    ; $1970 10      
   mov c,d       ; $1971 4a      
   lxi d,$2004   ; $1972 11 04 20
   dcr l         ; $1975 2d      
   cmc           ; $1976 3f      
   .byte 0x20    ; $1977 20      
   rz            ; $1978 c8      
   mvi c,$68     ; $1979 0e 68   
   ldax b        ; $197b 0a      
   mov c,e       ; $197c 4b      
   dad d         ; $197d 19      
   add d         ; $197e 82      
   inx b         ; $197f 03      
   .byte 0x20    ; $1980 20      
   dad b         ; $1981 09      
   mov a,d       ; $1982 7a      
   ldax b        ; $1983 0a      
   adc b         ; $1984 88      
   dad d         ; $1985 19      
   .byte 0x20    ; $1986 20      
   mvi b,$15     ; $1987 06 15   
   inx b         ; $1989 03      
   mvi b,$3f     ; $198a 06 3f   
   mov d,e       ; $198c 53      
   mov d,h       ; $198d 54      
   mov b,c       ; $198e 41      
   mov b,e       ; $198f 43      
   mov c,e       ; $1990 4b      
   dcr h         ; $1991 25      
   dad d         ; $1992 19      
   call $02e4    ; $1993 cd e4 02
   inx sp        ; $1996 33      
   inr b         ; $1997 04      
   cmp m         ; $1998 be      
   lxi b,$0984   ; $1999 01 84 09
   adc l         ; $199c 8d      
   inx b         ; $199d 03      
   jm $4a04      ; $199e fa 04 4a
   lxi d,$e910   ; $19a1 11 10 e9
   mov b,e       ; $19a4 43      
   cpi $45       ; $19a5 fe 45   
   mov d,b       ; $19a7 50      
   rp            ; $19a8 f0      
   mov b,c       ; $19a9 41      
   mov c,b       ; $19aa 48      
   pchl          ; $19ab e9      
   mov b,l       ; $19ac 45      
   .byte 0x20    ; $19ad 20      
   mov b,e       ; $19ae 43      
   mov d,h       ; $19af 54      
   mov b,l       ; $19b0 45      
   mov c,e       ; $19b1 4b      
   mov b,c       ; $19b2 41      
   dcr d         ; $19b3 15      
   inx b         ; $19b4 03      
   dad b         ; $19b5 09      
   mov c,c       ; $19b6 49      
   mov c,m       ; $19b7 4e      
   mov d,h       ; $19b8 54      
   mov b,l       ; $19b9 45      
   mov d,d       ; $19ba 52      
   mov d,b       ; $19bb 50      
   mov d,d       ; $19bc 52      
   mov b,l       ; $19bd 45      
   mov d,h       ; $19be 54      
   adc d         ; $19bf 8a      
   dad d         ; $19c0 19      
   call $02e4    ; $19c1 cd e4 02
   dcx h         ; $19c4 2b      
   ldax b        ; $19c5 0a      
   inr b         ; $19c6 04      
   inr m         ; $19c7 34      
   add h         ; $19c8 84      
   dad b         ; $19c9 09      
   rpo           ; $19ca e0      
   inx b         ; $19cb 03      
   mov a,d       ; $19cc 7a      
   ldax b        ; $19cd 0a      
   cnc $2c19     ; $19ce d4 19 2c
   inx b         ; $19d1 03      
   dcr d         ; $19d2 15      
   inx b         ; $19d3 03      
   ana m         ; $19d4 a6      
   mvi d,$ed     ; $19d5 16 ed   
   inx d         ; $19d7 13      
   sub b         ; $19d8 90      
   ral           ; $19d9 17      
   out $03       ; $19da d3 03   
   mov a,d       ; $19dc 7a      
   ldax b        ; $19dd 0a      
   rm            ; $19de f8      
   dad d         ; $19df 19      
   dcr a         ; $19e0 3d      
   dcr b         ; $19e1 05      
   dcr d         ; $19e2 15      
   stax b        ; $19e3 02      
   add h         ; $19e4 84      
   dad b         ; $19e5 09      
   rz            ; $19e6 c8      
   .byte 0x08    ; $19e7 08      
   mov a,d       ; $19e8 7a      
   ldax b        ; $19e9 0a      
   jp $1d19      ; $19ea f2 19 1d
   rrc           ; $19ed 0f      
   mov l,b       ; $19ee 68      
   ldax b        ; $19ef 0a      
   cp $2c19      ; $19f0 f4 19 2c
   inx b         ; $19f3 03      
   mov l,b       ; $19f4 68      
   ldax b        ; $19f5 0a      
   .byte 0x10    ; $19f6 10      
   ldax d        ; $19f7 1a      
   add d         ; $19f8 82      
   inx b         ; $19f9 03      
   mvi l,$19     ; $19fa 2e 19   
   mvi a,$02     ; $19fc 3e 02   
   add h         ; $19fe 84      
   dad b         ; $19ff 09      
   mov m,a       ; $1a00 77      
   inr b         ; $1a01 04      
   mov a,d       ; $1a02 7a      
   ldax b        ; $1a03 0a      
   inr c         ; $1a04 0c      
   ldax d        ; $1a05 1a      
   ora d         ; $1a06 b2      
   .byte 0x18    ; $1a07 18      
   mov l,b       ; $1a08 68      
   ldax b        ; $1a09 0a      
   .byte 0x10    ; $1a0a 10      
   ldax d        ; $1a0b 1a      
   add d         ; $1a0c 82      
   inx b         ; $1a0d 03      
   sub h         ; $1a0e 94      
   .byte 0x18    ; $1a0f 18      
   sub e         ; $1a10 93      
   dad d         ; $1a11 19      
   mov l,b       ; $1a12 68      
   ldax b        ; $1a13 0a      
   cnc $1519     ; $1a14 d4 19 15
   inx b         ; $1a17 03      
   mvi b,$43     ; $1a18 06 43   
   mov d,d       ; $1a1a 52      
   mov b,l       ; $1a1b 45      
   mov b,c       ; $1a1c 41      
   mov d,h       ; $1a1d 54      
   mov b,l       ; $1a1e 45      
   ora l         ; $1a1f b5      
   dad d         ; $1a20 19      
   call $02e4    ; $1a21 cd e4 02
   ana m         ; $1a24 a6      
   mvi d,$ed     ; $1a25 16 ed   
   inx d         ; $1a27 13      
   rnz           ; $1a28 c0      
   stax b        ; $1a29 02      
   add h         ; $1a2a 84      
   dad b         ; $1a2b 09      
   mov a,d       ; $1a2c 7a      
   ldax b        ; $1a2d 0a      
   mov d,d       ; $1a2e 52      
   ldax d        ; $1a2f 1a      
   out $03       ; $1a30 d3 03   
   sub b         ; $1a32 90      
   ral           ; $1a33 17      
   .byte 0x10    ; $1a34 10      
   inr b         ; $1a35 04      
   mov a,d       ; $1a36 7a      
   ldax b        ; $1a37 0a      
   mov d,d       ; $1a38 52      
   ldax d        ; $1a39 1a      
   out $03       ; $1a3a d3 03   
   .byte 0xed    ; $1a3c ed      
   mvi d,$3e     ; $1a3d 16 3e   
   .byte 0x18    ; $1a3f 18      
   rrc           ; $1a40 0f      
   .byte 0x20    ; $1a41 20      
   push psw      ; $1a42 f5      
   ori $45       ; $1a43 f6 45   
   .byte 0x20    ; $1a45 20      
   mov c,a       ; $1a46 4f      
   rp            ; $1a47 f0      
   mov d,b       ; $1a48 50      
   mov b,l       ; $1a49 45      
   cpo $ec45     ; $1a4a e4 45 ec
   mov b,l       ; $1a4d 45      
   mov c,b       ; $1a4e 48      
   .byte 0x20    ; $1a4f 20      
   mov h,m       ; $1a50 66      
   dcr d         ; $1a51 15      
   inx sp        ; $1a52 33      
   stax b        ; $1a53 02      
   add h         ; $1a54 84      
   dad b         ; $1a55 09      
   ei            ; $1a56 fb      
   ral           ; $1a57 17      
   dcr l         ; $1a58 2d      
   inx d         ; $1a59 13      
   .byte 0x10    ; $1a5a 10      
   rrc           ; $1a5b 0f      
   .byte 0xfd    ; $1a5c fd      
   stax b        ; $1a5d 02      
   mov c,h       ; $1a5e 4c      
   ral           ; $1a5f 17      
   dcr d         ; $1a60 15      
   inx b         ; $1a61 03      
   rlc           ; $1a62 07      
   inr a         ; $1a63 3c      
   mov b,d       ; $1a64 42      
   mov d,l       ; $1a65 55      
   mov c,c       ; $1a66 49      
   mov c,h       ; $1a67 4c      
   mov b,h       ; $1a68 44      
   mov d,e       ; $1a69 53      
   .byte 0x18    ; $1a6a 18      
   ldax d        ; $1a6b 1a      
   call $02e4    ; $1a6c cd e4 02
   lxi h,$151a   ; $1a6f 21 1a 15
   inx b         ; $1a72 03      
   rlc           ; $1a73 07      
   .byte 0x28    ; $1a74 28      
   mov b,h       ; $1a75 44      
   mov c,a       ; $1a76 4f      
   mov b,l       ; $1a77 45      
   mov d,e       ; $1a78 53      
   mvi a,$29     ; $1a79 3e 29   
   mov h,d       ; $1a7b 62      
   ldax d        ; $1a7c 1a      
   call $02e4    ; $1a7d cd e4 02
   .byte 0x20    ; $1a80 20      
   dad b         ; $1a81 09      
   mov c,h       ; $1a82 4c      
   ral           ; $1a83 17      
   dcr d         ; $1a84 15      
   inx b         ; $1a85 03      
   add l         ; $1a86 85      
   mov b,h       ; $1a87 44      
   mov c,a       ; $1a88 4f      
   mov b,l       ; $1a89 45      
   mov d,e       ; $1a8a 53      
   mvi a,$73     ; $1a8b 3e 73   
   ldax d        ; $1a8d 1a      
   call $02e4    ; $1a8e cd e4 02
   add e         ; $1a91 83      
   rrc           ; $1a92 0f      
   mov a,l       ; $1a93 7d      
   ldax d        ; $1a94 1a      
   dad b         ; $1a95 09      
   inx b         ; $1a96 03      
   rst 7         ; $1a97 ff      
   mvi c,$31     ; $1a98 0e 31   
   ral           ; $1a9a 17      
   dcr l         ; $1a9b 2d      
   inx d         ; $1a9c 13      
   .byte 0x10    ; $1a9d 10      
   rrc           ; $1a9e 0f      
   dcr d         ; $1a9f 15      
   inx b         ; $1aa0 03      
   .byte 0x08    ; $1aa1 08      
   mov b,e       ; $1aa2 43      
   mov c,a       ; $1aa3 4f      
   mov c,m       ; $1aa4 4e      
   mov d,e       ; $1aa5 53      
   mov d,h       ; $1aa6 54      
   mov b,c       ; $1aa7 41      
   mov c,m       ; $1aa8 4e      
   mov d,h       ; $1aa9 54      
   add m         ; $1aaa 86      
   ldax d        ; $1aab 1a      
   call $02e4    ; $1aac cd e4 02
   lxi h,$1d1a   ; $1aaf 21 1a 1d
   rrc           ; $1ab2 0f      
   dcx h         ; $1ab3 2b      
   ldax b        ; $1ab4 0a      
   add h         ; $1ab5 84      
   dad b         ; $1ab6 09      
   mov c,h       ; $1ab7 4c      
   ral           ; $1ab8 17      
   dcr d         ; $1ab9 15      
   inx b         ; $1aba 03      
   mvi b,$54     ; $1abb 06 54   
   mov c,a       ; $1abd 4f      
   mov b,e       ; $1abe 43      
   mov c,a       ; $1abf 4f      
   mov b,h       ; $1ac0 44      
   mov b,l       ; $1ac1 45      
   ana c         ; $1ac2 a1      
   ldax d        ; $1ac3 1a      
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
   .byte 0x08    ; $1ad0 08      
   mov b,b       ; $1ad1 40      
   mov b,l       ; $1ad2 45      
   mov e,b       ; $1ad3 58      
   mov b,l       ; $1ad4 45      
   mov b,e       ; $1ad5 43      
   mov d,l       ; $1ad6 55      
   mov d,h       ; $1ad7 54      
   mov b,l       ; $1ad8 45      
   ana c         ; $1ad9 a1      
   ldax d        ; $1ada 1a      
   pop h         ; $1adb e1      
   mov e,m       ; $1adc 5e      
   inx h         ; $1add 23      
   mov d,m       ; $1ade 56      
   xchg          ; $1adf eb      
   pchl          ; $1ae0 e9      
   inr b         ; $1ae1 04      
   mov d,c       ; $1ae2 51      
   mov d,l       ; $1ae3 55      
   mov b,c       ; $1ae4 41      
   mov c,m       ; $1ae5 4e      
   rnc           ; $1ae6 d0      
   ldax d        ; $1ae7 1a      
   call $02e4    ; $1ae8 cd e4 02
   rz            ; $1aeb c8      
   mvi c,$ac     ; $1aec 0e ac   
   ldax d        ; $1aee 1a      
   dcx h         ; $1aef 2b      
   ldax b        ; $1af0 0a      
   cnz $ff1a     ; $1af1 c4 1a ff
   mvi c,$2d     ; $1af4 0e 2d   
   inx d         ; $1af6 13      
   .byte 0x10    ; $1af7 10      
   rrc           ; $1af8 0f      
   lxi sp,$1517  ; $1af9 31 17 15
   inx b         ; $1afc 03      
   inr b         ; $1afd 04      
   mov d,m       ; $1afe 56      
   mov b,l       ; $1aff 45      
   mov b,e       ; $1b00 43      
   mov d,h       ; $1b01 54      
   pop h         ; $1b02 e1      
   ldax d        ; $1b03 1a      
   call $02e4    ; $1b04 cd e4 02
   rpe           ; $1b07 e8      
   ldax d        ; $1b08 1a      
   dcx h         ; $1b09 2b      
   ldax b        ; $1b0a 0a      
   in $1a        ; $1b0b db 1a   
   mov c,h       ; $1b0d 4c      
   ral           ; $1b0e 17      
   dcr d         ; $1b0f 15      
   inx b         ; $1b10 03      
   add d         ; $1b11 82      
   mov d,h       ; $1b12 54      
   mov c,a       ; $1b13 4f      
   .byte 0xfd    ; $1b14 fd      
   ldax d        ; $1b15 1a      
   call $02e4    ; $1b16 cd e4 02
   ana m         ; $1b19 a6      
   mvi d,$ed     ; $1b1a 16 ed   
   inx d         ; $1b1c 13      
   sub b         ; $1b1d 90      
   ral           ; $1b1e 17      
   rpo           ; $1b1f e0      
   inx b         ; $1b20 03      
   mov a,m       ; $1b21 7e      
   dcr b         ; $1b22 05      
   mov c,d       ; $1b23 4a      
   lxi d,$2003   ; $1b24 11 03 20
   dcr l         ; $1b27 2d      
   cmc           ; $1b28 3f      
   dcr a         ; $1b29 3d      
   dcr b         ; $1b2a 05      
   dcr d         ; $1b2b 15      
   stax b        ; $1b2c 02      
   add h         ; $1b2d 84      
   dad b         ; $1b2e 09      
   rz            ; $1b2f c8      
   .byte 0x08    ; $1b30 08      
   mov a,d       ; $1b31 7a      
   ldax b        ; $1b32 0a      
   cmc           ; $1b33 3f      
   dcx d         ; $1b34 1b      
   lda $8213     ; $1b35 3a 13 82
   inr b         ; $1b38 04      
   dcr e         ; $1b39 1d      
   rrc           ; $1b3a 0f      
   mov l,b       ; $1b3b 68      
   ldax b        ; $1b3c 0a      
   mov b,l       ; $1b3d 45      
   dcx d         ; $1b3e 1b      
   lda $8213     ; $1b3f 3a 13 82
   inr b         ; $1b42 04      
   inr l         ; $1b43 2c      
   inx b         ; $1b44 03      
   dcr d         ; $1b45 15      
   inx b         ; $1b46 03      
   .byte 0x08    ; $1b47 08      
   mov d,m       ; $1b48 56      
   mov b,c       ; $1b49 41      
   mov d,d       ; $1b4a 52      
   mov c,c       ; $1b4b 49      
   mov b,c       ; $1b4c 41      
   mov b,d       ; $1b4d 42      
   mov c,h       ; $1b4e 4c      
   mov b,l       ; $1b4f 45      
   lxi d,$cd1b   ; $1b50 11 1b cd
   cpo $2102     ; $1b53 e4 02 21
   ldax d        ; $1b56 1a      
   rz            ; $1b57 c8      
   mvi c,$1d     ; $1b58 0e 1d   
   rrc           ; $1b5a 0f      
   .byte 0xfd    ; $1b5b fd      
   stax b        ; $1b5c 02      
   mov c,h       ; $1b5d 4c      
   ral           ; $1b5e 17      
   dcr d         ; $1b5f 15      
   inx b         ; $1b60 03      
   ldax b        ; $1b61 0a      
   mov d,m       ; $1b62 56      
   mov c,a       ; $1b63 4f      
   mov b,e       ; $1b64 43      
   mov b,c       ; $1b65 41      
   mov b,d       ; $1b66 42      
   mov d,l       ; $1b67 55      
   mov c,h       ; $1b68 4c      
   mov b,c       ; $1b69 41      
   mov d,d       ; $1b6a 52      
   mov e,c       ; $1b6b 59      
   mov b,a       ; $1b6c 47      
   dcx d         ; $1b6d 1b      
   call $02e4    ; $1b6e cd e4 02
   lxi h,$2b1a   ; $1b71 21 1a 2b
   ldax b        ; $1b74 0a      
   lxi b,$2f00   ; $1b75 01 00 2f
   rrc           ; $1b78 0f      
   dcx h         ; $1b79 2b      
   ldax b        ; $1b7a 0a      
   add b         ; $1b7b 80      
   nop           ; $1b7c 00      
   cma           ; $1b7d 2f      
   rrc           ; $1b7e 0f      
   inx sp        ; $1b7f 33      
   stax b        ; $1b80 02      
   add h         ; $1b81 84      
   dad b         ; $1b82 09      
   sbb c         ; $1b83 99      
   inr b         ; $1b84 04      
   dcr e         ; $1b85 1d      
   rrc           ; $1b86 0f      
   rst 7         ; $1b87 ff      
   mvi c,$e1     ; $1b88 0e e1   
   lxi b,$0984   ; $1b8a 01 84 09
   dcr e         ; $1b8d 1d      
   rrc           ; $1b8e 0f      
   pop h         ; $1b8f e1      
   lxi b,$099d   ; $1b90 01 9d 09
   mov a,l       ; $1b93 7d      
   ldax d        ; $1b94 1a      
l1b95:
   call $02e4    ; $1b95 cd e4 02
   add d         ; $1b98 82      
   inr b         ; $1b99 04      
   inr h         ; $1b9a 24      
   stax b        ; $1b9b 02      
   sbb l         ; $1b9c 9d      
   dad b         ; $1b9d 09      
   dcr d         ; $1b9e 15      
   inx b         ; $1b9f 03      
l1ba0:
   .byte 6,"STRING"
   .word 0x1b61
   call $02e4    ; $1ba9 cd e4 02
   lxi h,$411a   ; $1bac 21 1a 41
   rrc           ; $1baf 0f      
   .byte 0xfd    ; $1bb0 fd      
   stax b        ; $1bb1 02      
   mov c,h       ; $1bb2 4c      
   ral           ; $1bb3 17      
   dcr d         ; $1bb4 15      
   inx b         ; $1bb5 03      
   inr b         ; $1bb6 04      
   lxi h,$5343   ; $1bb7 21 43 53
   mov d,b       ; $1bba 50      
   ana b         ; $1bbb a0      
   dcx d         ; $1bbc 1b      
   call $02e4    ; $1bbd cd e4 02
   inx sp        ; $1bc0 33      
   inr b         ; $1bc1 04      
   mov d,h       ; $1bc2 54      
   stax b        ; $1bc3 02      
   sbb l         ; $1bc4 9d      
   dad b         ; $1bc5 09      
   dcr d         ; $1bc6 15      
   inx b         ; $1bc7 03      
   inr b         ; $1bc8 04      
   cmc           ; $1bc9 3f      
   mov b,e       ; $1bca 43      
   mov d,e       ; $1bcb 53      
   mov d,b       ; $1bcc 50      
   ora m         ; $1bcd b6      
   dcx d         ; $1bce 1b      
   call $02e4    ; $1bcf cd e4 02
   inx sp        ; $1bd2 33      
   inr b         ; $1bd3 04      
   mov d,h       ; $1bd4 54      
   stax b        ; $1bd5 02      
   add h         ; $1bd6 84      
   dad b         ; $1bd7 09      
   xchg          ; $1bd8 eb      
   .byte 0x08    ; $1bd9 08      
   mov c,d       ; $1bda 4a      
   lxi d,$4311   ; $1bdb 11 11 43
   jpo $ea4f     ; $1bde e2 4f ea
   .byte 0x20    ; $1be1 20      
   mov b,e       ; $1be2 43      
   mov d,h       ; $1be3 54      
   mov b,l       ; $1be4 45      
   mov c,e       ; $1be5 4b      
   mov b,c       ; $1be6 41      
   .byte 0x20    ; $1be7 20      
   rp            ; $1be8 f0      
   mov c,a       ; $1be9 4f      
   .byte 0x20    ; $1bea 20      
   mov b,e       ; $1beb 43      
   mov d,e       ; $1bec 53      
   mov d,b       ; $1bed 50      
   dcr d         ; $1bee 15      
   inx b         ; $1bef 03      
   dcr b         ; $1bf0 05      
   cmc           ; $1bf1 3f      
   mov b,l       ; $1bf2 45      
   mov e,b       ; $1bf3 58      
   mov b,l       ; $1bf4 45      
   mov b,e       ; $1bf5 43      
   rz            ; $1bf6 c8      
   dcx d         ; $1bf7 1b      
   call $02e4    ; $1bf8 cd e4 02
   dcr d         ; $1bfb 15      
   stax b        ; $1bfc 02      
   add h         ; $1bfd 84      
   dad b         ; $1bfe 09      
   mov c,d       ; $1bff 4a      
   lxi d,$201a   ; $1c00 11 1a 20
   mov d,h       ; $1c03 54      
   mov d,b       ; $1c04 50      
   mov b,l       ; $1c05 45      
   jpo $45f5     ; $1c06 e2 f5 45
   mov d,h       ; $1c09 54      
   .byte 0x20    ; $1c0a 20      
   mov d,b       ; $1c0b 50      
   mov b,l       ; $1c0c 45      
   ori $e9       ; $1c0d f6 e9   
   mov c,l       ; $1c0f 4d      
   mov b,c       ; $1c10 41      
   .byte 0x20    ; $1c11 20      
   mov b,d       ; $1c12 42      
   mov a,c       ; $1c13 79      
   mov m,b       ; $1c14 70      
   mov c,a       ; $1c15 4f      
   mov l,h       ; $1c16 6c      
   mov c,b       ; $1c17 48      
   mov b,l       ; $1c18 45      
   mov c,b       ; $1c19 48      
   mov l,c       ; $1c1a 69      
   mov m,c       ; $1c1b 71      
   dcr d         ; $1c1c 15      
   inx b         ; $1c1d 03      
   dcr b         ; $1c1e 05      
   cmc           ; $1c1f 3f      
   mov b,e       ; $1c20 43      
   mov c,a       ; $1c21 4f      
   mov c,l       ; $1c22 4d      
   mov d,b       ; $1c23 50      
   rp            ; $1c24 f0      
   dcx d         ; $1c25 1b      
   call $02e4    ; $1c26 cd e4 02
   dcr d         ; $1c29 15      
   stax b        ; $1c2a 02      
   add h         ; $1c2b 84      
   dad b         ; $1c2c 09      
   mov a,m       ; $1c2d 7e      
   dcr b         ; $1c2e 05      
   mov c,d       ; $1c2f 4a      
   lxi d,$201a   ; $1c30 11 1a 20
   mov d,h       ; $1c33 54      
   mov d,b       ; $1c34 50      
   mov b,l       ; $1c35 45      
   mov h,d       ; $1c36 62      
   mov m,l       ; $1c37 75      
   mov b,l       ; $1c38 45      
   mov d,h       ; $1c39 54      
   .byte 0x20    ; $1c3a 20      
   mov d,b       ; $1c3b 50      
   mov b,l       ; $1c3c 45      
   hlt           ; $1c3d 76      
   mov l,c       ; $1c3e 69      
   mov c,l       ; $1c3f 4d      
   mov b,c       ; $1c40 41      
   .byte 0x20    ; $1c41 20      
   mov c,e       ; $1c42 4b      
   mov c,a       ; $1c43 4f      
   mov c,l       ; $1c44 4d      
   mov m,b       ; $1c45 70      
   mov l,c       ; $1c46 69      
   mov l,h       ; $1c47 6c      
   mov m,c       ; $1c48 71      
   mov h,e       ; $1c49 63      
   mov l,c       ; $1c4a 69      
   mov l,c       ; $1c4b 69      
   dcr d         ; $1c4c 15      
   inx b         ; $1c4d 03      
   mvi b,$3f     ; $1c4e 06 3f   
   mov d,b       ; $1c50 50      
   mov b,c       ; $1c51 41      
   mov c,c       ; $1c52 49      
   mov d,d       ; $1c53 52      
   mov d,e       ; $1c54 53      
   mvi e,$1c     ; $1c55 1e 1c   
   call $02e4    ; $1c57 cd e4 02
   xchg          ; $1c5a eb      
   .byte 0x08    ; $1c5b 08      
   mov c,d       ; $1c5c 4a      
   lxi d,$2010   ; $1c5d 11 10 20
   mov c,b       ; $1c60 48      
   mov b,l       ; $1c61 45      
   rp            ; $1c62 f0      
   mov b,c       ; $1c63 41      
   mov d,b       ; $1c64 50      
   mov c,b       ; $1c65 48      
   mov b,c       ; $1c66 41      
   pop psw       ; $1c67 f1      
   .byte 0x20    ; $1c68 20      
   mov b,e       ; $1c69 43      
   mov c,e       ; $1c6a 4b      
   mov c,a       ; $1c6b 4f      
   jpo $414b     ; $1c6c e2 4b 41
   dcr d         ; $1c6f 15      
   inx b         ; $1c70 03      
   dcr b         ; $1c71 05      
   mov c,h       ; $1c72 4c      
   mov b,l       ; $1c73 45      
   mov b,c       ; $1c74 41      
   mov d,m       ; $1c75 56      
   mov b,l       ; $1c76 45      
   mov c,m       ; $1c77 4e      
   inr e         ; $1c78 1c      
   call $02e4    ; $1c79 cd e4 02
   mov m,l       ; $1c7c 75      
   dad b         ; $1c7d 09      
   mov m,l       ; $1c7e 75      
   dad b         ; $1c7f 09      
   mov m,l       ; $1c80 75      
   dad b         ; $1c81 09      
   dcr d         ; $1c82 15      
   inx b         ; $1c83 03      
   add c         ; $1c84 81      
   lda $1c71     ; $1c85 3a 71 1c
   call $02e4    ; $1c88 cd e4 02
   rm            ; $1c8b f8      
   dcx d         ; $1c8c 1b      
   cmp l         ; $1c8d bd      
   dcx d         ; $1c8e 1b      
   inx sp        ; $1c8f 33      
   stax b        ; $1c90 02      
   add h         ; $1c91 84      
   dad b         ; $1c92 09      
   inr h         ; $1c93 24      
   stax b        ; $1c94 02      
   sbb l         ; $1c95 9d      
   dad b         ; $1c96 09      
   lxi h,$601a   ; $1c97 21 1a 60
   ral           ; $1c9a 17      
   mov a,m       ; $1c9b 7e      
   ral           ; $1c9c 17      
   dad b         ; $1c9d 09      
   inx b         ; $1c9e 03      
   mov c,h       ; $1c9f 4c      
   ral           ; $1ca0 17      
   dcr d         ; $1ca1 15      
   inx b         ; $1ca2 03      
   add c         ; $1ca3 81      
   dcx sp        ; $1ca4 3b      
   add h         ; $1ca5 84      
   inr e         ; $1ca6 1c      
   call $02e4    ; $1ca7 cd e4 02
   mvi h,$1c     ; $1caa 26 1c   
   rst 1         ; $1cac cf      
   dcx d         ; $1cad 1b      
   add e         ; $1cae 83      
   rrc           ; $1caf 0f      
   dcr d         ; $1cb0 15      
   inx b         ; $1cb1 03      
   mov h,b       ; $1cb2 60      
   ral           ; $1cb3 17      
   mov m,c       ; $1cb4 71      
   ral           ; $1cb5 17      
   dcr d         ; $1cb6 15      
   inx b         ; $1cb7 03      
   dad b         ; $1cb8 09      
   mov c,c       ; $1cb9 49      
   mov c,l       ; $1cba 4d      
   mov c,l       ; $1cbb 4d      
   mov b,l       ; $1cbc 45      
   mov b,h       ; $1cbd 44      
   mov c,c       ; $1cbe 49      
   mov b,c       ; $1cbf 41      
   mov d,h       ; $1cc0 54      
   mov b,l       ; $1cc1 45      
   ana e         ; $1cc2 a3      
   inr e         ; $1cc3 1c      
   call $02e4    ; $1cc4 cd e4 02
   .byte 0x20    ; $1cc7 20      
   ral           ; $1cc8 17      
   dcx h         ; $1cc9 2b      
   ldax b        ; $1cca 0a      
   add b         ; $1ccb 80      
   nop           ; $1ccc 00      
   sui $0a       ; $1ccd d6 0a   
   dcr d         ; $1ccf 15      
   inx b         ; $1cd0 03      
   dcr b         ; $1cd1 05      
   mov b,h       ; $1cd2 44      
   mov b,l       ; $1cd3 45      
   mov d,b       ; $1cd4 50      
   mov d,h       ; $1cd5 54      
   mov c,b       ; $1cd6 48      
   cmp b         ; $1cd7 b8      
   inr e         ; $1cd8 1c      
   call $02e4    ; $1cd9 cd e4 02
   inx sp        ; $1cdc 33      
   inr b         ; $1cdd 04      
   cmp m         ; $1cde be      
   lxi b,$0984   ; $1cdf 01 84 09
   adc l         ; $1ce2 8d      
   inx b         ; $1ce3 03      
   mov d,l       ; $1ce4 55      
   inr b         ; $1ce5 04      
   cmp l         ; $1ce6 bd      
   dcr b         ; $1ce7 05      
   rz            ; $1ce8 c8      
   mvi c,$de     ; $1ce9 0e de   
   inr b         ; $1ceb 04      
   dcr d         ; $1cec 15      
   inx b         ; $1ced 03      
   add d         ; $1cee 82      
   mov b,e       ; $1cef 43      
   shld $1cd1    ; $1cf0 22 d1 1c
   call $02e4    ; $1cf3 cd e4 02
   ana m         ; $1cf6 a6      
   mvi d,$ed     ; $1cf7 16 ed   
   inx d         ; $1cf9 13      
   mov m,a       ; $1cfa 77      
   inr b         ; $1cfb 04      
   sub c         ; $1cfc 91      
   dad b         ; $1cfd 09      
   sub h         ; $1cfe 94      
   .byte 0x18    ; $1cff 18      
   dcr d         ; $1d00 15      
   inx b         ; $1d01 03      
   add d         ; $1d02 82      
   mvi l,$22     ; $1d03 2e 22   
   xri $1c       ; $1d05 ee 1c   
   call $02e4    ; $1d07 cd e4 02
   mvi h,$1c     ; $1d0a 26 1c   
   add e         ; $1d0c 83      
   rrc           ; $1d0d 0f      
   mvi a,$18     ; $1d0e 3e 18   
   dcx h         ; $1d10 2b      
   ldax b        ; $1d11 0a      
   shld $ed00    ; $1d12 22 00 ed
   inx d         ; $1d15 13      
   mov b,c       ; $1d16 41      
   rrc           ; $1d17 0f      
   dcr d         ; $1d18 15      
   inx b         ; $1d19 03      
   add c         ; $1d1a 81      
   shld $1d02    ; $1d1b 22 02 1d
   call $02e4    ; $1d1e cd e4 02
   dcr d         ; $1d21 15      
   stax b        ; $1d22 02      
   add h         ; $1d23 84      
   dad b         ; $1d24 09      
   mov a,d       ; $1d25 7a      
   ldax b        ; $1d26 0a      
   dad sp        ; $1d27 39      
   dcr e         ; $1d28 1d      
   add e         ; $1d29 83      
   rrc           ; $1d2a 0f      
   mov d,e       ; $1d2b 53      
   ldax b        ; $1d2c 0a      
   dcx h         ; $1d2d 2b      
   ldax b        ; $1d2e 0a      
   shld $ed00    ; $1d2f 22 00 ed
   inx d         ; $1d32 13      
   mov b,c       ; $1d33 41      
   rrc           ; $1d34 0f      
   mov l,b       ; $1d35 68      
   ldax b        ; $1d36 0a      
   mov c,e       ; $1d37 4b      
   dcr e         ; $1d38 1d      
   dcx h         ; $1d39 2b      
   ldax b        ; $1d3a 0a      
   shld $ed00    ; $1d3b 22 00 ed
   inx d         ; $1d3e 13      
   mov e,d       ; $1d3f 5a      
   rrc           ; $1d40 0f      
   mov h,d       ; $1d41 62      
   inx b         ; $1d42 03      
   sub c         ; $1d43 91      
   dad b         ; $1d44 09      
   mov m,a       ; $1d45 77      
   inr b         ; $1d46 04      
   mov a,h       ; $1d47 7c      
   dcx b         ; $1d48 0b      
   mov e,d       ; $1d49 5a      
   rrc           ; $1d4a 0f      
   dcr d         ; $1d4b 15      
   inx b         ; $1d4c 03      
   add d         ; $1d4d 82      
   mvi l,$28     ; $1d4e 2e 28   
   ldax d        ; $1d50 1a      
   dcr e         ; $1d51 1d      
   call $02e4    ; $1d52 cd e4 02
   dcx h         ; $1d55 2b      
   ldax b        ; $1d56 0a      
   dad h         ; $1d57 29      
   nop           ; $1d58 00      
   .byte 0xed    ; $1d59 ed      
   inx d         ; $1d5a 13      
   mov l,a       ; $1d5b 6f      
   rrc           ; $1d5c 0f      
   mov a,m       ; $1d5d 7e      
   dcr d         ; $1d5e 15      
   dcr d         ; $1d5f 15      
   inx b         ; $1d60 03      
   dcr b         ; $1d61 05      
   mvi a,$4d     ; $1d62 3e 4d   
   mov b,c       ; $1d64 41      
   mov d,d       ; $1d65 52      
   mov c,e       ; $1d66 4b      
   mov c,l       ; $1d67 4d      
   dcr e         ; $1d68 1d      
   call $02e4    ; $1d69 cd e4 02
   rst 7         ; $1d6c ff      
   mvi c,$c8     ; $1d6d 0e c8   
   mvi c,$1d     ; $1d6f 0e 1d   
   rrc           ; $1d71 0f      
   dcr d         ; $1d72 15      
   inx b         ; $1d73 03      
   .byte 0x08    ; $1d74 08      
   mvi a,$52     ; $1d75 3e 52   
   mov b,l       ; $1d77 45      
   mov d,e       ; $1d78 53      
   mov c,a       ; $1d79 4f      
   mov c,h       ; $1d7a 4c      
   mov d,m       ; $1d7b 56      
   mov b,l       ; $1d7c 45      
   mov h,c       ; $1d7d 61      
   dcr e         ; $1d7e 1d      
   call $02e4    ; $1d7f cd e4 02
   rst 7         ; $1d82 ff      
   mvi c,$8d     ; $1d83 0e 8d   
   inx b         ; $1d85 03      
   sbb l         ; $1d86 9d      
   dad b         ; $1d87 09      
   dcr d         ; $1d88 15      
   inx b         ; $1d89 03      
   dcr b         ; $1d8a 05      
   inr a         ; $1d8b 3c      
   mov c,l       ; $1d8c 4d      
   mov b,c       ; $1d8d 41      
   mov d,d       ; $1d8e 52      
   mov c,e       ; $1d8f 4b      
   mov m,h       ; $1d90 74      
   dcr e         ; $1d91 1d      
   call $02e4    ; $1d92 cd e4 02
   rst 7         ; $1d95 ff      
   mvi c,$15     ; $1d96 0e 15   
   inx b         ; $1d98 03      
   .byte 0x08    ; $1d99 08      
   inr a         ; $1d9a 3c      
   mov d,d       ; $1d9b 52      
   mov b,l       ; $1d9c 45      
   mov d,e       ; $1d9d 53      
   mov c,a       ; $1d9e 4f      
   mov c,h       ; $1d9f 4c      
   mov d,m       ; $1da0 56      
   mov b,l       ; $1da1 45      
   adc d         ; $1da2 8a      
   dcr e         ; $1da3 1d      
   call $02e4    ; $1da4 cd e4 02
   dcr e         ; $1da7 1d      
   rrc           ; $1da8 0f      
   dcr d         ; $1da9 15      
   inx b         ; $1daa 03      
   add d         ; $1dab 82      
   mov c,c       ; $1dac 49      
   mov b,m       ; $1dad 46      
   sbb c         ; $1dae 99      
   dcr e         ; $1daf 1d      
   call $02e4    ; $1db0 cd e4 02
   mvi h,$1c     ; $1db3 26 1c   
   add e         ; $1db5 83      
   rrc           ; $1db6 0f      
   mov a,d       ; $1db7 7a      
   ldax b        ; $1db8 0a      
   mov l,c       ; $1db9 69      
   dcr e         ; $1dba 1d      
   jc $150e      ; $1dbb da 0e 15
   inx b         ; $1dbe 03      
   add l         ; $1dbf 85      
   mov c,c       ; $1dc0 49      
   mov b,m       ; $1dc1 46      
   mov c,m       ; $1dc2 4e      
   mov c,a       ; $1dc3 4f      
   mov d,h       ; $1dc4 54      
   xra e         ; $1dc5 ab      
   dcr e         ; $1dc6 1d      
   call $02e4    ; $1dc7 cd e4 02
   mvi h,$1c     ; $1dca 26 1c   
   add e         ; $1dcc 83      
   rrc           ; $1dcd 0f      
   sub b         ; $1dce 90      
   ldax b        ; $1dcf 0a      
   mov l,c       ; $1dd0 69      
   dcr e         ; $1dd1 1d      
   jc $150e      ; $1dd2 da 0e 15
   inx b         ; $1dd5 03      
   add h         ; $1dd6 84      
   mov b,l       ; $1dd7 45      
   mov c,h       ; $1dd8 4c      
   mov d,e       ; $1dd9 53      
   mov b,l       ; $1dda 45      
   cmp a         ; $1ddb bf      
   dcr e         ; $1ddc 1d      
   call $02e4    ; $1ddd cd e4 02
   mvi h,$1c     ; $1de0 26 1c   
   jc $570e      ; $1de2 da 0e 57
   inr e         ; $1de5 1c      
   add e         ; $1de6 83      
   rrc           ; $1de7 0f      
   mov l,b       ; $1de8 68      
   ldax b        ; $1de9 0a      
   mov l,c       ; $1dea 69      
   dcr e         ; $1deb 1d      
   adc l         ; $1dec 8d      
   inx b         ; $1ded 03      
   mov a,a       ; $1dee 7f      
   dcr e         ; $1def 1d      
   jc $150e      ; $1df0 da 0e 15
   inx b         ; $1df3 03      
   add h         ; $1df4 84      
   mov d,h       ; $1df5 54      
   mov c,b       ; $1df6 48      
   mov b,l       ; $1df7 45      
   mov c,m       ; $1df8 4e      
   sui $1d       ; $1df9 d6 1d   
   call $02e4    ; $1dfb cd e4 02
   mvi h,$1c     ; $1dfe 26 1c   
   jc $570e      ; $1e00 da 0e 57
   inr e         ; $1e03 1c      
   mov a,a       ; $1e04 7f      
   dcr e         ; $1e05 1d      
   dcr d         ; $1e06 15      
   inx b         ; $1e07 03      
   add l         ; $1e08 85      
   mov b,d       ; $1e09 42      
   mov b,l       ; $1e0a 45      
   mov b,a       ; $1e0b 47      
   mov c,c       ; $1e0c 49      
   mov c,m       ; $1e0d 4e      
   cp $cd1d      ; $1e0e f4 1d cd
   cpo $2602     ; $1e11 e4 02 26
   inr e         ; $1e14 1c      
   sub d         ; $1e15 92      
   dcr e         ; $1e16 1d      
   pop d         ; $1e17 d1      
   mvi c,$15     ; $1e18 0e 15   
   inx b         ; $1e1a 03      
   add l         ; $1e1b 85      
   mov b,c       ; $1e1c 41      
   mov b,a       ; $1e1d 47      
   mov b,c       ; $1e1e 41      
   mov c,c       ; $1e1f 49      
   mov c,m       ; $1e20 4e      
   .byte 0x08    ; $1e21 08      
   mvi e,$cd     ; $1e22 1e cd   
   cpo $2602     ; $1e24 e4 02 26
   inr e         ; $1e27 1c      
   pop d         ; $1e28 d1      
   mvi c,$57     ; $1e29 0e 57   
   inr e         ; $1e2b 1c      
   add e         ; $1e2c 83      
   rrc           ; $1e2d 0f      
   mov l,b       ; $1e2e 68      
   ldax b        ; $1e2f 0a      
   ana h         ; $1e30 a4      
   dcr e         ; $1e31 1d      
   dcr d         ; $1e32 15      
   inx b         ; $1e33 03      
   add d         ; $1e34 82      
   mov b,h       ; $1e35 44      
   mov c,a       ; $1e36 4f      
   dcx d         ; $1e37 1b      
   mvi e,$cd     ; $1e38 1e cd   
   cpo $2602     ; $1e3a e4 02 26
   inr e         ; $1e3d 1c      
   add e         ; $1e3e 83      
   rrc           ; $1e3f 0f      
   push h        ; $1e40 e5      
   ldax b        ; $1e41 0a      
   mov l,c       ; $1e42 69      
   dcr e         ; $1e43 1d      
   sub d         ; $1e44 92      
   dcr e         ; $1e45 1d      
   dcx h         ; $1e46 2b      
   ldax b        ; $1e47 0a      
   inx b         ; $1e48 03      
   nop           ; $1e49 00      
   dcr d         ; $1e4a 15      
   inx b         ; $1e4b 03      
   add e         ; $1e4c 83      
   cmc           ; $1e4d 3f      
   mov b,h       ; $1e4e 44      
   mov c,a       ; $1e4f 4f      
   inr m         ; $1e50 34      
   mvi e,$cd     ; $1e51 1e cd   
   cpo $2602     ; $1e53 e4 02 26
   inr e         ; $1e56 1c      
   add e         ; $1e57 83      
   rrc           ; $1e58 0f      
   inr c         ; $1e59 0c      
   dcx b         ; $1e5a 0b      
   mov l,c       ; $1e5b 69      
   dcr e         ; $1e5c 1d      
   sub d         ; $1e5d 92      
   dcr e         ; $1e5e 1d      
   dcx h         ; $1e5f 2b      
   ldax b        ; $1e60 0a      
   inx b         ; $1e61 03      
   nop           ; $1e62 00      
   dcr d         ; $1e63 15      
   inx b         ; $1e64 03      
   add h         ; $1e65 84      
   mov c,h       ; $1e66 4c      
   mov c,a       ; $1e67 4f      
   mov c,a       ; $1e68 4f      
   mov d,b       ; $1e69 50      
   mov c,h       ; $1e6a 4c      
   mvi e,$cd     ; $1e6b 1e cd   
   cpo $2602     ; $1e6d e4 02 26
   inr e         ; $1e70 1c      
   dcx h         ; $1e71 2b      
   ldax b        ; $1e72 0a      
   inx b         ; $1e73 03      
   nop           ; $1e74 00      
   mov d,a       ; $1e75 57      
   inr e         ; $1e76 1c      
   add e         ; $1e77 83      
   rrc           ; $1e78 0f      
   mvi l,$0b     ; $1e79 2e 0b   
   ana h         ; $1e7b a4      
   dcr e         ; $1e7c 1d      
   mov a,a       ; $1e7d 7f      
   dcr e         ; $1e7e 1d      
   dcr d         ; $1e7f 15      
   inx b         ; $1e80 03      
   add l         ; $1e81 85      
   dcx h         ; $1e82 2b      
   mov c,h       ; $1e83 4c      
   mov c,a       ; $1e84 4f      
   mov c,a       ; $1e85 4f      
   mov d,b       ; $1e86 50      
   mov h,l       ; $1e87 65      
   mvi e,$cd     ; $1e88 1e cd   
   cpo $2602     ; $1e8a e4 02 26
   inr e         ; $1e8d 1c      
   dcx h         ; $1e8e 2b      
   ldax b        ; $1e8f 0a      
   inx b         ; $1e90 03      
   nop           ; $1e91 00      
   mov d,a       ; $1e92 57      
   inr e         ; $1e93 1c      
   add e         ; $1e94 83      
   rrc           ; $1e95 0f      
   mov h,e       ; $1e96 63      
   dcx b         ; $1e97 0b      
   ana h         ; $1e98 a4      
   dcr e         ; $1e99 1d      
   mov a,a       ; $1e9a 7f      
   dcr e         ; $1e9b 1d      
   dcr d         ; $1e9c 15      
   inx b         ; $1e9d 03      
   add l         ; $1e9e 85      
   mov d,l       ; $1e9f 55      
   mov c,m       ; $1ea0 4e      
   mov d,h       ; $1ea1 54      
   mov c,c       ; $1ea2 49      
   mov c,h       ; $1ea3 4c      
   add c         ; $1ea4 81      
   mvi e,$cd     ; $1ea5 1e cd   
   cpo $2602     ; $1ea7 e4 02 26
   inr e         ; $1eaa 1c      
   pop d         ; $1eab d1      
   mvi c,$57     ; $1eac 0e 57   
   inr e         ; $1eae 1c      
   add e         ; $1eaf 83      
   rrc           ; $1eb0 0f      
   mov a,d       ; $1eb1 7a      
   ldax b        ; $1eb2 0a      
   ana h         ; $1eb3 a4      
   dcr e         ; $1eb4 1d      
   dcr d         ; $1eb5 15      
   inx b         ; $1eb6 03      
   add l         ; $1eb7 85      
   mov d,a       ; $1eb8 57      
   mov c,b       ; $1eb9 48      
   mov c,c       ; $1eba 49      
   mov c,h       ; $1ebb 4c      
   mov b,l       ; $1ebc 45      
   sbb m         ; $1ebd 9e      
   mvi e,$cd     ; $1ebe 1e cd   
   cpo $2602     ; $1ec0 e4 02 26
   inr e         ; $1ec3 1c      
   pop d         ; $1ec4 d1      
   mvi c,$57     ; $1ec5 0e 57   
   inr e         ; $1ec7 1c      
   pop d         ; $1ec8 d1      
   mvi c,$b0     ; $1ec9 0e b0   
   dcr e         ; $1ecb 1d      
   add d         ; $1ecc 82      
   inr b         ; $1ecd 04      
   dcr d         ; $1ece 15      
   inx b         ; $1ecf 03      
   add m         ; $1ed0 86      
   mov d,d       ; $1ed1 52      
   mov b,l       ; $1ed2 45      
   mov d,b       ; $1ed3 50      
   mov b,l       ; $1ed4 45      
   mov b,c       ; $1ed5 41      
   mov d,h       ; $1ed6 54      
   ora a         ; $1ed7 b7      
   mvi e,$cd     ; $1ed8 1e cd   
   cpo $2602     ; $1eda e4 02 26
   inr e         ; $1edd 1c      
   dcr c         ; $1ede 0d      
   dad b         ; $1edf 09      
   dcr c         ; $1ee0 0d      
   dad b         ; $1ee1 09      
   inx h         ; $1ee2 23      
   mvi e,$20     ; $1ee3 1e 20   
   dad b         ; $1ee5 09      
   .byte 0x20    ; $1ee6 20      
   dad b         ; $1ee7 09      
   sbb c         ; $1ee8 99      
   inr b         ; $1ee9 04      
   ei            ; $1eea fb      
   dcr e         ; $1eeb 1d      
   dcr d         ; $1eec 15      
   inx b         ; $1eed 03      
   inr b         ; $1eee 04      
   mvi a,$50     ; $1eef 3e 50   
   mov d,d       ; $1ef1 52      
   mov d,h       ; $1ef2 54      
   rnc           ; $1ef3 d0      
   mvi e,$cd     ; $1ef4 1e cd   
   cpo $d302     ; $1ef6 e4 02 d3
   inx b         ; $1ef9 03      
   ana m         ; $1efa a6      
   mvi d,$fa     ; $1efb 16 fa   
   inr b         ; $1efd 04      
   mov h,d       ; $1efe 62      
   inx b         ; $1eff 03      
   dcx h         ; $1f00 2b      
   ldax b        ; $1f01 0a      
   add b         ; $1f02 80      
   nop           ; $1f03 00      
   jm $6804      ; $1f04 fa 04 68
   ldax b        ; $1f07 0a      
   call $0515    ; $1f08 cd 15 05
   mov d,b       ; $1f0b 50      
   mov d,h       ; $1f0c 54      
   mov e,c       ; $1f0d 59      
   mov d,b       ; $1f0e 50      
   mov b,l       ; $1f0f 45      
   xri $1e       ; $1f10 ee 1e   
   call $02e4    ; $1f12 cd e4 02
   rz            ; $1f15 c8      
   mvi c,$0c     ; $1f16 0e 0c   
   dcx b         ; $1f18 0b      
   dad h         ; $1f19 29      
   rar           ; $1f1a 1f      
   out $03       ; $1f1b d3 03   
   sub c         ; $1f1d 91      
   dad b         ; $1f1e 09      
   push psw      ; $1f1f f5      
   mvi e,$3d     ; $1f20 1e 3d   
   dcr d         ; $1f22 15      
   mov m,a       ; $1f23 77      
   inr b         ; $1f24 04      
   mvi l,$0b     ; $1f25 2e 0b   
   dcx d         ; $1f27 1b      
   rar           ; $1f28 1f      
   add d         ; $1f29 82      
   inx b         ; $1f2a 03      
   dcr d         ; $1f2b 15      
   inx b         ; $1f2c 03      
   dcr b         ; $1f2d 05      
   mov b,d       ; $1f2e 42      
   mov d,d       ; $1f2f 52      
   mov b,l       ; $1f30 45      
   mov b,c       ; $1f31 41      
   mov c,e       ; $1f32 4b      
   ldax b        ; $1f33 0a      
   rar           ; $1f34 1f      
   call $02e4    ; $1f35 cd e4 02
   push h        ; $1f38 e5      
   inr c         ; $1f39 0c      
   mov a,d       ; $1f3a 7a      
   ldax b        ; $1f3b 0a      
   mov e,l       ; $1f3c 5d      
   rar           ; $1f3d 1f      
   add d         ; $1f3e 82      
   inx b         ; $1f3f 03      
   mov d,h       ; $1f40 54      
   dcr d         ; $1f41 15      
   dcx h         ; $1f42 2b      
   ldax b        ; $1f43 0a      
   mov b,e       ; $1f44 43      
   nop           ; $1f45 00      
   mov h,m       ; $1f46 66      
   dcr b         ; $1f47 05      
   rpo           ; $1f48 e0      
   inx b         ; $1f49 03      
   mov a,d       ; $1f4a 7a      
   ldax b        ; $1f4b 0a      
   mov e,l       ; $1f4c 5d      
   rar           ; $1f4d 1f      
   mov h,m       ; $1f4e 66      
   dcr d         ; $1f4f 15      
   mov c,d       ; $1f50 4a      
   lxi d,$200a   ; $1f51 11 0a 20
   dcr l         ; $1f54 2d      
   .byte 0x20    ; $1f55 20      
   rp            ; $1f56 f0      
   mov d,b       ; $1f57 50      
   mov b,l       ; $1f58 45      
   mov d,b       ; $1f59 50      
   mov b,d       ; $1f5a 42      
   mov b,c       ; $1f5b 41      
   mov c,b       ; $1f5c 48      
   dcr d         ; $1f5d 15      
   inx b         ; $1f5e 03      
   inr b         ; $1f5f 04      
   mov b,h       ; $1f60 44      
   mov d,l       ; $1f61 55      
   mov c,l       ; $1f62 4d      
   mov d,b       ; $1f63 50      
   dcr l         ; $1f64 2d      
   rar           ; $1f65 1f      
   call $02e4    ; $1f66 cd e4 02
   dcx h         ; $1f69 2b      
   ldax b        ; $1f6a 0a      
   rlc           ; $1f6b 07      
   nop           ; $1f6c 00      
   mov c,d       ; $1f6d 4a      
   inr b         ; $1f6e 04      
   dcx h         ; $1f6f 2b      
   ldax b        ; $1f70 0a      
   .byte 0x08    ; $1f71 08      
   nop           ; $1f72 00      
   cm $c80f      ; $1f73 fc 0f c8
   mvi c,$0c     ; $1f76 0e 0c   
   dcx b         ; $1f78 0b      
   pop b         ; $1f79 c1      
   rar           ; $1f7a 1f      
   mov h,m       ; $1f7b 66      
   dcr d         ; $1f7c 15      
   dcr m         ; $1f7d 35      
   rar           ; $1f7e 1f      
   .byte 0x08    ; $1f7f 08      
   stax b        ; $1f80 02      
   add h         ; $1f81 84      
   dad b         ; $1f82 09      
   adc l         ; $1f83 8d      
   inx b         ; $1f84 03      
   mov a,l       ; $1f85 7d      
   mvi d,$d3     ; $1f86 16 d3   
   inx b         ; $1f88 03      
   dcx h         ; $1f89 2b      
   ldax b        ; $1f8a 0a      
   inr b         ; $1f8b 04      
   nop           ; $1f8c 00      
   out $12       ; $1f8d d3 12   
   cnz $c416     ; $1f8f c4 16 c4
   mvi d,$d3     ; $1f92 16 d3   
   inx b         ; $1f94 03      
   dcx h         ; $1f95 2b      
   ldax b        ; $1f96 0a      
   .byte 0x08    ; $1f97 08      
   nop           ; $1f98 00      
   rz            ; $1f99 c8      
   mvi c,$e5     ; $1f9a 0e e5   
   ldax b        ; $1f9c 0a      
   xra a         ; $1f9d af      
   rar           ; $1f9e 1f      
   out $03       ; $1f9f d3 03   
   sub c         ; $1fa1 91      
   dad b         ; $1fa2 09      
   jc $d30e      ; $1fa3 da 0e d3
   stax d        ; $1fa6 12      
   cnz $7716     ; $1fa7 c4 16 77
   inr b         ; $1faa 04      
   mvi l,$0b     ; $1fab 2e 0b   
   sbb a         ; $1fad 9f      
   rar           ; $1fae 1f      
   adc l         ; $1faf 8d      
   inx b         ; $1fb0 03      
   dcx h         ; $1fb1 2b      
   ldax b        ; $1fb2 0a      
   .byte 0x08    ; $1fb3 08      
   nop           ; $1fb4 00      
   stax d        ; $1fb5 12      
   rar           ; $1fb6 1f      
   adc l         ; $1fb7 8d      
   inx b         ; $1fb8 03      
   .byte 0x08    ; $1fb9 08      
   stax b        ; $1fba 02      
   sbb l         ; $1fbb 9d      
   dad b         ; $1fbc 09      
   mvi l,$0b     ; $1fbd 2e 0b   
   mov a,e       ; $1fbf 7b      
   rar           ; $1fc0 1f      
   add d         ; $1fc1 82      
   inx b         ; $1fc2 03      
   dcr d         ; $1fc3 15      
   inx b         ; $1fc4 03      
   dcr b         ; $1fc5 05      
   mov d,h       ; $1fc6 54      
   mov d,d       ; $1fc7 52      
   mov b,c       ; $1fc8 41      
   mov c,c       ; $1fc9 49      
   mov c,h       ; $1fca 4c      
   mov e,a       ; $1fcb 5f      
   rar           ; $1fcc 1f      
   call $02e4    ; $1fcd cd e4 02
   mov l,m       ; $1fd0 6e      
   inr d         ; $1fd1 14      
   ana m         ; $1fd2 a6      
   stax b        ; $1fd3 02      
   add h         ; $1fd4 84      
   dad b         ; $1fd5 09      
   mov d,l       ; $1fd6 55      
   inr b         ; $1fd7 04      
   dcr d         ; $1fd8 15      
   inx b         ; $1fd9 03      
   dcr b         ; $1fda 05      
   mov c,m       ; $1fdb 4e      
   mov c,h       ; $1fdc 4c      
   mov c,c       ; $1fdd 49      
   mov d,e       ; $1fde 53      
   mov d,h       ; $1fdf 54      
   push b        ; $1fe0 c5      
   rar           ; $1fe1 1f      
   call $02e4    ; $1fe2 cd e4 02
   add h         ; $1fe5 84      
   dad b         ; $1fe6 09      
   out $03       ; $1fe7 d3 03   
   mov a,d       ; $1fe9 7a      
   ldax b        ; $1fea 0a      
   dcx h         ; $1feb 2b      
   .byte 0x20    ; $1fec 20      
   out $03       ; $1fed d3 03   
   mov l,a       ; $1fef 6f      
   rrc           ; $1ff0 0f      
   dcx h         ; $1ff1 2b      
   ldax b        ; $1ff2 0a      
   cmc           ; $1ff3 3f      
   nop           ; $1ff4 00      
   rz            ; $1ff5 c8      
   .byte 0x08    ; $1ff6 08      
   call $621f    ; $1ff7 cd 1f 62
   inx b         ; $1ffa 03      
   jm $7a04      ; $1ffb fa 04 7a
   ldax b        ; $1ffe 0a      
   inx b         ; $1fff 03      
   .byte 0x20    ; $2000 20      
   mov h,m       ; $2001 66      
   dcr d         ; $2002 15      
   out $03       ; $2003 d3 03   
   dcx h         ; $2005 2b      
   ldax b        ; $2006 0a      
   .byte 0x08    ; $2007 08      
   nop           ; $2008 00      
   mov c,d       ; $2009 4a      
   inr b         ; $200a 04      
   dcx h         ; $200b 2b      
   ldax b        ; $200c 0a      
   rm            ; $200d f8      
   rst 7         ; $200e ff      
   rz            ; $200f c8      
   .byte 0x08    ; $2010 08      
   mov h,d       ; $2011 62      
   inx b         ; $2012 03      
   mov d,l       ; $2013 55      
   inr b         ; $2014 04      
   push b        ; $2015 c5      
   inx b         ; $2016 03      
   mov a,m       ; $2017 7e      
   dcr d         ; $2018 15      
   call $c11f    ; $2019 cd 1f c1
   inr b         ; $201c 04      
   rz            ; $201d c8      
   mvi c,$de     ; $201e 0e de   
   inr b         ; $2020 04      
   sui $16       ; $2021 d6 16   
   mov a,e       ; $2023 7b      
   inx d         ; $2024 13      
   dcr m         ; $2025 35      
   rar           ; $2026 1f      
   mov l,b       ; $2027 68      
   ldax b        ; $2028 0a      
   push h        ; $2029 e5      
   rar           ; $202a 1f      
   add d         ; $202b 82      
   inx b         ; $202c 03      
   dcr d         ; $202d 15      
   inx b         ; $202e 03      
   dcr b         ; $202f 05      
   mov d,a       ; $2030 57      
   mov c,a       ; $2031 4f      
   mov d,d       ; $2032 52      
   mov b,h       ; $2033 44      
   mov d,e       ; $2034 53      
   push b        ; $2035 c5      
   rar           ; $2036 1f      
   call $02e4    ; $2037 cd e4 02
   inr h         ; $203a 24      
   stax b        ; $203b 02      
   add h         ; $203c 84      
   dad b         ; $203d 09      
   jpo $151f     ; $203e e2 1f 15
   inx b         ; $2041 03      
   dcr b         ; $2042 05      
   mov d,m       ; $2043 56      
   mov c,h       ; $2044 4c      
   mov c,c       ; $2045 49      
   mov d,e       ; $2046 53      
   mov d,h       ; $2047 54      
   cma           ; $2048 2f      
   .byte 0x20    ; $2049 20      
   call $02e4    ; $204a cd e4 02
   stc           ; $204d 37      
   .byte 0x20    ; $204e 20      
   dcr d         ; $204f 15      
   inx b         ; $2050 03      
   add d         ; $2051 82      
   dcr l         ; $2052 2d      
   dcr l         ; $2053 2d      
   mov b,d       ; $2054 42      
   .byte 0x20    ; $2055 20      
   call $02e4    ; $2056 cd e4 02
   ora c         ; $2059 b1      
   stax b        ; $205a 02      
   add h         ; $205b 84      
   dad b         ; $205c 09      
   mov a,d       ; $205d 7a      
   ldax b        ; $205e 0a      
   mov m,l       ; $205f 75      
   .byte 0x20    ; $2060 20      
   hlt           ; $2061 76      
   stax b        ; $2062 02      
   add h         ; $2063 84      
   dad b         ; $2064 09      
   dcx h         ; $2065 2b      
   ldax b        ; $2066 0a      
   cmc           ; $2067 3f      
   nop           ; $2068 00      
   mov c,d       ; $2069 4a      
   inr b         ; $206a 04      
   dcx h         ; $206b 2b      
   ldax b        ; $206c 0a      
   rnz           ; $206d c0      
   rst 7         ; $206e ff      
   rz            ; $206f c8      
   .byte 0x08    ; $2070 08      
   mov l,b       ; $2071 68      
   ldax b        ; $2072 0a      
   mov a,c       ; $2073 79      
   .byte 0x20    ; $2074 20      
   mov l,e       ; $2075 6b      
   stax b        ; $2076 02      
   add h         ; $2077 84      
   dad b         ; $2078 09      
   hlt           ; $2079 76      
   stax b        ; $207a 02      
   sbb l         ; $207b 9d      
   dad b         ; $207c 09      
   dcr d         ; $207d 15      
   inx b         ; $207e 03      
   inr b         ; $207f 04      
   mov c,m       ; $2080 4e      
   mov c,a       ; $2081 4f      
   mov c,a       ; $2082 4f      
   mov d,b       ; $2083 50      
   mov d,c       ; $2084 51      
   .byte 0x20    ; $2085 20      
   call $02e4    ; $2086 cd e4 02
   dcr d         ; $2089 15      
   inx b         ; $208a 03      
   stax b        ; $208b 02      
   mov d,e       ; $208c 53      
   mvi l,$7f     ; $208d 2e 7f   
   .byte 0x20    ; $208f 20      
   call $02e4    ; $2090 cd e4 02
   .byte 0xd9    ; $2093 d9      
   inr e         ; $2094 1c      
   rpo           ; $2095 e0      
   inx b         ; $2096 03      
   mov a,d       ; $2097 7a      
   ldax b        ; $2098 0a      
   cmp c         ; $2099 b9      
   .byte 0x20    ; $209a 20      
   mov m,a       ; $209b 77      
   inr b         ; $209c 04      
   pop d         ; $209d d1      
   mvi c,$e5     ; $209e 0e e5   
   ldax b        ; $20a0 0a      
   ora l         ; $20a1 b5      
   .byte 0x20    ; $20a2 20      
   cmp m         ; $20a3 be      
   lxi b,$0984   ; $20a4 01 84 09
   sbb a         ; $20a7 9f      
   ldax b        ; $20a8 0a      
   ana l         ; $20a9 a5      
   inr b         ; $20aa 04      
   mov d,l       ; $20ab 55      
   inr b         ; $20ac 04      
   add h         ; $20ad 84      
   dad b         ; $20ae 09      
   cpi $12       ; $20af fe 12   
   mvi l,$0b     ; $20b1 2e 0b   
   ana e         ; $20b3 a3      
   .byte 0x20    ; $20b4 20      
   mov l,b       ; $20b5 68      
   ldax b        ; $20b6 0a      
   push b        ; $20b7 c5      
   .byte 0x20    ; $20b8 20      
   mvi a,$18     ; $20b9 3e 18   
   dad b         ; $20bb 09      
   mov b,e       ; $20bc 43      
   mov d,h       ; $20bd 54      
   mov b,l       ; $20be 45      
   mov c,e       ; $20bf 4b      
   .byte 0x20    ; $20c0 20      
   rp            ; $20c1 f0      
   push psw      ; $20c2 f5      
   mov b,e       ; $20c3 43      
   mov d,h       ; $20c4 54      
   dcr d         ; $20c5 15      
   inx b         ; $20c6 03      
   add c         ; $20c7 81      
   .byte 0x28    ; $20c8 28      
   adc e         ; $20c9 8b      
   .byte 0x20    ; $20ca 20      
   call $02e4    ; $20cb cd e4 02
   dcx h         ; $20ce 2b      
   ldax b        ; $20cf 0a      
   dad h         ; $20d0 29      
   nop           ; $20d1 00      
   .byte 0xed    ; $20d2 ed      
   inx d         ; $20d3 13      
   add d         ; $20d4 82      
   inx b         ; $20d5 03      
   dcr d         ; $20d6 15      
   inx b         ; $20d7 03      
   .byte 0x08    ; $20d8 08      
   cmc           ; $20d9 3f      
   mov b,e       ; $20da 43      
   mov d,l       ; $20db 55      
   mov d,d       ; $20dc 52      
   mov d,d       ; $20dd 52      
   mov b,l       ; $20de 45      
   mov c,m       ; $20df 4e      
   mov d,h       ; $20e0 54      
   rst 0         ; $20e1 c7      
   .byte 0x20    ; $20e2 20      
   call $02e4    ; $20e3 cd e4 02
   inx sp        ; $20e6 33      
   stax b        ; $20e7 02      
   add h         ; $20e8 84      
   dad b         ; $20e9 09      
   cmc           ; $20ea 3f      
   .byte 0x08    ; $20eb 08      
   mov a,m       ; $20ec 7e      
   dcr b         ; $20ed 05      
   mov c,d       ; $20ee 4a      
   lxi d,$2004   ; $20ef 11 04 20
   dcr l         ; $20f2 2d      
   .byte 0x20    ; $20f3 20      
   cmc           ; $20f4 3f      
   dcr d         ; $20f5 15      
   inx b         ; $20f6 03      
   add a         ; $20f7 87      
   mov d,e       ; $20f8 53      
   mov b,e       ; $20f9 43      
   mov d,d       ; $20fa 52      
   mov b,c       ; $20fb 41      
   mov d,h       ; $20fc 54      
   mov b,e       ; $20fd 43      
   mov c,b       ; $20fe 48      
   rst 0         ; $20ff c7      
   .byte 0x20    ; $2100 20      
   call $02e4    ; $2101 cd e4 02
   rm            ; $2104 f8      
   dcx d         ; $2105 1b      
   ana m         ; $2106 a6      
   mvi d,$ed     ; $2107 16 ed   
   inx d         ; $2109 13      
   inx sp        ; $210a 33      
   stax b        ; $210b 02      
   add h         ; $210c 84      
   dad b         ; $210d 09      
   .byte 0x18    ; $210e 18      
   .byte 0x18    ; $210f 18      
   mov a,m       ; $2110 7e      
   dcr b         ; $2111 05      
   mov c,d       ; $2112 4a      
   lxi d,$2004   ; $2113 11 04 20
   dcr l         ; $2116 2d      
   .byte 0x20    ; $2117 20      
   cmc           ; $2118 3f      
   dcr d         ; $2119 15      
   inx b         ; $211a 03      
   add h         ; $211b 84      
   mov c,d       ; $211c 4a      
   mov c,a       ; $211d 4f      
   mov c,c       ; $211e 49      
   mov c,m       ; $211f 4e      
   rst 6         ; $2120 f7      
   .byte 0x20    ; $2121 20      
   call $02e4    ; $2122 cd e4 02
   rm            ; $2125 f8      
   dcx d         ; $2126 1b      
   ana m         ; $2127 a6      
   mvi d,$ed     ; $2128 16 ed   
   inx d         ; $212a 13      
   xthl          ; $212b e3      
   .byte 0x20    ; $212c 20      
   mov a,e       ; $212d 7b      
   inx d         ; $212e 13      
   add h         ; $212f 84      
   dad b         ; $2130 09      
   .byte 0x20    ; $2131 20      
   ral           ; $2132 17      
   mov a,e       ; $2133 7b      
   inx d         ; $2134 13      
   sbb l         ; $2135 9d      
   dad b         ; $2136 09      
   dcr d         ; $2137 15      
   inx b         ; $2138 03      
   add e         ; $2139 83      
   mov c,m       ; $213a 4e      
   mov b,l       ; $213b 45      
   mov d,a       ; $213c 57      
   dcx d         ; $213d 1b      
   lxi h,$e4cd   ; $213e 21 cd e4
   stax b        ; $2141 02      
   rm            ; $2142 f8      
   dcx d         ; $2143 1b      
   ana m         ; $2144 a6      
   mvi d,$ed     ; $2145 16 ed   
   inx d         ; $2147 13      
   out $03       ; $2148 d3 03   
   xthl          ; $214a e3      
   .byte 0x20    ; $214b 20      
   inx sp        ; $214c 33      
   stax b        ; $214d 02      
   add h         ; $214e 84      
   dad b         ; $214f 09      
   dcr c         ; $2150 0d      
   dad b         ; $2151 09      
   out $03       ; $2152 d3 03   
   mov a,e       ; $2154 7b      
   inx d         ; $2155 13      
   inx sp        ; $2156 33      
   stax b        ; $2157 02      
   sbb l         ; $2158 9d      
   dad b         ; $2159 09      
   sub d         ; $215a 92      
   inx d         ; $215b 13      
   adc l         ; $215c 8d      
   inx b         ; $215d 03      
   xthl          ; $215e e3      
   .byte 0x20    ; $215f 20      
   sub d         ; $2160 92      
   inx d         ; $2161 13      
   dcx h         ; $2162 2b      
   ldax b        ; $2163 0a      
   jmp $6200     ; $2164 c3 00 62
   inx b         ; $2167 03      
   xra d         ; $2168 aa      
   dad b         ; $2169 09      
   mov m,a       ; $216a 77      
   inr b         ; $216b 04      
   sbb l         ; $216c 9d      
   dad b         ; $216d 09      
   .byte 0x20    ; $216e 20      
   dad b         ; $216f 09      
   inx sp        ; $2170 33      
   stax b        ; $2171 02      
   sbb l         ; $2172 9d      
   dad b         ; $2173 09      
   dcr d         ; $2174 15      
   inx b         ; $2175 03      
   mvi b,$46     ; $2176 06 46   
   mov c,a       ; $2178 4f      
   mov d,d       ; $2179 52      
   mov b,a       ; $217a 47      
   mov b,l       ; $217b 45      
   mov d,h       ; $217c 54      
   dad sp        ; $217d 39      
   lxi h,$e4cd   ; $217e 21 cd e4
   stax b        ; $2181 02      
   ana m         ; $2182 a6      
   mvi d,$ed     ; $2183 16 ed   
   inx d         ; $2185 13      
   xthl          ; $2186 e3      
   .byte 0x20    ; $2187 20      
   out $03       ; $2188 d3 03   
   xri $01       ; $218a ee 01   
   add h         ; $218c 84      
   dad b         ; $218d 09      
   jm $4a04      ; $218e fa 04 4a
   lxi d,$420e   ; $2191 11 0e 42
   sphl          ; $2194 f9      
   mov e,b       ; $2195 58      
   mov c,a       ; $2196 4f      
   cpo $fa20     ; $2197 e4 20 fa
   mov b,c       ; $219a 41      
   .byte 0x20    ; $219b 20      
   mov b,m       ; $219c 46      
   mov b,l       ; $219d 45      
   mov c,m       ; $219e 4e      
   mov b,e       ; $219f 43      
   mov b,l       ; $21a0 45      
   dcr c         ; $21a1 0d      
   dad b         ; $21a2 09      
   pop h         ; $21a3 e1      
   lxi b,$0984   ; $21a4 01 84 09
   inx sp        ; $21a7 33      
   dad b         ; $21a8 09      
   mov h,d       ; $21a9 62      
   inx b         ; $21aa 03      
   jm $7a04      ; $21ab fa 04 7a
   ldax b        ; $21ae 0a      
   pop b         ; $21af c1      
   lxi h,$3450   ; $21b0 21 50 34
   ldax b        ; $21b3 0a      
   ral           ; $21b4 17      
   add h         ; $21b5 84      
   dad b         ; $21b6 09      
   out $03       ; $21b7 d3 03   
   pop h         ; $21b9 e1      
   lxi b,$099d   ; $21ba 01 9d 09
   mov l,b       ; $21bd 68      
   ldax b        ; $21be 0a      
   ana a         ; $21bf a7      
   lxi h,$03d3   ; $21c0 21 d3 03
   dcx h         ; $21c3 2b      
   ldax b        ; $21c4 0a      
   inr b         ; $21c5 04      
   nop           ; $21c6 00      
   mov d,l       ; $21c7 55      
   inr b         ; $21c8 04      
   mov a,e       ; $21c9 7b      
   inx d         ; $21ca 13      
   add h         ; $21cb 84      
   dad b         ; $21cc 09      
   out $03       ; $21cd d3 03   
   inx sp        ; $21cf 33      
   dad b         ; $21d0 09      
   jm $7a04      ; $21d1 fa 04 7a
   ldax b        ; $21d4 0a      
   ret           ; $21d5 c9      
   lxi h,$0362   ; $21d6 21 62 03
   sbb c         ; $21d9 99      
   inr b         ; $21da 04      
   sbb l         ; $21db 9d      
   dad b         ; $21dc 09      
   add h         ; $21dd 84      
   dad b         ; $21de 09      
   rpo           ; $21df e0      
   inx b         ; $21e0 03      
   mov a,m       ; $21e1 7e      
   dcr b         ; $21e2 05      
   mov a,d       ; $21e3 7a      
   ldax b        ; $21e4 0a      
   pop b         ; $21e5 c1      
   lxi h,$0920   ; $21e6 21 20 09
   pop d         ; $21e9 d1      
   lxi b,$099d   ; $21ea 01 9d 09
   dcr d         ; $21ed 15      
   inx b         ; $21ee 03      
   dad b         ; $21ef 09      
   mov b,c       ; $21f0 41      
   mov d,e       ; $21f1 53      
   mov d,e       ; $21f2 53      
   mov b,l       ; $21f3 45      
   mov c,l       ; $21f4 4d      
   mov b,d       ; $21f5 42      
   mov c,h       ; $21f6 4c      
   mov b,l       ; $21f7 45      
   mov d,d       ; $21f8 52      
   hlt           ; $21f9 76      
   lxi h,$95cd   ; $21fa 21 cd 95
   dcx d         ; $21fd 1b      
   lxi b,$6f80   ; $21fe 01 80 6f
   dad h         ; $2201 29      
   mov d,a       ; $2202 57      
   inr m         ; $2203 34      
   call $02e4    ; $2204 cd e4 02
   ana l         ; $2207 a5      
   inr b         ; $2208 04      
   ana l         ; $2209 a5      
   inr b         ; $220a 04      
   ana l         ; $220b a5      
   inr b         ; $220c 04      
   dcr d         ; $220d 15      
   inx b         ; $220e 03      
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
   sub c         ; $226f 91      
   dad b         ; $2270 09      
   cma           ; $2271 2f      
   rrc           ; $2272 0f      
   dcr d         ; $2273 15      
   inx b         ; $2274 03      
   call $02e4    ; $2275 cd e4 02
   sub c         ; $2278 91      
   dad b         ; $2279 09      
   mov c,d       ; $227a 4a      
   inr b         ; $227b 04      
   cma           ; $227c 2f      
   rrc           ; $227d 0f      
   dcr d         ; $227e 15      
   inx b         ; $227f 03      
   call $02e4    ; $2280 cd e4 02
   sub c         ; $2283 91      
   dad b         ; $2284 09      
   adc l         ; $2285 8d      
   inx b         ; $2286 03      
   inr b         ; $2287 04      
   shld $044a    ; $2288 22 4a 04
   cma           ; $228b 2f      
   rrc           ; $228c 0f      
   dcr d         ; $228d 15      
   inx b         ; $228e 03      
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
   rlc           ; $28e3 07      
   mov b,d       ; $28e4 42      
   mov b,l       ; $28e5 45      
   mov b,a       ; $28e6 47      
   dcr l         ; $28e7 2d      
   mov b,c       ; $28e8 41      
   mov d,e       ; $28e9 53      
   mov c,l       ; $28ea 4d      
   rst 5         ; $28eb ef      
   lxi h,$e4cd   ; $28ec 21 cd e4
   stax b        ; $28ef 02      
   sphl          ; $28f0 f9      
   shld $21fb    ; $28f1 22 fb 21
   cmp l         ; $28f4 bd      
   dcx d         ; $28f5 1b      
   dcr d         ; $28f6 15      
   inx b         ; $28f7 03      
   rlc           ; $28f8 07      
   mov b,l       ; $28f9 45      
   mov c,m       ; $28fa 4e      
   mov b,h       ; $28fb 44      
   dcr l         ; $28fc 2d      
   mov b,c       ; $28fd 41      
   mov d,e       ; $28fe 53      
   mov c,l       ; $28ff 4d      
   xthl          ; $2900 e3      
   .byte 0x28    ; $2901 28      
   call $02e4    ; $2902 cd e4 02
   cmp c         ; $2905 b9      
   shld $1bcf    ; $2906 22 cf 1b
   inx sp        ; $2909 33      
   stax b        ; $290a 02      
   add h         ; $290b 84      
   dad b         ; $290c 09      
   inr h         ; $290d 24      
   stax b        ; $290e 02      
   sbb l         ; $290f 9d      
   dad b         ; $2910 09      
   dcr d         ; $2911 15      
   inx b         ; $2912 03      
   inr b         ; $2913 04      
   mov b,e       ; $2914 43      
   mov c,a       ; $2915 4f      
   mov b,h       ; $2916 44      
   mov b,l       ; $2917 45      
   rm            ; $2918 f8      
   .byte 0x28    ; $2919 28      
   call $02e4    ; $291a cd e4 02
   lxi h,$601a   ; $291d 21 1a 60
   ral           ; $2920 17      
   dcr l         ; $2921 2d      
   inx d         ; $2922 13      
   mov l,d       ; $2923 6a      
   inr b         ; $2924 04      
   .byte 0x10    ; $2925 10      
   rrc           ; $2926 0f      
   .byte 0xed    ; $2927 ed      
   .byte 0x28    ; $2928 28      
   dcr d         ; $2929 15      
   inx b         ; $292a 03      
   add l         ; $292b 85      
   dcx sp        ; $292c 3b      
   mov b,e       ; $292d 43      
   mov c,a       ; $292e 4f      
   mov b,h       ; $292f 44      
   mov b,l       ; $2930 45      
   inx d         ; $2931 13      
   dad h         ; $2932 29      
   call $02e4    ; $2933 cd e4 02
   mvi h,$1c     ; $2936 26 1c   
   add e         ; $2938 83      
   rrc           ; $2939 0f      
   mov a,l       ; $293a 7d      
   ldax d        ; $293b 1a      
   .byte 0xed    ; $293c ed      
   .byte 0x28    ; $293d 28      
   mov m,c       ; $293e 71      
   ral           ; $293f 17      
   dcr d         ; $2940 15      
   inx b         ; $2941 03      
   .byte 0x08    ; $2942 08      
   mov b,l       ; $2943 45      
   mov c,m       ; $2944 4e      
   mov b,h       ; $2945 44      
   dcr l         ; $2946 2d      
   mov b,e       ; $2947 43      
   mov c,a       ; $2948 4f      
   mov b,h       ; $2949 44      
   mov b,l       ; $294a 45      
   dcx h         ; $294b 2b      
   dad h         ; $294c 29      
   call $02e4    ; $294d cd e4 02
   mov h,b       ; $2950 60      
   ral           ; $2951 17      
   stax b        ; $2952 02      
   dad h         ; $2953 29      
   dcr d         ; $2954 15      
   inx b         ; $2955 03      
   dcr b         ; $2956 05      
   mov c,h       ; $2957 4c      
   mov b,c       ; $2958 41      
   mov b,d       ; $2959 42      
   mov b,l       ; $295a 45      
   mov c,h       ; $295b 4c      
   mov b,d       ; $295c 42      
   dad h         ; $295d 29      
   call $02e4    ; $295e cd e4 02
   mov d,d       ; $2961 52      
   dcx d         ; $2962 1b      
   dcx h         ; $2963 2b      
   ldax b        ; $2964 0a      
   cpi $ff       ; $2965 fe ff   
   .byte 0x10    ; $2967 10      
   rrc           ; $2968 0f      
   mov h,b       ; $2969 60      
   ral           ; $296a 17      
   .byte 0xed    ; $296b ed      
   .byte 0x28    ; $296c 28      
   dcr d         ; $296d 15      
   inx b         ; $296e 03      
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
   dcr b         ; $2982 05      
   .byte 0x28    ; $2983 28      
   mov c,a       ; $2984 4f      
   mov d,l       ; $2985 55      
   mov d,h       ; $2986 54      
   dad h         ; $2987 29      
   mov d,m       ; $2988 56      
   dad h         ; $2989 29      
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
   mvi b,$42     ; $29ab 06 42   
   mov c,a       ; $29ad 4f      
   mov d,l       ; $29ae 55      
   mov c,m       ; $29af 4e      
   mov b,h       ; $29b0 44      
   mov d,e       ; $29b1 53      
   add d         ; $29b2 82      
   dad h         ; $29b3 29      
   call $02e4    ; $29b4 cd e4 02
   mov h,d       ; $29b7 62      
   inx b         ; $29b8 03      
   mov c,d       ; $29b9 4a      
   inr b         ; $29ba 04      
   adc l         ; $29bb 8d      
   inx b         ; $29bc 03      
   dcr d         ; $29bd 15      
   inx b         ; $29be 03      
   call $02e4    ; $29bf cd e4 02
   out $03       ; $29c2 d3 03   
   mov c,h       ; $29c4 4c      
   lhld $044a    ; $29c5 2a 4a 04
   rz            ; $29c8 c8      
   mvi c,$8d     ; $29c9 0e 8d   
   inx b         ; $29cb 03      
   mov h,h       ; $29cc 64      
   lhld $29b4    ; $29cd 2a b4 29
   inr c         ; $29d0 0c      
   dcx b         ; $29d1 0b      
   sbi $29       ; $29d2 de 29   
   sbb a         ; $29d4 9f      
   ldax b        ; $29d5 0a      
   sub c         ; $29d6 91      
   dad b         ; $29d7 09      
   mov c,d       ; $29d8 4a      
   inr b         ; $29d9 04      
   mvi l,$0b     ; $29da 2e 0b   
   cnc $1529     ; $29dc d4 29 15
   inx b         ; $29df 03      
   call $02e4    ; $29e0 cd e4 02
   mvi a,$18     ; $29e3 3e 18   
   .byte 0x08    ; $29e5 08      
   .byte 0x28    ; $29e6 28      
   mov e,c       ; $29e7 59      
   cma           ; $29e8 2f      
   mvi l,$2e     ; $29e9 2e 2e   
   mvi l,$29     ; $29eb 2e 29   
   .byte 0x20    ; $29ed 20      
   mov d,h       ; $29ee 54      
   dcr d         ; $29ef 15      
   out $03       ; $29f0 d3 03   
   dcr a         ; $29f2 3d      
   dcr d         ; $29f3 15      
   dcx h         ; $29f4 2b      
   ldax b        ; $29f5 0a      
   mov e,c       ; $29f6 59      
   nop           ; $29f7 00      
   mov h,m       ; $29f8 66      
   dcr b         ; $29f9 05      
   dcr d         ; $29fa 15      
   inx b         ; $29fb 03      
   inx b         ; $29fc 03      
   mov c,a       ; $29fd 4f      
   mov d,l       ; $29fe 55      
   mov d,h       ; $29ff 54      
   xra e         ; $2a00 ab      
   dad h         ; $2a01 29      
   call $02e4    ; $2a02 cd e4 02
   cmp a         ; $2a05 bf      
   dad h         ; $2a06 29      
   mov h,d       ; $2a07 62      
   inx b         ; $2a08 03      
   .byte 0x20    ; $2a09 20      
   dcx h         ; $2a0a 2b      
   sbb l         ; $2a0b 9d      
   dad b         ; $2a0c 09      
   mov h,h       ; $2a0d 64      
   lhld $2a4c    ; $2a0e 2a 4c 2a
   mov c,d       ; $2a11 4a      
   inr b         ; $2a12 04      
   mov h,m       ; $2a13 66      
   dcr d         ; $2a14 15      
   mvi a,$18     ; $2a15 3e 18   
   ldax b        ; $2a17 0a      
   mov l,l       ; $2a18 6d      
   mov l,h       ; $2a19 6c      
   inr a         ; $2a1a 3c      
   dcr l         ; $2a1b 2d      
   dcr l         ; $2a1c 2d      
   mov h,d       ; $2a1d 62      
   mov l,h       ; $2a1e 6c      
   mov l,a       ; $2a1f 6f      
   mov l,e       ; $2a20 6b      
   .byte 0x20    ; $2a21 20      
   mov h,d       ; $2a22 62      
   inx b         ; $2a23 03      
   add h         ; $2a24 84      
   dad b         ; $2a25 09      
   cpi $12       ; $2a26 fe 12   
   rpo           ; $2a28 e0      
   dad h         ; $2a29 29      
   mov a,d       ; $2a2a 7a      
   ldax b        ; $2a2b 0a      
   sta $8a2a     ; $2a2c 32 2a 8a
   dad h         ; $2a2f 29      
   dcr d         ; $2a30 15      
   inx b         ; $2a31 03      
   inx b         ; $2a32 03      
   inr b         ; $2a33 04      
   dcr d         ; $2a34 15      
   inx b         ; $2a35 03      
   dcr d         ; $2a36 15      
   inx b         ; $2a37 03      
   mvi b,$53     ; $2a38 06 53   
   mov d,h       ; $2a3a 54      
   mov b,m       ; $2a3b 46      
   mov c,c       ; $2a3c 49      
   mov c,h       ; $2a3d 4c      
   mov b,l       ; $2a3e 45      
   dad b         ; $2a3f 09      
   lhld $e4cd    ; $2a40 2a cd e4
   stax b        ; $2a43 02      
   dcr d         ; $2a44 15      
   inx b         ; $2a45 03      
   inx b         ; $2a46 03      
   mov b,h       ; $2a47 44      
   mov b,d       ; $2a48 42      
   mov c,b       ; $2a49 48      
   cm $cd29      ; $2a4a fc 29 cd
   add h         ; $2a4d 84      
   dad b         ; $2a4e 09      
   inr b         ; $2a4f 04      
   nop           ; $2a50 00      
   inx b         ; $2a51 03      
   mov b,h       ; $2a52 44      
   mov b,d       ; $2a53 42      
   mov d,h       ; $2a54 54      
   mov b,m       ; $2a55 46      
   lhld $84cd    ; $2a56 2a cd 84
   dad b         ; $2a59 09      
   stax b        ; $2a5a 02      
   nop           ; $2a5b 00      
   dcr b         ; $2a5c 05      
   mov b,d       ; $2a5d 42      
   cma           ; $2a5e 2f      
   mov b,d       ; $2a5f 42      
   mov d,l       ; $2a60 55      
   mov b,m       ; $2a61 46      
   mov b,m       ; $2a62 46      
   lhld $84cd    ; $2a63 2a cd 84
   dad b         ; $2a66 09      
   nop           ; $2a67 00      
   inr b         ; $2a68 04      
   inr b         ; $2a69 04      
   mov c,b       ; $2a6a 48      
   mov b,h       ; $2a6b 44      
   mov b,d       ; $2a6c 42      
   mov d,h       ; $2a6d 54      
   mov e,h       ; $2a6e 5c      
   lhld $84cd    ; $2a6f 2a cd 84
   dad b         ; $2a72 09      
   mvi b,$04     ; $2a73 06 04   
   mvi b,$23     ; $2a75 06 23   
   mov b,d       ; $2a77 42      
   mov d,l       ; $2a78 55      
   mov b,m       ; $2a79 46      
   mov b,m       ; $2a7a 46      
   lxi sp,$2a69  ; $2a7b 31 69 2a
   call $0984    ; $2a7e cd 84 09
   sbb e         ; $2a81 9b      
   dcr m         ; $2a82 35      
   mvi b,$46     ; $2a83 06 46   
   mov c,c       ; $2a85 49      
   mov d,d       ; $2a86 52      
   mov d,e       ; $2a87 53      
   mov d,h       ; $2a88 54      
   lxi sp,$2a69  ; $2a89 31 69 2a
   call $0984    ; $2a8c cd 84 09
   sbb l         ; $2a8f 9d      
   dcr m         ; $2a90 35      
   mvi b,$4c     ; $2a91 06 4c   
   mov c,c       ; $2a93 49      
   mov c,l       ; $2a94 4d      
   mov c,c       ; $2a95 49      
   mov d,h       ; $2a96 54      
   lxi sp,$2a83  ; $2a97 31 83 2a
   call $0984    ; $2a9a cd 84 09
   sbb a         ; $2a9d 9f      
   dcr m         ; $2a9e 35      
   inr b         ; $2a9f 04      
   mov d,l       ; $2aa0 55      
   mov d,d       ; $2aa1 52      
   cma           ; $2aa2 2f      
   mov d,a       ; $2aa3 57      
   sub c         ; $2aa4 91      
   lhld $84cd    ; $2aa5 2a cd 84
   dad b         ; $2aa8 09      
   ana c         ; $2aa9 a1      
   dcr m         ; $2aaa 35      
   inr b         ; $2aab 04      
   mov d,b       ; $2aac 50      
   mov d,d       ; $2aad 52      
   mov b,l       ; $2aae 45      
   mov d,m       ; $2aaf 56      
   sub c         ; $2ab0 91      
   lhld $84cd    ; $2ab1 2a cd 84
   dad b         ; $2ab4 09      
   ana e         ; $2ab5 a3      
   dcr m         ; $2ab6 35      
   inx b         ; $2ab7 03      
   mov d,l       ; $2ab8 55      
   mov d,e       ; $2ab9 53      
   mov b,l       ; $2aba 45      
   xra e         ; $2abb ab      
   lhld $84cd    ; $2abc 2a cd 84
   dad b         ; $2abf 09      
   ana l         ; $2ac0 a5      
   dcr m         ; $2ac1 35      
   mvi b,$42     ; $2ac2 06 42   
   mov b,d       ; $2ac4 42      
   dcr l         ; $2ac5 2d      
   mov b,e       ; $2ac6 43      
   mov c,m       ; $2ac7 4e      
   mov d,h       ; $2ac8 54      
   xra e         ; $2ac9 ab      
   lhld $84cd    ; $2aca 2a cd 84
   dad b         ; $2acd 09      
   ana a         ; $2ace a7      
   dcr m         ; $2acf 35      
   inx b         ; $2ad0 03      
   mov d,e       ; $2ad1 53      
   mov b,e       ; $2ad2 43      
   mov d,d       ; $2ad3 52      
   xra e         ; $2ad4 ab      
   lhld $84cd    ; $2ad5 2a cd 84
   dad b         ; $2ad8 09      
   xra c         ; $2ad9 a9      
   dcr m         ; $2ada 35      
   inr b         ; $2adb 04      
   mov c,h       ; $2adc 4c      
   mov b,e       ; $2add 43      
   mov c,m       ; $2ade 4e      
   mov d,h       ; $2adf 54      
   rnc           ; $2ae0 d0      
   lhld $84cd    ; $2ae1 2a cd 84
   dad b         ; $2ae4 09      
   xra e         ; $2ae5 ab      
   dcr m         ; $2ae6 35      
   dcr b         ; $2ae7 05      
   inx h         ; $2ae8 23      
   mov b,d       ; $2ae9 42      
   mov d,l       ; $2aea 55      
   mov b,m       ; $2aeb 46      
   mov b,m       ; $2aec 46      
   in $2a        ; $2aed db 2a   
   call $02e4    ; $2aef cd e4 02
   mov a,m       ; $2af2 7e      
   lhld $0984    ; $2af3 2a 84 09
   dcr d         ; $2af6 15      
   inx b         ; $2af7 03      
   dcr b         ; $2af8 05      
   mov b,m       ; $2af9 46      
   mov c,c       ; $2afa 49      
   mov d,d       ; $2afb 52      
   mov d,e       ; $2afc 53      
   mov d,h       ; $2afd 54      
   rnc           ; $2afe d0      
   lhld $e4cd    ; $2aff 2a cd e4
   stax b        ; $2b02 02      
   adc h         ; $2b03 8c      
   lhld $0984    ; $2b04 2a 84 09
   dcr d         ; $2b07 15      
   inx b         ; $2b08 03      
   dcr b         ; $2b09 05      
   mov c,h       ; $2b0a 4c      
   mov c,c       ; $2b0b 49      
   mov c,l       ; $2b0c 4d      
   mov c,c       ; $2b0d 49      
   mov d,h       ; $2b0e 54      
   rm            ; $2b0f f8      
   lhld $e4cd    ; $2b10 2a cd e4
   stax b        ; $2b13 02      
   sbb d         ; $2b14 9a      
   lhld $0984    ; $2b15 2a 84 09
   dcr d         ; $2b18 15      
   inx b         ; $2b19 03      
   inx b         ; $2b1a 03      
   mov b,h       ; $2b1b 44      
   mov b,d       ; $2b1c 42      
   mov b,e       ; $2b1d 43      
   dad b         ; $2b1e 09      
   dcx h         ; $2b1f 2b      
   call $02e4    ; $2b20 cd e4 02
   add d         ; $2b23 82      
   inr b         ; $2b24 04      
   dcr d         ; $2b25 15      
   inx b         ; $2b26 03      
   inx b         ; $2b27 03      
   mov d,d       ; $2b28 52      
   cma           ; $2b29 2f      
   mov d,a       ; $2b2a 57      
   ldax d        ; $2b2b 1a      
   dcx h         ; $2b2c 2b      
   call $02e4    ; $2b2d cd e4 02
   ana m         ; $2b30 a6      
   lhld $0984    ; $2b31 2a 84 09
   inr l         ; $2b34 2c      
   inx b         ; $2b35 03      
   dcr d         ; $2b36 15      
   inx b         ; $2b37 03      
   dcr c         ; $2b38 0d      
   mov b,l       ; $2b39 45      
   mov c,l       ; $2b3a 4d      
   mov d,b       ; $2b3b 50      
   mov d,h       ; $2b3c 54      
   mov e,c       ; $2b3d 59      
   dcr l         ; $2b3e 2d      
   mov b,d       ; $2b3f 42      
   mov d,l       ; $2b40 55      
   mov b,m       ; $2b41 46      
   mov b,m       ; $2b42 46      
   mov b,l       ; $2b43 45      
   mov d,d       ; $2b44 52      
   mov d,e       ; $2b45 53      
   ldax d        ; $2b46 1a      
   dcx h         ; $2b47 2b      
   call $02e4    ; $2b48 cd e4 02
   nop           ; $2b4b 00      
   dcx h         ; $2b4c 2b      
   lxi d,$622b   ; $2b4d 11 2b 62
   inx b         ; $2b50 03      
   mov d,l       ; $2b51 55      
   inr b         ; $2b52 04      
   mov e,e       ; $2b53 5b      
   .byte 0x18    ; $2b54 18      
   lxi d,$002b   ; $2b55 11 2b 00
   dcx h         ; $2b58 2b      
   push h        ; $2b59 e5      
   ldax b        ; $2b5a 0a      
   mov l,e       ; $2b5b 6b      
   dcx h         ; $2b5c 2b      
   dcx h         ; $2b5d 2b      
   ldax b        ; $2b5e 0a      
   rst 7         ; $2b5f ff      
   mov a,a       ; $2b60 7f      
   sbb a         ; $2b61 9f      
   ldax b        ; $2b62 0a      
   sbb l         ; $2b63 9d      
   dad b         ; $2b64 09      
   mov m,b       ; $2b65 70      
   lhld $0b63    ; $2b66 2a 63 0b
   mov e,l       ; $2b69 5d      
   dcx h         ; $2b6a 2b      
   pop d         ; $2b6b d1      
   mvi c,$cb     ; $2b6c 0e cb   
   lhld $099d    ; $2b6e 2a 9d 09
   nop           ; $2b71 00      
   dcx h         ; $2b72 2b      
   out $03       ; $2b73 d3 03   
   ora d         ; $2b75 b2      
   lhld $099d    ; $2b76 2a 9d 09
   cmp l         ; $2b79 bd      
   lhld $099d    ; $2b7a 2a 9d 09
   dcr d         ; $2b7d 15      
   inx b         ; $2b7e 03      
   inr c         ; $2b7f 0c      
   mov d,e       ; $2b80 53      
   mov b,c       ; $2b81 41      
   mov d,m       ; $2b82 56      
   mov b,l       ; $2b83 45      
   dcr l         ; $2b84 2d      
   mov b,d       ; $2b85 42      
   mov d,l       ; $2b86 55      
   mov b,m       ; $2b87 46      
   mov b,m       ; $2b88 46      
   mov b,l       ; $2b89 45      
   mov d,d       ; $2b8a 52      
   mov d,e       ; $2b8b 53      
   .byte 0x38    ; $2b8c 38      
   dcx h         ; $2b8d 2b      
   call $02e4    ; $2b8e cd e4 02
   lxi d,$002b   ; $2b91 11 2b 00
   dcx h         ; $2b94 2b      
   push h        ; $2b95 e5      
   ldax b        ; $2b96 0a      
   ret           ; $2b97 c9      
   dcx h         ; $2b98 2b      
   sbb a         ; $2b99 9f      
   ldax b        ; $2b9a 0a      
   add h         ; $2b9b 84      
   dad b         ; $2b9c 09      
   dcx h         ; $2b9d 2b      
   ldax b        ; $2b9e 0a      
   nop           ; $2b9f 00      
   add b         ; $2ba0 80      
   rz            ; $2ba1 c8      
   .byte 0x08    ; $2ba2 08      
   mov a,d       ; $2ba3 7a      
   ldax b        ; $2ba4 0a      
   jmp $9f2b     ; $2ba5 c3 2b 9f
   ldax b        ; $2ba8 0a      
   add h         ; $2ba9 84      
   dad b         ; $2baa 09      
   dcx h         ; $2bab 2b      
   ldax b        ; $2bac 0a      
   rst 7         ; $2bad ff      
   mov a,a       ; $2bae 7f      
   rz            ; $2baf c8      
   .byte 0x08    ; $2bb0 08      
   add m         ; $2bb1 86      
   .byte 0x20    ; $2bb2 20      
   sbb a         ; $2bb3 9f      
   ldax b        ; $2bb4 0a      
   sbb l         ; $2bb5 9d      
   dad b         ; $2bb6 09      
   sbb a         ; $2bb7 9f      
   ldax b        ; $2bb8 0a      
   add m         ; $2bb9 86      
   .byte 0x20    ; $2bba 20      
   add m         ; $2bbb 86      
   .byte 0x20    ; $2bbc 20      
   add m         ; $2bbd 86      
   .byte 0x20    ; $2bbe 20      
   add m         ; $2bbf 86      
   .byte 0x20    ; $2bc0 20      
   stax b        ; $2bc1 02      
   lhld $2a70    ; $2bc2 2a 70 2a
   mov h,e       ; $2bc5 63      
   dcx b         ; $2bc6 0b      
   sbb c         ; $2bc7 99      
   dcx h         ; $2bc8 2b      
   dcr d         ; $2bc9 15      
   inx b         ; $2bca 03      
   dcr b         ; $2bcb 05      
   mov b,m       ; $2bcc 46      
   mov c,h       ; $2bcd 4c      
   mov d,l       ; $2bce 55      
   mov d,e       ; $2bcf 53      
   mov c,b       ; $2bd0 48      
   mov a,a       ; $2bd1 7f      
   dcx h         ; $2bd2 2b      
   call $02e4    ; $2bd3 cd e4 02
   adc m         ; $2bd6 8e      
   dcx h         ; $2bd7 2b      
   mov c,b       ; $2bd8 48      
   dcx h         ; $2bd9 2b      
   dcr d         ; $2bda 15      
   inx b         ; $2bdb 03      
   mvi b,$55     ; $2bdc 06 55   
   mov d,b       ; $2bde 50      
   mov b,h       ; $2bdf 44      
   mov b,c       ; $2be0 41      
   mov d,h       ; $2be1 54      
   mov b,l       ; $2be2 45      
   .byte 0xcb    ; $2be3 cb      
   dcx h         ; $2be4 2b      
   call $02e4    ; $2be5 cd e4 02
   ora d         ; $2be8 b2      
   lhld $0984    ; $2be9 2a 84 09
   out $03       ; $2bec d3 03   
   add h         ; $2bee 84      
   dad b         ; $2bef 09      
   dcx h         ; $2bf0 2b      
   ldax b        ; $2bf1 0a      
   nop           ; $2bf2 00      
   add b         ; $2bf3 80      
   .byte 0xd9    ; $2bf4 d9      
   .byte 0x08    ; $2bf5 08      
   adc l         ; $2bf6 8d      
   inx b         ; $2bf7 03      
   sbb l         ; $2bf8 9d      
   dad b         ; $2bf9 09      
   dcr d         ; $2bfa 15      
   inx b         ; $2bfb 03      
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
   mvi b,$42     ; $2cbf 06 42   
   mov d,l       ; $2cc1 55      
   mov b,m       ; $2cc2 46      
   mov b,m       ; $2cc3 46      
   mov b,l       ; $2cc4 45      
   mov d,d       ; $2cc5 52      
   cc $cd2b      ; $2cc6 dc 2b cd
   cpo $d302     ; $2cc9 e4 02 d3
   inx b         ; $2ccc 03      
   dcr e         ; $2ccd 1d      
   inr l         ; $2cce 2c      
   mov a,d       ; $2ccf 7a      
   ldax b        ; $2cd0 0a      
   .byte 0xd9    ; $2cd1 d9      
   inr l         ; $2cd2 2c      
   .byte 0x10    ; $2cd3 10      
   inr b         ; $2cd4 04      
   mov l,b       ; $2cd5 68      
   ldax b        ; $2cd6 0a      
   rst 4         ; $2cd7 e7      
   inr l         ; $2cd8 2c      
   cmp l         ; $2cd9 bd      
   lhld $0984    ; $2cda 2a 84 09
   out $03       ; $2cdd d3 03   
   mov a,l       ; $2cdf 7d      
   inr l         ; $2ce0 2c      
   adc l         ; $2ce1 8d      
   inx b         ; $2ce2 03      
   mov h,d       ; $2ce3 62      
   inx b         ; $2ce4 03      
   sbb l         ; $2ce5 9d      
   dad b         ; $2ce6 09      
   out $03       ; $2ce7 d3 03   
   ora d         ; $2ce9 b2      
   lhld $099d    ; $2cea 2a 9d 09
   mov l,b       ; $2ced 68      
   inr l         ; $2cee 2c      
   mov c,h       ; $2cef 4c      
   lhld $044a    ; $2cf0 2a 4a 04
   dcr d         ; $2cf3 15      
   inx b         ; $2cf4 03      
   dcr b         ; $2cf5 05      
   mov b,d       ; $2cf6 42      
   mov c,h       ; $2cf7 4c      
   mov c,a       ; $2cf8 4f      
   mov b,e       ; $2cf9 43      
   mov c,e       ; $2cfa 4b      
   cmp a         ; $2cfb bf      
   inr l         ; $2cfc 2c      
   call $02e4    ; $2cfd cd e4 02
   out $03       ; $2d00 d3 03   
   dcr e         ; $2d02 1d      
   inr l         ; $2d03 2c      
   mov a,d       ; $2d04 7a      
   ldax b        ; $2d05 0a      
   mvi c,$2d     ; $2d06 0e 2d   
   .byte 0x10    ; $2d08 10      
   inr b         ; $2d09 04      
   mov l,b       ; $2d0a 68      
   ldax b        ; $2d0b 0a      
   lhld $bd2d    ; $2d0c 2a 2d bd
   lhld $0984    ; $2d0f 2a 84 09
   out $03       ; $2d12 d3 03   
   mov a,l       ; $2d14 7d      
   inr l         ; $2d15 2c      
   adc l         ; $2d16 8d      
   inx b         ; $2d17 03      
   mov h,d       ; $2d18 62      
   inx b         ; $2d19 03      
   sbb l         ; $2d1a 9d      
   dad b         ; $2d1b 09      
   out $03       ; $2d1c d3 03   
   add m         ; $2d1e 86      
   .byte 0x20    ; $2d1f 20      
   add m         ; $2d20 86      
   .byte 0x20    ; $2d21 20      
   mov h,d       ; $2d22 62      
   inx b         ; $2d23 03      
   add h         ; $2d24 84      
   dad b         ; $2d25 09      
   add m         ; $2d26 86      
   .byte 0x20    ; $2d27 20      
   mov e,c       ; $2d28 59      
   mvi l,$d3     ; $2d29 2e d3   
   inx b         ; $2d2b 03      
   ora d         ; $2d2c b2      
   lhld $099d    ; $2d2d 2a 9d 09
   mov l,b       ; $2d30 68      
   inr l         ; $2d31 2c      
   mov c,h       ; $2d32 4c      
   lhld $044a    ; $2d33 2a 4a 04
   dcr d         ; $2d36 15      
   inx b         ; $2d37 03      
   inr b         ; $2d38 04      
   mov c,h       ; $2d39 4c      
   mov c,c       ; $2d3a 49      
   mov d,e       ; $2d3b 53      
   mov d,h       ; $2d3c 54      
   push psw      ; $2d3d f5      
   inr l         ; $2d3e 2c      
   call $02e4    ; $2d3f cd e4 02
   out $03       ; $2d42 d3 03   
   sui $2a       ; $2d44 d6 2a   
   sbb l         ; $2d46 9d      
   dad b         ; $2d47 09      
   out $03       ; $2d48 d3 03   
   mov h,m       ; $2d4a 66      
   dcr d         ; $2d4b 15      
   mvi a,$18     ; $2d4c 3e 18   
   dad b         ; $2d4e 09      
   .byte 0x20    ; $2d4f 20      
   cm $504b      ; $2d50 fc 4b 50
   mov b,c       ; $2d53 41      
   mov c,b       ; $2d54 48      
   .byte 0x20    ; $2d55 20      
   inx h         ; $2d56 23      
   .byte 0x20    ; $2d57 20      
   cpi $12       ; $2d58 fe 12   
   .byte 0xfd    ; $2d5a fd      
   inr l         ; $2d5b 2c      
   dcx h         ; $2d5c 2b      
   ldax b        ; $2d5d 0a      
   .byte 0x10    ; $2d5e 10      
   nop           ; $2d5f 00      
   rz            ; $2d60 c8      
   mvi c,$e5     ; $2d61 0e e5   
   ldax b        ; $2d63 0a      
   add m         ; $2d64 86      
   dcr l         ; $2d65 2d      
   mov h,m       ; $2d66 66      
   dcr d         ; $2d67 15      
   sbb a         ; $2d68 9f      
   ldax b        ; $2d69 0a      
   jc $ab0e      ; $2d6a da 0e ab
   stax d        ; $2d6d 12      
   cnz $c416     ; $2d6e c4 16 c4
   mvi d,$d3     ; $2d71 16 d3   
   inx b         ; $2d73 03      
   dcx h         ; $2d74 2b      
   ldax b        ; $2d75 0a      
   mov b,b       ; $2d76 40      
   nop           ; $2d77 00      
   mov a,m       ; $2d78 7e      
   dcr d         ; $2d79 15      
   dcx h         ; $2d7a 2b      
   ldax b        ; $2d7b 0a      
   mov b,b       ; $2d7c 40      
   nop           ; $2d7d 00      
   mov c,d       ; $2d7e 4a      
   inr b         ; $2d7f 04      
   dcr m         ; $2d80 35      
   rar           ; $2d81 1f      
   mvi l,$0b     ; $2d82 2e 0b   
   mov h,m       ; $2d84 66      
   dcr l         ; $2d85 2d      
   add d         ; $2d86 82      
   inx b         ; $2d87 03      
   dcr d         ; $2d88 15      
   inx b         ; $2d89 03      
   inr b         ; $2d8a 04      
   mov c,h       ; $2d8b 4c      
   mov c,a       ; $2d8c 4f      
   mov b,c       ; $2d8d 41      
   mov b,h       ; $2d8e 44      
   .byte 0x38    ; $2d8f 38      
   dcr l         ; $2d90 2d      
   call $02e4    ; $2d91 cd e4 02
   rpo           ; $2d94 e0      
   inx b         ; $2d95 03      
   sub b         ; $2d96 90      
   ldax b        ; $2d97 0a      
   ora c         ; $2d98 b1      
   dcr l         ; $2d99 2d      
   mov h,m       ; $2d9a 66      
   dcr d         ; $2d9b 15      
   mvi a,$18     ; $2d9c 3e 18   
   .byte 0x10    ; $2d9e 10      
   jm $e741      ; $2d9f fa 41 e7
   mov d,b       ; $2da2 50      
   push psw      ; $2da3 f5      
   jm $414b      ; $2da4 fa 4b 41
   .byte 0x20    ; $2da7 20      
   jpo $4fec     ; $2da8 e2 ec 4f
   mov c,e       ; $2dab 4b      
   mov b,c       ; $2dac 41      
   .byte 0x20    ; $2dad 20      
   .byte 0x30    ; $2dae 30      
   push d        ; $2daf d5      
   .byte 0x10    ; $2db0 10      
   mov l,e       ; $2db1 6b      
   stax b        ; $2db2 02      
   add h         ; $2db3 84      
   dad b         ; $2db4 09      
   dcr c         ; $2db5 0d      
   dad b         ; $2db6 09      
   hlt           ; $2db7 76      
   stax b        ; $2db8 02      
   add h         ; $2db9 84      
   dad b         ; $2dba 09      
   dcr c         ; $2dbb 0d      
   dad b         ; $2dbc 09      
   mov e,a       ; $2dbd 5f      
   stax b        ; $2dbe 02      
   add h         ; $2dbf 84      
   dad b         ; $2dc0 09      
   dcr c         ; $2dc1 0d      
   dad b         ; $2dc2 09      
   ora c         ; $2dc3 b1      
   stax b        ; $2dc4 02      
   add h         ; $2dc5 84      
   dad b         ; $2dc6 09      
   dcr c         ; $2dc7 0d      
   dad b         ; $2dc8 09      
   ora c         ; $2dc9 b1      
   stax b        ; $2dca 02      
   sbb l         ; $2dcb 9d      
   dad b         ; $2dcc 09      
   hlt           ; $2dcd 76      
   stax b        ; $2dce 02      
   cm $6409      ; $2dcf fc 09 64
   lhld $026b    ; $2dd2 2a 6b 02
   sbb l         ; $2dd5 9d      
   dad b         ; $2dd6 09      
   pop b         ; $2dd7 c1      
   dad d         ; $2dd8 19      
   .byte 0x20    ; $2dd9 20      
   dad b         ; $2dda 09      
   ora c         ; $2ddb b1      
   stax b        ; $2ddc 02      
   sbb l         ; $2ddd 9d      
   dad b         ; $2dde 09      
   .byte 0x20    ; $2ddf 20      
   dad b         ; $2de0 09      
   mov e,a       ; $2de1 5f      
   stax b        ; $2de2 02      
   sbb l         ; $2de3 9d      
   dad b         ; $2de4 09      
   .byte 0x20    ; $2de5 20      
   dad b         ; $2de6 09      
   hlt           ; $2de7 76      
   stax b        ; $2de8 02      
   sbb l         ; $2de9 9d      
   dad b         ; $2dea 09      
   .byte 0x20    ; $2deb 20      
   dad b         ; $2dec 09      
   mov l,e       ; $2ded 6b      
   stax b        ; $2dee 02      
   sbb l         ; $2def 9d      
   dad b         ; $2df0 09      
   dcr d         ; $2df1 15      
   inx b         ; $2df2 03      
   add e         ; $2df3 83      
   dcr l         ; $2df4 2d      
   dcr l         ; $2df5 2d      
   mvi a,$8a     ; $2df6 3e 8a   
   dcr l         ; $2df8 2d      
   call $02e4    ; $2df9 cd e4 02
   ora c         ; $2dfc b1      
   stax b        ; $2dfd 02      
   ldax b        ; $2dfe 0a      
   ldax b        ; $2dff 0a      
   hlt           ; $2e00 76      
   stax b        ; $2e01 02      
   cm $1509      ; $2e02 fc 09 15
   inx b         ; $2e05 03      
   inr b         ; $2e06 04      
   mov d,h       ; $2e07 54      
   mov c,b       ; $2e08 48      
   mov d,d       ; $2e09 52      
   mov d,l       ; $2e0a 55      
   di            ; $2e0b f3      
   dcr l         ; $2e0c 2d      
   call $02e4    ; $2e0d cd e4 02
   mov m,a       ; $2e10 77      
   inr b         ; $2e11 04      
   adc l         ; $2e12 8d      
   inx b         ; $2e13 03      
   push h        ; $2e14 e5      
   ldax b        ; $2e15 0a      
   .byte 0x20    ; $2e16 20      
   mvi l,$9f     ; $2e17 2e 9f   
   ldax b        ; $2e19 0a      
   sub c         ; $2e1a 91      
   dcr l         ; $2e1b 2d      
   mvi l,$0b     ; $2e1c 2e 0b   
   .byte 0x18    ; $2e1e 18      
   mvi l,$15     ; $2e1f 2e 15   
   inx b         ; $2e21 03      
   inr b         ; $2e22 04      
   .byte 0x28    ; $2e23 28      
   mov c,c       ; $2e24 49      
   mov c,m       ; $2e25 4e      
   dad h         ; $2e26 29      
   mvi b,$2e     ; $2e27 06 2e   
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
   stax b        ; $2e54 02      
   mov c,c       ; $2e55 49      
   mov c,m       ; $2e56 4e      
   shld $cd2e    ; $2e57 22 2e cd
   cpo $6602     ; $2e5a e4 02 66
   dcr d         ; $2e5d 15      
   mvi a,$18     ; $2e5e 3e 18   
   ldax b        ; $2e60 0a      
   mov l,l       ; $2e61 6d      
   mov l,h       ; $2e62 6c      
   dcr l         ; $2e63 2d      
   dcr l         ; $2e64 2d      
   mvi a,$62     ; $2e65 3e 62   
   mov l,h       ; $2e67 6c      
   mov l,a       ; $2e68 6f      
   mov l,e       ; $2e69 6b      
   .byte 0x20    ; $2e6a 20      
   out $03       ; $2e6b d3 03   
   cpi $12       ; $2e6d fe 12   
   rpo           ; $2e6f e0      
   dad h         ; $2e70 29      
   cnz $9016     ; $2e71 c4 16 90
   ldax b        ; $2e74 0a      
   add e         ; $2e75 83      
   mvi l,$82     ; $2e76 2e 82   
   inx b         ; $2e78 03      
   mov c,h       ; $2e79 4c      
   lhld $044a    ; $2e7a 2a 4a 04
   mov h,h       ; $2e7d 64      
   lhld $16b3    ; $2e7e 2a b3 16
   dcr d         ; $2e81 15      
   inx b         ; $2e82 03      
   mov h,d       ; $2e83 62      
   inx b         ; $2e84 03      
   .byte 0x20    ; $2e85 20      
   dcx h         ; $2e86 2b      
   jpo $642e     ; $2e87 e2 2e 64
   lhld $2a4c    ; $2e8a 2a 4c 2a
   mov c,d       ; $2e8d 4a      
   inr b         ; $2e8e 04      
   sbb c         ; $2e8f 99      
   inr b         ; $2e90 04      
   adc l         ; $2e91 8d      
   inx b         ; $2e92 03      
   dad h         ; $2e93 29      
   mvi l,$f2     ; $2e94 2e f2   
   inx b         ; $2e96 03      
   mov c,d       ; $2e97 4a      
   inr b         ; $2e98 04      
   mvi a,$18     ; $2e99 3e 18   
   dcr b         ; $2e9b 05      
   mov h,d       ; $2e9c 62      
   mov l,h       ; $2e9d 6c      
   mov l,a       ; $2e9e 6f      
   mov l,e       ; $2e9f 6b      
   .byte 0x20    ; $2ea0 20      
   cpi $12       ; $2ea1 fe 12   
   mov a,m       ; $2ea3 7e      
   dcr b         ; $2ea4 05      
   out $03       ; $2ea5 d3 03   
   mov a,d       ; $2ea7 7a      
   ldax b        ; $2ea8 0a      
   pop d         ; $2ea9 d1      
   mvi l,$82     ; $2eaa 2e 82   
   inx b         ; $2eac 03      
   mov h,d       ; $2ead 62      
   inx b         ; $2eae 03      
   cmp a         ; $2eaf bf      
   dad h         ; $2eb0 29      
   mov h,d       ; $2eb1 62      
   inx b         ; $2eb2 03      
   .byte 0x20    ; $2eb3 20      
   dcx h         ; $2eb4 2b      
   add h         ; $2eb5 84      
   dad b         ; $2eb6 09      
   mov h,m       ; $2eb7 66      
   dcr b         ; $2eb8 05      
   .byte 0x10    ; $2eb9 10      
   inr b         ; $2eba 04      
   out $03       ; $2ebb d3 03   
   sub b         ; $2ebd 90      
   ldax b        ; $2ebe 0a      
   pop d         ; $2ebf d1      
   mvi l,$3e     ; $2ec0 2e 3e   
   .byte 0x18    ; $2ec2 18      
   dcr c         ; $2ec3 0d      
   mov l,a       ; $2ec4 6f      
   mov a,e       ; $2ec5 7b      
   mov l,c       ; $2ec6 69      
   mov h,d       ; $2ec7 62      
   mov l,e       ; $2ec8 6b      
   mov h,c       ; $2ec9 61      
   .byte 0x20    ; $2eca 20      
   mov m,a       ; $2ecb 77      
   mov m,a       ; $2ecc 77      
   mov l,a       ; $2ecd 6f      
   mov h,h       ; $2ece 64      
   mov h,c       ; $2ecf 61      
   .byte 0x20    ; $2ed0 20      
   mov a,d       ; $2ed1 7a      
   ldax b        ; $2ed2 0a      
   mov e,h       ; $2ed3 5c      
   mvi l,$03     ; $2ed4 2e 03   
   inr b         ; $2ed6 04      
   dcr d         ; $2ed7 15      
   inx b         ; $2ed8 03      
   call $f806    ; $2ed9 cd 06 f8
   mov l,a       ; $2edc 6f      
   mvi a,$08     ; $2edd 3e 08   
   jmp $f806     ; $2edf c3 06 f8
   call $02e4    ; $2ee2 cd e4 02
   mov h,d       ; $2ee5 62      
   inx b         ; $2ee6 03      
   mov l,d       ; $2ee7 6a      
   inr b         ; $2ee8 04      
   dcr d         ; $2ee9 15      
   inx b         ; $2eea 03      
   mvi l,$02     ; $2eeb 2e 02   
   mvi a,$3d     ; $2eed 3e 3d   
   mov d,h       ; $2eef 54      
   mvi l,$cd     ; $2ef0 2e cd   
   cpo $0f02     ; $2ef2 e4 02 0f
   dcr b         ; $2ef5 05      
   mov a,m       ; $2ef6 7e      
   dcr b         ; $2ef7 05      
   dcr d         ; $2ef8 15      
   inx b         ; $2ef9 03      
   stax b        ; $2efa 02      
   inr a         ; $2efb 3c      
   dcr a         ; $2efc 3d      
   cpe $cd2e     ; $2efd ec 2e cd
   cpo $3302     ; $2f00 e4 02 33
   dcr b         ; $2f03 05      
   mov a,m       ; $2f04 7e      
   dcr b         ; $2f05 05      
   dcr d         ; $2f06 15      
   inx b         ; $2f07 03      
   stax b        ; $2f08 02      
   mov d,l       ; $2f09 55      
   mvi a,$fa     ; $2f0a 3e fa   
   mvi l,$cd     ; $2f0c 2e cd   
   cpo $8d02     ; $2f0e e4 02 8d
   inx b         ; $2f11 03      
   jm $1504      ; $2f12 fa 04 15
   inx b         ; $2f15 03      
   dcr b         ; $2f16 05      
   mov b,e       ; $2f17 43      
   mov b,c       ; $2f18 41      
   mov d,e       ; $2f19 53      
   mov b,l       ; $2f1a 45      
   lda $2f08     ; $2f1b 3a 08 2f
   call $02e4    ; $2f1e cd e4 02
   rm            ; $2f21 f8      
   dcx d         ; $2f22 1b      
   lxi h,$601a   ; $2f23 21 1a 60
   ral           ; $2f26 17      
   mov a,m       ; $2f27 7e      
   ral           ; $2f28 17      
   mov a,l       ; $2f29 7d      
   ldax d        ; $2f2a 1a      
   call $02e4    ; $2f2b cd e4 02
   adc l         ; $2f2e 8d      
   inx b         ; $2f2f 03      
   ana l         ; $2f30 a5      
   inr b         ; $2f31 04      
   mov c,d       ; $2f32 4a      
   inr b         ; $2f33 04      
   in $1a        ; $2f34 db 1a   
   dcr d         ; $2f36 15      
   inx b         ; $2f37 03      
   add l         ; $2f38 85      
   dcx sp        ; $2f39 3b      
   mov b,e       ; $2f3a 43      
   mov b,c       ; $2f3b 41      
   mov d,e       ; $2f3c 53      
   mov b,l       ; $2f3d 45      
   mvi d,$2f     ; $2f3e 16 2f   
   call $02e4    ; $2f40 cd e4 02
   cmp a         ; $2f43 bf      
   mvi c,$1d     ; $2f44 0e 1d   
   rrc           ; $2f46 0f      
   ana a         ; $2f47 a7      
   inr e         ; $2f48 1c      
   dcr d         ; $2f49 15      
   inx b         ; $2f4a 03      
   inx b         ; $2f4b 03      
   mov b,e       ; $2f4c 43      
   mov d,l       ; $2f4d 55      
   mov d,d       ; $2f4e 52      
   .byte 0x38    ; $2f4f 38      
   cma           ; $2f50 2f      
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
   inx b         ; $2f70 03      
   mov b,e       ; $2f71 43      
   mov c,h       ; $2f72 4c      
   mov d,e       ; $2f73 53      
   mov c,e       ; $2f74 4b      
   cma           ; $2f75 2f      
   push b        ; $2f76 c5      
   mvi c,$1f     ; $2f77 0e 1f   
   call $f809    ; $2f79 cd 09 f8
   pop b         ; $2f7c c1      
   jmp $02ef     ; $2f7d c3 ef 02
   inr b         ; $2f80 04      
   mov b,d       ; $2f81 42      
   mov b,l       ; $2f82 45      
   mov b,l       ; $2f83 45      
   mov d,b       ; $2f84 50      
   mov m,b       ; $2f85 70      
   cma           ; $2f86 2f      
   call $02e4    ; $2f87 cd e4 02
   dcx h         ; $2f8a 2b      
   ldax b        ; $2f8b 0a      
   inr b         ; $2f8c 04      
   nop           ; $2f8d 00      
   rz            ; $2f8e c8      
   mvi c,$e5     ; $2f8f 0e e5   
   ldax b        ; $2f91 0a      
   sbb m         ; $2f92 9e      
   cma           ; $2f93 2f      
   dcx h         ; $2f94 2b      
   ldax b        ; $2f95 0a      
   rlc           ; $2f96 07      
   nop           ; $2f97 00      
   dcr a         ; $2f98 3d      
   dcr d         ; $2f99 15      
   mvi l,$0b     ; $2f9a 2e 0b   
   sub h         ; $2f9c 94      
   cma           ; $2f9d 2f      
   dcr d         ; $2f9e 15      
   inx b         ; $2f9f 03      
   stax b        ; $2fa0 02      
   mov b,m       ; $2fa1 46      
   mov e,m       ; $2fa2 5e      
   add b         ; $2fa3 80      
   cma           ; $2fa4 2f      
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
   inr b         ; $2fbb 04      
   .byte 0x28    ; $2fbc 28      
   mov b,c       ; $2fbd 41      
   mov d,h       ; $2fbe 54      
   dad h         ; $2fbf 29      
   ana b         ; $2fc0 a0      
   cma           ; $2fc1 2f      
   pop h         ; $2fc2 e1      
   lxi d,$fff8   ; $2fc3 11 f8 ff
   dad d         ; $2fc6 19      
   push h        ; $2fc7 e5      
   jmp $02ef     ; $2fc8 c3 ef 02
   add d         ; $2fcb 82      
   mov b,c       ; $2fcc 41      
   mov d,h       ; $2fcd 54      
   cmp e         ; $2fce bb      
   cma           ; $2fcf 2f      
   call $02e4    ; $2fd0 cd e4 02
   ana m         ; $2fd3 a6      
   mvi d,$ed     ; $2fd4 16 ed   
   inx d         ; $2fd6 13      
   sub b         ; $2fd7 90      
   ral           ; $2fd8 17      
   rpo           ; $2fd9 e0      
   inx b         ; $2fda 03      
   mov a,m       ; $2fdb 7e      
   dcr b         ; $2fdc 05      
   mov c,d       ; $2fdd 4a      
   lxi d,$2d02   ; $2fde 11 02 2d
   cmc           ; $2fe1 3f      
   dcr a         ; $2fe2 3d      
   dcr b         ; $2fe3 05      
   dcr d         ; $2fe4 15      
   stax b        ; $2fe5 02      
   add h         ; $2fe6 84      
   dad b         ; $2fe7 09      
   rz            ; $2fe8 c8      
   .byte 0x08    ; $2fe9 08      
   mov a,d       ; $2fea 7a      
   ldax b        ; $2feb 0a      
   rm            ; $2fec f8      
   cma           ; $2fed 2f      
   dcx h         ; $2fee 2b      
   ldax b        ; $2fef 0a      
   .byte 0x08    ; $2ff0 08      
   nop           ; $2ff1 00      
   mov c,d       ; $2ff2 4a      
   inr b         ; $2ff3 04      
   dcr e         ; $2ff4 1d      
   rrc           ; $2ff5 0f      
   dcr d         ; $2ff6 15      
   inx b         ; $2ff7 03      
   dcx h         ; $2ff8 2b      
   ldax b        ; $2ff9 0a      
   .byte 0x08    ; $2ffa 08      
   nop           ; $2ffb 00      
   mov c,d       ; $2ffc 4a      
   inr b         ; $2ffd 04      
   inr l         ; $2ffe 2c      
   inx b         ; $2fff 03      
   dcr d         ; $3000 15      
   inx b         ; $3001 03      
   .byte 0x08    ; $3002 08      
   mov d,c       ; $3003 51      
   mov d,l       ; $3004 55      
   mov b,c       ; $3005 41      
   mov c,m       ; $3006 4e      
   dcx h         ; $3007 2b      
   mov d,m       ; $3008 56      
   mov b,c       ; $3009 41      
   mov d,d       ; $300a 52      
   .byte 0xcb    ; $300b cb      
   cma           ; $300c 2f      
   call $02e4    ; $300d cd e4 02
   rpe           ; $3010 e8      
   ldax d        ; $3011 1a      
   dcx h         ; $3012 2b      
   ldax b        ; $3013 0a      
   call $2f00    ; $3014 cd 00 2f
   rrc           ; $3017 0f      
   dcx h         ; $3018 2b      
   ldax b        ; $3019 0a      
   jnz $1d2f     ; $301a c2 2f 1d
   rrc           ; $301d 0f      
   dcr d         ; $301e 15      
   inx b         ; $301f 03      
   stax b        ; $3020 02      
   sta $025e     ; $3021 32 5e 02
   .byte 0x30    ; $3024 30      
   call $02e4    ; $3025 cd e4 02
   dcx h         ; $3028 2b      
   ldax b        ; $3029 0a      
   rlc           ; $302a 07      
   nop           ; $302b 00      
   mov d,l       ; $302c 55      
   inr b         ; $302d 04      
   ora l         ; $302e b5      
   dad b         ; $302f 09      
   dcr d         ; $3030 15      
   inx b         ; $3031 03      
   lxi b,$207c   ; $3032 01 7c 20
   .byte 0x30    ; $3035 30      
   call $0984    ; $3036 cd 84 09
   jnz $0177     ; $3039 c2 77 01
   mov c,h       ; $303c 4c      
   .byte 0x20    ; $303d 20      
   .byte 0x30    ; $303e 30      
   call $0984    ; $303f cd 84 09
   mov c,m       ; $3042 4e      
   nop           ; $3043 00      
   lxi b,$2058   ; $3044 01 58 20
   .byte 0x30    ; $3047 30      
   call $0984    ; $3048 cd 84 09
   nop           ; $304b 00      
   nop           ; $304c 00      
   call $1ac4    ; $304d cd c4 1a
   lxi b,$4459   ; $3050 01 59 44
   .byte 0x30    ; $3053 30      
   call $0984    ; $3054 cd 84 09
   nop           ; $3057 00      
   nop           ; $3058 00      
   call $1ac4    ; $3059 cd c4 1a
   lxi b,$5041   ; $305c 01 41 50
   .byte 0x30    ; $305f 30      
   call $0984    ; $3060 cd 84 09
   nop           ; $3063 00      
   nop           ; $3064 00      
   call $1ac4    ; $3065 cd c4 1a
   lxi b,$5054   ; $3068 01 54 50
   .byte 0x30    ; $306b 30      
   call $0984    ; $306c cd 84 09
   rst 7         ; $306f ff      
   rst 7         ; $3070 ff      
   call $1ac4    ; $3071 cd c4 1a
   inx b         ; $3074 03      
   mov d,b       ; $3075 50      
   mov b,l       ; $3076 45      
   mov c,m       ; $3077 4e      
   mov d,b       ; $3078 50      
   .byte 0x30    ; $3079 30      
   call $02e4    ; $307a cd e4 02
   ani $0e       ; $307d e6 0e   
   mov m,c       ; $307f 71      
   .byte 0x30    ; $3080 30      
   dcr d         ; $3081 15      
   inx b         ; $3082 03      
   inx b         ; $3083 03      
   mov b,a       ; $3084 47      
   mov d,l       ; $3085 55      
   mov c,l       ; $3086 4d      
   mov m,h       ; $3087 74      
   .byte 0x30    ; $3088 30      
   call $02e4    ; $3089 cd e4 02
   di            ; $308c f3      
   mvi c,$71     ; $308d 0e 71   
   .byte 0x30    ; $308f 30      
   dcr d         ; $3090 15      
   inx b         ; $3091 03      
   lxi b,$8347   ; $3092 01 47 83
   .byte 0x30    ; $3095 30      
   call $02e4    ; $3096 cd e4 02
   cmp l         ; $3099 bd      
   dcr b         ; $309a 05      
   cmc           ; $309b 3f      
   .byte 0x30    ; $309c 30      
   sbb e         ; $309d 9b      
   mvi b,$36     ; $309e 06 36   
   .byte 0x30    ; $30a0 30      
   mov c,d       ; $30a1 4a      
   inr b         ; $30a2 04      
   adc l         ; $30a3 8d      
   inx b         ; $30a4 03      
   cmp l         ; $30a5 bd      
   dcr b         ; $30a6 05      
   mov c,d       ; $30a7 4a      
   inr b         ; $30a8 04      
   dcr d         ; $30a9 15      
   inx b         ; $30aa 03      
   stax b        ; $30ab 02      
   cmc           ; $30ac 3f      
   mov d,e       ; $30ad 53      
   add e         ; $30ae 83      
   .byte 0x30    ; $30af 30      
   pop h         ; $30b0 e1      
   pop d         ; $30b1 d1      
   mov a,e       ; $30b2 7b      
   ora a         ; $30b3 b7      
   jnz $30c2     ; $30b4 c2 c2 30
   mov a,h       ; $30b7 7c      
   ora a         ; $30b8 b7      
   push d        ; $30b9 d5      
   jm $02ef      ; $30ba fa ef 02
   pop d         ; $30bd d1      
   push h        ; $30be e5      
   jmp $02ef     ; $30bf c3 ef 02
   mov a,h       ; $30c2 7c      
   ora a         ; $30c3 b7      
   push h        ; $30c4 e5      
   jm $02ef      ; $30c5 fa ef 02
   pop h         ; $30c8 e1      
   lxi d,$0000   ; $30c9 11 00 00
   push d        ; $30cc d5      
   jmp $02ef     ; $30cd c3 ef 02
   lxi b,$8379   ; $30d0 01 79 83
   .byte 0x30    ; $30d3 30      
   pop d         ; $30d4 d1      
   mov a,e       ; $30d5 7b      
   ani $01       ; $30d6 e6 01   
   jnz $30e2     ; $30d8 c2 e2 30
   lxi d,$0000   ; $30db 11 00 00
   push d        ; $30de d5      
   jmp $02ef     ; $30df c3 ef 02
   lxi d,$ffff   ; $30e2 11 ff ff
   push d        ; $30e5 d5      
   jmp $02ef     ; $30e6 c3 ef 02
   stax b        ; $30e9 02      
   dcx h         ; $30ea 2b      
   mov m,b       ; $30eb 70      
   add e         ; $30ec 83      
   .byte 0x30    ; $30ed 30      
   lda $304b     ; $30ee 3a 4b 30
   ana a         ; $30f1 a7      
   jnz $3106     ; $30f2 c2 06 31
   lda $3057     ; $30f5 3a 57 30
   ana a         ; $30f8 a7      
   jnz $3101     ; $30f9 c2 01 31
   mvi h,$01     ; $30fc 26 01   
   jmp $3103     ; $30fe c3 03 31
   mvi h,$10     ; $3101 26 10   
   jmp $3114     ; $3103 c3 14 31
   lda $3057     ; $3106 3a 57 30
   ana a         ; $3109 a7      
   jnz $3112     ; $310a c2 12 31
   mvi h,$02     ; $310d 26 02   
   jmp $3114     ; $310f c3 14 31
   mvi h,$04     ; $3112 26 04   
   pop d         ; $3114 d1      
   ldax d        ; $3115 1a      
   ora h         ; $3116 b4      
   stax d        ; $3117 12      
   jmp $02ef     ; $3118 c3 ef 02
   stax b        ; $311b 02      
   dcr l         ; $311c 2d      
   mov m,b       ; $311d 70      
   add e         ; $311e 83      
   .byte 0x30    ; $311f 30      
   lda $304b     ; $3120 3a 4b 30
   ana a         ; $3123 a7      
   jnz $3138     ; $3124 c2 38 31
   lda $3057     ; $3127 3a 57 30
   ana a         ; $312a a7      
   jnz $3133     ; $312b c2 33 31
   mvi h,$fe     ; $312e 26 fe   
   jmp $3135     ; $3130 c3 35 31
   mvi h,$ef     ; $3133 26 ef   
   jmp $3146     ; $3135 c3 46 31
   lda $3057     ; $3138 3a 57 30
   ana a         ; $313b a7      
   jnz $3144     ; $313c c2 44 31
   mvi h,$fd     ; $313f 26 fd   
   jmp $3146     ; $3141 c3 46 31
   mvi h,$fb     ; $3144 26 fb   
   pop d         ; $3146 d1      
   ldax d        ; $3147 1a      
   ana h         ; $3148 a4      
   stax d        ; $3149 12      
   jmp $02ef     ; $314a c3 ef 02
   lxi b,$8370   ; $314d 01 70 83
   .byte 0x30    ; $3150 30      
   lda $306f     ; $3151 3a 6f 30
   ora a         ; $3154 b7      
   jnz $30ee     ; $3155 c2 ee 30
   jmp $3120     ; $3158 c3 20 31
   lxi b,$8357   ; $315b 01 57 83
   .byte 0x30    ; $315e 30      
   call $0984    ; $315f cd 84 09
   nop           ; $3162 00      
   nop           ; $3163 00      
   call $1ac4    ; $3164 cd c4 1a
   lxi b,$8362   ; $3167 01 62 83
   .byte 0x30    ; $316a 30      
   call $0984    ; $316b cd 84 09
   nop           ; $316e 00      
   nop           ; $316f 00      
   call $1ac4    ; $3170 cd c4 1a
   lxi b,$8367   ; $3173 01 67 83
   .byte 0x30    ; $3176 30      
   call $0984    ; $3177 cd 84 09
   nop           ; $317a 00      
   nop           ; $317b 00      
   call $1ac4    ; $317c cd c4 1a
   lxi b,$8364   ; $317f 01 64 83
   .byte 0x30    ; $3182 30      
   call $0984    ; $3183 cd 84 09
   nop           ; $3186 00      
   nop           ; $3187 00      
   call $1ac4    ; $3188 cd c4 1a
   lxi b,$8376   ; $318b 01 76 83
   .byte 0x30    ; $318e 30      
   call $0984    ; $318f cd 84 09
   nop           ; $3192 00      
   nop           ; $3193 00      
   call $1ac4    ; $3194 cd c4 1a
   stax b        ; $3197 02      
   inr h         ; $3198 24      
   lxi sp,$3083  ; $3199 31 83 30
   call $0984    ; $319c cd 84 09
   ldax d        ; $319f 1a      
   sta $c4cd     ; $31a0 32 cd c4
   ldax d        ; $31a3 1a      
   stax b        ; $31a4 02      
   inr h         ; $31a5 24      
   sta $3083     ; $31a6 32 83 30
   call $0984    ; $31a9 cd 84 09
   .byte 0x20    ; $31ac 20      
   sta $c4cd     ; $31ad 32 cd c4
   ldax d        ; $31b0 1a      
   stax b        ; $31b1 02      
   inr h         ; $31b2 24      
   inr m         ; $31b3 34      
   add e         ; $31b4 83      
   .byte 0x30    ; $31b5 30      
   call $0984    ; $31b6 cd 84 09
   lda $cd32     ; $31b9 3a 32 cd
   cnz $021a     ; $31bc c4 1a 02
   inr h         ; $31bf 24      
   dcr m         ; $31c0 35      
   add e         ; $31c1 83      
   .byte 0x30    ; $31c2 30      
   call $0984    ; $31c3 cd 84 09
   mov b,b       ; $31c6 40      
   sta $c4cd     ; $31c7 32 cd c4
   ldax d        ; $31ca 1a      
   stax b        ; $31cb 02      
   mov b,h       ; $31cc 44      
   mov e,b       ; $31cd 58      
   add e         ; $31ce 83      
   .byte 0x30    ; $31cf 30      
   call $0984    ; $31d0 cd 84 09
   nop           ; $31d3 00      
   nop           ; $31d4 00      
   call $1ac4    ; $31d5 cd c4 1a
   stax b        ; $31d8 02      
   mov b,h       ; $31d9 44      
   mov e,c       ; $31da 59      
   add e         ; $31db 83      
   .byte 0x30    ; $31dc 30      
   call $0984    ; $31dd cd 84 09
   nop           ; $31e0 00      
   nop           ; $31e1 00      
   call $1ac4    ; $31e2 cd c4 1a
   lxi b,$8369   ; $31e5 01 69 83
   .byte 0x30    ; $31e8 30      
   call $0984    ; $31e9 cd 84 09
   nop           ; $31ec 00      
   nop           ; $31ed 00      
   call $1ac4    ; $31ee cd c4 1a
   lxi b,$836a   ; $31f1 01 6a 83
   .byte 0x30    ; $31f4 30      
   call $0984    ; $31f5 cd 84 09
   nop           ; $31f8 00      
   nop           ; $31f9 00      
   call $1ac4    ; $31fa cd c4 1a
   lxi b,$836c   ; $31fd 01 6c 83
   .byte 0x30    ; $3200 30      
   call $02e4    ; $3201 cd e4 02
   rz            ; $3204 c8      
   mvi c,$64     ; $3205 0e 64   
   lxi sp,$316b  ; $3207 31 6b 31
   cmp a         ; $320a bf      
   mvi c,$e5     ; $320b 0e e5   
   ldax b        ; $320d 0a      
   mov e,d       ; $320e 5a      
   sta $315f     ; $320f 32 5f 31
   mov l,e       ; $3212 6b      
   lxi sp,$050f  ; $3213 31 0f 05
   sub b         ; $3216 90      
   ldax b        ; $3217 0a      
   mvi m,$32     ; $3218 36 32   
   nop           ; $321a 00      
   nop           ; $321b 00      
   .byte 0xfd    ; $321c fd      
   .byte 0x08    ; $321d 08      
   out $03       ; $321e d3 03   
   nop           ; $3220 00      
   nop           ; $3221 00      
   mov h,b       ; $3222 60      
   .byte 0x30    ; $3223 30      
   adc l         ; $3224 8d      
   inx b         ; $3225 03      
   add e         ; $3226 83      
   lxi sp,$30b0  ; $3227 31 b0 30
   mov c,d       ; $322a 4a      
   inr b         ; $322b 04      
   mov h,l       ; $322c 65      
   .byte 0x30    ; $322d 30      
   mov e,a       ; $322e 5f      
   lxi sp,$316b  ; $322f 31 6b 31
   mov d,l       ; $3232 55      
   inr b         ; $3233 04      
   mov h,h       ; $3234 64      
   lxi sp,$3060  ; $3235 31 60 30
   mov d,c       ; $3238 51      
   lxi sp,$0000  ; $3239 31 00 00
   .byte 0xfd    ; $323c fd      
   .byte 0x08    ; $323d 08      
   out $03       ; $323e d3 03   
   nop           ; $3240 00      
   nop           ; $3241 00      
   mov h,b       ; $3242 60      
   .byte 0x30    ; $3243 30      
   adc l         ; $3244 8d      
   inx b         ; $3245 03      
   adc a         ; $3246 8f      
   lxi sp,$30b0  ; $3247 31 b0 30
   mov c,d       ; $324a 4a      
   inr b         ; $324b 04      
   mov h,l       ; $324c 65      
   .byte 0x30    ; $324d 30      
   mov e,a       ; $324e 5f      
   lxi sp,$3177  ; $324f 31 77 31
   mov c,d       ; $3252 4a      
   inr b         ; $3253 04      
   mov h,h       ; $3254 64      
   lxi sp,$0b2e  ; $3255 31 2e 0b
   .byte 0x10    ; $3258 10      
   sta $0315     ; $3259 32 15 03
   inr b         ; $325c 04      
   mov c,h       ; $325d 4c      
   mov c,c       ; $325e 49      
   mov c,m       ; $325f 4e      
   mov b,l       ; $3260 45      
   add e         ; $3261 83      
   .byte 0x30    ; $3262 30      
   call $02e4    ; $3263 cd e4 02
   jp $2b03      ; $3266 f2 03 2b
   ldax b        ; $3269 0a      
   sta $fa00     ; $326a 32 00 fa
   inr b         ; $326d 04      
   adc l         ; $326e 8d      
   inx b         ; $326f 03      
   dcx h         ; $3270 2b      
   ldax b        ; $3271 0a      
   add b         ; $3272 80      
   nop           ; $3273 00      
   jm $c804      ; $3274 fa 04 c8
   .byte 0x08    ; $3277 08      
   .byte 0xfd    ; $3278 fd      
   .byte 0x08    ; $3279 08      
   mov c,d       ; $327a 4a      
   lxi d,$2d17   ; $327b 11 17 2d
   mov l,m       ; $327e 6e      
   mov h,l       ; $327f 65      
   mov m,a       ; $3280 77      
   mov h,l       ; $3281 65      
   mov m,d       ; $3282 72      
   mov l,m       ; $3283 6e      
   mov a,c       ; $3284 79      
   mov l,d       ; $3285 6a      
   .byte 0x20    ; $3286 20      
   mov h,c       ; $3287 61      
   mov m,d       ; $3288 72      
   mov h,a       ; $3289 67      
   mov m,l       ; $328a 75      
   mov l,l       ; $328b 6d      
   mov h,l       ; $328c 65      
   mov l,m       ; $328d 6e      
   mov m,h       ; $328e 74      
   .byte 0x20    ; $328f 20      
   mov c,h       ; $3290 4c      
   mov c,c       ; $3291 49      
   mov c,m       ; $3292 4e      
   mov b,l       ; $3293 45      
   jp $4803      ; $3294 f2 03 48
   .byte 0x30    ; $3297 30      
   mov d,h       ; $3298 54      
   .byte 0x30    ; $3299 30      
   sub m         ; $329a 96      
   .byte 0x30    ; $329b 30      
   mov h,l       ; $329c 65      
   .byte 0x30    ; $329d 30      
   mov d,h       ; $329e 54      
   .byte 0x30    ; $329f 30      
   mov d,l       ; $32a0 55      
   inr b         ; $32a1 04      
   jpo $4831     ; $32a2 e2 31 48
   .byte 0x30    ; $32a5 30      
   mov d,l       ; $32a6 55      
   inr b         ; $32a7 04      
   push d        ; $32a8 d5      
   lxi sp,$0ed1  ; $32a9 31 d1 0e
   rnc           ; $32ac d0      
   lxi sp,$0550  ; $32ad 31 50 05
   sub b         ; $32b0 90      
   ldax b        ; $32b1 0a      
   ora m         ; $32b2 b6      
   sta $046a     ; $32b3 32 6a 04
   xri $31       ; $32b6 ee 31   
   cmc           ; $32b8 3f      
   .byte 0x30    ; $32b9 30      
   .byte 0xdd    ; $32ba dd      
   lxi sp,$0550  ; $32bb 31 50 05
   sub b         ; $32be 90      
   ldax b        ; $32bf 0a      
   cnz $6a32     ; $32c0 c4 32 6a
   inr b         ; $32c3 04      
   jm $d031      ; $32c4 fa 31 d0
   lxi sp,$04b1  ; $32c7 31 b1 04
   .byte 0xdd    ; $32ca dd      
   lxi sp,$04b1  ; $32cb 31 b1 04
   jp $f203      ; $32ce f2 03 f2
   inx b         ; $32d1 03      
   sbi $04       ; $32d2 de 04   
   mov m,b       ; $32d4 70      
   lxi sp,$04c1  ; $32d5 31 c1 04
   mov a,h       ; $32d8 7c      
   lxi sp,$0533  ; $32d9 31 33 05
   mov a,d       ; $32dc 7a      
   ldax b        ; $32dd 0a      
   .byte 0x10    ; $32de 10      
   inx sp        ; $32df 33      
   dcx h         ; $32e0 2b      
   ldax b        ; $32e1 0a      
   mov d,h       ; $32e2 54      
   .byte 0x30    ; $32e3 30      
   out $03       ; $32e4 d3 03   
   sbb h         ; $32e6 9c      
   lxi sp,$099d  ; $32e7 31 9d 09
   lda $8213     ; $32ea 3a 13 82
   inr b         ; $32ed 04      
   xra c         ; $32ee a9      
   lxi sp,$099d  ; $32ef 31 9d 09
   push psw      ; $32f2 f5      
   lxi sp,$3188  ; $32f3 31 88 31
   dcx h         ; $32f6 2b      
   ldax b        ; $32f7 0a      
   mov c,b       ; $32f8 48      
   .byte 0x30    ; $32f9 30      
   out $03       ; $32fa d3 03   
   ora m         ; $32fc b6      
   lxi sp,$099d  ; $32fd 31 9d 09
   lda $8213     ; $3300 3a 13 82
   inr b         ; $3303 04      
   jmp $9d31     ; $3304 c3 31 9d
   dad b         ; $3307 09      
   pchl          ; $3308 e9      
   lxi sp,$3194  ; $3309 31 94 31
   mov l,b       ; $330c 68      
   ldax b        ; $330d 0a      
   inr a         ; $330e 3c      
   inx sp        ; $330f 33      
   dcx h         ; $3310 2b      
   ldax b        ; $3311 0a      
   mov c,b       ; $3312 48      
   .byte 0x30    ; $3313 30      
   out $03       ; $3314 d3 03   
   sbb h         ; $3316 9c      
   lxi sp,$099d  ; $3317 31 9d 09
   lda $8213     ; $331a 3a 13 82
   inr b         ; $331d 04      
   xra c         ; $331e a9      
   lxi sp,$099d  ; $331f 31 9d 09
   pchl          ; $3322 e9      
   lxi sp,$3188  ; $3323 31 88 31
   dcx h         ; $3326 2b      
   ldax b        ; $3327 0a      
   mov d,h       ; $3328 54      
   .byte 0x30    ; $3329 30      
   out $03       ; $332a d3 03   
   ora m         ; $332c b6      
   lxi sp,$099d  ; $332d 31 9d 09
   lda $8213     ; $3330 3a 13 82
   inr b         ; $3333 04      
   jmp $9d31     ; $3334 c3 31 9d
   dad b         ; $3337 09      
   push psw      ; $3338 f5      
   lxi sp,$3194  ; $3339 31 94 31
   mov c,b       ; $333c 48      
   .byte 0x30    ; $333d 30      
   pop d         ; $333e d1      
   mvi c,$c8     ; $333f 0e c8   
   .byte 0x08    ; $3341 08      
   mov l,d       ; $3342 6a      
   inr b         ; $3343 04      
   mov c,l       ; $3344 4d      
   .byte 0x30    ; $3345 30      
   mov d,h       ; $3346 54      
   .byte 0x30    ; $3347 30      
   pop d         ; $3348 d1      
   mvi c,$c8     ; $3349 0e c8   
   .byte 0x08    ; $334b 08      
   mov l,d       ; $334c 6a      
   inr b         ; $334d 04      
   mov e,c       ; $334e 59      
   .byte 0x30    ; $334f 30      
   lxi b,$5932   ; $3350 01 32 59
   .byte 0x30    ; $3353 30      
   mov c,l       ; $3354 4d      
   .byte 0x30    ; $3355 30      
   dcr d         ; $3356 15      
   inx b         ; $3357 03      
   inr b         ; $3358 04      
   mov d,b       ; $3359 50      
   mov c,h       ; $335a 4c      
   mov c,a       ; $335b 4f      
   mov d,h       ; $335c 54      
   mov e,h       ; $335d 5c      
   sta $e4cd     ; $335e 32 cd e4
   stax b        ; $3361 02      
   jp $2b03      ; $3362 f2 03 2b
   ldax b        ; $3365 0a      
   sta $fa00     ; $3366 32 00 fa
   inr b         ; $3369 04      
   adc l         ; $336a 8d      
   inx b         ; $336b 03      
   dcx h         ; $336c 2b      
   ldax b        ; $336d 0a      
   add b         ; $336e 80      
   nop           ; $336f 00      
   jm $c804      ; $3370 fa 04 c8
   .byte 0x08    ; $3373 08      
   .byte 0xfd    ; $3374 fd      
   .byte 0x08    ; $3375 08      
   mov c,d       ; $3376 4a      
   lxi d,$2d17   ; $3377 11 17 2d
   mov l,m       ; $337a 6e      
   mov h,l       ; $337b 65      
   mov m,a       ; $337c 77      
   mov h,l       ; $337d 65      
   mov m,d       ; $337e 72      
   mov l,m       ; $337f 6e      
   mov a,c       ; $3380 79      
   mov l,d       ; $3381 6a      
   .byte 0x20    ; $3382 20      
   mov h,c       ; $3383 61      
   mov m,d       ; $3384 72      
   mov h,a       ; $3385 67      
   mov m,l       ; $3386 75      
   mov l,l       ; $3387 6d      
   mov h,l       ; $3388 65      
   mov l,m       ; $3389 6e      
   mov m,h       ; $338a 74      
   .byte 0x20    ; $338b 20      
   mov d,b       ; $338c 50      
   mov c,h       ; $338d 4c      
   mov c,a       ; $338e 4f      
   mov d,h       ; $338f 54      
   jp $d403      ; $3390 f2 03 d4
   .byte 0x30    ; $3393 30      
   mov e,c       ; $3394 59      
   .byte 0x30    ; $3395 30      
   cnc $4d30     ; $3396 d4 30 4d
   .byte 0x30    ; $3399 30      
   jp $9603      ; $339a f2 03 96
   .byte 0x30    ; $339d 30      
   mov d,c       ; $339e 51      
   lxi sp,$3059  ; $339f 31 59 30
   mov c,l       ; $33a2 4d      
   .byte 0x30    ; $33a3 30      
   dcr d         ; $33a4 15      
   inx b         ; $33a5 03      
   inx b         ; $33a6 03      
   mov b,d       ; $33a7 42      
   mov e,c       ; $33a8 59      
   mov b,l       ; $33a9 45      
   mov e,b       ; $33aa 58      
   inx sp        ; $33ab 33      
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
   dcr b         ; $3448 05      
   mov b,m       ; $3449 46      
   mov c,a       ; $344a 4f      
   mov d,d       ; $344b 52      
   mov d,h       ; $344c 54      
   mov c,b       ; $344d 48      
   nop           ; $344e 00      
   nop           ; $344f 00      
   call $1b95    ; $3450 cd 95 1b
   lxi b,$8680   ; $3453 01 80 86
   mov b,e       ; $3456 43      
   nop           ; $3457 00      
   nop           ; $3458 00      
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
   dcr b         ; $3639 05      
   mov d,m       ; $363a 56      
   dcr l         ; $363b 2d      
   mov b,c       ; $363c 41      
   mov b,e       ; $363d 43      
   mov d,h       ; $363e 54      
   mov e,b       ; $363f 58      
   inx sp        ; $3640 33      
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
   mvi b,$56     ; $3664 06 56   
   dcr l         ; $3666 2d      
   mov c,h       ; $3667 4c      
   mov c,c       ; $3668 49      
   mov d,e       ; $3669 53      
   mov d,h       ; $366a 54      
   dad sp        ; $366b 39      
   mvi m,$cd     ; $366c 36 cd   
   cpo $e102     ; $366e e4 02 e1
   lxi b,$0984   ; $3671 01 84 09
   rpo           ; $3674 e0      
   inx b         ; $3675 03      
   mov a,d       ; $3676 7a      
   ldax b        ; $3677 0a      
   add b         ; $3678 80      
   mvi m,$41     ; $3679 36 41   
   mvi m,$68     ; $367b 36 68   
   ldax b        ; $367d 0a      
   mov m,d       ; $367e 72      
   mvi m,$15     ; $367f 36 15   
   inx b         ; $3681 03      
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
   inr b         ; $38fd 04      
   mov d,m       ; $38fe 56      
   mov c,a       ; $38ff 4f      
   mov b,e       ; $3900 43      
   mvi l,$64     ; $3901 2e 64   
   mvi m,$cd     ; $3903 36 cd   
   cpo $6602     ; $3905 e4 02 66
   dcr d         ; $3908 15      
   out $03       ; $3909 d3 03   
   sbb c         ; $390b 99      
   inr b         ; $390c 04      
   sbb c         ; $390d 99      
   inr b         ; $390e 04      
   mov c,e       ; $390f 4b      
   inx d         ; $3910 13      
   .byte 0xdd    ; $3911 dd      
   inx d         ; $3912 13      
   mvi a,$18     ; $3913 3e 18   
   rlc           ; $3915 07      
   mov m,e       ; $3916 73      
   mov m,b       ; $3917 70      
   mov l,c       ; $3918 69      
   mov m,e       ; $3919 73      
   mov l,a       ; $391a 6f      
   mov l,e       ; $391b 6b      
   .byte 0x20    ; $391c 20      
   .byte 0xed    ; $391d ed      
   mvi d,$15     ; $391e 16 15   
   inx b         ; $3920 03      
   lxi b,$fd79   ; $3921 01 79 fd
   .byte 0x38    ; $3924 38      
   call $02e4    ; $3925 cd e4 02
   mvi a,$18     ; $3928 3e 18   
   dcr c         ; $392a 0d      
   .byte 0x20    ; $392b 20      
   mov m,a       ; $392c 77      
   mov a,c       ; $392d 79      
   mov h,a       ; $392e 67      
   mov m,d       ; $392f 72      
   mov m,l       ; $3930 75      
   hlt           ; $3931 76      
   mov h,c       ; $3932 61      
   mov h,l       ; $3933 65      
   mov m,h       ; $3934 74      
   mov m,e       ; $3935 73      
   mov m,c       ; $3936 71      
   .byte 0x20    ; $3937 20      
   dcr d         ; $3938 15      
   inx b         ; $3939 03      
   lxi b,$214e   ; $393a 01 4e 21
   dad sp        ; $393d 39      
   call $0984    ; $393e cd 84 09
   nop           ; $3941 00      
   nop           ; $3942 00      
   call $1ac4    ; $3943 cd c4 1a
   lxi b,$3a66   ; $3946 01 66 3a
   dad sp        ; $3949 39      
   call $02e4    ; $394a cd e4 02
   out $03       ; $394d d3 03   
   sbb c         ; $394f 99      
   inr b         ; $3950 04      
   add h         ; $3951 84      
   dad b         ; $3952 09      
   dad d         ; $3953 19      
   mvi m,$fa     ; $3954 36 fa   
   inr b         ; $3956 04      
   mov h,d       ; $3957 62      
   inx b         ; $3958 03      
   dad d         ; $3959 19      
   mvi m,$fa     ; $395a 36 fa   
   inr b         ; $395c 04      
   mov a,d       ; $395d 7a      
   ldax b        ; $395e 0a      
   adc b         ; $395f 88      
   dad sp        ; $3960 39      
   mov a,d       ; $3961 7a      
   ldax b        ; $3962 0a      
   mov m,c       ; $3963 71      
   dad sp        ; $3964 39      
   mvi a,$18     ; $3965 3e 18   
   inx b         ; $3967 03      
   .byte 0x20    ; $3968 20      
   mov l,m       ; $3969 6e      
   mov h,l       ; $396a 65      
   dcr h         ; $396b 25      
   dad sp        ; $396c 39      
   mov l,b       ; $396d 68      
   ldax b        ; $396e 0a      
   add h         ; $396f 84      
   dad sp        ; $3970 39      
   mvi a,$39     ; $3971 3e 39   
   mov m,a       ; $3973 77      
   inr b         ; $3974 04      
   mov b,e       ; $3975 43      
   dad sp        ; $3976 39      
   dcr h         ; $3977 25      
   dad sp        ; $3978 39      
   mvi a,$18     ; $3979 3e 18   
   .byte 0x08    ; $397b 08      
   mov a,m       ; $397c 7e      
   mov h,c       ; $397d 61      
   mov m,e       ; $397e 73      
   mov m,h       ; $397f 74      
   mov l,c       ; $3980 69      
   mov a,m       ; $3981 7e      
   mov l,m       ; $3982 6e      
   mov l,a       ; $3983 6f      
   mov l,b       ; $3984 68      
   ldax b        ; $3985 0a      
   sbb d         ; $3986 9a      
   dad sp        ; $3987 39      
   sub b         ; $3988 90      
   ldax b        ; $3989 0a      
   sbb d         ; $398a 9a      
   dad sp        ; $398b 39      
   dcr h         ; $398c 25      
   dad sp        ; $398d 39      
   mvi a,$18     ; $398e 3e 18   
   dad b         ; $3990 09      
   mov m,b       ; $3991 70      
   mov l,a       ; $3992 6f      
   mov l,h       ; $3993 6c      
   mov l,m       ; $3994 6e      
   mov l,a       ; $3995 6f      
   mov m,e       ; $3996 73      
   mov m,h       ; $3997 74      
   mov a,b       ; $3998 78      
   mov h,b       ; $3999 60      
   dcr d         ; $399a 15      
   inx b         ; $399b 03      
   lxi b,$4668   ; $399c 01 68 46
   dad sp        ; $399f 39      
   call $02e4    ; $39a0 cd e4 02
   inr b         ; $39a3 04      
   dad sp        ; $39a4 39      
   mov c,d       ; $39a5 4a      
   dad sp        ; $39a6 39      
   mov h,m       ; $39a7 66      
   dcr d         ; $39a8 15      
   add m         ; $39a9 86      
   mvi m,$15     ; $39aa 36 15   
   inx b         ; $39ac 03      
   inr b         ; $39ad 04      
   mov b,e       ; $39ae 43      
   mov d,e       ; $39af 53      
   mov d,l       ; $39b0 55      
   mov c,l       ; $39b1 4d      
   .byte 0xfd    ; $39b2 fd      
   .byte 0x38    ; $39b3 38      
   call $02e4    ; $39b4 cd e4 02
   mov h,d       ; $39b7 62      
   inx b         ; $39b8 03      
   mov c,d       ; $39b9 4a      
   inr b         ; $39ba 04      
   adc l         ; $39bb 8d      
   inx b         ; $39bc 03      
   rz            ; $39bd c8      
   mvi c,$c5     ; $39be 0e c5   
   inx b         ; $39c0 03      
   push h        ; $39c1 e5      
   ldax b        ; $39c2 0a      
   rst 1         ; $39c3 cf      
   dad sp        ; $39c4 39      
   sbb a         ; $39c5 9f      
   ldax b        ; $39c6 0a      
   sub c         ; $39c7 91      
   dad b         ; $39c8 09      
   mov c,d       ; $39c9 4a      
   inr b         ; $39ca 04      
   mvi l,$0b     ; $39cb 2e 0b   
   push b        ; $39cd c5      
   dad sp        ; $39ce 39      
   dcr d         ; $39cf 15      
   inx b         ; $39d0 03      
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
   dcr b         ; $3ad0 05      
   mov c,l       ; $3ad1 4d      
   mov d,e       ; $3ad2 53      
   mov b,c       ; $3ad3 41      
   mov d,m       ; $3ad4 56      
   mov b,l       ; $3ad5 45      
   xra l         ; $3ad6 ad      
   dad sp        ; $3ad7 39      
   call $02e4    ; $3ad8 cd e4 02
   mov l,b       ; $3adb 68      
   .byte 0x18    ; $3adc 18      
   .byte 0xdd    ; $3add dd      
   inx d         ; $3ade 13      
   out $03       ; $3adf d3 03   
   xri $01       ; $3ae1 ee 01   
   add h         ; $3ae3 84      
   dad b         ; $3ae4 09      
   jm $4a04      ; $3ae5 fa 04 4a
   lxi d,$770e   ; $3ae8 11 0e 77
   mov a,c       ; $3aeb 79      
   mov l,b       ; $3aec 68      
   mov l,a       ; $3aed 6f      
   mov h,h       ; $3aee 64      
   .byte 0x20    ; $3aef 20      
   mov a,d       ; $3af0 7a      
   mov h,c       ; $3af1 61      
   .byte 0x20    ; $3af2 20      
   mov b,m       ; $3af3 46      
   mov b,l       ; $3af4 45      
   mov c,m       ; $3af5 4e      
   mov b,e       ; $3af6 43      
   mov b,l       ; $3af7 45      
   mov e,d       ; $3af8 5a      
   lda $03d3     ; $3af9 3a d3 03
   stax d        ; $3afc 12      
   mvi m,$d3     ; $3afd 36 d3   
   inx b         ; $3aff 03      
   mvi e,$36     ; $3b00 1e 36   
   rz            ; $3b02 c8      
   mvi c,$2a     ; $3b03 0e 2a   
   mvi m,$e6     ; $3b05 36 e6   
   mvi c,$e8     ; $3b07 0e e8   
   mvi m,$bf     ; $3b09 36 bf   
   mvi c,$43     ; $3b0b 0e 43   
   dad sp        ; $3b0d 39      
   dcx h         ; $3b0e 2b      
   ldax b        ; $3b0f 0a      
   ei            ; $3b10 fb      
   mvi m,$27     ; $3b11 36 27   
   stc           ; $3b13 37      
   dcx h         ; $3b14 2b      
   ldax b        ; $3b15 0a      
   ana b         ; $3b16 a0      
   dad sp        ; $3b17 39      
   mov b,m       ; $3b18 46      
   mvi m,$2b     ; $3b19 36 2b   
   ldax b        ; $3b1b 0a      
   add m         ; $3b1c 86      
   .byte 0x20    ; $3b1d 20      
   sub e         ; $3b1e 93      
   .byte 0x38    ; $3b1f 38      
   dcx h         ; $3b20 2b      
   ldax b        ; $3b21 0a      
   sbb d         ; $3b22 9a      
   .byte 0x38    ; $3b23 38      
   mvi m,$36     ; $3b24 36 36   
   mov l,l       ; $3b26 6d      
   mvi m,$3e     ; $3b27 36 3e   
   dad sp        ; $3b29 39      
   mov d,b       ; $3b2a 50      
   dcr b         ; $3b2b 05      
   mov a,d       ; $3b2c 7a      
   ldax b        ; $3b2d 0a      
   inr m         ; $3b2e 34      
   dcx sp        ; $3b2f 3b      
   di            ; $3b30 f3      
   mvi c,$e8     ; $3b31 0e e8   
   mvi m,$66     ; $3b33 36 66   
   dcr d         ; $3b35 15      
   mov h,m       ; $3b36 66      
   dcr d         ; $3b37 15      
   xthl          ; $3b38 e3      
   mvi m,$90     ; $3b39 36 90   
   ldax b        ; $3b3b 0a      
   mov b,b       ; $3b3c 40      
   dcx sp        ; $3b3d 3b      
   .byte 0xed    ; $3b3e ed      
   dad sp        ; $3b3f 39      
   rst 7         ; $3b40 ff      
   mvi c,$0d     ; $3b41 0e 0d   
   mvi m,$55     ; $3b43 36 55   
   inr b         ; $3b45 04      
   out $03       ; $3b46 d3 03   
   sub d         ; $3b48 92      
   lda $03f2     ; $3b49 3a f2 03
   ora h         ; $3b4c b4      
   dad sp        ; $3b4d 39      
   ani $39       ; $3b4e e6 39   
   mov h,d       ; $3b50 62      
   inx b         ; $3b51 03      
   mov h,m       ; $3b52 66      
   dcr d         ; $3b53 15      
   .byte 0xed    ; $3b54 ed      
   mvi d,$3e     ; $3b55 16 3e   
   .byte 0x18    ; $3b57 18      
   .byte 0x10    ; $3b58 10      
   .byte 0x20    ; $3b59 20      
   inr e         ; $3b5a 1c      
   inr e         ; $3b5b 1c      
   mvi c,$20     ; $3b5c 0e 20   
   mov l,l       ; $3b5e 6d      
   mov l,h       ; $3b5f 6c      
   .byte 0x20    ; $3b60 20      
   .byte 0x28    ; $3b61 28      
   mov e,c       ; $3b62 59      
   cma           ; $3b63 2f      
   mvi l,$2e     ; $3b64 2e 2e   
   mvi l,$29     ; $3b66 2e 29   
   .byte 0x20    ; $3b68 20      
   mov d,h       ; $3b69 54      
   dcr d         ; $3b6a 15      
   out $03       ; $3b6b d3 03   
   dcr a         ; $3b6d 3d      
   dcr d         ; $3b6e 15      
   dcx h         ; $3b6f 2b      
   ldax b        ; $3b70 0a      
   mov e,c       ; $3b71 59      
   nop           ; $3b72 00      
   sub h         ; $3b73 94      
   .byte 0x10    ; $3b74 10      
   mov a,d       ; $3b75 7a      
   ldax b        ; $3b76 0a      
   mov a,l       ; $3b77 7d      
   dcx sp        ; $3b78 3b      
   inx b         ; $3b79 03      
   inr b         ; $3b7a 04      
   dcr d         ; $3b7b 15      
   inx b         ; $3b7c 03      
   mov h,d       ; $3b7d 62      
   inx b         ; $3b7e 03      
   dcx h         ; $3b7f 2b      
   ldax b        ; $3b80 0a      
   .byte 0x20    ; $3b81 20      
   nop           ; $3b82 00      
   ana l         ; $3b83 a5      
   lda $01e1     ; $3b84 3a e1 01
   add h         ; $3b87 84      
   dad b         ; $3b88 09      
   out $03       ; $3b89 d3 03   
   dcr c         ; $3b8b 0d      
   mvi m,$fa     ; $3b8c 36 fa   
   inr b         ; $3b8e 04      
   mov a,d       ; $3b8f 7a      
   ldax b        ; $3b90 0a      
   sub l         ; $3b91 95      
   dcx sp        ; $3b92 3b      
   mov a,m       ; $3b93 7e      
   dcr b         ; $3b94 05      
   sbb m         ; $3b95 9e      
   lda $0ec8     ; $3b96 3a c8 0e
   pop h         ; $3b99 e1      
   lxi b,$0410   ; $3b9a 01 10 04
   out $03       ; $3b9d d3 03   
   add h         ; $3b9f 84      
   dad b         ; $3ba0 09      
   out $03       ; $3ba1 d3 03   
   dcr c         ; $3ba3 0d      
   mvi m,$fa     ; $3ba4 36 fa   
   inr b         ; $3ba6 04      
   mov a,d       ; $3ba7 7a      
   ldax b        ; $3ba8 0a      
   sbb e         ; $3ba9 9b      
   dcx sp        ; $3baa 3b      
   add d         ; $3bab 82      
   inx b         ; $3bac 03      
   out $03       ; $3bad d3 03   
   pop h         ; $3baf e1      
   lxi b,$0566   ; $3bb0 01 66 05
   mov a,d       ; $3bb3 7a      
   ldax b        ; $3bb4 0a      
   cmp c         ; $3bb5 b9      
   dcx sp        ; $3bb6 3b      
   mov a,m       ; $3bb7 7e      
   dcr b         ; $3bb8 05      
   jc $e139      ; $3bb9 da 39 e1
   dad sp        ; $3bbc 39      
   dcr c         ; $3bbd 0d      
   mvi m,$8d     ; $3bbe 36 8d   
   lda $36e3     ; $3bc0 3a e3 36
   sbb c         ; $3bc3 99      
   lda $39d5     ; $3bc4 3a d5 39
   .byte 0x20    ; $3bc7 20      
   ral           ; $3bc8 17      
   rz            ; $3bc9 c8      
   mvi c,$33     ; $3bca 0e 33   
   inr b         ; $3bcc 04      
   dcx h         ; $3bcd 2b      
   ldax b        ; $3bce 0a      
   .byte 0x10    ; $3bcf 10      
   nop           ; $3bd0 00      
   adc d         ; $3bd1 8a      
   dad h         ; $3bd2 29      
   inx b         ; $3bd3 03      
   inr b         ; $3bd4 04      
   inx b         ; $3bd5 03      
   inr b         ; $3bd6 04      
   inx b         ; $3bd7 03      
   inr b         ; $3bd8 04      
   inx b         ; $3bd9 03      
   inr b         ; $3bda 04      
   ana l         ; $3bdb a5      
   lda $0315     ; $3bdc 3a 15 03
   lxi b,$d07c   ; $3bdf 01 7c d0
   lda $e4cd     ; $3be2 3a cd e4
   stax b        ; $3be5 02      
   inr b         ; $3be6 04      
   dad sp        ; $3be7 39      
   mov h,m       ; $3be8 66      
   dcr d         ; $3be9 15      
   add m         ; $3bea 86      
   mvi m,$15     ; $3beb 36 15   
   inx b         ; $3bed 03      
   lxi b,$df63   ; $3bee 01 63 df
   dcx sp        ; $3bf1 3b      
   call $02e4    ; $3bf2 cd e4 02
   dcx h         ; $3bf5 2b      
   ldax b        ; $3bf6 0a      
   in $1a        ; $3bf7 db 1a   
   mov h,d       ; $3bf9 62      
   inx b         ; $3bfa 03      
   cz $7a36      ; $3bfb cc 36 7a
   ldax b        ; $3bfe 0a      
   dcx b         ; $3bff 0b      
   inr a         ; $3c00 3c      
   out $03       ; $3c01 d3 03   
   lda $4d13     ; $3c03 3a 13 4d
   mvi m,$82     ; $3c06 36 82   
   inx b         ; $3c08 03      
   dcr d         ; $3c09 15      
   inx b         ; $3c0a 03      
   dcx h         ; $3c0b 2b      
   ldax b        ; $3c0c 0a      
   dcx h         ; $3c0d 2b      
   cma           ; $3c0e 2f      
   mov h,d       ; $3c0f 62      
   inx b         ; $3c10 03      
   cz $7a36      ; $3c11 cc 36 7a
   ldax b        ; $3c14 0a      
   lxi sp,$d33c  ; $3c15 31 3c d3
   inx b         ; $3c18 03      
   lda $d313     ; $3c19 3a 13 d3
   inx b         ; $3c1c 03      
   add h         ; $3c1d 84      
   dad b         ; $3c1e 09      
   cmp a         ; $3c1f bf      
   mvi c,$94     ; $3c20 0e 94   
   .byte 0x10    ; $3c22 10      
   mov a,d       ; $3c23 7a      
   ldax b        ; $3c24 0a      
   cma           ; $3c25 2f      
   inr a         ; $3c26 3c      
   mov c,l       ; $3c27 4d      
   mvi m,$82     ; $3c28 36 82   
   inr b         ; $3c2a 04      
   mov l,b       ; $3c2b 68      
   ldax b        ; $3c2c 0a      
   dcx d         ; $3c2d 1b      
   inr a         ; $3c2e 3c      
   add d         ; $3c2f 82      
   inx b         ; $3c30 03      
   dcr d         ; $3c31 15      
   inx b         ; $3c32 03      
   lxi b,$d071   ; $3c33 01 71 d0
   lda $e4cd     ; $3c36 3a cd e4
   stax b        ; $3c39 02      
   rst 7         ; $3c3a ff      
   mvi c,$8d     ; $3c3b 0e 8d   
   lda $0ec8     ; $3c3d 3a c8 0e
   dad h         ; $3c40 29      
   mvi l,$82     ; $3c41 2e 82   
   inx b         ; $3c43 03      
   dad d         ; $3c44 19      
   mvi m,$8d     ; $3c45 36 8d   
   lda $39b4     ; $3c47 3a b4 39
   pop h         ; $3c4a e1      
   dad sp        ; $3c4b 39      
   sub h         ; $3c4c 94      
   .byte 0x10    ; $3c4d 10      
   mov c,d       ; $3c4e 4a      
   lxi d,$6f06   ; $3c4f 11 06 6f
   mov a,e       ; $3c52 7b      
   mov l,c       ; $3c53 69      
   mov h,d       ; $3c54 62      
   mov l,e       ; $3c55 6b      
   mov h,c       ; $3c56 61      
   adc l         ; $3c57 8d      
   lda $0f10     ; $3c58 3a 10 0f
   sbb c         ; $3c5b 99      
   lda $0a7a     ; $3c5c 3a 7a 0a
   sub a         ; $3c5f 97      
   inr a         ; $3c60 3c      
   pop h         ; $3c61 e1      
   lxi b,$0984   ; $3c62 01 84 09
   sbb c         ; $3c65 99      
   lda $3625     ; $3c66 3a 25 36
   mov c,d       ; $3c69 4a      
   inr b         ; $3c6a 04      
   pop h         ; $3c6b e1      
   lxi b,$099d   ; $3c6c 01 9d 09
   push d        ; $3c6f d5      
   dad sp        ; $3c70 39      
   dcr h         ; $3c71 25      
   mvi m,$4a     ; $3c72 36 4a   
   inr b         ; $3c74 04      
   out $03       ; $3c75 d3 03   
   push b        ; $3c77 c5      
   inx b         ; $3c78 03      
   sbb l         ; $3c79 9d      
   dad b         ; $3c7a 09      
   pop h         ; $3c7b e1      
   lxi b,$0984   ; $3c7c 01 84 09
   sbb c         ; $3c7f 99      
   inr b         ; $3c80 04      
   mov c,l       ; $3c81 4d      
   mvi m,$82     ; $3c82 36 82   
   inr b         ; $3c84 04      
   jp $fa03      ; $3c85 f2 03 fa
   inr b         ; $3c88 04      
   mov a,d       ; $3c89 7a      
   ldax b        ; $3c8a 0a      
   sub l         ; $3c8b 95      
   inr a         ; $3c8c 3c      
   mov c,l       ; $3c8d 4d      
   mvi m,$84     ; $3c8e 36 84   
   dad b         ; $3c90 09      
   mov l,b       ; $3c91 68      
   ldax b        ; $3c92 0a      
   mov a,a       ; $3c93 7f      
   inr a         ; $3c94 3c      
   inx b         ; $3c95 03      
   inr b         ; $3c96 04      
   .byte 0x20    ; $3c97 20      
   ral           ; $3c98 17      
   rz            ; $3c99 c8      
   lda $3625     ; $3c9a 3a 25 36
   mov c,d       ; $3c9d 4a      
   inr b         ; $3c9e 04      
   inx sp        ; $3c9f 33      
   stax b        ; $3ca0 02      
   add h         ; $3ca1 84      
   dad b         ; $3ca2 09      
   sbb l         ; $3ca3 9d      
   dad b         ; $3ca4 09      
   dad d         ; $3ca5 19      
   mvi m,$7b     ; $3ca6 36 7b   
   inx d         ; $3ca8 13      
   sbb l         ; $3ca9 9d      
   dad b         ; $3caa 09      
   pop h         ; $3cab e1      
   lxi b,$0984   ; $3cac 01 84 09
   rpo           ; $3caf e0      
   inx b         ; $3cb0 03      
   mov a,d       ; $3cb1 7a      
   ldax b        ; $3cb2 0a      
   cmp e         ; $3cb3 bb      
   inr a         ; $3cb4 3c      
   xthl          ; $3cb5 e3      
   dcx sp        ; $3cb6 3b      
   mov l,b       ; $3cb7 68      
   ldax b        ; $3cb8 0a      
   xra l         ; $3cb9 ad      
   inr a         ; $3cba 3c      
   dcr d         ; $3cbb 15      
   inx b         ; $3cbc 03      
   dcr b         ; $3cbd 05      
   mov c,l       ; $3cbe 4d      
   mov c,h       ; $3cbf 4c      
   mov c,a       ; $3cc0 4f      
   mov b,c       ; $3cc1 41      
   mov b,h       ; $3cc2 44      
   rnc           ; $3cc3 d0      
   lda $e4cd     ; $3cc4 3a cd e4
   stax b        ; $3cc7 02      
   mvi a,$18     ; $3cc8 3e 18   
   rrc           ; $3cca 0f      
   mov l,l       ; $3ccb 6d      
   mov l,h       ; $3ccc 6c      
   .byte 0x20    ; $3ccd 20      
   inr e         ; $3cce 1c      
   inr e         ; $3ccf 1c      
   mvi c,$20     ; $3cd0 0e 20   
   .byte 0x28    ; $3cd2 28      
   mov e,c       ; $3cd3 59      
   cma           ; $3cd4 2f      
   mvi l,$2e     ; $3cd5 2e 2e   
   mvi l,$29     ; $3cd7 2e 29   
   .byte 0x20    ; $3cd9 20      
   mov d,h       ; $3cda 54      
   dcr d         ; $3cdb 15      
   out $03       ; $3cdc d3 03   
   dcr a         ; $3cde 3d      
   dcr d         ; $3cdf 15      
   dcx h         ; $3ce0 2b      
   ldax b        ; $3ce1 0a      
   mov e,c       ; $3ce2 59      
   nop           ; $3ce3 00      
   sub h         ; $3ce4 94      
   .byte 0x10    ; $3ce5 10      
   mov a,d       ; $3ce6 7a      
   ldax b        ; $3ce7 0a      
   cpe $153c     ; $3ce8 ec 3c 15
   inx b         ; $3ceb 03      
   cnz $5a16     ; $3cec c4 16 5a
   rrc           ; $3cef 0f      
   out $03       ; $3cf0 d3 03   
   dcx h         ; $3cf2 2b      
   ldax b        ; $3cf3 0a      
   .byte 0x20    ; $3cf4 20      
   nop           ; $3cf5 00      
   rz            ; $3cf6 c8      
   mvi c,$29     ; $3cf7 0e 29   
   mvi l,$82     ; $3cf9 2e 82   
   inx b         ; $3cfb 03      
   .byte 0xed    ; $3cfc ed      
   mvi d,$66     ; $3cfd 16 66   
   dcr d         ; $3cff 15      
   dad b         ; $3d00 09      
   inx b         ; $3d01 03      
   rz            ; $3d02 c8      
   mvi c,$e5     ; $3d03 0e e5   
   ldax b        ; $3d05 0a      
   mvi c,$3d     ; $3d06 0e 3d   
   dcr m         ; $3d08 35      
   rar           ; $3d09 1f      
   mvi l,$0b     ; $3d0a 2e 0b   
   .byte 0x08    ; $3d0c 08      
   dcr a         ; $3d0d 3d      
   rz            ; $3d0e c8      
   mvi c,$d3     ; $3d0f 0e d3   
   inx b         ; $3d11 03      
   jp $f203      ; $3d12 f2 03 f2
   inx b         ; $3d15 03      
   out $03       ; $3d16 d3 03   
   inx sp        ; $3d18 33      
   inr b         ; $3d19 04      
   dcx h         ; $3d1a 2b      
   ldax b        ; $3d1b 0a      
   mvi c,$00     ; $3d1c 0e 00   
   rz            ; $3d1e c8      
   mvi c,$29     ; $3d1f 0e 29   
   mvi l,$82     ; $3d21 2e 82   
   inx b         ; $3d23 03      
   call $da3a    ; $3d24 cd 3a da
   dad sp        ; $3d27 39      
   sbb m         ; $3d28 9e      
   lda $36e8     ; $3d29 3a e8 36
   sub d         ; $3d2c 92      
   lda $3612     ; $3d2d 3a 12 36
   ani $39       ; $3d30 e6 39   
   rst 7         ; $3d32 ff      
   mvi c,$1e     ; $3d33 0e 1e   
   mvi m,$19     ; $3d35 36 19   
   mvi m,$0d     ; $3d37 36 0d   
   mvi m,$55     ; $3d39 36 55   
   inr b         ; $3d3b 04      
   lhld $e636    ; $3d3c 2a 36 e6
   mvi c,$f4     ; $3d3f 0e f4   
   mvi m,$2b     ; $3d41 36 2b   
   ldax b        ; $3d43 0a      
   jp $933b      ; $3d44 f2 3b 93
   .byte 0x38    ; $3d47 38      
   dcx h         ; $3d48 2b      
   ldax b        ; $3d49 0a      
   sbb d         ; $3d4a 9a      
   .byte 0x38    ; $3d4b 38      
   mvi m,$36     ; $3d4c 36 36   
   dcx h         ; $3d4e 2b      
   ldax b        ; $3d4f 0a      
   add m         ; $3d50 86      
   .byte 0x20    ; $3d51 20      
   daa           ; $3d52 27      
   stc           ; $3d53 37      
   dcr h         ; $3d54 25      
   mvi m,$7e     ; $3d55 36 7e   
   dcr b         ; $3d57 05      
   xthl          ; $3d58 e3      
   mvi m,$d9     ; $3d59 36 d9   
   .byte 0x08    ; $3d5b 08      
   sub b         ; $3d5c 90      
   ldax b        ; $3d5d 0a      
   mov h,h       ; $3d5e 64      
   dcr a         ; $3d5f 3d      
   .byte 0xed    ; $3d60 ed      
   dad sp        ; $3d61 39      
   push d        ; $3d62 d5      
   .byte 0x10    ; $3d63 10      
   stc           ; $3d64 37      
   inr a         ; $3d65 3c      
   dcr d         ; $3d66 15      
   inx b         ; $3d67 03      
   mvi b,$45     ; $3d68 06 45   
   mov b,h       ; $3d6a 44      
   mov c,c       ; $3d6b 49      
   mov d,h       ; $3d6c 54      
   mov c,a       ; $3d6d 4f      
   mov d,d       ; $3d6e 52      
   cmp l         ; $3d6f bd      
   inr a         ; $3d70 3c      
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
   inr b         ; $4386 04      
   mov b,l       ; $4387 45      
   mov b,h       ; $4388 44      
   mov c,c       ; $4389 49      
   mov d,h       ; $438a 54      
   mov l,b       ; $438b 68      
   dcr a         ; $438c 3d      
   call $02e4    ; $438d cd e4 02
   .byte 0xd9    ; $4390 d9      
   inr e         ; $4391 1c      
   mov a,d       ; $4392 7a      
   ldax b        ; $4393 0a      
   sbb d         ; $4394 9a      
   mov b,e       ; $4395 43      
   sui $2a       ; $4396 d6 2a   
   sbb l         ; $4398 9d      
   dad b         ; $4399 09      
   sui $2a       ; $439a d6 2a   
   add h         ; $439c 84      
   dad b         ; $439d 09      
   rz            ; $439e c8      
   mvi c,$de     ; $439f 0e de   
   inr b         ; $43a1 04      
   .byte 0xfd    ; $43a2 fd      
   inr l         ; $43a3 2c      
   add d         ; $43a4 82      
   inx b         ; $43a5 03      
   hlt           ; $43a6 76      
   cma           ; $43a7 2f      
   mov a,a       ; $43a8 7f      
   dcr a         ; $43a9 3d      
   cm $c809      ; $43aa fc 09 c8
   mvi c,$8e     ; $43ad 0e 8e   
   dcr a         ; $43af 3d      
   sub m         ; $43b0 96      
   dcr a         ; $43b1 3d      
   cm $2b09      ; $43b2 fc 09 2b
   ldax b        ; $43b5 0a      
   ldax b        ; $43b6 0a      
   nop           ; $43b7 00      
   rz            ; $43b8 c8      
   mvi c,$51     ; $43b9 0e 51   
   cma           ; $43bb 2f      
   mvi a,$18     ; $43bc 3e 18   
   mvi b,$7c     ; $43be 06 7c   
   mov l,e       ; $43c0 6b      
   mov m,d       ; $43c1 72      
   mov h,c       ; $43c2 61      
   mov l,m       ; $43c3 6e      
   dcr a         ; $43c4 3d      
   sui $2a       ; $43c5 d6 2a   
   add h         ; $43c7 84      
   dad b         ; $43c8 09      
   dcx h         ; $43c9 2b      
   ldax b        ; $43ca 0a      
   dcr b         ; $43cb 05      
   nop           ; $43cc 00      
   xra e         ; $43cd ab      
   stax d        ; $43ce 12      
   dcx h         ; $43cf 2b      
   ldax b        ; $43d0 0a      
   inr b         ; $43d1 04      
   nop           ; $43d2 00      
   sui $16       ; $43d3 d6 16   
   mvi a,$18     ; $43d5 3e 18   
   rlc           ; $43d7 07      
   mov e,b       ; $43d8 58      
   dcr a         ; $43d9 3d      
   .byte 0x20    ; $43da 20      
   .byte 0x20    ; $43db 20      
   .byte 0x20    ; $43dc 20      
   mov e,c       ; $43dd 59      
   dcr a         ; $43de 3d      
   dcx h         ; $43df 2b      
   ldax b        ; $43e0 0a      
   ora c         ; $43e1 b1      
   mov b,d       ; $43e2 42      
   cm $6442      ; $43e3 fc 42 64
   lhld $3dc5    ; $43e6 2a c5 3d
   mov h,m       ; $43e9 66      
   dcr d         ; $43ea 15      
   cnz $3e16     ; $43eb c4 16 3e
   .byte 0x18    ; $43ee 18      
   mvi a,$46     ; $43ef 3e 46   
   inx sp        ; $43f1 33      
   cma           ; $43f2 2f      
   mov b,m       ; $43f3 46      
   dcr m         ; $43f4 35      
   dcr l         ; $43f5 2d      
   dcr e         ; $43f6 1d      
   cma           ; $43f7 2f      
   mvi c,$20     ; $43f8 0e 20   
   mov b,c       ; $43fa 41      
   mov d,b       ; $43fb 50      
   sta $492d     ; $43fc 32 2d 49
   mov c,m       ; $43ff 4e      
   mov d,e       ; $4400 53      
   .byte 0x20    ; $4401 20      
   mov b,m       ; $4402 46      
   sta $532d     ; $4403 32 2d 53
   mov d,b       ; $4406 50      
   mov c,h       ; $4407 4c      
   mov c,c       ; $4408 49      
   mov d,h       ; $4409 54      
   .byte 0x20    ; $440a 20      
   mov e,m       ; $440b 5e      
   mov c,a       ; $440c 4f      
   dcr l         ; $440d 2d      
   mov b,h       ; $440e 44      
   mov b,l       ; $440f 45      
   mov c,h       ; $4410 4c      
   .byte 0x20    ; $4411 20      
   mov e,m       ; $4412 5e      
   mov a,m       ; $4413 7e      
   dcr l         ; $4414 2d      
   mov b,h       ; $4415 44      
   mov b,l       ; $4416 45      
   mov c,h       ; $4417 4c      
   mov d,a       ; $4418 57      
   mov c,a       ; $4419 4f      
   mov d,d       ; $441a 52      
   mov b,h       ; $441b 44      
   .byte 0x20    ; $441c 20      
   mov m,b       ; $441d 70      
   mov m,e       ; $441e 73      
   dcr l         ; $441f 2d      
   mov b,h       ; $4420 44      
   mov b,l       ; $4421 45      
   mov c,h       ; $4422 4c      
   mov c,h       ; $4423 4c      
   mov c,c       ; $4424 49      
   mov c,m       ; $4425 4e      
   mov b,l       ; $4426 45      
   .byte 0x20    ; $4427 20      
   mov b,m       ; $4428 46      
   inr m         ; $4429 34      
   dcr l         ; $442a 2d      
   mov b,l       ; $442b 45      
   mov c,m       ; $442c 4e      
   mov b,h       ; $442d 44      
   rz            ; $442e c8      
   mvi c,$8e     ; $442f 0e 8e   
   dcr a         ; $4431 3d      
   rz            ; $4432 c8      
   mvi c,$2b     ; $4433 0e 2b   
   cmc           ; $4435 3f      
   mov h,m       ; $4436 66      
   mov b,d       ; $4437 42      
   dad b         ; $4438 09      
   cmc           ; $4439 3f      
   mov m,e       ; $443a 73      
   mov b,e       ; $443b 43      
   mov l,b       ; $443c 68      
   ldax b        ; $443d 0a      
   mvi m,$44     ; $443e 36 44   
   dcr d         ; $4440 15      
   inx b         ; $4441 03      
   dcr b         ; $4442 05      
   mov l,h       ; $4443 6c      
   mov h,l       ; $4444 65      
   mov l,d       ; $4445 6a      
   mov h,h       ; $4446 64      
   mov l,c       ; $4447 69      
   add m         ; $4448 86      
   mov b,e       ; $4449 43      
   call $02e4    ; $444a cd e4 02
   out $03       ; $444d d3 03   
   sui $16       ; $444f d6 16   
   mvi a,$18     ; $4451 3e 18   
   dad d         ; $4453 19      
   .byte 0x20    ; $4454 20      
   .byte 0x20    ; $4455 20      
   .byte 0x20    ; $4456 20      
   .byte 0x20    ; $4457 20      
   .byte 0x20    ; $4458 20      
   .byte 0x20    ; $4459 20      
   .byte 0x20    ; $445a 20      
   .byte 0x20    ; $445b 20      
   .byte 0x20    ; $445c 20      
   .byte 0x20    ; $445d 20      
   .byte 0x20    ; $445e 20      
   inx b         ; $445f 03      
   .byte 0x20    ; $4460 20      
   .byte 0x20    ; $4461 20      
   .byte 0x20    ; $4462 20      
   .byte 0x20    ; $4463 20      
   .byte 0x20    ; $4464 20      
   .byte 0x20    ; $4465 20      
   .byte 0x20    ; $4466 20      
   .byte 0x20    ; $4467 20      
   .byte 0x20    ; $4468 20      
   .byte 0x20    ; $4469 20      
   .byte 0x20    ; $446a 20      
   .byte 0x20    ; $446b 20      
   .byte 0x20    ; $446c 20      
   mov h,m       ; $446d 66      
   dcr d         ; $446e 15      
   out $03       ; $446f d3 03   
   sui $16       ; $4471 d6 16   
   mvi a,$18     ; $4473 3e 18   
   dad d         ; $4475 19      
   .byte 0x20    ; $4476 20      
   .byte 0x20    ; $4477 20      
   ral           ; $4478 17      
   ral           ; $4479 17      
   .byte 0x20    ; $447a 20      
   mvi b,$17     ; $447b 06 17   
   ral           ; $447d 17      
   lxi d,$1117   ; $447e 11 17 11
   mvi b,$17     ; $4481 06 17   
   ral           ; $4483 17      
   .byte 0x20    ; $4484 20      
   .byte 0x20    ; $4485 20      
   ral           ; $4486 17      
   ral           ; $4487 17      
   .byte 0x20    ; $4488 20      
   .byte 0x20    ; $4489 20      
   ral           ; $448a 17      
   lxi d,$1706   ; $448b 11 06 17
   ral           ; $448e 17      
   mov h,m       ; $448f 66      
   dcr d         ; $4490 15      
   out $03       ; $4491 d3 03   
   sui $16       ; $4493 d6 16   
   mvi a,$18     ; $4495 3e 18   
   dad d         ; $4497 19      
   .byte 0x20    ; $4498 20      
   inr b         ; $4499 04      
   lxi d,$1006   ; $449a 11 06 10
   mvi b,$17     ; $449d 06 17   
   .byte 0x20    ; $449f 20      
   .byte 0x20    ; $44a0 20      
   ral           ; $44a1 17      
   lxi d,$7f17   ; $44a2 11 17 7f
   ral           ; $44a5 17      
   .byte 0x20    ; $44a6 20      
   inr b         ; $44a7 04      
   lxi d,$1006   ; $44a8 11 06 10
   .byte 0x20    ; $44ab 20      
   ral           ; $44ac 17      
   lxi d,$7f17   ; $44ad 11 17 7f
   ral           ; $44b0 17      
   mov h,m       ; $44b1 66      
   dcr d         ; $44b2 15      
   out $03       ; $44b3 d3 03   
   sui $16       ; $44b5 d6 16   
   mvi a,$18     ; $44b7 3e 18   
   dad d         ; $44b9 19      
   .byte 0x20    ; $44ba 20      
   mvi b,$11     ; $44bb 06 11   
   mvi b,$11     ; $44bd 06 11   
   mvi b,$17     ; $44bf 06 17   
   ral           ; $44c1 17      
   lxi d,$1517   ; $44c2 11 17 15
   ral           ; $44c5 17      
   mvi b,$17     ; $44c6 06 17   
   .byte 0x20    ; $44c8 20      
   mvi d,$11     ; $44c9 16 11   
   mvi b,$15     ; $44cb 06 15   
   .byte 0x20    ; $44cd 20      
   ral           ; $44ce 17      
   dcr d         ; $44cf 15      
   ral           ; $44d0 17      
   mvi b,$17     ; $44d1 06 17   
   mov h,m       ; $44d3 66      
   dcr d         ; $44d4 15      
   out $03       ; $44d5 d3 03   
   sui $16       ; $44d7 d6 16   
   mvi a,$18     ; $44d9 3e 18   
   dad d         ; $44db 19      
   .byte 0x20    ; $44dc 20      
   ral           ; $44dd 17      
   lxi b,$1702   ; $44de 01 02 17
   mvi b,$17     ; $44e1 06 17   
   .byte 0x20    ; $44e3 20      
   .byte 0x20    ; $44e4 20      
   ral           ; $44e5 17      
   ral           ; $44e6 17      
   lxi d,$1706   ; $44e7 11 06 17
   .byte 0x20    ; $44ea 20      
   ral           ; $44eb 17      
   .byte 0x20    ; $44ec 20      
   .byte 0x20    ; $44ed 20      
   ral           ; $44ee 17      
   .byte 0x20    ; $44ef 20      
   ral           ; $44f0 17      
   ral           ; $44f1 17      
   lxi d,$1706   ; $44f2 11 06 17
   mov h,m       ; $44f5 66      
   dcr d         ; $44f6 15      
   out $03       ; $44f7 d3 03   
   sui $16       ; $44f9 d6 16   
   mvi a,$18     ; $44fb 3e 18   
   dad d         ; $44fd 19      
   inr b         ; $44fe 04      
   ral           ; $44ff 17      
   .byte 0x20    ; $4500 20      
   .byte 0x20    ; $4501 20      
   ral           ; $4502 17      
   mvi b,$17     ; $4503 06 17   
   ral           ; $4505 17      
   lxi d,$1717   ; $4506 11 17 17
   lxi b,$1706   ; $4509 01 06 17
   mvi b,$17     ; $450c 06 17   
   ral           ; $450e 17      
   ral           ; $450f 17      
   ral           ; $4510 17      
   lxi d,$1717   ; $4511 11 17 17
   lxi b,$1706   ; $4514 01 06 17
   mov h,m       ; $4517 66      
   dcr d         ; $4518 15      
   out $03       ; $4519 d3 03   
   sui $16       ; $451b d6 16   
   mvi a,$18     ; $451d 3e 18   
   dad d         ; $451f 19      
   .byte 0x20    ; $4520 20      
   .byte 0x20    ; $4521 20      
   .byte 0x20    ; $4522 20      
   .byte 0x20    ; $4523 20      
   .byte 0x20    ; $4524 20      
   .byte 0x20    ; $4525 20      
   .byte 0x20    ; $4526 20      
   .byte 0x20    ; $4527 20      
   .byte 0x20    ; $4528 20      
   .byte 0x20    ; $4529 20      
   .byte 0x20    ; $452a 20      
   .byte 0x20    ; $452b 20      
   .byte 0x20    ; $452c 20      
   .byte 0x20    ; $452d 20      
   stax b        ; $452e 02      
   lxi b,$2020   ; $452f 01 20 20
   stax b        ; $4532 02      
   lxi b,$2020   ; $4533 01 20 20
   .byte 0x20    ; $4536 20      
   .byte 0x20    ; $4537 20      
   .byte 0x20    ; $4538 20      
   mov h,m       ; $4539 66      
   dcr d         ; $453a 15      
   dcr d         ; $453b 15      
   inx b         ; $453c 03      
   mvi b,$74     ; $453d 06 74   
   mov m,l       ; $453f 75      
   mov h,m       ; $4540 66      
   mov h,l       ; $4541 65      
   mov l,h       ; $4542 6c      
   mov a,b       ; $4543 78      
   mov b,d       ; $4544 42      
   mov b,h       ; $4545 44      
   call $02e4    ; $4546 cd e4 02
   out $03       ; $4549 d3 03   
   sui $16       ; $454b d6 16   
   mvi a,$18     ; $454d 3e 18   
   dcr c         ; $454f 0d      
   .byte 0x20    ; $4550 20      
   .byte 0x20    ; $4551 20      
   .byte 0x20    ; $4552 20      
   .byte 0x20    ; $4553 20      
   .byte 0x20    ; $4554 20      
   .byte 0x20    ; $4555 20      
   .byte 0x20    ; $4556 20      
   .byte 0x20    ; $4557 20      
   .byte 0x20    ; $4558 20      
   mvi d,$17     ; $4559 16 17   
   dcr d         ; $455b 15      
   .byte 0x20    ; $455c 20      
   mov h,m       ; $455d 66      
   dcr d         ; $455e 15      
   out $03       ; $455f d3 03   
   sui $16       ; $4561 d6 16   
   mvi a,$18     ; $4563 3e 18   
   dcr c         ; $4565 0d      
   .byte 0x20    ; $4566 20      
   .byte 0x20    ; $4567 20      
   .byte 0x20    ; $4568 20      
   .byte 0x20    ; $4569 20      
   .byte 0x20    ; $456a 20      
   .byte 0x20    ; $456b 20      
   .byte 0x20    ; $456c 20      
   .byte 0x20    ; $456d 20      
   mvi d,$17     ; $456e 16 17   
   ral           ; $4570 17      
   ral           ; $4571 17      
   ral           ; $4572 17      
   mov h,m       ; $4573 66      
   dcr d         ; $4574 15      
   out $03       ; $4575 d3 03   
   sui $16       ; $4577 d6 16   
   mvi a,$18     ; $4579 3e 18   
   dcr c         ; $457b 0d      
   .byte 0x20    ; $457c 20      
   .byte 0x20    ; $457d 20      
   .byte 0x20    ; $457e 20      
   mov m,e       ; $457f 73      
   ral           ; $4580 17      
   mov h,m       ; $4581 66      
   mov m,h       ; $4582 74      
   .byte 0x20    ; $4583 20      
   .byte 0x20    ; $4584 20      
   .byte 0x20    ; $4585 20      
   .byte 0x20    ; $4586 20      
   ral           ; $4587 17      
   lxi b,$1566   ; $4588 01 66 15
   out $03       ; $458b d3 03   
   sui $16       ; $458d d6 16   
   mvi a,$18     ; $458f 3e 18   
   dcr c         ; $4591 0d      
   .byte 0x20    ; $4592 20      
   .byte 0x20    ; $4593 20      
   .byte 0x20    ; $4594 20      
   inr b         ; $4595 04      
   ral           ; $4596 17      
   ral           ; $4597 17      
   lxi b,$2020   ; $4598 01 20 20
   .byte 0x20    ; $459b 20      
   mvi b,$11     ; $459c 06 11   
   .byte 0x20    ; $459e 20      
   mov h,m       ; $459f 66      
   dcr d         ; $45a0 15      
   out $03       ; $45a1 d3 03   
   sui $16       ; $45a3 d6 16   
   mvi a,$18     ; $45a5 3e 18   
   dcr c         ; $45a7 0d      
   inr b         ; $45a8 04      
   inr d         ; $45a9 14      
   ral           ; $45aa 17      
   ral           ; $45ab 17      
   ral           ; $45ac 17      
   lxi b,$2020   ; $45ad 01 20 20
   .byte 0x20    ; $45b0 20      
   .byte 0x20    ; $45b1 20      
   mvi b,$20     ; $45b2 06 20   
   .byte 0x20    ; $45b4 20      
   mov h,m       ; $45b5 66      
   dcr d         ; $45b6 15      
   dcr d         ; $45b7 15      
   inx b         ; $45b8 03      
   inr b         ; $45b9 04      
   mov m,e       ; $45ba 73      
   mov l,a       ; $45bb 6f      
   mov h,m       ; $45bc 66      
   mov m,h       ; $45bd 74      
   dcr a         ; $45be 3d      
   mov b,l       ; $45bf 45      
   call $02e4    ; $45c0 cd e4 02
   out $03       ; $45c3 d3 03   
   sui $16       ; $45c5 d6 16   
   mvi a,$18     ; $45c7 3e 18   
   stax d        ; $45c9 12      
   inr b         ; $45ca 04      
   ral           ; $45cb 17      
   ral           ; $45cc 17      
   lxi d,$1704   ; $45cd 11 04 17
   ral           ; $45d0 17      
   dcr d         ; $45d1 15      
   .byte 0x20    ; $45d2 20      
   inr d         ; $45d3 14      
   mvi d,$17     ; $45d4 16 17   
   inr d         ; $45d6 14      
   .byte 0x10    ; $45d7 10      
   mvi b,$17     ; $45d8 06 17   
   ral           ; $45da 17      
   ral           ; $45db 17      
   mov h,m       ; $45dc 66      
   dcr d         ; $45dd 15      
   out $03       ; $45de d3 03   
   sui $16       ; $45e0 d6 16   
   mvi a,$18     ; $45e2 3e 18   
   stax d        ; $45e4 12      
   mvi b,$17     ; $45e5 06 17   
   mvi b,$15     ; $45e7 06 15   
   mvi b,$17     ; $45e9 06 17   
   mvi b,$17     ; $45eb 06 17   
   mvi b,$17     ; $45ed 06 17   
   ral           ; $45ef 17      
   ral           ; $45f0 17      
   ral           ; $45f1 17      
   ral           ; $45f2 17      
   .byte 0x20    ; $45f3 20      
   mvi b,$17     ; $45f4 06 17   
   .byte 0x20    ; $45f6 20      
   mov h,m       ; $45f7 66      
   dcr d         ; $45f8 15      
   out $03       ; $45f9 d3 03   
   sui $16       ; $45fb d6 16   
   mvi a,$18     ; $45fd 3e 18   
   stax d        ; $45ff 12      
   mvi b,$17     ; $4600 06 17   
   .byte 0x20    ; $4602 20      
   .byte 0x20    ; $4603 20      
   mvi b,$17     ; $4604 06 17   
   mvi b,$17     ; $4606 06 17   
   mvi b,$17     ; $4608 06 17   
   mvi b,$17     ; $460a 06 17   
   mvi b,$17     ; $460c 06 17   
   .byte 0x20    ; $460e 20      
   mvi b,$17     ; $460f 06 17   
   .byte 0x20    ; $4611 20      
   mov h,m       ; $4612 66      
   dcr d         ; $4613 15      
   out $03       ; $4614 d3 03   
   sui $16       ; $4616 d6 16   
   mvi a,$18     ; $4618 3e 18   
   stax d        ; $461a 12      
   mvi b,$17     ; $461b 06 17   
   mvi b,$13     ; $461d 06 13   
   mvi b,$17     ; $461f 06 17   
   mvi b,$17     ; $4621 06 17   
   mvi b,$17     ; $4623 06 17   
   mvi d,$17     ; $4625 16 17   
   mvi d,$17     ; $4627 16 17   
   .byte 0x20    ; $4629 20      
   mvi b,$17     ; $462a 06 17   
   .byte 0x20    ; $462c 20      
   mov h,m       ; $462d 66      
   dcr d         ; $462e 15      
   out $03       ; $462f d3 03   
   sui $16       ; $4631 d6 16   
   mvi a,$18     ; $4633 3e 18   
   stax d        ; $4635 12      
   stax b        ; $4636 02      
   ral           ; $4637 17      
   ral           ; $4638 17      
   lxi d,$1702   ; $4639 11 02 17
   ral           ; $463c 17      
   inx d         ; $463d 13      
   .byte 0x20    ; $463e 20      
   inx b         ; $463f 03      
   ral           ; $4640 17      
   ral           ; $4641 17      
   inx b         ; $4642 03      
   lxi b,$0620   ; $4643 01 20 06
   ral           ; $4646 17      
   .byte 0x20    ; $4647 20      
   mov h,m       ; $4648 66      
   dcr d         ; $4649 15      
   dcr d         ; $464a 15      
   inx b         ; $464b 03      
   ldax b        ; $464c 0a      
   mov d,h       ; $464d 54      
   mov d,d       ; $464e 52      
   mov b,c       ; $464f 41      
   mov b,h       ; $4650 44      
   mov b,l       ; $4651 45      
   dcr l         ; $4652 2d      
   mov c,l       ; $4653 4d      
   mov b,c       ; $4654 41      
   mov d,d       ; $4655 52      
   mov c,e       ; $4656 4b      
   cmp c         ; $4657 b9      
   mov b,l       ; $4658 45      
   call $02e4    ; $4659 cd e4 02
   hlt           ; $465c 76      
   cma           ; $465d 2f      
   dcx h         ; $465e 2b      
   ldax b        ; $465f 0a      
   mvi c,$00     ; $4660 0e 00   
   mov c,d       ; $4662 4a      
   mov b,h       ; $4663 44      
   mov h,m       ; $4664 66      
   dcr d         ; $4665 15      
   mov h,m       ; $4666 66      
   dcr d         ; $4667 15      
   dcx h         ; $4668 2b      
   ldax b        ; $4669 0a      
   mvi b,$00     ; $466a 06 00   
   mov c,d       ; $466c 4a      
   inr b         ; $466d 04      
   mov b,m       ; $466e 46      
   mov b,l       ; $466f 45      
   mov h,m       ; $4670 66      
   dcr d         ; $4671 15      
   mov h,m       ; $4672 66      
   dcr d         ; $4673 15      
   mov h,m       ; $4674 66      
   dcr d         ; $4675 15      
   dcx h         ; $4676 2b      
   ldax b        ; $4677 0a      
   inx b         ; $4678 03      
   nop           ; $4679 00      
   mov d,l       ; $467a 55      
   inr b         ; $467b 04      
   rnz           ; $467c c0      
   mov b,l       ; $467d 45      
   adc c         ; $467e 89      
   .byte 0x30    ; $467f 30      
   dcx h         ; $4680 2b      
   ldax b        ; $4681 0a      
   mvi m,$00     ; $4682 36 00   
   dcx h         ; $4684 2b      
   ldax b        ; $4685 0a      
   dcr h         ; $4686 25      
   nop           ; $4687 00      
   mov e,a       ; $4688 5f      
   inx sp        ; $4689 33      
   dcx h         ; $468a 2b      
   ldax b        ; $468b 0a      
   lda $2b00     ; $468c 3a 00 2b
   ldax b        ; $468f 0a      
   dcr h         ; $4690 25      
   nop           ; $4691 00      
   mov e,a       ; $4692 5f      
   inx sp        ; $4693 33      
   dcx h         ; $4694 2b      
   ldax b        ; $4695 0a      
   mvi m,$00     ; $4696 36 00   
   dcx h         ; $4698 2b      
   ldax b        ; $4699 0a      
   dcx h         ; $469a 2b      
   nop           ; $469b 00      
   mov e,a       ; $469c 5f      
   inx sp        ; $469d 33      
   rz            ; $469e c8      
   mvi c,$4d     ; $469f 0e 4d   
   .byte 0x30    ; $46a1 30      
   rz            ; $46a2 c8      
   mvi c,$59     ; $46a3 0e 59   
   .byte 0x30    ; $46a5 30      
   mov a,d       ; $46a6 7a      
   .byte 0x30    ; $46a7 30      
   dcx h         ; $46a8 2b      
   ldax b        ; $46a9 0a      
   mov h,m       ; $46aa 66      
   dcr d         ; $46ab 15      
   dcx h         ; $46ac 2b      
   ldax b        ; $46ad 0a      
   mov a,e       ; $46ae 7b      
   dcr c         ; $46af 0d      
   sbb l         ; $46b0 9d      
   dad b         ; $46b1 09      
   dcx h         ; $46b2 2b      
   ldax b        ; $46b3 0a      
   mov b,b       ; $46b4 40      
   sbb h         ; $46b5 9c      
   rz            ; $46b6 c8      
   mvi c,$e5     ; $46b7 0e e5   
   ldax b        ; $46b9 0a      
   rnz           ; $46ba c0      
   mov b,m       ; $46bb 46      
   mvi l,$0b     ; $46bc 2e 0b   
   cmp h         ; $46be bc      
   mov b,m       ; $46bf 46      
   hlt           ; $46c0 76      
   cma           ; $46c1 2f      
   dcr d         ; $46c2 15      
   inx b         ; $46c3 03      

.end
