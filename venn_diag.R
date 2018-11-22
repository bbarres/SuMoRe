###############################################################################
###############################################################################
#Code for the Venn diagram figures
###############################################################################
###############################################################################

#loading the packages necessary for the analysis
library(eulerr)
library(RColorBrewer)


###############################################################################
#loading and preparing the AOX resistance data
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
     fills=list(fill=colovec,alpha=0.2),
     legend=FALSE)



