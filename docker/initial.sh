#!/bin/bash

# Load System Infrastructure Information (from the CSV files in this repo)
./load-data.py -s production -o regions
./load-data.py -s production -o sites
./load-data.py -s production -o nodes
./load-data.py -s production -o instruments
./load-data.py -s production -o instrument_classes
./load-data.py -s production -o instrument_models

# Load Asset Management Metadata
./load-data.py -s production -o assets
./load-data.py -s production -o cruises
./load-data.py -s production -o deployments
./load-data.py -s production -o calibrations

# Load Preload Metadata
./preload_update_db.sh # First update the local sqlite database
./load-data.py -s production -o preload

# Load Data Streams List (from this repo)
./load-data.py -s production -o data_streams

# Load Ingestions CSVs
./load-data.py -s production -o ingestions

# Annotations (loaded directly from OOI Net)
# Ignore loading in annotations for now
# ./load-annotations.py -s production