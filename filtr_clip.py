import pyperclip

from filtr import filtr_string

try:
    pyperclip.copy(filtr_string(pyperclip.paste()))
except pyperclip.PyperclipException:
    pass
