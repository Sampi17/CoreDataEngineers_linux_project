#!/bin/bash

# establishing connection to the postgres database
psql  -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME"  -c "SELECT 'CONNECTION SUCCESSFUL' AS status, version();"
#psql -U "$DB_USER" -d "$DB_NAME" -p "$DB_PORT" -c "SELECT 'CONNECTION SUCCESSFUL' AS status, version();"
# pwd
file_path="/home/black_ninja/core_data_engineering_projects/data/"
#change directory to the file path
cd $file_path
# create an array of all csv files in the directory
csvfiles=(*.csv)

# create tables in the postgres database
if psql -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME"  -f /home/black_ninja/core_data_engineering_projects/Scripts/create_tables.sql; then
#if psql -U "$DB_USER" -d "$DB_NAME" -p "$DB_PORT" -f /home/black_ninja/core_data_engineering_projects/Scripts/create_tables.sql; then   
    echo "tables created successfully"
else
    echo "tables not created successfully"
fi

# loop through the array of csv files and load them into the postgres database
for file in "${csvfiles[@]}"; do
    base_name=$(basename "$file" .csv)
    echo "loading $base_name into the  $DB_NAME database"

    # load the csv file into the postgres database
   psql -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME"  -c "\copy $base_name FROM '$file' WITH (FORMAT csv, HEADER true, QUOTE '\"');"
    #psql -U "$DB_USER" -d "$DB_NAME" -p "$DB_PORT"  -c "\copy $base_name FROM '$file' WITH (FORMAT csv, HEADER true, QUOTE '\"');"
    if [ $? -eq 0 ]; then
        echo successfully loaded $base_name into the database
    else
        echo "not successfully loaded $base_name into the database"
    fi
done

