#!bash/bin

current_working_dir='/home/black_ninja/core_data_engineering_projects'

# Download the dataset from url
curl -O $dataset
#check for current csv in the pwd
current_csv=$(ls -t *.csv | head -1)
cd $current_working_dir
if [ "$current_csv" ]; then
	echo "successfully downloaded: $current_csv"
else 
	echo "failed to download file"
fi 
# Load the data in the raw folder

#moving csv file to raw folder
mv $current_csv $current_working_dir/raw
cd $current_working_dir/raw/

if [ "$current_csv" ]; then
	echo "Successfully moved $current_csv to $current_working_dir/raw  "
else
	echo "failed to move file "
fi

rawfile=$current_csv

#trasformation layer
#rename column to the correct naming conversion according to business standards 
awk -F, 'NR==1{for(i=1;i<=NF;i++){if($i=="Variable_code"){$i="variable_code"}}}1' OFS=, $rawfile > $current_working_dir/transformed/2023_year_finance.csv

#change directory to  the transformed directory
cd $current_working_dir/transformed

transformed_file=$current_working_dir/transformed/$(ls -t *.csv | head -1)

#Check for the presence of the transdormed file in the transformed directory
if [ "$transformed_file" ]; then
	echo "File successfully loaded to transformed layer"
else
	echo "File not found in on transformed layer "
fi

#selecting the relavent fields form the csv file
csvsql --query "SELECT Year, Value, Units, variable_code FROM finance" \
       --tables finance "$transformed_file" > $current_working_dir/gold/2023_year_finance.csv
cd $current_working_dir/gold

gold_file=$current_working_dir/gold/$(ls -t *.csv | head -1)

if [ "$gold_file" ]; then
        echo "File successfully loaded to gold layer"
else
        echo "File not found in gold layer"
fi
