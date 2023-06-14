library(sf)
library(sp)
library(rgeos)
shp<-st_read("C:/Users/tim.moloney/Documents/work/Horse_Creek/data/model_wel.shp")
grd<-st_read("C:/Users/tim.moloney/Documents/work/Horse_Creek/data/AMEC/grid.shp")
shift_c<-st_centroid(st_union(grd))
grd<-as_Spatial(grd)

deg = (33.5) # degrees of rotation
rot = function(a) matrix(c(cos(a), sin(a), -sin(a), cos(a)), 2, 2)
shpg = st_geometry(shp)
cntrd = st_centroid(st_union(shpg))
shpg2 = (shpg - cntrd) * rot(pi/(180/deg)) * 1 + cntrd# rotate from N
shpg2<- shpg2 + c(907373.6,394096.7) # shift to NAD83 Wyo State Plane East,
# shpg2<- shpg2 + st_bbox(shift_c-cntrd)[1:2] # shift to NAD83 Wyo State Plane East, this is close but has small offset 

plot(grd,axes=TRUE)
plot(shpg2, col= 'red', add=TRUE)

# plot(shp$geometry, col= 'red', axes=TRUE)
shp$geometry<-shpg2
shp<-st_set_crs(shp,3736)
st_write(shp,dsn="./outputs/",layer="model_wel.shp",driver = "ESRI Shapefile", append = FALSE)