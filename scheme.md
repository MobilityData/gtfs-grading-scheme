# GTFS Grading Scheme v1
1. [Sampling](#sampling)
2. [Finding reference material](#finding-reference-material)
3. [Grade summary](#grade-summary)
4. [Assessment criteria](#assessment-criteria)

## Sampling
Evaluating all values in a GTFS dataset would be a laborious and exhaustive process. Moreover, many qualitative issues that can be identified in a GTFS dataset are often systemic. For instance, the GTFS name values for the RATP (FR-IDF) do not include accents that are seen by riders on the ground. Such discrepancies can be identified by evaluating a smaller number of samples instead of needlessly evaluating thousands of entries in the dataset.

Sampling will be stratified for each `agency_id` and `route_type` defined in the dataset. This is to control differences in how separate agencies may present rider-facing values, and to control for differences in how these values may be presented for different networks. For example, the dataset may report an accurate `route_color` for the subway, but may be inaccurate or missing for buses.

**Stratified random sampling**<br>
For each `agency_id` and `route_type`, the GTFS fields in scope will be stratify randomly sampled. Fields sharing the same file (e.g. `routes.txt`, `stops.txt`, or `trips.txt`) will be sampled by entry. The number of random samples is determined by the number of file entries for each `agency_id` and `route_type`.<br>

If there is only 1 entry in the file, 1 will be sampled. Otherwise, the number of random samples will be determined by the following equation:<br><br>
`number of random samples = integer ( log10 ( number of file entries ) ) + 2` <br>

So that:<br>
`1 file entry = 1 sample`<br>
`2 file entries = 2 samples`<br>
`9 file entries = 2 samples`<br>
`10 file entries = 3 samples`<br>
`99 file entries = 3 samples`<br>
`100 file entries = 4 samples`<br>
`999 file entries = 4 samples`<br>
`1000 file entries = 5 samples`<br>
`...`

## Finding reference material
Evaluators will compare the sampled GTFS dataset values with the official branding and rider-facing information seen in the real world. This official reference information will be compiled in MobilityData’s [GTFS Grading Scheme Template](https://docs.google.com/document/d/1ecN8ZI1KKxfPUfPHdQTSCInx3t1eSOf2LnEHZd-3vOE/edit#heading=h.kjtjp9u1jdh7). All official reference information should be dated and sourced by a deep link or URL attached to the content. To use the GTFS Grading Scheme Template:
1. Go to the document at the [link](https://docs.google.com/document/d/1ecN8ZI1KKxfPUfPHdQTSCInx3t1eSOf2LnEHZd-3vOE/edit#heading=h.kjtjp9u1jdh7) provided.
2. `File > Make a copy` and choose a Google Drive destination where the template will be used.

Some general guidelines for finding reference material:
- For all images, timebox the search process by 45 seconds for each sample entry.
- For all images taken from a [street view](https://en.wikipedia.org/wiki/List_of_street_view_services) service, the image must have been captured within the last 3 years to be considered official.
- Trip Planners are not a source-of-truth. As they often use GTFS data, Trip Planners can potentially provide misleading comparisons.
- If official reference material cannot be found, indicate “NA” in both the “Official reference” and “Points” columns

The procedures for where to look and what to record for each field are the following:

### `routes.txt`
1. Sample random routes.
2. For each column in the “Evaluation” and “Grade” tables indicating a GTFS field, fill in the sampled values.
3. Catalogue official reference information in the “Official reference” column of the template. Write the date of their publishing and deep link the source if provided.

`route_short_name` and `route_long_name`
1. Go to the transit agency’s website and find the official `route_type` map (i.e. bus map, metro map, etc). Check if the `route_short_name` and/or the `route_long_name` are shown on the mapped route. Take a screenshot and store in the “Official reference” columns.
2. Go to the transit agency’s website and find the official `route_type` timetable. Check if the `route_short_name` and/or `route_long_name` are displayed. Take a screenshot and store in the “Official reference” columns.
3. Optional: Find an image of the vehicle’s headsign and see if the `route_short_name` and/or `route_long_name` are displayed. For third party evaluators, timebox the image search by 45 seconds. If no images are found, indicate “NA” in the “Official reference” columns. For agencies with access to the vehicles, primary photos of the vehicle’s headsigns are valid so long as the information being displayed is what is being displayed to the rider. Store images in the “Official reference” columns.
4. Optional: Go to a stop located on the route in street view (by entering the coordinates of the stop or manually finding it) and check if the `route_short_name` and/or `route_long_name` are displayed. Take a screenshot and store in the “Official reference” column.

`route_color` and `route_text_color`
1. Go to the transit agency’s website and find the official `route_type` map (i.e. bus map, metro map, etc), and the route stop schedule or timetable. Check if there are colors associated with the route, take a screenshot. Check if there is a contrast color for the route text (e.g. `route_text_color`). Take a screenshot and store in the “Official reference” column.
2. Set the text highlight color of the GTFS route color fields to that indicated by its HTML code.

### `stops.txt`
1. Sample random stops.
2. For each column in the “Evaluation” and “Grade” tables indicating a GTFS field, fill in the sampled values.
3. Catalogue official reference information in the “Official reference” column of the template. Write the date of their publishing and deep link the source if provided.

`stop_name`
1. Go to the transit agency’s website and find the official `route_type` map (i.e. bus map, metro map, etc). Check if the stop_name is displayed. Take a screenshot and store in the “Official reference” column.
2. Go to the transit agency’s website and find the official `route_type` timetable. Check if the stop_name is displayed. Take a screenshot and store in the “Official reference” column.
3. Optional: Go to the stop located on the route in street view by entering the coordinates of the stop. Check if the stop_name is displayed. Take a screenshot and store in the “Official reference” column.
4. If no formal stop name is given, but instead rely on crossroads or POIs, go to a map and screen shot the stop with the street name or landmark in view.

`stop_lat` and `stop_lon`
1. Search the coordinates of `stop_lat` and `stop_lon` at [openstreetmap.org](https://www.openstreetmap.org/).
2. Take a screenshot of the aerial view and store in the “Official reference” column.
3. Go to street view and verify if the coordinates match with where the stop is located on the ground.

### `trips.txt`
1. Sample random trips for unique trip_headsigns
2. For each column in the “Evaluation” and “Grade” tables indicating a GTFS field, fill in the sampled values.
3. Catalogue official reference information in the “Official reference” column of the template. Write the date of their publishing and deep link the source if provided.

`trip_headsign`
1. Find an image of the vehicle’s headsign and see if the trip_headsign is displayed. For third party evaluators, timebox the image search by 45 seconds. If no images are found, indicate “NA” in the “Official reference” columns. For agencies with access to the vehicles, primary photos of the vehicle’s headsigns are valid so long as the information being displayed is what is being displayed to the rider.
2. Optional: Go to the transit agency’s website and find the official `route_type` map (i.e. bus map, metro map, 
. Check if the `trip_headsign` is displayed, take a screenshot.
3. Optional: Go to the transit agency’s website and find the official `route_type` timetable. Check if the trip_headsign is displayed, take a screenshot.
4. Store images in the “Official reference” columns.

## Grade summary
Recall that the goal of the GTFS Grading Scheme is to ensure that GTFS datasets reflect the rider-facing information that is seen and understood in the real world. What the rider sees of the GTFS data should translate unambiguously to reality. Grades will be reported for each field name within each `agency_id` and `route_type` that are being assessed. This disaggregated level of grading will provide a clear indication of the fields which will need to be improved before being production ready. Each sample entry that will be assessed will earn a certain number of points depending on the assessment criteria applied for that field name.<br>

If a sampled field value earns at least one point of `-1`, the entire field will be flagged as “Rejected” and will not pass onto the Grading Scheme process below. A “Rejected” status indicates that the entire field must be improved before being used in production.Fields that receive no `-1` points will be subject to the Grading Scheme below. Points will be aggregated and weighted according to the number of samples to yield a nominal grade for the field:<br><br>
`nominal grade = (sum of field points) / (number of sample entries)`

| Nominal grade | Dataset grade | Description |
| ----- | -----| -----|
| Perfect | `100%` | The GTFS dataset is production ready. |
| Passing | `50 - 99%` | The GTFS dataset can be used in production, but should be improved if possible. |
| Passing with warnings | `0 - 49%` | The GTFS dataset should be improved before being used in production. |

## Assessment criteria

`route_short_name`
| Points | Description |
| ----- | ----- |
| `1` | The `route_short_name` is consistent with official maps, timetables, vehicle signage and stop signage. |
| `0.75` | a. The `route_short_name` is consistent with official maps, timetables, vehicle signage and stop signage but has different capitalization, missing accents, or is abbreviated.<br> b. The source-of-truth information has varying representations that cannot be perfectly captured by the GTFS. This fields will be flagged as “Inconsistent source-of-truth” in the evaluation. |
| `0` | The `route_short_name` precision is reduced but can still be reasoned by the rider to match the official route short name on maps, timetables, vehicle signage and stop signage. |
| `-1` | The `route_short_name` is ambiguous, confusing, or entirely inconsistent with official maps, timetables, vehicle signage and in-station signage. |

`route_long_name`
| Points | Description |
| ----- | ----- |
| `1` | The `route_long_name` is consistent with official maps, timetables, vehicle signage and stop signage. |
| `0.75` | a. The `route_long_name` is consistent with official maps, timetables, vehicle signage and stop signage but has different capitalization, missing accents, or is abbreviated.<br> b. The source-of-truth information has varying representations that cannot be perfectly captured by the GTFS. These fields will be flagged as “Inconsistent source-of-truth” in the evaluation. |
| `0` | The `route_long_name` precision is reduced but can still be reasoned by the rider to match the official route short name on maps, timetables, vehicle signage and stop signage. |
| `-1` | The `route_long_name` is ambiguous, confusing, or entirely inconsistent with official maps, timetables, vehicle signage and in-station signage. |

`route_color`
| Points | Description |
| ----- | ----- |
| `1` | The `route_color` is consistent with official branding and signage. If there is no official route color reported by the agency, a default `route_color` is valid. |
| `0` | The `route_color` is of a comparable chroma and can be reasoned by the rider to represent what is seen in reality, but does not match official branding and signage.  |
| `-1` | The `route_color` is absent in the GTFS data, given that it is actually officially provided, or the route_color is completely inconsistent with official branding and signage. |

`route_text_color`
| Points | Description |
| ----- | ----- |
| `1` | The `route_text_color` is consistent with the contrast color of the official branding and signage. If there is no official contrast color reported by the agency, a default `route_text_color` is valid. |
| `0` | The `route_text_color` is of a comparable chroma and can be reasoned by the rider to represent the contrast color seen in reality, but does not match official branding and signage. |
| `-1` | The `route_text_color` is absent in the GTFS data, given that it is actually officially provided, or the `route_text_color` is completely inconsistent with official branding and signage. |

`stop_name` for `location_type=0`
| Points | Description |
| ----- | ----- |
| `1` | The `stop_name` is consistent with official maps, timetables and signage. |
| `0.75` | a. The `stop_name` is consistent with official maps, timetables and signage but has different capitalization, missing accents, or is abbreviated.<br> b. The source-of-truth information has varying representations that cannot be perfectly captured by the GTFS. These fields will be flagged as “Inconsistent source-of-truth” in the evaluation. |
| `0` | The `stop_name` precision is reduced but can still be reasoned by the rider to match the official stop name on maps, timetables and signage. |
| `-1` | The `stop_name` is ambiguous, confusing, or entirely inconsistent with official maps, timetables and signage. |

`stop_lat` and `stop_lon` for `location_type=0`
| Points | Description |
| ----- | ----- |
| `1` | The GTFS stop coordinates are consistent with the stop’s real location.<br><br> Depending on the context of the physical environment, there are different threshold tolerances for what is deemed a “real location”. The goal is that the rider be able to unambiguously find the correct stop, travelling the correct direction, based on the GTFS information; a task that may prove easier in rural settings as opposed to confounding urban ones for the same location discrepancies. While discretion should be used, a “real location” can be determined using the following guide:<br>- Within `5 meters` in crowded urban locations.<br> - Within `10 meters` in medium suburban settings.<br>- Within `15 meters` in exurban/rural settings. |
| `0` | The GTFS stop coordinates are imperfect, but the rider can intuitively find the stop’s real location from the coordinate location. |
| `-1` | The GTFS stop coordinates are imperfect, and would mislead the rider’s navigation of the system (wrong side of street, facing the wrong direction of travel, unspecific at a complicated terminal). |

`trip_headsign`
| Points | Description |
| ----- | ----- |
| `1` | The `trip_headsign` is consistent with official maps, timetables, vehicle signage and in-station signage. |
| `0.75` | a. The `trip_headsign` is consistent with official maps, timetables, vehicle signage and in-station signage but has different capitalization, missing accents, or is abbreviated.<br>b. The source-of-truth information has varying representations that cannot be perfectly captured by the GTFS. These fields will be flagged as “Inconsistent source-of-truth” in the evaluation. |
| `0` | The `trip_headsign` precision is reduced but can still be reasoned by the rider to match the official trip headsign name on maps, timetables, vehicle signage and in-station signage. |
| `-1` | The `trip_headsign` is ambiguous, confusing, or entirely inconsistent with official maps, timetables, vehicle signage and in-station signage. |

See examples of the process [here](https://docs.google.com/document/d/19VNvbsGZFn9AFEmwdbQ6zeiytjhuaXVczK3U114642I/edit#heading=h.ol3bghjpwbae).
