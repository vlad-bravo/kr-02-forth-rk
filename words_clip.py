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
        words[f'{nfa:04X}'] = f'{name_length}', name, f'{lfa_ref:04X}', cfa
        process_nfa(dump, lfa_ref)

def process_forth_code(text: str, ptr: int, lim: int) -> str:
    while ptr < lim:
        cfa = int.from_bytes(dump[ptr:ptr+2], byteorder='little')
        name = next((value[1] for _, value in words.items() if value[3] == cfa), None)
        if name:
            label = filtr_string(name)
            name_postfix = ' - ' + name
        else:
            label = f'${cfa:04X}'
            name_postfix = ''
        text = text + f'   .word {label:<17}; {ptr:04X} {cfa:04X}{name_postfix}\n'
        ptr = ptr + 2
    return text

def get_cfa_body(start_cfa: int, prev_nfa: str) -> str:
    lim = int(prev_nfa, base=16)
    text = ''
    ptr = start_cfa + 3
    if dump[start_cfa:ptr] == b'\xcd\xe4\x02':
        text = f'\n   call _FCALL            ; {start_cfa:04X}\n'
        text = process_forth_code(text, ptr, lim)
    return text

with open('C:\\dev\\kr-02-forth-rk\\memory.bin', 'br') as in_file:
    dump = in_file.read()

try:
    nfa = pyperclip.paste().upper()
    process_nfa(dump, LAST_NFA)
    word = words.get(nfa)
    if word:
        name_length, name, lfa, cfa = word
        label = filtr_string(name)
        label_length = len(label)
        next_word = words.get(lfa)
        if next_word:
            next_name_length, next_name, _, _ = next_word
            lfa = 'NFA' + filtr_string(next_name) + ' ' * (12 - int(next_name_length)) + ' ; ' + lfa
        else:
            lfa = '$' + lfa
        prev_nfa = next((key for key, value in words.items() if value[2] == nfa), None)
        if prev_nfa:
            cfa_body = get_cfa_body(cfa, prev_nfa)
        else:
            cfa_body = ''
        text = (f'\nNFA{label}:{" "*(13-int(label_length))}; {nfa}\n'
                f'   .byte {name_length},"{name}"\n'
                f'   .word {lfa}\n'
                f'{label}:{" "*(16-int(label_length))}; {cfa:04X} - {prev_nfa}{cfa_body}')
        pyperclip.copy(text)
except pyperclip.PyperclipException:
    pass
