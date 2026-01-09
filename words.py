# выборка слов из образа forth

LAST_NFA = 0x464C

def process_nfa(dump, nfa: int):
    if nfa:
        name_length = dump[nfa] % 32
        name = dump[nfa+1:nfa+name_length+1].decode('utf-8')
        lfa = dump[nfa+name_length+2] * 256 + dump[nfa+name_length+1]
        cfa = nfa + name_length + 3
        print(f'{nfa:04X}', f'{name_length:02X}', name, f'{lfa:04X}', f'{cfa:04X}')
        process_nfa(dump, lfa)

with open('forth.bin', 'br') as in_file:
    dump = in_file.read()

process_nfa(dump, LAST_NFA)
