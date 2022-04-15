# Load the Dataset
points <- read.csv("C:/Users/skiax/OneDrive/Desktop/Map Project/newmap/Western_Macedonia.csv", encoding = "UTF-8")  #Full path
#points <- read.csv("Western_Macedonia.csv.csv", encoding = "UTF-8")  #To working directory


# Create list with icons to color every category marker (English option)
icons <- iconList('TownHall' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-black.png',iconWidth = 24, iconHeight =32),
                  'Hospital' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png', iconWidth = 24, iconHeight =32),
                  'Square' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png', iconWidth = 24, iconHeight =32))

# Clustering(factor) 
dplyr::mutate(points, factor = factor(ifelse(factor %in% c('Square', 'TownHall', 'Hospital'), factor)))

# Create list with icons to color every category point (Greek option)
Eicons <- iconList('Νοσοκομείο' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-black.png',iconWidth = 24, iconHeight =32),
                  'Πλατεία' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png', iconWidth = 24, iconHeight =32),
                  'Δημαρχείο' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png', iconWidth = 24, iconHeight =32))

# Clustering(GreekFactor) 
dplyr::mutate(points, GreekFactor = factor(ifelse(GreekFactor %in% c('Δημαρχείο', 'Νοσοκομείο', 'Πλατεία'), GreekFactor)))

# Create list with icons to color every category point (German option)
Gicons <- iconList('Rathaus' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-black.png',iconWidth = 24, iconHeight =32),
                  'Krankenhaus' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-blue.png', iconWidth = 24, iconHeight =32),
                  'Platz' = makeIcon(iconUrl = 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-gold.png', iconWidth = 24, iconHeight =32))

# Clustering(GermanFactor) 
dplyr::mutate(points, GermanFactor = factor(ifelse(GermanFactor %in% c('Platz', 'Rathaus', 'Krankenhaus'), GermanFactor)))


# Take color same as markers color to build addLegend and will use it into leaflet::addLegend
pal <- colorFactor(palette = c("black", "dodgerblue", "gold"), 
                   levels = rev(unique(points$factor)))

Epal <- colorFactor(palette = c("black", "dodgerblue", "gold"), 
                   levels = rev(unique(points$GreekFactor)))

Gpal <- colorFactor(palette = c("black", "dodgerblue", "gold"), 
                    levels = rev(unique(points$GermanFactor)))