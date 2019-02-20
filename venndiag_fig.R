###############################################################################
###############################################################################
#Code for the Venn diagram figures
###############################################################################
###############################################################################

#loading the packages necessary for the analysis
library(eulerr)
library(RColorBrewer)
library(devtools)
install_github('johannesbjork/LaCroixColoR')
library(LaCroixColoR)
source("dataloading.R")


###############################################################################
#Figure 3A: Venn Diagram
###############################################################################

#building the contingency table
div_fin<-table(data_monitoring$bioag_surv_monitoring_comb)
#total number of evaluated monitoring
print(paste("Total number of evaluated monitoring =",sum(div_fin)))
#number of monitoring with no information on the founding sources
print(paste("Missing data = ",div_fin[7]))

#chosing a set of colors
colovec<-colovec<-lacroix_palettes$PassionFruit[1,c(1,3,6)]

#you need to run the 'euler' function several time in order to obtain a figure 
#close to the one in the manuscript, because the optimisation process leeds 
#to different solution each time
fit<-euler(c(Insects=36,Weeds=68,Fungi=52,"Insects&Fungi"=4,
      "Weeds&Fungi"=2,"Insects&Weeds"=0,"Insects&Weeds&Fungi"=16),
      shape=c("ellipse"),control=list(extraopt_threshold=0))
plot(fit,
     quantities=list(col=c("black"),cex=1.3,font=3),
     edges=list(col=colovec,lwd=7),
     labels=list(col=colovec,cex=1.4),
     fills=list(fill=colovec,alpha=0.3),
     legend=FALSE)

#export to a pdf 6 x 5 inches


###############################################################################
#Figure 4A: Venn Diagram
###############################################################################

#building the contingency table
div_fin<-table(data_monitoring$participation_financement)
#total number of evaluated monitoring
print(paste("Total number of evaluated monitoring =",sum(div_fin)))
#number of monitoring with no information on the founding sources
print(paste("Missing data = ",div_fin[1]))

#chosing a set of colors
colovec<-brewer.pal(7,"Dark2")[c(5,6,7)]

fit<-euler(c(Academic=23,Governmental=36,Private=55,"Academic&Governmental"=7,
             "Academic&Private"=5,"Governmental&Private"=36,
             "Academic&Governmental&Private"=12))
plot(fit,
     quantities=list(col=c("black"),cex=1.3,font=3),
     edges=list(col=colovec,lwd=7),
     labels=list(col=colovec,cex=1.4),
     fills=list(fill=colovec,alpha=0.3),
     legend=FALSE)

#export to a pdf 6 x 5 inches


###############################################################################
#END
###############################################################################