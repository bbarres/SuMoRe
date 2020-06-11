##############################################################################/
##############################################################################/
#Code for the barplot (absolute values)
##############################################################################/
##############################################################################/

#this code was written by Christophe Plantamp
#loading the packages necessary for the analysis
source("dataloading.R")


##############################################################################/
#Figure 2B: Aera of expertise of the respondants####
##############################################################################/

#picking a set of colors
thecol<-brewer.pal(9,"GnBu")[6]
#preparing the dataset for the plot
VAR<-table(data_repondants$Domaine_competences_repondant)
names(VAR)<-c("Fungicide","Fungicide\nHerbicide\nInsecticide",
              "Fungicide\nInsecticide","Herbicide","Insecticide")
VAR<-VAR[c(1,4,5,3,2)]

#ploting the barplot
op<-par(mar=c(8, 5, 2, 2) + 0.1,xpd=TRUE)
graf<-barplot(VAR,space=0.8,col=thecol,ylim=c(0,70),
              ylab="Number of respondents",
              cex.axis =1.3,cex.lab=2,las=1,xaxt="n",
              yaxt="n",bty="n",border=NA,font.lab=2)
axis(1,at=graf[1:5],labels=FALSE,lwd=4)
axis(2,at=seq(0,70,10),labels=seq(0,70,10),lwd=4,las=1,font=2,cex.axis=1.1)
title(main=NULL,xlab="Area of expertise",cex.lab=2,line=6,font.lab=2)
box(bty="l",lwd=4)
text(labels=names(VAR),x=graf[1:5],y=rep(-12,5),cex=1.1,font=2,srt=40)
par(op)

#export to a pdf 6 x 5 inches


##############################################################################/
#Figure 2C: Number of system described####
##############################################################################/

#picking a set of colors
thecol<-brewer.pal(9,"BuPu")[6]
#preparing the dataset for the plot
VAR<-as.table(c(106,68,76))
names(VAR)<-c("Academic","Governmental","Private")

#ploting the barplot
op<-par(mar=c(6.5, 6.5, 2, 2) + 0.1,xpd=TRUE)
graf<-barplot(VAR,space=2,col=thecol,ylim=c(0,120),
              ylab="Number of\nRMS described",
              cex.axis =1.3,cex.lab=2,las=1,xaxt="n",
              yaxt="n",bty="n",border=NA,font.lab=2)
axis(1,at=graf[1:3],labels=FALSE,lwd=4)
axis(2,at=seq(0,120,20),labels=seq(0,120,20),lwd=4,las=1,font=2,cex.axis=1.1)
title(main=NULL,xlab="RMS category",cex.lab=2,line=4,font.lab=2)
box(bty="l",lwd=4)
text(labels=names(VAR),x=graf[1:5],y=rep(-12,5),cex=1.1,font=2,srt=0)
par(op)

#export to a pdf 6 x 5 inches


##############################################################################/
#Figure 2D: Number of countries with at least one monitoring system of type####
##############################################################################/

#picking a set of colors
thecol<-brewer.pal(9,"YlGnBu")[8]
#preparing the dataset for the plot
VAR<-as.table(c(39,26,32))
names(VAR)<-c("Academic","Governmental","Private")

#ploting the barplot
op<-par(mar=c(6.5, 7.5, 2, 2) + 0.1,xpd=TRUE)
graf<-barplot(VAR,space=2,col=thecol,ylim=c(0,50),
              ylab="Number of countries with at
least one RMS in this category",
              cex.axis =1.3,cex.lab=1.7,las=1,xaxt="n",
              yaxt="n",bty="n",border=NA,font.lab=2)
axis(1,at=graf[1:3],labels=FALSE,lwd=4)
axis(2,at=seq(0,50,10),labels=seq(0,50,10),lwd=4,las=1,font=2,cex.axis=1.1)
title(main=NULL,xlab="RMS category",cex.lab=2,line=4,font.lab=2)
box(bty="l",lwd=4)
text(labels=names(VAR),x=graf[1:5],y=rep(-4.5,5),cex=1.1,font=2,srt=0)
par(op)

#export to a pdf 6 x 5 inches


##############################################################################/
#Figure 4C: Sampling choice criteria method ~ monitoring device####
##############################################################################/

#picking a set of colors
thecol<-brewer.pal(11,"PiYG")[c(2,3,4)]

#preparing the dataset for the plotting
var1<-tapply(data_monitoring$q_sampling_locations_loss_efficacy,
             data_monitoring$type_monitoring_par_repondant,sum)
var2<-tapply(data_monitoring$q_sampling_locations_selection_pressure,
             data_monitoring$type_monitoring_par_repondant,sum)
var3<-tapply(data_monitoring$q_sampling_locations_randomly,
             data_monitoring$type_monitoring_par_repondant,sum)
table<-data.frame(Facteur1=rep(levels(
   data_monitoring$type_monitoring_par_repondant),3),
                  Facteur2=c(rep("Loss of efficacy",3),
                             rep("According to PPP use",3),
                             rep("Randomly",3)),
                  Count=c(var1,var2,var3))
#reordering the categories
table<-table[c(1,4,7,3,6,9,2,5,8),]
#preparing the labels for the plot
LEVEL<-data_monitoring$type_monitoring_par_repondant
levels(LEVEL)[3]<-"Governmental"

#plotting the barplot
op<-par(mar=c(6.5, 5, 2, 2) + 0.1)
graf<-barplot(table$Count,
              col=thecol,ylim=c(0,70),ylab="Number of responses",
              cex.axis =1.3,cex.lab=2,las=1,yaxt="n",bty="n",border=NA,
              space=c(rep(0.1,3),1.2,rep(0.1,2),1.2,rep(0.1,2)),font.lab=2)
