##############################################################################/
##############################################################################/
#Code for the worl map
##############################################################################/
##############################################################################/

#this code was originaly written by Pauline De Jerphanion and modified by
#Benoit Barrès

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
#Figure 2A: World map of the responding countries####
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

#plotting the distribution of the area of the different countries
plot(gArea(sPDF,byid=TRUE))

#plot map
op<-par(oma=c(0,0,0,0),mar=c(0,0,0,9))
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
legend(16000000,6000000,pch=21,
       pt.bg=c("white",colourPalette[1:4]),#title="Number of\nrespondents",
       legend=c("0","1","2","[3-6]","[7-10]"),text.width=60000000,
       cex=1.3,pt.cex=3,col="black",bg=NA,bty="n",ncol=1,xjust=0,
       x.intersp=0.4,y.intersp=0.6,title.adj=0.03)
par(op)
#export to pdf 15 x 7 inches


##############################################################################/
#END
##############################################################################/