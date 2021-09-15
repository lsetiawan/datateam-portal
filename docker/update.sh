#!/bin/bash
date

# Switch to main directory
cd $BACKEND_DIR

# Update git repos
cd repos/preload-database/
git pull
cd ../asset-management/
git pull
cd ../ingestion-csvs/
git pull
cd ../../

# Update sqlite database for preload
./preload_update_db.sh

# Run database update scripts
./load-data.py -s production -o assets
./load-data.py -s production -o cruises
./load-data.py -s production -o deployments
./load-data.py -s production -o calibrations
./load-data.py -s production -o preload
./load-data.py -s production -o data_streams
./load-data.py -s production -o ingestions

date