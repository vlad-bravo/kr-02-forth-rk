import pyperclip

from filtr import filtr_string
from words_clip import process_nfa, process_forth_code

LAST_NFA = 0x464C

# Адреса CFA-кодов словарных статей (от - до)
PTR = 0x2283
LIM = 0x228f

words = {}

with open('C:\\dev\\kr-02-forth-rk\\memory.bin', 'br') as in_file:
    dump = in_file.read()

try:
    process_nfa(dump, LAST_NFA)
    text = process_forth_code('', PTR, LIM)
    pyperclip.copy(text)
except pyperclip.PyperclipException:
    pass
