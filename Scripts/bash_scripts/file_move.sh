#!/bin/bash

source_dir="/home/black_ninja/core_data_engineering_projects/file_dump"
destination_dir="/home/black_ninja/core_data_engineering_projects/json_and_CSV"

mv $source_dir/*.{csv,json} $destination_dir

if [ $? -eq 0 ];then
	echo "files successfully moved to destination: "
	cd $destination_dir
	ls 
else 
	echo "files failed to move"
fi
