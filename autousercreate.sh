# !/bin/bash
echo Auto User Creator is running...
# Check if a CSV file is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 users.csv"
  exit 1
fi

csv_file="$1"

if [ ! -f "$csv_file" ]; then
  echo "Error: CSV file '$csv_file' not found."
  exit 1
fi

while IFS=, read -r username expdate group
do
    # Split the username
    IFS='-' read firstname lastname <<< "$username"
    echo "Fullname: $firstname $lastname"
    
    if [ "$group" = "admins" ]
    then
        
        sudo useradd -m -e "$expdate" "$username"
        # Set the user as admin
        sudo usermod -aG sudo "$username"
        # Force the user to create password on initial login
        sudo chage -d 0 "$username"
        echo Administrator User: "$username" created sucessfully
    else
        # sudo useradd -m -e "$expdate" -G "$group" "$username"
        sudo useradd -m -e "$expdate" "$username"
        # Force the user to create password on initial login
        sudo chage -d 0 "$username"
        echo User: "$username" created sucessfully

    fi
done < "$csv_file"