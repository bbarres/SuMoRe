##############################################################################/
##############################################################################/
#Code for the "donut" plot
##############################################################################/
##############################################################################/

#this code was written by Christophe Plantamp
#loading the packages and data necessary for the analysis
source("dataloading.R")


##############################################################################/
#preparing the dataset####
##############################################################################/

data<-data_pays[,c(1,2,5)]
divCoex<-numeric(dim(data)[1])
Modal<-levels(data$coexistence_pays)
Number<-c(1,0,2,1,2,1,3,2)
Monitoring<-data.frame(Official=numeric(dim(data)[1]),
                       Private=numeric(dim(data)[1]),
                       Research=numeric(dim(data)[1]))
for (i in 1:length(Modal)) {
  divCoex[data$coexistence_pays==Modal[i]]<-Number[i] 
}

data<-cbind(data,divCoex)
AA=xyTable(data$divCoex,data$nb_bioagr_surv)
#removing zero
AA$x<-AA$x[-c(1:2,9)]
AA$y<-AA$y[-c(1:2,9)]
AA$number<-AA$number[-c(1:2,9)]

#counting the number for each 'pest categories' x 'RMS in country categories'
Count_coex<-data.frame(x=numeric(0),y=numeric(0),
                       NA_NA_academic=character(0),
                       NA_NA_NA=character(0),
                       NA_private_academic=character(0),
                       NA_private_NA=character(0),
                       public_NA_academic=character(0),
                       public_NA_NA=character(0),
                       public_private_academic=character(0),
                       public_private_NA=character(0))
Titre<-colnames(Count_coex)
for(i in 1:3){
  for(j in 1:3){
    EXTRACT<-data[data$divCoex==i & data$nb_bioagr_surv==j,]
    Count_coex<-rbind(Count_coex,(c(i,j,table(EXTRACT$coexistence_pays))))
  }
}
colnames(Count_coex)<-Titre
Prop<-Count_coex[,c(1,2,3,8,6,7,5,10,9)]
colnames(Prop)<-c("x","y","Academic","Governmental","Private",
                  "Academic\nGovernmental","Academic\nPrivate",
                  "Governmental\nPrivate",
                  "Academic\nGovernmental\nPrivate") 


##############################################################################/
#Figure 5D: Donut plot####
##############################################################################/

#setting a color palette
thecol<-brewer.pal(7,"Dark2")[7:1]

#here comes the plotting
def.par<-par(no.readonly=TRUE)
layout(cbind(1,2),widths=c(9,3))
op<-par(mar=c(6.1,4.1,1,0.1))
plot(AA$x,AA$y,pch=16,col="white",xlim=c(0.5,3.2),ylim=c(0.5,3.5),
     axes=FALSE,ann=FALSE,
     xaxp=c(1,3,2),yaxp=c(1,3,2),xaxt="n",yaxt="n",bty="n",cex.lab=1.2,
     font.lab=2,asp=1)
title(main=NULL,
      xlab="Number of categories of\nmonitoring system in the country",
      cex.lab=1.5,line=4,font.lab=2,xpd=NA)
title(main=NULL,ylab="Number of pest categories",cex.lab=1.5,
      line=3,font.lab=2,xpd=NA)
box(bty="l",lwd=4)
axis(1,at=1:3,labels=1:3,lwd=4,font=2,cex.axis=1.5)
axis(2,at=1:3,labels=1:3,lwd=4,las=1,font=2,cex.axis=1.5)
rayon<-sqrt(AA$number)
for (i in 1:nrow(Prop)){
  floating.pie(Prop[i,1],Prop[i,2],x=as.numeric(Prop[i,3:9])+1e-7,
               col=thecol,radius=rayon[i]*0.1,border=F)
  draw.circle(Prop[i,1],Prop[i,2],col="white",radius=rayon[i]*0.1-0.07,
              border=F)
}
text(AA$x,AA$y,AA$number,font=2,cex=1.3)

par(mar=c(4.1,0.5,0,0))
plot.new()
legend('topleft',legend=colnames(Prop)[c(5,3,4,8,6,7,9)],
       border="transparent",pch=15,
       col=thecol,bg=thecol,bty="n",horiz=FALSE,cex=0.9,pt.cex=1.4,
       x.intersp=1.5,y.intersp=5)
par(op)
par(def.par)


##############################################################################/
#END
##############################################################################/