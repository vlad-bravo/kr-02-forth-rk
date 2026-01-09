#!/usr/bin/env python3
import argparse
import sys

from filtr import filtr_string

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
