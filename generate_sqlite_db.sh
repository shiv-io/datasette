#!/bin/bash

# Delete existing app.db
rm -f app.db

cd data
# Loop through CSVs in directory
for filename in *.csv; do
    # Table name is the file name without the extension
    TABLENAME=$(echo $filename | cut -d'.' -f 1)
    
    # Insert CSV into app.db
    echo "Inserting $filename into app.db as table $TABLENAME"
    sqlite-utils insert ../app.db $TABLENAME $filename --sniff
done
