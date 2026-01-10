import pyperclip

from filtr import filtr_string

LAST_NFA = 0x464C

words = {}

def process_nfa(dump, nfa: int):
    global words
    if nfa:
        name_length = dump[nfa] % 32    # Clar IMMEDIATE, SMUDGE flags
        lfa = nfa + name_length + 1
        cfa = nfa + name_length + 3
        name = dump[nfa+1:lfa].decode('utf-8')
        lfa_ref = int.from_bytes(dump[lfa:lfa+2], byteorder='little')
        words[f'{nfa:04X}'] = f'{name_length}', name, f'{lfa_ref:04X}', f'{cfa:04X}'
        process_nfa(dump, lfa_ref)

with open('C:\\dev\\kr-02-forth-rk\\memory.bin', 'br') as in_file:
    dump = in_file.read()

try:
    nfa = pyperclip.paste().upper()
    process_nfa(dump, LAST_NFA)
    word = words.get(nfa)
    if word:
        name_length, name, lfa, cfa = word
        label = filtr_string(name)
        text = (f'\nNFA{label}:    ; {nfa}\n'
                f'   .byte {name_length},"{name}"\n'
                f'   .word ${lfa}\n'
                f'{label}:       ; {cfa}')
        pyperclip.copy(text)
except pyperclip.PyperclipException:
    pass
