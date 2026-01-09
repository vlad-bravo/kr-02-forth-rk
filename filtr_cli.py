#!/usr/bin/env python3
import argparse
import sys

def filtr_char(char: str) -> str:
    """
    Python equivalent of the Forth word (FILTR).
    Transforms a single character according to the specified rules.
    
    - A-Z and 0-9 are kept.
    - '_' is doubled.
    - All other characters are replaced by '_' and their 2-digit hex code.
    """
    c_val = ord(char)
    # Check for uppercase letters (A-Z) or digits (0-9)
    if (0x41 <= c_val <= 0x5A) or (0x30 <= c_val <= 0x39):
        return char
    # Check for underscore
    elif char == '_':
        return '__'
    # All other characters
    else:
        # Use an f-string to format the character's value as a 2-digit uppercase hex number
        return f'_{c_val:02X}'

def filtr_string(input_str: str) -> str:
    """
    Python equivalent of the Forth word FILTR.
    Transforms an entire string.
    """
    output_parts = ['_']
    
    for char in input_str:
        output_parts.append(filtr_char(char))
    
    return "".join(output_parts)

def main():
    """
    Main function to run the CLI application.
    """
    # Create the argument parser
    parser = argparse.ArgumentParser(
        description="Transform a string according to specific character rules.",
        epilog="Example: python filtr_cli.py \"1+!C\""
    )

    # Add the required input string argument
    parser.add_argument(
        "input_string",
        type=str,
        help="The string to be filtered."
    )

    # Parse the arguments from the command line
    args = parser.parse_args()

    # Get the input string from the parsed arguments
    input_str = args.input_string
    
    # Perform the transformation
    result_str = filtr_string(input_str)
    
    # Print the final result to standard output
    print(result_str)

if __name__ == "__main__":
    main()
