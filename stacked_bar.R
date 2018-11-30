###############################################################################
###############################################################################
#Code for the stacked barplot
###############################################################################
###############################################################################

#loading the packages necessary for the analysis
library(RColorBrewer)
source("dataloading.R")


###############################################################################
#loading and preparing the AOX resistance data
###############################################################################

colovec<-brewer.pal(7,"Dark2")

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


layout(cbind(1,2),widths=c(9,2))  # put legend on bottom 1/8th of the chart
op<-par(mar=c(6.1,6.1,2,0))
temp<-barplot(IDH_coex,col=colovec,border=NA,axes=FALSE,
              axisnames=FALSE,space=0.7,xpd=FALSE)
axis(1,at=temp,labels=FALSE,lwd=4,font=2,
     cex.axis=0.8,padj=0.1,xpd=TRUE,las=1)
text(temp,par("usr")[1]-10,labels=names(effectif),srt=25,
     xpd=TRUE,cex=1.1,font=2)
axis(2,lwd=4,font=2,cex.axis=1.1,las=1)
box(bty="l",lwd=4)
title(main=NULL,xlab="IDH class",ylab="Percentage of countries",cex.lab=2,
      line=4)
text(temp[1],104,paste("n=",effectif[1],sep=""),font=3,cex=1.5,xpd=TRUE)
text(temp[2],104,paste("n=",effectif[2],sep=""),font=3,cex=1.5,xpd=TRUE)
text(temp[3],104,paste("n=",effectif[3],sep=""),font=3,cex=1.5,xpd=TRUE)
text(temp[4],104,paste("n=",effectif[4],sep=""),font=3,cex=1.5,xpd=TRUE)
text(temp[5],104,paste("n=",effectif[5],sep=""),font=3,cex=1.5,xpd=TRUE)

par(mar=c(4.1,0,0,0))
# c(bottom, left, top, right)
plot.new()
legend('topleft',legend=row.names(IDH_coex),border="transparent",
       fill=colovec,bty ="n",horiz=FALSE,cex=0.9,y.intersp=2)
par(op)

