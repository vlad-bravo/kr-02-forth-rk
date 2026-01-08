@echo off
del forth.bin
C:\Dev\retroassembler\retroassembler.exe forth.asm
fc /b forth.bin memory.bin
