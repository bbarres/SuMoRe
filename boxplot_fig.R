##############################################################################/
##############################################################################/
#Code for the boxplot figure
##############################################################################/
##############################################################################/

#this code was written by Pauline De Jerphanion
#loading the packages and the data necessary for the analysis
source("dataloading.R")


##############################################################################/
#Figure 5B: boxplot choice of the themes####
##############################################################################/

#getting the dataset in shape for plotting
tmp<-data_monitoring[which(data_monitoring$q_nb_participant_choice!=""),]
tmp$q_nb_participant_choice<-as.numeric(tmp$q_nb_participant_choice)
tmp$type_monitoring_par_repondant<-factor(tmp$type_monitoring_par_repondant,
                                          levels=c("Academic","Public",
                                                   "Private"))

#here comes the code for the boxplot
op<-par(mar=c(5.1,7,2.1,2.1),font.lab=2)
bx<-boxplot(tmp$q_nb_participant_choice~tmp$type_monitoring_par_repondant,
            horizontal=FALSE,col="transparent",border="transparent",
            xlab="RMS category",
            ylab="Number of actor type paticipating
to the choice of the topics", 
            las=1,cex.lab=1.7,cex=1.5,frame=FALSE,yaxt='n',xaxt='n',
            ylim=c(0,4.3),boxwex=0.3,lwd=0.9)
box(lwd=4,lty=1,bty="l")
axis(2, at=c(0,1,2,3,4),las=2,cex.axis=1.3,lwd=4,font=2)
axis(1, at=c(1,2,3),labels=c("Academic","Governmental","Private"),
     las=1,cex.axis=1.2,lwd=4,font=2)
tmp$qnbpartjit<-jitter(tmp$q_nb_participant_choice,1.01)
stripchart(tmp$qnbpartjit~tmp$type_monitoring_par_repondant,cex=1,
           frame=FALSE,yaxt='n',xaxt='n',ylim=c(0,4),method="jitter",
           offset=1,add=TRUE, vertical=TRUE,pch=19,
           col=adjustcolor("grey",alpha=0.6),jitter=0.25)
par(op)

tempmean<-aggregate(tmp$q_nb_participant_choice,
                    list(as.character(tmp$type_monitoring_par_repondant)),
                    mean)[,2]
points(c(1,2,3),tempmean[c(1,3,2)],pch=25,col="red",bg="red",cex=1)

#export to pdf 6 x 5 inches


##############################################################################/
#Figure 15: boxplot choice of the themes####
##############################################################################/

tmp<-data_monitoring[which(data_monitoring$q_nb_participant_analysis!=""),]
tmp$q_nb_participant_analysis<-as.numeric(tmp$q_nb_participant_analysis)
tmp$type_monitoring_par_repondant<-factor(tmp$type_monitoring_par_repondant,
                                          levels=c("Academic","Public",
                                                   "Private"))

op<-par(mar=c(5.1,7,2.1,2.1),font.lab=2)
bx<-boxplot(tmp$q_nb_participant_analysis~tmp$type_monitoring_par_repondant,
            main="",horizontal=FALSE,
            xlab="Type of resistance monitoring system",
            ylab="Number of participants to the
data analysis and interpretation", 
            las=1,cex.lab=1.5,cex=1.5,frame=FALSE,yaxt='n',xaxt='n',
            ylim=c(0,4.3),boxwex=0.3,lwd=0.9)
box(lwd=4,lty=1,bty="l")
axis(2, at=c(0,1,2,3,4),las=2,cex.axis=1.3,lwd=4,font=2)
axis(1, at=c(1,2,3),labels=c("Academic","Governmental","Private"),
     las=1,cex.axis=1.3,lwd=4,font=2)
tmp$qnbpartjit<-jitter(tmp$q_nb_participant_analysis,1.15)
stripchart(tmp$qnbpartjit~tmp$type_monitoring_par_repondant,cex=0.9,
           frame=FALSE,yaxt='n',xaxt='n',ylim=c(0,4),method="jitter",
           offset=1,add=TRUE, vertical=TRUE,pch=19,
           col=adjustcolor("grey",alpha=0.4))
par(op)

tempmean<-aggregate(tmp$q_nb_participant_analysis,
                    list(as.character(tmp$type_monitoring_par_repondant)),
                    mean)[,2]
points(c(1,2,3),tempmean[c(1,3,2)],pch=25,col="red",bg="red",cex=1)

#export to pdf 6 x 5 inches


##############################################################################/
#END
##############################################################################/