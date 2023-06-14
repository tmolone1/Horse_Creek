library(sf)
library(sp)
shp<-st_read("O:/Complaints/Interference Investigations/Horse Creek/AMEC Dir/Horse Creek/Model/Output/011711 wells/011711_HCmodel.shp")
shp<-as_Spatial(shp)
