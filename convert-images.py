import os
import subprocess
import shutil # For cleanup of simulated directory, which you won't need in production

def convert_images_to_2k(root_dir):
    """
    Converts .dds and .tga image files within the given directory to 2K resolution (50% scale).
    Assumes ImageMagick 'magick' command is available in the system's PATH.
    Modifies files in place.
    """
    if not os.path.isdir(root_dir):
        print(f"Error: Directory '{root_dir}' does not exist.")
        return

    print(f"Starting image conversion in: {root_dir}")
    converted_count = 0
    errors_count = 0
    skipped_count = 0

    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            file_extension = os.path.splitext(filename)[1].lower()
            if file_extension in ('.dds', '.tga'):
                full_path = os.path.join(dirpath, filename)
                print(f"Processing: {full_path}")
                try:
                    command = ["magick", full_path, "-scale", "67%", full_path]
                    result = subprocess.run(command, check=False, capture_output=True, text=True) # check=False for graceful error handling
                    if result.returncode == 0:
                        print(f"  Converted successfully.")
                        if result.stdout:
                            print(f"  ImageMagick Output:\n{result.stdout.strip()}")
                        if result.stderr:
                            print(f"  ImageMagick Warnings/Errors:\n{result.stderr.strip()}")
                        converted_count += 1
                    else:
                        # Check for 'command not found' specifically
                        if "magick: command not found" in result.stderr.lower() or "no such file or directory" in result.stderr.lower() and "magick" in result.stderr.lower():
                            print(f"  Error: 'magick' command not found. Please ensure ImageMagick is installed and in your system's PATH.")
                            return # Exit immediately if magick command is not found
                        else:
                            print(f"  Error converting {full_path}: Command returned non-zero exit status {result.returncode}")
                            print(f"  Stdout: {result.stdout.strip()}")
                            print(f"  Stderr: {result.stderr.strip()}")
                            errors_count += 1
                except Exception as e:
                    print(f"  An unexpected error occurred while processing {full_path}: {e}")
                    errors_count += 1
            else:
                skipped_count += 1

    print(f"\nConversion complete.")
    print(f"Total files scanned: {converted_count + errors_count + skipped_count}")
    print(f"Successfully converted: {converted_count}")
    print(f"Failed conversions: {errors_count}")
    print(f"Files skipped (not .dds or .tga): {skipped_count}")
    if errors_count > 0:
        print("Please review the errors above for failed conversions.")

import sys

convert_images_to_2k(
    "/home/daniel/Repos/github.com/danicc097/eu4-modpack-4k/" + sys.argv[1]
)
