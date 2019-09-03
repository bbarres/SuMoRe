##############################################################################/
##############################################################################/
#Code for the boxplot figure
##############################################################################/
##############################################################################/

#this code was written by Pauline De Jerphanion
#loading the packages necessary for the analysis
library(RColorBrewer)
library(reshape2)
#and the data
source("dataloading.R")


##############################################################################/
#Figure 4B: boxplot choice of the themes####
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
            xlab="Monitoring system category",
            ylab="Number of participants\nto the choice of the topics", 
            las=1,cex.lab=2,cex=1.5,frame=FALSE,yaxt='n',xaxt='n',
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










#from here, this is the code for statistical analyses using chisquare tests


#####Test - Figure 11 3.2.5.
table(data_monitoring$bioag_surv_monitoring_comb)
tmp<-data_monitoring[which(data_monitoring$bioag_surv_monitoring_comb!="" & 
                             data_monitoring$bioag_surv_monitoring_comb!="NANANA"),]
table(tmp$bioag_surv_monitoring_comb)
tmp$multi_mono_categories<-""
tmp$multi_mono_categories<-ifelse(tmp$bioag_surv_monitoring_comb %in% c("001","010","100"), "mono","multi")
table(tmp$multi_mono_categories)
tmp2<-dcast(tmp,type_monitoring_par_repondant~multi_mono_categories)
xtest<-chisq.test(tmp2[,2:3],simulate.p.value = TRUE)
xtest
xtest$observed
xtest$expected
xtest$residuals
#http://forums.cirad.fr/logiciel-R/viewtopic.php?t=2231 
#http://pbil.univ-lyon1.fr/R/pdf/qrc.pdf
#https://alea.fr.eu.org/git/doc_khi2.git/blob_plain/HEAD:/khi2.pdf
#http://grasland.script.univ-paris-diderot.fr/STAT98/stat98_8/stat98_8.htm
#http://mehdikhaneboubi.free.fr/stat/co/khi_deux_r.html

####Test - Figure 14 3.3.3
#on sélectionne les lignes où il y a au moins une réponse sur les variables analyses et interprétation des données
tmp<-data_monitoring[-which(paste(data_monitoring$q_analyzes_and_interprets_the_data_Academics,
                                  data_monitoring$q_analyzes_and_interprets_the_data_Advisers,
                                  data_monitoring$q_analyzes_and_interprets_the_data_Companies,
                                  data_monitoring$q_analyzes_and_interprets_the_data_Distributors,
                                  data_monitoring$q_analyzes_and_interprets_the_data_Officials,
                                  data_monitoring$q_analyzes_and_interprets_the_data_other,sep="_")=="0_0_0_0_0_0"),]
tmp$auto_analyse_data<-"0"
tmp$auto_analyse_data[which(tmp$type_monitoring_par_repondant=="Public" & tmp$q_analyzes_and_interprets_the_data_Officials=="1")]<-"1"
tmp$auto_analyse_data[which(tmp$type_monitoring_par_repondant=="Academic" & tmp$q_analyzes_and_interprets_the_data_Academics=="1")]<-"1"
tmp$auto_analyse_data[which(tmp$type_monitoring_par_repondant=="Private" & tmp$q_analyzes_and_interprets_the_data_Companies=="1" | tmp$q_analyzes_and_interprets_the_data_Advisers=="1" | tmp$q_analyzes_and_interprets_the_data_Distributors=="1")]<-"1"
#verification
#tmp[which(tmp$auto_analyse_data=="1" & tmp$type_monitoring_par_repondant=="Private"),c("type_monitoring_par_repondant", "q_analyzes_and_interprets_the_data_Companies","q_analyzes_and_interprets_the_data_Advisers","q_analyzes_and_interprets_the_data_Distributors", "auto_analyse_data")]
table(tmp$auto_analyse_data)
tmp2<-dcast(tmp,type_monitoring_par_repondant~auto_analyse_data)
xtest<-chisq.test(tmp2[,2:3],simulate.p.value = TRUE)

####Test - 3.2.4
tmp<-data_monitoring[which(data_monitoring$participation_financement_monitoring_nouvelle_version!=""),]
#prive vs. non prive
tmp$financement_private<-""
tmp$financement_private<-ifelse(grepl("Private", tmp$participation_financement_monitoring_nouvelle_version),"1","0")
table(tmp$financement_private)
tmp2<-dcast(tmp,type_monitoring_par_repondant~financement_private)
xtest<-chisq.test(tmp2[,2:3],simulate.p.value = TRUE)
#auto vs. non auto
tmp$auto_financement<-"0"
tmp$auto_financement[which(tmp$type_monitoring_par_repondant=="Public" 
                           & (grepl("public",tmp$participation_financement_monitoring_nouvelle_version)==TRUE 
                              | grepl("Public",tmp$participation_financement_monitoring_nouvelle_version)==TRUE))]<-"1"
