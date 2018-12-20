###############################################################################
###############################################################################
#Code for the Venn diagram figures
###############################################################################
###############################################################################

#loading the packages necessary for the analysis
library(eulerr)
library(RColorBrewer)
source("dataloading.R")


###############################################################################
#Figure 6: Venn Diagram
###############################################################################

#building the contingency table
div_fin<-table(data_monitoring$bioag_surv_monitoring_comb)
#total number of evaluated monitoring
print(paste("Total number of evaluated monitoring =",sum(div_fin)))
#number of monitoring with no information on the founding sources
print(paste("Missing data = ",div_fin[7]))

#chosing a set of colors
colovec<-brewer.pal(6,"Paired")[1:3]

fit<-euler(c(Insects=36,Weeds=68,Fungi=52,"Insects&Fungi"=4,
      "Weeds&Fungi"=2,"Insects&Weeds"=0,"Insects&Weeds&Fungi"=16))
plot(fit,quantities=TRUE)
plot(fit,
     quantities=list(col=c("black"),cex=1.3,font=3),
     edges=list(col=colovec,lwd=7),
     labels=list(col=colovec,cex=1.4),
     fills=list(fill=colovec,alpha=0.3),
     legend=FALSE)

#export to a pdf 6 x 5 inches


###############################################################################
#Figure 12: Venn Diagram
###############################################################################

#building the contingency table
div_fin<-table(data_monitoring$participation_financement)
#total number of evaluated monitoring
print(paste("Total number of evaluated monitoring =",sum(div_fin)))
#number of monitoring with no information on the founding sources
print(paste("Missing data = ",div_fin[1]))

#chosing a set of colors
colovec<-brewer.pal(3,"Dark2")

fit<-euler(c(Academic=23,Public=36,Private=55,"Academic&Public"=7,
             "Academic&Private"=5,"Public&Private"=36,"Academic&Public&Private"=12))
plot(fit,quantities=TRUE)
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