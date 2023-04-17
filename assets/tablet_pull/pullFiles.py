import json
import subprocess
import os
import time
import signal
import sys

# Define the signal handler function. This will be called when the user presses Ctrl+C
# Used to clean up the adb server when the script is terminated
def signal_handler(sig, frame):
    subprocess.call([adb_path, "kill-server"])
    sys.exit(0)

# Register the signal handler
signal.signal(signal.SIGINT, signal_handler)

# Set the path to the adb executable
adb_path = 'C:/Users/cmwal/AppData/Local/Android/Sdk/platform-tools/adb.exe'
device_dir = '/sdcard/Android/data/com.example.hivemind/files/2023micmp3/'
local_dir = 'C:/Users/cmwal/Documents/Robotics/Scripting/pull_files_from_tablet/match_files'

device_id = ''
device_id_old = ''
copiedFiles = 0
skippedFiles = 0

overwrite_files = True;

# Start the adb server
subprocess.call([adb_path, "start-server"])
print("")

# Get connected devices
devices = subprocess.check_output([adb_path, "devices"]).decode().split('\n')[1:-2]

while True:
    
    if not devices:
        print("No devices connected. Press Ctrl+C to exit.")
        time.sleep(1)
        devices = subprocess.check_output([adb_path, "devices"]).decode().split('\n')[1:-2]
        device_id_old = ''
    
    else:        
        # Get the device model for each connected device
        for device in devices:
            device_id = device.split('\t')[0]
            model = subprocess.check_output([adb_path, "-s", device_id, "shell", "getprop", "ro.product.model"]).strip().decode("utf-8")
            
            if device_id == device_id_old:
                print("Same device connected. Press Ctrl+C to exit.")
                time.sleep(1)
                devices = subprocess.check_output([adb_path, "devices"]).decode().split('\n')[1:-2]
    
            else:
                print("Connected Device:")
                print("Device ID:", device_id)
                print("Device Model:", model)
                print("Last Device:", device_id_old)
                print("")

                # Get a list of files in the device directory
                proc = subprocess.Popen([adb_path, "shell", "ls", device_dir], stdout=subprocess.PIPE)
                out, err = proc.communicate()

                # Decode the output from bytes to a string
                out_str = out.decode()

                # Split the output into individual filenames
                file_names = out_str.split()

                # Copy each file from the device to the local computer
                copiedFiles = 0
                skippedFiles = 0
                for file_name in file_names:
                    device_file_path = device_dir + file_name
                    local_file_path = os.path.normpath(os.path.join(local_dir, file_name))
                    if not os.path.exists(local_file_path) or overwrite_files:
                        subprocess.call([adb_path, "pull", device_file_path, local_dir])

                        copiedFiles += 1
                    else:
                        skippedFiles += 1

                print("Copied: ", copiedFiles)
                print("Skipped: ", skippedFiles)

                device_id_old = device_id


