import json
import argparse
import sys

def convert_json_to_binary(input_path, output_path):
    """
    Reads a JSON file with memory data, parses it, and writes it to a binary file.

    Args:
        input_path (str): The path to the input JSON file.
        output_path (str): The path to the output binary file.
    """
    try:
        # --- 1. Read and Parse the JSON File ---
        print(f"[*] Reading memory map from '{input_path}'...")
        with open(input_path, 'r') as f:
            data = json.load(f)

        if "memory" not in data:
            print("[!] Error: JSON file must contain a top-level 'memory' key.")
            sys.exit(1)
        
        memory_map = data["memory"]
        print(f"[*] Found {len(memory_map)} memory blocks in the JSON file.")

        # --- 2. Determine the Total Memory Size ---
        # We need to find the highest address to know how big our binary file should be.
        max_end_address = 0
        for addr_str, data_str in memory_map.items():
            # Parse the address (e.g., ":0010" -> 16)
            start_address = int(addr_str.lstrip(':'), 16)
            
            # Count the number of bytes in the data string
            num_bytes = len(data_str.split())
            
            # Calculate the end address of this block
            end_address = start_address + num_bytes - 1
            
            if end_address > max_end_address:
                max_end_address = end_address
        
        # The total size is the highest address + 1 (since addresses start at 0)
        total_size = max_end_address + 1
        print(f"[*] Calculated total memory size: {total_size} bytes (0x{total_size:X}).")

        # --- 3. Create a Memory Buffer ---
        # Use a bytearray, which is a mutable sequence of bytes.
        # It's initialized with all zeros, representing empty/unwritten memory.
        memory_buffer = bytearray(total_size)
        print("[*] Initialized memory buffer with zeros.")

        # --- 4. Populate the Buffer with Data ---
        for addr_str, data_str in memory_map.items():
            # Parse the starting address
            start_address = int(addr_str.lstrip(':'), 16)
            
            # Parse the data string into a list of integers
            # e.g., "0A FF 01" -> [10, 255, 1]
            byte_values = [int(b, 16) for b in data_str.split()]
            
            # Write the byte values into the buffer at the correct location
            # Slicing is an efficient way to do this.
            end_address = start_address + len(byte_values)
            memory_buffer[start_address:end_address] = byte_values
            
            print(f"    - Wrote {len(byte_values)} bytes to address 0x{start_address:04X}")

        # --- 5. Write the Buffer to a Binary File ---
        print(f"[*] Writing final binary data to '{output_path}'...")
        with open(output_path, 'wb') as f:
            f.write(memory_buffer)
        
        print("[+] Success! Binary file created.")

    except FileNotFoundError:
        print(f"[!] Error: Input file not found at '{input_path}'")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"[!] Error: Could not decode JSON from '{input_path}'. Please check its format.")
        sys.exit(1)
    except (ValueError, KeyError) as e:
        print(f"[!] Error processing data: {e}. Please check address and byte formats in the JSON.")
        sys.exit(1)

if __name__ == "__main__":
    # Set up command-line argument parsing
    parser = argparse.ArgumentParser(
        description="Convert a JSON memory map to a binary file.",
        formatter_class=argparse.RawTextHelpFormatter
    )
    parser.add_argument(
        "input_file", 
        default="rk86-snapshot-forth.json",
        help="Path to the input JSON file containing the memory map."
    )
    parser.add_argument(
        "-o", "--output", 
        default="memory.bin",
        help="Path for the output binary file (default: memory.bin)."
    )
    
    args = parser.parse_args()

    convert_json_to_binary(args.input_file, args.output)
