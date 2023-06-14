library(dataRetrieval)
library(tidyverse)
library(cowplot)
# add station number 06676500 to the query for 1915-1919 data
#06676550 is at WY Cross Ranch - data from 1965-1979

HC_flow <- tibble(readNWISdv(siteNumbers=c('06676500', '06676550', "06675850"), parameterCd="00060", 
                                  startDate = "", endDate = 	""))
seo_HC_data<-read_csv("./data/discharge1.csv", col_names = TRUE, skip =1)
another<-read_csv("./data/discharge2.csv", col_names = TRUE, skip =1)
seo_HC_data<-tibble(rbind(seo_HC_data,another))
rm(another)


p0<-ggplot(HC_flow, aes(group=site_no,x=Date,y=X_00060_00003)) + 
  geom_point(aes(color=site_no)) +
  scale_y_continuous(trans='log10', limits= c(0.1,500)) +
  scale_x_date(limits=as.Date(c('1915-10-01','1919-09-30'))) + 
  labs(title= "USGS streamgages",
       subtitle = "Historical",
       y = 'Discharge (cfs)',
       x=  "Date",
       color="Site Number") +
  theme_classic()

p<-ggplot(HC_flow, aes(group=site_no,x=Date,y=X_00060_00003)) + 
  geom_point(aes(color=site_no)) +
  scale_y_continuous(trans='log10', limits= c(0.1,500)) +
  scale_x_date(limits=as.Date(c('1978-03-01','1979-09-30')),date_breaks = "9 months") + 
  labs(title= "USGS streamgages",
       subtitle = "Historical",
       y = 'Discharge (cfs)',
       x=  "Date",
       color="Site Number") +
  theme_classic()

p2<-ggplot(seo_HC_data, aes(x=`Timestamp (UTC)`,y=`Value (Cubic Feet Per Second)`)) + 
  geom_point(aes(color="slategrey"), show.legend = FALSE) +
  scale_y_continuous(trans='log10', limits=c(0.1,500)) +
  labs(title= "SEO station 0102HRCK",
       subtitle = "Horse Creek at Goshen-Laramie CO. Line",
          y = 'Discharge (cfs)',
          x=  "Date") +
  theme_classic()

p3<-cowplot::plot_grid(p0, p, p2, ncol=3)
save_plot("myplot.tiff",p3, ncol=3,base_width = 4.25, base_height = 8.5)
