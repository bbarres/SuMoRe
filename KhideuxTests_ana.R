##############################################################################/
##############################################################################/
#Code for the statistical analyses
##############################################################################/
##############################################################################/

#this code was written by Pauline de Jerphanion and Christophe Plantamp
#part of the following code is inspired by information found on the 
#following websites: 
#http://forums.cirad.fr/logiciel-R/viewtopic.php?t=2231 
#http://pbil.univ-lyon1.fr/R/pdf/qrc.pdf
#https://alea.fr.eu.org/git/doc_khi2.git/blob_plain/HEAD:/khi2.pdf
#http://grasland.script.univ-paris-diderot.fr/STAT98/stat98_8/stat98_8.htm
#http://mehdikhaneboubi.free.fr/stat/co/khi_deux_r.html

#loading the packages necessary for the analysis
source("dataloading.R")
library(reshape2)


##############################################################################/
#paragraph 3.1.2: Contingency between NRML and PPP use source####
##############################################################################/

data_pays$coexistence_chiffre<-""
data_pays$coexistence_chiffre<-ifelse(data_pays$coexistence_pays %in% 
                                        c("NA_NA_academic",
                                          "NA_private_NA",
                                          "public_NA_NA"),
                                      "1",
                                      data_pays$coexistence_chiffre)
data_pays$coexistence_chiffre<-ifelse(data_pays$coexistence_pays %in% 
                                        c("NA_private_academic",
                                          "public_NA_academic",
                                          "public_private_NA"),
                                      "2",
                                      data_pays$coexistence_chiffre)
data_pays$coexistence_chiffre<-ifelse(data_pays$coexistence_pays==
                                        "public_private_academic",
                                      "3",
                                      data_pays$coexistence_chiffre)
data_pays$coexistence_chiffre<-ifelse(data_pays$coexistence_pays %in% 
                                        c("NA_NA_NA"),
                                      "0",
                                      data_pays$coexistence_chiffre)
tmp<-data_pays[-which(data_pays$q136_q137_UsagePPP %in% c("not_known")),]
tmp2<-dcast(tmp,coexistence_chiffre~q136_q137_UsagePPP)
chisq.test(tmp2[,3:4],simulate.p.value = TRUE)


##############################################################################/
#paragraph 3.2.1: Conting. between number pest types monitored & RMS cat.####
##############################################################################/

table(data_monitoring$bioag_surv_monitoring_comb)
tmp<-data_monitoring[which(
  data_monitoring$bioag_surv_monitoring_comb!="" & 
    data_monitoring$bioag_surv_monitoring_comb!=
    "NANANA"),]
table(tmp$bioag_surv_monitoring_comb)
tmp$multi_mono_categories<-""
#because of the skewed distribution of the number of pest types monitored, 
#we separate them into 2 categories: only one type of pest monitored and 
#several types of pest monitored
tmp$multi_mono_categories<-ifelse(tmp$bioag_surv_monitoring_comb %in% 
                                    c("001","010","100","1","10"),
                                  "mono","multi")
table(tmp$multi_mono_categories)
tmp2<-dcast(tmp,type_monitoring_par_repondant~multi_mono_categories)
chisq.test(tmp2[,2:3],simulate.p.value = TRUE)


##############################################################################/
#paragraph 3.2.2: Contingency between NRML and RMS objectives####
##############################################################################/

tmp<-data_monitoring[-which(data_monitoring$q_objectives_ %in% 
                              c("","do not know")),]
tmp2<-dcast(tmp,coexistence_chiffre~q_objectives_)
chisq.test(tmp2[,2:4],simulate.p.value = TRUE)


##############################################################################/
#paragraph 3.2.2: Contingency between sampling procedure and RMS categories####
##############################################################################/

tmp<-data_monitoring[-which(
  paste(data_monitoring$q_sampling_locations_randomly,
        data_monitoring$q_sampling_locations_selection_pressure,
        data_monitoring$q_sampling_locations_loss_efficacy,
        data_monitoring$q_sampling_locations_other,
        sep="_")=="0_0_0_0"),]
tmp$random_sampling<-""
tmp$random_sampling<-ifelse(tmp$q_sampling_locations_randomly=="1","1","0")
tmp2<-dcast(tmp,type_monitoring_par_repondant~random_sampling)
chisq.test(tmp2[,2:3])


##############################################################################/
#paragraph 3.2.3: Contingency between type of technique and RMS categories####
##############################################################################/

tmp<-data_monitoring[-which(
  paste(data_monitoring$q_analysis_techniques_biotest_recodé,
        data_monitoring$q_analysis_techniques_biomolecular_recodé,
        data_monitoring$q_analysis_techniques_biochemical_recodé,
        sep="_")=="0_0_0"),]
