#load necessary packages
library(dplyr)

#set working directory containing a zipped gtfs dataset
setwd("~/Documents/R/data")

#load zipped gtfs dataset
gtfs <- "gtfs.zip"

#read necessary files from the zipped gtfs dataset and select columns
routes <- read.csv(
  unz(gtfs, "routes.txt"), 
  header = TRUE, 
  sep = ",") %>% select(
    "route_id",
    "route_type",
    contains("agency_id"),
    contains("route_short_name"),
    contains("route_long_name"),
    contains("route_color"),
    contains("route_text_color")
  )
oc <- list(
  "agency_id",
  "route_short_name",
  "route_long_name",
  "route_color",
  "route_text_color")
for (i in seq_along(oc)){
  if (!oc[[i]] %in% colnames(routes)) {
    routes[,oc[[i]]] <- NA
  }
}

stops <- read.csv(
  unz(gtfs, "stops.txt"), 
  header = TRUE, 
  sep = ",") %>% select(
    "stop_id",
    "stop_name",
    contains("location_type")
  )
if (!"location_type" %in% colnames(stops)) {
  stops[,"location_type"] <- NA
}

trips <- read.csv(
  unz(gtfs, "trips.txt"), 
  header = TRUE, 
  sep = ",") %>% select(
    "route_id",
    "trip_id", 
    contains("trip_headsign")
  )
if (!"trip_headsign" %in% colnames(trips)) {
  trips[,"trip_headsign"] <- NA
}

stop_times <- read.csv(
  unz(gtfs, "stop_times.txt"), 
  header = TRUE, 
  sep = ",") %>% select(
    "trip_id",
    "stop_id"
  )

#match gtfs relationships
m.routes <- routes %>% select(
  "agency_id",
  "route_type",
  "route_id",
  "route_short_name",
  "route_long_name",
  "route_color",
  "route_text_color"
)

m.trips <- merge(
  m.routes,
  trips,
  by="route_id",
  all.y=TRUE)

m.stop_times <- merge(
  m.trips,
  stop_times,
  by="trip_id",
  all.y=TRUE)

if (all(!is.na(stops$location_type))) {
  stops <- filter(stops, stops$location_type==0)
}
m.stops <- distinct(
  merge(
    stops,
    m.stop_times,
    by="stop_id",
    all.x=TRUE) 
  %>% select(
    "agency_id",
    "route_type",
    "stop_id",
    "stop_name")
)

#post-merge clean of m.trips
m.trips <- m.trips %>% select(
  "agency_id",
  "route_type",
  "trip_id",
  "trip_headsign"
)
if(all(!is.na(m.trips$trip_headsign))){
  m.trips <- m.trips[!duplicated(m.trips[ ,c("trip_headsign")]), ]
}

mf <- list(m.routes, m.stops, m.trips)

#stratify by agency_id and route_type
strat <- list()
if(
  ("agency_id" %in% colnames(routes))
  &&
  (!is.na(routes$agency_id))) {
  (for (i in seq_along(mf)) {
    strat[[i]] <- split(mf[[i]], 
                        with(mf[[i]],
                             interaction(
                               mf[[i]]$agency_id,
                               mf[[i]]$route_type)
                        )
    )
  }
  )
}

if(
  (!"agency_id" %in% colnames(routes))
  ||
  (is.na(routes$agency_id))) {
  (for (i in seq_along(mf)) {
    strat[[i]] <- split(
      mf[[i]],
      mf[[i]]$route_type
    )
  }
  )
}

for (i in seq_along(strat)) {
  strat[[i]] <- strat[[i]][
    sapply(strat[[i]],nrow)>0
    ]
}

#random sampling
ar <- unlist(strat, recursive = FALSE, use.names = FALSE)
random <- list()

for (i in seq_along(ar)) {
  random[[i]] <- ar[[i]][
    sample(nrow(ar[[i]]),
           (ifelse(
             (nrow(ar[[i]])==1),
             1,
             (as.integer(log10(nrow(ar[[i]])))+2)
           )
           )
    )
    ,]
}

#write csv
if (length(random)==3) {
  random_routes <- as.data.frame(random[[1]])
  write.csv(random_routes,"random_routes.csv", row.names = FALSE)
  random_stops <- as.data.frame(random[[2]])
  write.csv(random_stops,"random_stops.csv", row.names = FALSE)
  random_trips <- as.data.frame(random[[3]])
  write.csv(random_trips,"random_trips.csv", row.names = FALSE)
}

if (length(random)>3) {
  random_routes <- data.frame()
  random_stops <- data.frame()
  random_trips <- data.frame()
  for (i in head(seq_along(random),-1)) {
    for (j in i:length(random)) {
      if (identical(
        sort(names(random[[i]])), 
        sort(names(random[[j]])))) {
        df <- data.frame(random[[j]])
        if ("route_id" %in% colnames(df)) {
          random_routes <- distinct(rbind(random_routes,df))
          write.csv(random_routes,"random_routes.csv", row.names = FALSE)
        }
        if ("stop_id" %in% colnames(df)) {
          random_stops <- distinct(rbind(random_stops,df))
          write.csv(random_stops,"random_stops.csv", row.names = FALSE)
        }
        if ("trip_id" %in% colnames(df)) {
          random_trips <- distinct(rbind(random_trips,df))
          write.csv(random_trips,"random_trips.csv", row.names = FALSE)
        }
      }
    }
  }
}

#sample csvs are written to the working directory
