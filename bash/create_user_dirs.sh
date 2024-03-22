#!/bin/bash

# Variable to store the path to the root directory
root_dir=""

# Checking for the presence of the -d argument to determine the path to the root directory
while getopts "d:" opt; do
  case ${opt} in
    d ) root_dir=$OPTARG ;;
    \? ) echo "Usage: $0 [-d root_directory]" >&2
         exit 1 ;;
  esac
done
shift $((OPTIND -1))

# If the path to the root directory is not specified via the -d flag, prompt the user for it
if [ -z "$root_dir" ]; then
    read -p "Enter the path to the root directory: " root_dir
fi

# Creating a directory for each user
for user in $(cut -d: -f1 /etc/passwd); do
    user_dir="${root_dir}/${user}"

    # Creating the directory if it does not exist
    if [ ! -d "$user_dir" ]; then
        mkdir -p "$user_dir"
    fi

    # Setting permissions for the directory (755) and the owner (corresponding user)
    chmod 755 "$user_dir"
    chown "$user:$user" "$user_dir"

    # Writing logs to stdout and file
    echo "Directory for user $user created: $user_dir"
    echo "$(date): Directory for user $user created: $user_dir" >> script_log.txt
done