tmp2<-dcast(tmp,type_monitoring_par_repondant~
              q_analysis_techniques_biotest_recodé+
              q_analysis_techniques_biomolecular_recodé+
              q_analysis_techniques_biochemical_recodé)
chisq.test(tmp2[,2:8],simulate.p.value = TRUE)


##############################################################################/
#paragraph 3.2.4: Contingency between freq. of public. and RMS categories####
##############################################################################/

tmp<-data_monitoring[which(data_monitoring$q_frequence_publications_res!=""),]
tmp$publication<-""
tmp$publication<-ifelse(tmp$q_frequence_publications_res==
                          "not published","0","1")
tmp2<-dcast(tmp,type_monitoring_par_repondant~publication)
chisq.test(tmp2[,2:3],simulate.p.value = TRUE)


##############################################################################/
#paragraph 3.3.1: Contingency between self-funding and RMS categories####
##############################################################################/

tmp$auto_financement<-"0"
tmp$auto_financement[which(
  tmp$type_monitoring_par_repondant=="Public" 
  & (grepl("public",
           tmp$participation_financement_monitoring_nouvelle_version)==TRUE 
     | grepl("Public",
     tmp$participation_financement_monitoring_nouvelle_version)==TRUE))]<-"1"
tmp$auto_financement[which(
  tmp$type_monitoring_par_repondant=="Academic"
  & grepl("Academic",
      tmp$participation_financement_monitoring_nouvelle_version)==TRUE)]<-"1"
tmp$auto_financement[which(
  tmp$type_monitoring_par_repondant=="Private" 
  & grepl("Private",
      tmp$participation_financement_monitoring_nouvelle_version)==TRUE)]<-"1"
table(tmp$auto_financement)
tmp3<-dcast(tmp, type_monitoring_par_repondant~auto_financement)
chisq.test(tmp3[,2:3],simulate.p.value = TRUE)


##############################################################################/
#paragraph 3.3.2: Contingency between off. standardi. and modif. reg. proc.####
##############################################################################/

tmp<-data_monitoring[-which(
  data_monitoring$q_official_formalised_sampling_ %in% c("","do not know") | 
    data_monitoring$q_related_registration_ %in% c("","do not know")),]
tmp2<-dcast(tmp,q_official_formalised_sampling_~q_related_registration_)
chisq.test(tmp2[,2:3])


##############################################################################/
#paragraph 3.3.3: effect of RMS vs variety of stakeholders in topic choice####
##############################################################################/

boxplot(q_nb_participant_choice~type_monitoring_par_repondant,
        data=data_monitoring)
kruskal.test(q_nb_participant_choice~type_monitoring_par_repondant,
             data=data_monitoring)


##############################################################################/
#paragraph 3.3.4: effect of RMS vs number of participants to data analysis####
##############################################################################/

boxplot(q_nb_participant_analysis~type_monitoring_par_repondant,
        data=data_monitoring)
kruskal.test(q_nb_participant_analysis~type_monitoring_par_repondant,
             data=data_monitoring)
mean(na.omit(data_monitoring$q_nb_participant_analysis)) 


##############################################################################/
#paragraph 3.3.4: Contingency between actors in analysis and RMS categories####
##############################################################################/

tmp<-data_monitoring[-which(paste(
  data_monitoring$
    q_analyzes_and_interprets_the_data_Academics,
  data_monitoring$
    q_analyzes_and_interprets_the_data_Advisers,
  data_monitoring$
    q_analyzes_and_interprets_the_data_Companies,
  data_monitoring$
    q_analyzes_and_interprets_the_data_Distributors,
  data_monitoring$
    q_analyzes_and_interprets_the_data_Officials,
  data_monitoring$
    q_analyzes_and_interprets_the_data_other,sep="_")=="0_0_0_0_0_0"),]
tmp$auto_analyse_data<-"0"
tmp$auto_analyse_data[which(
  tmp$type_monitoring_par_repondant=="Public" & 
    tmp$q_analyzes_and_interprets_the_data_Officials=="1")]<-"1"
tmp$auto_analyse_data[which(
  tmp$type_monitoring_par_repondant=="Academic" & 
    tmp$q_analyzes_and_interprets_the_data_Academics=="1")]<-"1"
tmp$auto_analyse_data[which(
  tmp$type_monitoring_par_repondant=="Private" & 
    tmp$q_analyzes_and_interprets_the_data_Companies=="1" | 
    tmp$q_analyzes_and_interprets_the_data_Advisers=="1" | 
    tmp$q_analyzes_and_interprets_the_data_Distributors=="1")]<-"1"
table(tmp$auto_analyse_data)
tmp2<-dcast(tmp,type_monitoring_par_repondant~auto_analyse_data)
chisq.test(tmp2[,2:3],simulate.p.value = TRUE)


##############################################################################/
#END
##############################################################################/