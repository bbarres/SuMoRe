###############################################################################
###############################################################################
#Code for the stacked barplot
###############################################################################
###############################################################################

#loading the packages necessary for the analysis
library(RColorBrewer)
source("dataloading.R")


###############################################################################
#Figure 3: relation between IDH and organization of reistance monitoring
###############################################################################

colovec<-brewer.pal(7,"Dark2")[7:1]

#formating the table necessary for the table
IDH_coex<-table(data_pays$coexistence_pays,
                data_pays$Indice.Dvpt.Humain_classes)
#wer remove the NA class
IDH_coex<-IDH_coex[-c(2),]
colnames(IDH_coex)<-c("[0.5-0.6]","[0.6-0.7]","[0.7-0.8]",
                      "[0.8-0.9]","[0.9-1]")
row.names(IDH_coex)<-c("Academic","Academic\nPrivate",
                       "Private","Academic\nPublic",
                       "Public","Academic\nPrivate\nPublic",
                       "Public\nPrivate")
IDH_coex<-IDH_coex[c(3,1,5,7,4,2,6),]
effectif<-colSums(IDH_coex)
effectif
IDH_coex<-prop.table(IDH_coex,margin=2)*100
IDH_coex

layout(cbind(1,2),widths=c(9,2))  # put legend on bottom 1/8th of the chart
op<-par(mar=c(6.1,5.1,2,0))
temp<-barplot(IDH_coex,col=colovec,border=NA,axes=FALSE,
              axisnames=FALSE,space=0.7,xpd=FALSE)
axis(1,at=temp,labels=FALSE,lwd=4,font=2,
     cex.axis=1.1,padj=0.1,xpd=TRUE,las=1)
text(temp,par("usr")[1]-10,labels=names(effectif),srt=25,
     xpd=TRUE,cex=1.2,font=2)
axis(2,lwd=4,font=2,cex.axis=1.2,las=1)
box(bty="l",lwd=4)
title(main=NULL,xlab="IDH class",ylab="Percentage of countries",cex.lab=2,
      line=3.5,font.lab=2)
text(temp[1],104,paste("n=",effectif[1],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[2],104,paste("n=",effectif[2],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[3],104,paste("n=",effectif[3],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[4],104,paste("n=",effectif[4],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[5],104,paste("n=",effectif[5],sep=""),font=3,cex=1.2,xpd=TRUE)

par(mar=c(4.1,0,0,0))
plot.new()
legend('topleft',legend=row.names(IDH_coex),border="transparent",
       fill=colovec,bty ="n",horiz=FALSE,cex=0.9,y.intersp=2)
par(op)


###############################################################################
#Figure 4: relation between IDH and PPP use type of monitoring
###############################################################################

colovec<-brewer.pal(4,"Accent")[1:4]

#formating the table necessary for the table
IDH_PPPsurv<-table(data_pays$q136_q137_UsagePPP,
                   data_pays$Indice.Dvpt.Humain_classes)
#we
colnames(IDH_PPPsurv)<-c("[0.5-0.6]","[0.6-0.7]","[0.7-0.8]",
                         "[0.8-0.9]","[0.9-1]")
row.names(IDH_PPPsurv)<-c("Not\nmonitored","Don't know",
                          "Sales","Sales and\nSurveys")
IDH_PPPsurv<-IDH_PPPsurv[c(3,4,1,2),]
effectif<-colSums(IDH_PPPsurv)
effectif
IDH_PPPsurv<-prop.table(IDH_PPPsurv,margin=2)*100
IDH_PPPsurv

layout(cbind(1,2),widths=c(9,2))  # put legend on bottom 1/8th of the chart
op<-par(mar=c(6.1,5.1,2,0))
temp<-barplot(IDH_PPPsurv,col=colovec,border=NA,axes=FALSE,
              axisnames=FALSE,space=0.7,xpd=FALSE)
axis(1,at=temp,labels=FALSE,lwd=4,font=2,
     cex.axis=1.1,padj=0.1,xpd=TRUE,las=1)
text(temp,par("usr")[1]-10,labels=names(effectif),srt=25,
     xpd=TRUE,cex=1.2,font=2)
axis(2,lwd=4,font=2,cex.axis=1.2,las=1)
box(bty="l",lwd=4)
title(main=NULL,xlab="IDH class",ylab="Percentage of countries",cex.lab=2,
      line=3.5,font.lab=2)
text(temp[1],104,paste("n=",effectif[1],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[2],104,paste("n=",effectif[2],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[3],104,paste("n=",effectif[3],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[4],104,paste("n=",effectif[4],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[5],104,paste("n=",effectif[5],sep=""),font=3,cex=1.2,xpd=TRUE)

par(mar=c(4.1,0,0,0))
plot.new()
legend('left',legend=row.names(IDH_PPPsurv),border="transparent",
       fill=colovec,bty ="n",horiz=FALSE,cex=0.9,y.intersp=2)
par(op)


###############################################################################
#Figure 5: relation between PPP usage and coexistence of monitoring
###############################################################################

colovec<-brewer.pal(7,"Dark2")[7:1]

#formating the table necessary for the table
PPPsurv_coex<-table(data_pays$coexistence_pays,
                data_pays$q136_q137_UsagePPP)
#wer remove the NA class
PPPsurv_coex<-PPPsurv_coex[-c(2),-c(2)]
colnames(PPPsurv_coex)<-c("Not\nmonitored","Sales","Sales and\nSurveys")
row.names(PPPsurv_coex)<-c("Academic","Academic\nPrivate",
                       "Private","Academic\nPublic",
                       "Public","Academic\nPrivate\nPublic",
                       "Public\nPrivate")
PPPsurv_coex<-PPPsurv_coex[c(3,1,5,7,4,2,6),]
effectif<-colSums(PPPsurv_coex)
effectif
PPPsurv_coex<-prop.table(PPPsurv_coex,margin=2)*100
PPPsurv_coex

layout(cbind(1,2),widths=c(9,2))  # put legend on bottom 1/8th of the chart
op<-par(mar=c(6.1,5.1,2,0))
temp<-barplot(PPPsurv_coex,col=colovec,border=NA,axes=FALSE,
              axisnames=FALSE,space=1.5,xpd=FALSE)
axis(1,at=temp,labels=FALSE,lwd=4,font=2,
     cex.axis=1.1,padj=0.1,xpd=TRUE,las=1)
text(temp,par("usr")[1]-12,labels=names(effectif),srt=0,
     xpd=TRUE,cex=1.2,font=2)
axis(2,lwd=4,font=2,cex.axis=1.2,las=1)
box(bty="l",lwd=4)
title(main=NULL,xlab="PPP monitoring",ylab="Percentage of countries",cex.lab=2,
      line=3.5,font.lab=2)
text(temp[1],104,paste("n=",effectif[1],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[2],104,paste("n=",effectif[2],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[3],104,paste("n=",effectif[3],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[4],104,paste("n=",effectif[4],sep=""),font=3,cex=1.2,xpd=TRUE)
text(temp[5],104,paste("n=",effectif[5],sep=""),font=3,cex=1.2,xpd=TRUE)

par(mar=c(4.1,0,0,0))
plot.new()
legend('topleft',legend=row.names(PPPsurv_coex),border="transparent",
       fill=colovec,bty ="n",horiz=FALSE,cex=0.9,y.intersp=2)
par(op)