axis(1,at=graf[c(2,5,8)],labels=FALSE, lwd=4)
axis(2,at=seq(0,70,10),labels=seq(0,70,10),lwd=4,las=1,font=2,cex.axis=1.1)
box(bty="l",lwd=4)
mtext(levels(LEVEL)[c(1,3,2)],at=c(1.7,6.1,10.6),line=1.5,cex=1.5,side=1)
mtext("Monitoring system category",at=6.1,line=3,cex=2,side=1,font=2,padj=1)
legend(4,75,legend=c("Based on loss of efficacy",
                     "Based on PPP use",
                     "Randomly"),
       pch=15,col=thecol,bg=thecol,bty="n",cex=1.3,pt.cex=1.4,xpd=TRUE,
       y.intersp=1.8)
par(op)

#export to a pdf 6 x 5 inches


##############################################################################/
#Figure 4D: Frequence de publication ~ monitoring device####
##############################################################################/

#picking a set of colors
thecol<-brewer.pal(5,"Set1")

#preparing the dataset for the plotting
VAR<-xtabs(~data_monitoring$q_frequence_publications_res+
              data_monitoring$type_monitoring_par_repondant)
VAR<-c(VAR[c(3,1,5,2,4),1],VAR[c(3,1,5,2,4),3],VAR[c(3,1,5,2,4),2])+0.1

#plotting the barplot
op<-par(mar=c(6, 5, 1, 1) + 0.1)
graf<-barplot(VAR,col=rep(thecol,3),ylim=c(0,70),
              ylab="Number of responses",cex.axis =1.3,cex.lab=2,
              las=1,xaxt="n",yaxt="n",bty="n",border=NA,
              space=c(rep(0.1,5),1.2,rep(0.1,4),1.2,rep(0.1,4)),
              font.lab=2)

axis(1,at=graf[c(3,8,13)],labels=FALSE, lwd=4)
axis(2,at=seq(0,70,10),labels=seq(0,70,10),lwd=4,las=1,font=2,cex.axis=1.1)
box(bty="l",lwd=4)
mtext(c("Academic","Governmental","Private"),at=graf[c(3,8,13)],
      line=1.5,cex=1.5,side=1)
mtext("Monitoring system category", at=9.4,line=3,cex=2,side=1,
      font=2,padj=1)
legend(8,75,legend=c("Not published","During cropping season",
                       "Yearly","Less frequently","Other"),
       pch=15,col=thecol,bg=thecol,bty="n",cex=1.3,pt.cex=1.6,xpd=TRUE,
       ncol=1,x.intersp=1,y.intersp=2.5)
par(op)

#export to a pdf 6 x 5 inches


##############################################################################/
#Figure 5C: Number of respondant by types of monitoring and respondant####
##############################################################################/

#picking a set of colors
thecol<-brewer.pal(11,"PRGn")[c(11,10,9)]

#preparing the dataset for the plotting
var1<-tapply(data_monitoring$q_analyzes_and_interprets_the_data_Academics,
             data_monitoring$type_monitoring_par_repondant,sum)
var2<-tapply(data_monitoring$q_analyzes_and_interprets_the_data_Officials,
             data_monitoring$type_monitoring_par_repondant,sum)
var3<-tapply(data_monitoring$q_analyzes_and_interprets_the_data_Companies,
             data_monitoring$type_monitoring_par_repondant,sum)
var4<-tapply(data_monitoring$q_analyzes_and_interprets_the_data_Advisers,
             data_monitoring$type_monitoring_par_repondant,sum)
var5<-tapply(data_monitoring$q_analyzes_and_interprets_the_data_Distributors,
             data_monitoring$type_monitoring_par_repondant,sum)
var6<-var3+var4+var5
table<-data.frame(Facteur1=rep(levels(
   data_monitoring$type_monitoring_par_repondant),3),
                  Facteur2=c(rep("Academics",3),rep("Officials",3),
                             rep("Privates",3)),
                  Count=c(var1,var2,var6))
table<-table[c(1,4,7,3,6,9,2,5,8),]
#preparing the labels for the plot
LEVEL<-data_monitoring$type_monitoring_par_repondant
levels(LEVEL)[3]<-"Governmental"

#plotting the barplot
op<-par(mar=c(6.5, 5, 1, 1) + 0.1)
graf<-barplot(table$Count,
              col=thecol,ylim=c(0,100),ylab="Number of responses",
              cex.axis =1.3,cex.lab=1.8,las=1,yaxt="n",bty="n",border=NA,
              space=c(rep(0.1,3),1.2,rep(0.1,2),1.2,rep(0.1,2)),font.lab=2)
axis(1,at=graf[c(2,5,8)],labels=FALSE, lwd=4)
axis(2,at=seq(0,100,10),labels=seq(0,100,10),lwd=4,las=1,font=2,cex.axis=1.1)
box(bty="l",lwd=4)
mtext(levels(LEVEL)[c(1,3,2)],at=c(1.7,6.1,10.6),line=1.5,cex=1.5,side=1)
mtext("Monitoring system category", at=6.1, line=3,cex=2,side=1,font=2,
      padj=1)
legend(5,105,legend=c("Academic experts",
                      "Governmental experts",
                      "Private experts"),
       y.intersp=1.8,
       pch=15,col=thecol,bg=thecol,bty="n",cex=1.4,pt.cex=1.6,xpd=TRUE)
par(op)

#export to a pdf 6 x 5 inches


##############################################################################/
#END
##############################################################################/