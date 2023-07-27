# If you don't have the files for sqlite it won't work!
# Download them there: https://www.sqlite.org/download.html
# If your ubuntu doesn't want to work with this file 
# make the script file executable again!

#!/bin/sh

if [ -f "chadchat.db" ]; then
    echo "An existing database found in the current directory. Do you want to overwrite this file? (1 or 0): "
    read answer
    if [ "$answer" = "0" ]; then
        exit 0
    fi
fi

if command -v sqlite3 >/dev/null 2>&1; then
    echo "SQLite3 found in the system!"
    echo "Creating a database..."
    sqlite3 chadchat.db < chadchat.sql

    if [ $? -eq 0 ]; then
        echo "Database created successfully!"
    else
        echo "Database creation failed. Please check database.sql and sqlite3 installation."
        exit 1
    fi
else
    echo "SQLite3 not found, please install SQLite3 and read comments of this file!"
fi

cp -n chadchat.db backup_chadchat.db