





###############################################################################
#ex-Figure 3C: Support of metadata collection ~ monitoring device
###############################################################################

#choix de la couleur des barres
thecol<-c("grey30","grey50","grey70")

VAR<-xtabs(~data_monitoring$q_moyens_collecte_data+
             data_monitoring$type_monitoring_par_repondant)
VAR<-VAR[,c(1,3,2)]
VAR<-c(VAR[1,],VAR[4,],VAR[3,])

#tracer diagramme en bâton

op<-par(mar=c(7, 5, 2, 2) + 0.1)
graf<-barplot(VAR,
              col=rep(thecol,3),ylim=c(0,70),ylab="Number of responses",
              cex.axis =1.3,cex.lab=1.8,las=1,xaxt="n",yaxt="n",bty="n",
              border=NA,
              space=c(rep(0.1,3),1.2,rep(0.1,2),1.2,rep(0.1,2)),font.lab=2)
axis(1,at=graf[c(2,5,8)],labels=FALSE, lwd=4)
axis(2,at=seq(0,70,10),labels=seq(0,70,10),lwd=4,las=1,font=2,cex.axis=1.1)
box(bty="l",lwd=4)

mtext(c("Electronic","Paper","Electronic\nand Paper"),at=c(1.7,6.1,10.6),
      line=0.4,cex=1.5,side=1,padj=1)
legend(1,70,legend=c("Academic","Governmental","Private"),
       pch=15,col=thecol,bg=thecol,bty="n",cex=1.4,pt.cex=1.6,xpd=TRUE,ncol=3)
mtext("Data collection media", at=6.1, line=4,cex=1.8,side=1,font=2,padj=1)

par(op)


###############################################################################
#ex-Figure 3D: impact sur la procedure d'homologation ~ formalisation du protocole
###############################################################################

#choix de la couleur des barres
thecol<-c("grey70","grey30")

VAR<-xtabs(~data_monitoring$q_official_formalised_sampling_+
             data_monitoring$q_related_registration_)
VAR<-c(VAR[3,c(3,4)],VAR[4,c(3,4)])

#tracer diagramme en bâton

op<-par(mar=c(7, 5, 2, 2) + 0.1)
graf<-barplot(VAR,
              col=thecol[c(1,2,1,2)],ylim=c(0,70),ylab="Number of responses",
              cex.axis =1.3,cex.lab=1.8,las=1,xaxt="n",yaxt="n",bty="n",
              border=NA,
              space=c(rep(0.3,2),1.5,0.3),font.lab=2)
axis(1,at=graf[c(1,3)]+0.65,labels=FALSE, lwd=4)
axis(2,at=seq(0,70,10),labels=seq(0,70,10),lwd=4,las=1,font=2,cex.axis=1.1)
box(bty="l",lwd=4)

mtext(c("Not formalised","Formalised"),at=graf[c(1,3)]+0.65,line=0.4,
      cex=1.5,side=1,padj=1)
legend(-0.2,72,legend=c("Impact on registration procedure :"),
       bty="n",cex=1.4,xpd=TRUE)
legend(5.5,75,legend=c("No","Yes"),
       pch=15,col=thecol,bg=thecol,bty="n",cex=1.4,pt.cex=1.6,xpd=TRUE)
mtext("Formalisation\nof sampling protocol", at=3.5, line=2.5,cex=1.8,
      side=1,font=2,padj=1)

par(op)


###############################################################################
#END OF SUPPLEMENTARY
###############################################################################