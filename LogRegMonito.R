##############################################################################/
##############################################################################/
#Code for the statistical analyses
##############################################################################/
##############################################################################/

#loading the packages necessary for the analysis
library(RColorBrewer)
library(visreg)
source("dataloading.R")


##############################################################################/
#Logistic regression on the existence of the different type of monitoring####
##############################################################################/

#formating the data set for the regression
coexreg<-matrix(unlist(strsplit(as.character(data_pays$coexistence_pays),"_")),
                ncol=3,dimnames=list(data_pays$pays,
                                    c("Public","Private","Academic")),
                byrow=TRUE)

coexreg[coexreg %in% c("public","private","academic")]<-1
coexreg[coexreg=="NA"]<-0
coexreg<-as.data.frame(coexreg)
coexreg<-cbind(coexreg,"IDH"=data_pays$Indice.Dvpt.Humain)

#regression for the academic monitoring
IDHacad.mod<-glm(Academic~IDH,family="binomial",data=coexreg)
summary(IDHacad.mod)
visreg(IDHacad.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Academic",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="P(Academic monitoring exist)",
       legend=FALSE,ylim=c(0,1))

#and now the regression, first the public monitoring
IDHpub.mod<-glm(Public~IDH,family="binomial",data=coexreg)
summary(IDHpub.mod)
visreg(IDHpub.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Public",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="P(Public monitoring exist)",
       legend=FALSE,ylim=c(0,1))

#regression for the private monitoring
IDHpriv.mod<-glm(Private~IDH,family="binomial",data=coexreg)
summary(IDHpriv.mod)
visreg(IDHpriv.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Private",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="P(Private monitoring exist)",
       legend=FALSE,ylim=c(0,1))

#the 3 plot combined
op<-par(mfrow=c(1,3))
visreg(IDHacad.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Academic",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that an Academic monitoring system exists",
       legend=FALSE,ylim=c(0,1),main=list("Academic",cex=2))
box()
visreg(IDHpub.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Public",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that a Governmental monitoring system exists",
       legend=FALSE,ylim=c(0,1),main=list("Governmental",cex=2))
box()
visreg(IDHpriv.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Private",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that a Private monitoring system exists",
       legend=FALSE,ylim=c(0,1),main=list("Private",cex=2))
box()
par(op)

#export to a pdf 10 x 4 inches


##############################################################################/
#Logistic regression on which tools are used to monitor PPP usage####
##############################################################################/

#formating the data set for the regression
usaPPP<-as.character(data_pays$q136_q137_UsagePPP)
usaPPP[usaPPP=="sale"]<-"sale_NA"
#we make the hypothesis that "no" and "not_know" are equivalent to 
#"no PPP monitoring at all"
usaPPP[usaPPP=="no" | usaPPP=="not_known"]<-"NA_NA"

usaPPP<-matrix(unlist(strsplit(usaPPP,"_")),
               ncol=2,dimnames=list(data_pays$pays,c("Sale","Survey")),
               byrow=TRUE)

usaPPP[usaPPP %in% c("sale","survey")]<-1
usaPPP[usaPPP=="NA"]<-0
usaPPP<-as.data.frame(usaPPP)
usaPPP<-cbind(usaPPP,"IDH"=data_pays$Indice.Dvpt.Humain)

#and now the regression, first the sale PPP usage monitoring
IDHsal.mod<-glm(Sale~IDH,family="binomial",data=usaPPP)
summary(IDHsal.mod)
visreg(IDHsal.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Sale",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="P(PPP sale monitoring exist)",
       legend=FALSE,ylim=c(0,1))

#regression for the private monitoring
IDHsurv.mod<-glm(Survey~IDH,family="binomial",data=usaPPP)
summary(IDHsurv.mod)
visreg(IDHsurv.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Survey",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="P(PPP survey monitoring exist)",
       legend=FALSE,ylim=c(0,1))

#the 2 plot combined
op<-par(mfrow=c(1,2),mar=c(5.1,5,4.1,2.1))
visreg(IDHsal.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Sale",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that a PPP\n sale monitoring exists",
       legend=FALSE,ylim=c(0,1),main=list("Sale",cex=2))
box()
visreg(IDHsurv.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Survey",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that a PPP\n survey monitoring exists",
       legend=FALSE,ylim=c(0,1),main=list("Survey",cex=2))
box()
par(op)

#export to a pdf 6.66 x 4 inches


op<-par(mfrow=c(2,3),mar=c(5.1,5,4.1,2.1))
visreg(IDHacad.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Academic",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that an Academic\n monitoring system exists",
       legend=FALSE,ylim=c(0,1),main=list("Academic",cex=2))
box()
visreg(IDHpub.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Public",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that a Governmental\n monitoring system exists",
       legend=FALSE,ylim=c(0,1),main=list("Governmental",cex=2))
box()
visreg(IDHpriv.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Private",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that a Private\n monitoring system exists",
       legend=FALSE,ylim=c(0,1),main=list("Private",cex=2))
box()
visreg(IDHsal.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Sale",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that a PPP\n sale monitoring exists",
       legend=FALSE,ylim=c(0,1),main=list("Sale",cex=2))
box()
visreg(IDHsurv.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Survey",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="Probability that a PPP\n survey monitoring exists",
       legend=FALSE,ylim=c(0,1),main=list("Survey",cex=2))
box()
par(op)
#export to a pdf 11 x 7 inches


##############################################################################/
#END
##############################################################################/