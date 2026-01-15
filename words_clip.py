import pyperclip

from filtr import filtr_string

LAST_NFA = 0x464C
LAST_NFA_EDITOR = 0x3D75
LAST_NFA_ASSEMBLER = 0x21FF
LAST_NFA_LOADER = 0x3AC4

words = {}

def process_nfa(dump, nfa: int, recursive=True):
    global words
    if nfa:
        name_length = dump[nfa] % 32    # Clar IMMEDIATE, SMUDGE flags
        lfa = nfa + name_length + 1
        cfa = nfa + name_length + 3
        if name_length == 0:
            name = ''
        else:
            try:
                name = dump[nfa+1:lfa].decode('utf-8')
            except:
                name = dump[nfa+1:lfa]
        lfa_ref = int.from_bytes(dump[lfa:lfa+2], byteorder='little')
        words[f'{nfa:04X}'] = f'{name_length}', name, f'{lfa_ref:04X}', cfa
        if recursive:
            process_nfa(dump, lfa_ref)

def process_nfa_by_adr(dump):
    adr_list = (
        0x1abb, # NFA_TOCODE
        0x0259, # NFA_INB
        0x027b, # NFA_OUTB
        0x0287, # NFA__23TOB
        0x032d, # NFA_ASMCALL
        0x0635, # NFA__2DTEXT
        0x0837, # NFA__3FWORD
        0x0c95, # NFA__28KEY_29
        0x0cfa, # NFA_LEMIT
        0x0d0c, # NFA_PRINT
        0x0d2f, # NFA__28LEMIT_29
        0x172b, # NFA__21CF
        0x1742, # NFA__28_21CODE_29
        0x1620, # NFA_CONSOLE
        0x17f3, # NFA__2BWORD
        0x1810, # NFA__2DWORD
        0x01f3, # NFA_W_2DLINK
        0x1fda, # NFA_NLIST
        0x20d8, # NFA__3FCURRENT
        0x3092, # NFA_G
        0x30ab, # NFA__3FS
        0x31fd, # NFA__6C
        0x3068, # NFA_T
        0x305c, # NFA_A
        0x3032, # NFA__7C
        0x2b27, # NFA_R_2FW
        0x2ae7, # NFA__23BUFF
        0x2ac2, # NFA_BB_2DCNT
        0x2ab7, # NFA_USE
        0x2a9f, # NFA_UR_2FW
        0x2a75, # NFA__23BUFF1
        0x2a51, # NFA_DBT
        0x2a38, # NFA_STFILE
        0x296f, # NFA_NEXT_3B
        0x28C5, # NFA_REPEAT
        0x220f, # NFA_H
        0x2218, # NFA_L
        0x2221, # NFA_A
        0x222a, # NFA_PSW
        0x2235, # NFA_D
        0
    )
    for adr in adr_list:
        process_nfa(dump, adr, recursive=False)

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
        text += f'   .word {label:<17}; ${ptr:04x} {cfa:04X}{name_postfix}\n'
        ptr += 2
        if name == '(.")' or name == '(ABORT")':
            string_length = dump[ptr]
            string = dump[ptr+1:ptr+string_length+1]
            text += f'   .byte {string_length},"{string}"\n'
            ptr += string_length + 1
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
    process_nfa(dump, LAST_NFA_ASSEMBLER)
    process_nfa(dump, LAST_NFA_EDITOR)
    process_nfa(dump, LAST_NFA_LOADER)
    process_nfa_by_adr(dump)
    word = words.get(nfa)
    if not word:
        try:
            process_nfa(dump, int(nfa, base=16), recursive=False)
            word = words.get(nfa)
        except:
            pass
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
