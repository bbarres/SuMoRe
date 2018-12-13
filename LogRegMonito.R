###############################################################################
###############################################################################
#Code for the stacked barplot
###############################################################################
###############################################################################

#loading the packages necessary for the analysis
library(RColorBrewer)
library(visreg)
source("dataloading.R")


###############################################################################
#Logistic regression on the existence of the different type of monitoring
###############################################################################

#formating the data set for the regression
coexreg<-matrix(unlist(strsplit(as.character(data_pays$coexistence_pays),"_")),
                ncol=3,dimnames=list(data_pays$pays,
                                    c("Public","Private","Academic")),
                byrow=TRUE)

coexreg[coexreg %in% c("public","private","academic")]<-1
coexreg[coexreg=="NA"]<-0
coexreg<-as.data.frame(coexreg)
coexreg<-cbind(coexreg,"IDH"=data_pays$Indice.Dvpt.Humain)

#and now the regression, first the public monitoring
IDHpub.mod<-glm(Public~IDH,family="binomial",data=coexreg)
visreg(IDHpub.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Public",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="P(Public monitoring exist)",
       legend=FALSE,ylim=c(0,1))

#regression for the private monitoring
IDHpriv.mod<-glm(Private~IDH,family="binomial",data=coexreg)
visreg(IDHpriv.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Private",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="P(Private monitoring exist)",
       legend=FALSE,ylim=c(0,1))

#regression for the academic monitoring
IDHacad.mod<-glm(Academic~IDH,family="binomial",data=coexreg)
visreg(IDHacad.mod,"IDH",rug=2,scale="response",jitter=TRUE,by="Academic",
       overlay=TRUE,partial=FALSE,xlab="IDH",
       ylab="P(Academic monitoring exist)",
       legend=FALSE,ylim=c(0,1))


###############################################################################
#END
###############################################################################