tmp$auto_financement[which(tmp$type_monitoring_par_repondant=="Academic" 
                           & grepl("Academic",tmp$participation_financement_monitoring_nouvelle_version)==TRUE)]<-"1"
tmp$auto_financement[which(tmp$type_monitoring_par_repondant=="Private" 
                           & grepl("Private",tmp$participation_financement_monitoring_nouvelle_version)==TRUE)]<-"1"
table(tmp$auto_financement)
#verification
#tmp[which(tmp$auto_financement=="0"& tmp$type_monitoring_par_repondant=="Academic"),c("type_monitoring_par_repondant","participation_financement_monitoring_nouvelle_version", "auto_financement"),]
tmp3<-dcast(tmp, type_monitoring_par_repondant~auto_financement)
xtest<-chisq.test(tmp3[,2:3],simulate.p.value = TRUE)


####Test - Figure 10 3.2.3
tmp<-data_monitoring[which(data_monitoring$q_frequence_publications_res!=""),]
tmp$publication<-""
tmp$publication<-ifelse(tmp$q_frequence_publications_res == "not published","0","1")
tmp2<-dcast(tmp,type_monitoring_par_repondant~publication)
xtest<-chisq.test(tmp2[,2:3],simulate.p.value = TRUE)#/!\ effectifs trop faibles ?

####Test - figure 9 3.2.2 bis
tmp<-data_monitoring[-which(data_monitoring$q_official_formalised_sampling_ %in% c("","do not know") | data_monitoring$q_related_registration_ %in% c("","do not know")),]
tmp2<-dcast(tmp,q_official_formalised_sampling_~q_related_registration_)
chisq.test(tmp2[,2:3])

####Test -3.2.2. 
tmp<-data_monitoring[-which(paste(data_monitoring$q_analysis_techniques_biotest_recodé,
                                  data_monitoring$q_analysis_techniques_biomolecular_recodé,
                                  data_monitoring$q_analysis_techniques_biochemical_recodé,sep="_")=="0_0_0"),]
tmp2<-dcast(tmp,type_monitoring_par_repondant~q_analysis_techniques_biotest_recodé+q_analysis_techniques_biomolecular_recodé+q_analysis_techniques_biochemical_recodé)
chisq.test(tmp2[,2:8],simulate.p.value = TRUE)#/!\ effectifs trop faibles ?
tmp3<-dcast(tmp,type_monitoring_par_repondant~nb_analysis_techniques)
chisq.test(tmp3[,2:4])

####Test -figure 7 3.2.1.
tmp<-data_monitoring[-which(paste(data_monitoring$q_sampling_locations_randomly,
                                  data_monitoring$q_sampling_locations_selection_pressure,
                                  data_monitoring$q_sampling_locations_loss_efficacy,
                                  data_monitoring$q_sampling_locations_other,sep="_")=="0_0_0_0"),]
tmp3<-dcast(tmp,type_monitoring_par_repondant~q_sampling_locations_randomly+
              q_sampling_locations_selection_pressure+
              q_sampling_locations_loss_efficacy+
              q_sampling_locations_other)#/!\ effectifs trop faibles ?
chisq.test(tmp3[,2:15],simulate.p.value = TRUE)
tmp$random_sampling<-""
tmp$random_sampling<-ifelse(tmp$q_sampling_locations_randomly=="1","1","0")
tmp2<-dcast(tmp,type_monitoring_par_repondant~random_sampling)
chisq.test(tmp2[,2:3])

####Test -3.2.1
tmp<-data_monitoring[-which(data_monitoring$q_objectives_ %in% c("","do not know")),]
#test khideux ou équivalent sur la coexistence des monitorings codé en diversité 1,2,3 
#en fonction des objectifs du monitoring
tmp2<-dcast(tmp,coexistence_chiffre~q_objectives_)
chisq.test(tmp2[,2:4],simulate.p.value = TRUE)
#test khideux coexistence avec acad et coex sans acad en fct des objectifs
tmp$coexistence_acad<-""
tmp$coexistence_acad<-ifelse(grepl("academic",tmp$coexistence_pays)==TRUE,"1","0")
tmp3<-dcast(tmp,q_objectives_ ~ coexistence_acad)#/!\ effectifs trop faibles ?

####Test -3.1.3.
#khideu ou équivalent sur différence de distribution d'échelle entre sale et survey
table(data_repondants$mailles_sales_PPP_q142bis)
table(data_repondants$mailles_autres_donnees_usages_PPP_q153bis)
