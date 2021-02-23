# GTFS Grading Scheme v1.0.0

## Overview
A dataset flagged as "valid" by an automated validator may contain undetected qualitative errors that are unsuitable for rider-facing purposes (e.g., misspelling of names, inconsistent headsignage, missing information). Because of this, most data consumers do manual checks on datasets when they are adding them in their services. These manual checks consult official transit agency websites, images (i.e., Google street view) and other sources of truth in order to verify that rider-facing GTFS values are accurate.

MobilityData aims to standardize these manual checks in an open and replicable process using the GTFS Grading Scheme. The GTFS Grading Scheme provides data producers an opportunity to improve their datasets before releasing them, and gives data consumers a shared understanding of a dataset’s quality before putting it into production. This will ensure that riders unambiguously understand the information provided to them via GTFS, corresponding to what they see on-the-ground.

## Scope 
GTFS Grading Scheme v1 handles the following subset of GTFS fields:
- `route_short_name`
- `route_long_name`
- `route_color`
- `route_text_color`
- `stop_name` (for `location_type=0`)
- `stop_lat` and `stop_lon` (for `location_type=0`)
- `trip_headsign`

See examples of the process [here](https://docs.google.com/document/d/19VNvbsGZFn9AFEmwdbQ6zeiytjhuaXVczK3U114642I/edit#heading=h.ol3bghjpwbae).
