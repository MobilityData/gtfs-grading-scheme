# GTFS Grading Scheme sampler v1

## Overview
The GTFS Grading Scheme sampler is an R script that facilitates the sampling of GTFS datasets for evaluation in the GTFS Grading Scheme, particularly for large multi-`agency_id` multi-`route_type` datasets. The fields handled are:
- `route_short_name`
- `route_long_name`
- `route_color`
- `route_text_color`
- `stop_name` for `location_type=0`
- `trip_headsign`

The above fields are stratified random sampled for each `agency_id` and `route_type`. The number of samples is determined by the total number of entries for each stratification. 

## Prerequisites
1. Download and install [R](https://cloud.r-project.org/).
2. Download [code](https://github.com/MobilityData/gtfs-grading-scheme/blob/main/sampler/sampler-v1.r) for the grading scheme sampler.
3. Optional: Download and install the [R Studio](https://rstudio.com/products/rstudio/download/) IDE.
4. Install the `dplyr` library by entering `install.packages(“dplyr”)` in the R console.

## Usage
1. Open the code for the grading scheme sampler in R, or any IDE that is compatible with the R language.
2. In the beginning of the script under  `#set working directory containing a zipped gtfs dataset`,  set the working directory to the file path where the GTFS dataset is located, and where the output sample csv files will be written. The default working directory is set as `~/Documents/R/data`.
In the beginning of the script under #load zipped gtfs dataset, enter the name of the zipped GTFS dataset to sample that is located in the working directory. The default file name is set as `gtfs.zip`.
3. Run the script. Runtime may differ based on the size of `gtfs.zip`.
4. The output GTFS data samples will be written to the working directory as separate csv files:

`~/Documents/R/data/`

| File name | Description | 
| ----- | ----- | 
| `random_routes.csv` | Random samples from `routes.txt` 
| `random_stops.csv` | Random samples from `stop.txt` |
| `random_trips.csv` | Random samples from `trips.txt` |
