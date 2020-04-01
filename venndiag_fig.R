##############################################################################/
##############################################################################/
#Code for the Venn diagram figures
##############################################################################/
##############################################################################/

#loading the packages necessary for the analysis
library(eulerr)
library(RColorBrewer)
library(devtools)
install_github('johannesbjork/LaCroixColoR')
library(LaCroixColoR)
source("dataloading.R")


##############################################################################/
#Figure 4A: Venn Diagram####
##############################################################################/

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


##############################################################################/
#Figure 5A: Venn Diagram####
##############################################################################/

#building the contingency table
div_fin<-table(data_monitoring$participation_financement)
#total number of evaluated monitoring
print(paste("Total number of evaluated monitoring =",sum(div_fin)))
#number of monitoring with no information on the founding sources
print(paste("Missing data = ",div_fin[1]))

#computing the pivot table for source of funding of the different type of 
#monitoring
Kpil<-table(data_monitoring$participation_financement_monitoring,
            data_monitoring$type_monitoring_par_repondant)
#removing the resistance monitoring system without any information type
Kpil<-Kpil[c(-1),]
#
colnames(Kpil)<-list("Academic","Private","Governmental")
rownames(Kpil)<-list("Academic","Academic&Private","Private",
                     "Governmental","Academic&Governmental",
                     "Governmental&Private","Academic&Governmental&Private")
Kpil<-Kpil[c(1,4,3,5,2,6,7),]
Kpil<-cbind(Kpil,"All_RMS"=rowSums(Kpil))
Kpil

#chosing a set of colors
colovec<-brewer.pal(7,"Dark2")[c(5,6,7)]

#source of funding for all types of resistance monitoring system 
fit<-euler(c(Academic=23,
             Governmental=36,
             Private=55,
             "Academic&Governmental"=7,
             "Academic&Private"=5,
             "Governmental&Private"=36,
             "Academic&Governmental&Private"=12),
           shape=c("ellipse"),control=list(extraopt_threshold=0))
plot(fit,
     quantities=list(col=c("black"),cex=2.5,font=2),
     edges=list(col=colovec,lwd=13),
     labels=list(col="transparent",cex=1.4),
     fills=list(fill=colovec,alpha=0.3),
     legend=list(labels=list("","",""),nrow=3,alpha=1,cex=1.5,vgap=3,
                 col.text="transparent"))
#export to a pdf 8 x 6 inches

#source of funding for Academic resistance monitoring system 
fitAca<-euler(c(Academic=23,
                Governmental=12,
                Private=12,
                "Academic&Governmental"=3,
                "Academic&Private"=2,
                "Governmental&Private"=18,
                "Academic&Governmental&Private"=3),
              shape=c("ellipse"),control=list(extraopt_threshold=0))
plot(fitAca,
     quantities=list(col=c("black"),cex=2.5,font=2),
     edges=list(col=colovec,lwd=10),
     labels=FALSE,
     fills=list(fill=colovec,alpha=0.3),
     legend=FALSE)
#export to a pdf 4 x 4 inches

#source of funding for Academic resistance monitoring system 
fitPriv<-euler(c(Academic=0,
                 Governmental=1,
                 Private=39,
                 "Academic&Governmental"=0,
                 "Academic&Private"=0,
                 "Governmental&Private"=8,
                 "Academic&Governmental&Private"=0),
               shape=c("ellipse"),control=list(extraopt_threshold=0))
plot(fitPriv,
     quantities=list(col=c("black"),cex=2.5,font=2),
     edges=list(col=colovec,lwd=10),
     labels=FALSE,
     fills=list(fill=colovec,alpha=0.3),
     legend=FALSE)
#export to a pdf 4 x 4 inches

#source of funding for Academic resistance monitoring system 
fitGov<-euler(c(Academic=0,
                Governmental=23,
                Private=4,
                "Academic&Governmental"=4,
                "Academic&Private"=3,
                "Governmental&Private"=10,
                "Academic&Governmental&Private"=9),
             shape=c("ellipse"),control=list(extraopt_threshold=0))
plot(fitGov,
     quantities=list(col=c("black"),cex=2.5,font=2),
     edges=list(col=colovec,lwd=10),
     labels=FALSE,
     fills=list(fill=colovec,alpha=0.3),
     legend=FALSE)
#export to a pdf 4 x 4 inches


##############################################################################/
#END
##############################################################################/