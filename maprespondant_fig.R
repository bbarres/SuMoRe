##############################################################################/
##############################################################################/
#Code for the worl map
##############################################################################/
##############################################################################/

#this code was written by Pauline De Jerphanion
#loading the packages necessary for the analysis
library(rworldmap)
library(classInt)
library(RColorBrewer)
library(ggplot2)
library(reshape2)
library(rgdal)
library(rgeos)
#and the data
source("dataloading.R")


##############################################################################/
#Figure 1: World map of the responding countries####
##############################################################################/

#preparing the data
data_country_total<-as.data.frame(table(data_repondants$q2))
colnames(data_country_total)<-c("country","total")

#getting colours
colourPalette <- brewer.pal(5,'Oranges')[2:5]

#first get countries excluding Antarctica which crashes spTransform
sPDF <- getMap()[-which(getMap()$ADMIN=="Antarctica"),]
#Ajout des données au shapefile
sPDF <- joinCountryData2Map(data_country_total
                            , joinCode='NAME'
                            , nameJoinColumn='country'
                            , verbose='TRUE')

#transform to robin for the Robinson projection
sPDF <- spTransform(sPDF, CRS=CRS("+proj=robin +ellps=WGS84"))

#BB : je n'ai pas compris à quoi ça servait, mais nécessite le package rgeos, 
#peut-être pour voir la distribution des aires des différents polygones ?
plot(gArea(sPDF,byid=TRUE))

#plot map
par(oma=c(0,0,0,0),mar=c(0,0,0,0))
par(xpd=TRUE)
mapParams <- mapCountryData(sPDF[which(sPDF@data$ADMIN!="Antarctica" & 
                                         gArea(sPDF,byid=TRUE)>20000000000 ),]
                            ,nameColumnToPlot="total"
                            ,mapTitle=""
                            ,addLegend=FALSE
                            ,catMethod = c(0,1,2,6,12)
                            ,colourPalette = colourPalette
                            ,oceanCol = "white"
                            ,missingCountryCol = "white"
                            ,borderCol="black"
                            ,lwd=0.8)
legend(-16500000,-7500000,
       fill = c("white",colourPalette[1:4]),#title="Number of respondents" ,
       legend = c("0","1","2","[3-6]","[7-10]"), text.width=4000000,
       cex=1.5, col="black",bg=NA,bty="n",ncol=5, xjust=0,
       x.intersp=0.6 ,title.adj = 0)

#export to pdf 6 x 5 inches


##############################################################################/
#END
##############################################################################/