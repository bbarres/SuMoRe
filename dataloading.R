##############################################################################/
##############################################################################/
#Loading the datasets and packages needed
##############################################################################/
##############################################################################/

#loading the data necessary for analyses and plot
data_pays<-read.csv2(file="data/20181211_data_pays.csv",
                     header=TRUE)

data_repondants<-read.csv2(file="data/20181114_data_repondant.csv",
                           header=TRUE)

data_monitoring<-read.csv2(file="data/20181121_data_monitoring.csv",
                           header=TRUE)

#loading the packages necessary for analyses and plot
library(RColorBrewer)
library(visreg)
library(plotrix)
library(reshape2)
library(rworldmap)
library(classInt)
library(ggplot2)
library(rgdal)
library(rgeos)
library(devtools)
install_github('johannesbjork/LaCroixColoR')
library(LaCroixColoR)
library(eulerr)


##############################################################################/
#Writing info session for reproducibility####
##############################################################################/

sink("session_info.txt")
print(sessioninfo::session_info())
sink()
#inspired by an R gist of François Briatte: 
#https://gist.github.com/briatte/14e47fb0cfb8801f25c889edea3fcd9b


##############################################################################/
#END
##############################################################################/