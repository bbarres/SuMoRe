[![DOI](https://zenodo.org/badge/158614822.svg)](https://zenodo.org/badge/latestdoi/158614822)

# Supporting data and code for: Monitoring systems for resistance to plant protection products across the world: Between redundancy and complementarity
*This repository contains the R code used for the data analyses and production of the figures of the related article*

![alt text](https://vy7bgw.db.files.1drv.com/y4mJcCXlpEQlZMq8mdAu7b8K9pAc2N3boQ0iHSWn7cREMnjbGu5gK6GN6kIKv2LL5keC8Owf4SR-42JjveGIyxCv_zIyeiYiNByIBwWocLjOE6ictf_lu-Sjv-hhGo5AMhAkOZydDdqd6wRrOgbOPYguZAP5y9CNEpH_q6z3i4Dj9Zvcyxzi3o-iXj5_cQLBi53AXTp6-cEPoKxU8n3vdG5OQ?width=1584&height=588&cropmode=none)


## Context
In this study, we explore the diversity and features of the pesticide Resistance Monitoring Systems (RMS) of multiple coutries around the world. A survey was realized using a questionnaire send to experts in herbicides, fungicides and insecticides resistance in numerous countries. Based on a classification of RMS into three categories (Academic, Governmental and Private), we investigate the characteristics, structure and interactions between RMS and try to depict the landscape of the pesticide RMS in today globalized world. 


## Datasets
In this section, you will find the list of the datasets used in this study. The data files can be found in the "data" folder. For the data tables, the name of the different variables are listed and explained as well. 

+ **20181211_data_pays.csv:** the first dataset contains information about countries for which there was at least one respondant to the survey. It sums up the number of classes of pests that are monitored, the type of usage information available in the different countries and some information linked to the development level of the countries. 
  + *pays*: name of the country. 
  + *coexistence_pays*: type of monitoring cited at least once by the survey's respondant. 
  + *Indice.Dvpt.Humain*: value of the Human Development Index (HDI) as of 2019. 
  + *Indice.Dvpt.Humain_classes*: the same information as HDI but grouped into classes of 0.1 bin. 
  + *IDH_classes2*: the same information as HDI with 3 classes *[<0.8]*, *[0.8-0.9]* and *[0.9-1.0]*
  + *nb_bioagr_surv*: number of pests surveyed in the country according to the survey's respondant. 
  + *q136_q137_UsagePPP*: type of PPP usage monitoring. This could be made by monitoring sale, by a survey or by both. This is the combined information for all the respondant of one country. 
  
+ **20181114_data_repondant.csv:** the second dataset contains information about the respondant and their answers to questions related to PPP monitoring in their respective coutry. 
  + *q160*: anonymized ID of the respondant. 
  + *q2*: country of the respondant. 
  + *q136-137.recodée*: type of PPP usage monitoring. This could be made by monitoring sale, by a survey or by both. If the respondant did not answer to this question, the field is left empty. The respondant can also answer that he/she doesn't know the information. 
  + *Domaine_competences_repondant*: the type of pesticide classes of which the respondent claims to be knowledgeable. The value can be fungicide (*'fung'*), herbicide (*'herb'*), insecticide (*'ins'*) or any combination of the three classes. Missing data are indicated by *'NA'*. 
  + *mailles_sales_PPP_q142bis*: the within country geographical level at which the sales figures are collected. The value can be: *'country'*, *'region'*, *'sale location'*,*'postal code of the user'*, *'do not know'* and *'other'*. Missing data are indicated by *'NA'*. 
  + *mailles_autres_donnees_usages_PPP_q153bis*: the within country geographical level at which the other method (ie different of sales figures) of PPP monitoring are collected. The value can be: *'country'*, *'region'*, *'sale location'*, *'postal code of the user'*, *'do not know'* and *'other'*. Missing data are indicated by *'NA'*. 
  + *mailles_données_usages_comb*: the combination of the two previous fields. The value can be a combination of: *'country'*, *'region'*, *'sale location'*, *'postal code of the user'*, *'do not know'* and *'other'*. Missing data are indicated by *'NA'*. 
  + *continent*: the continent of the country of the respondant. 
  
+ **20181121_data_monitoring.csv:** the third dataset includes all the information from the questionnaires filled in by the respondants. Some of the fields of this dataset has been transformed from the raw data extracted straight from the questionnaires. For each respondant, there could be up to three entries, one for each category of Resistance Monitoring System (RMS) the respondant fielded information for. 
  + *q160*: anonymized ID of the respondant. 
  + *pays*: country of the respondant. 
  + *coexistence_pays*: combined type of RMS cited by the respondant. The value can be a combination of: *'public'*, *'private'*, *'academic'* and *'NA'* (for absence of one or the other RMS). 
  + *q_objectives_*: what are the objectives of the RMS or combination of RMS. The value can be *'emergence'*, *'frequency of existing resistance'*, *'both'* and *'do not know'*. 
  + *q_number_themes_*: number of themes investigated per year in the country according to the respondant. When the respondant didn't answer, the field is let empty. 
  + *bioag_surv_monitoring_comb*: pest categories monitored in the country according to the respondant. *'1'* = insects, *'10'* = weeds, *'100'* = fungi, *'101'* = fungi and insects, *'110'* = fungi + weeds, *'111'* = fungi + weeds + insects and *'NANANA'* = no response. 
  + *q_related_registration_*: is the RMS related to the registration process? Possible values are *'yes'*, *'no'* or *'do not know'*. 
  + *q_analysis_techniques_biotest_recodé*: can biossays be used for the monitoring? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_analysis_techniques_biomolecular_recodé*: can biomolecular assays be used for the monitoring? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_analysis_techniques_biochemical_recodé*: can biochemical assays be used for the monitoring? Possible values are *'0'* = no and *'1'* = yes. 
  + *nb_analysis_techniques*: the number of different categories of assays used for the monitoring system, according to the respondant. 
  + *q_official_formalised_sampling_*: Is there on official formalization of the sampling procedure for the RMS according to the respondant? Possible values are *'yes'*, *'no'* or *'do not know'*. 
  + *q_analyzes_and_interprets_the_data_Officials*: Are governmental involved in the analyzis and interpretation of the data produce by the RMS, according to the respondant? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_analyzes_and_interprets_the_data_Academics*: Are academics involved in the analyzis and interpretation of the data produce by the RMS, according to the respondant? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_analyzes_and_interprets_the_data_Companies*: Are private involved in the analyzis and interpretation of the data produce by the RMS, according to the respondant? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_analyzes_and_interprets_the_data_Advisers*: Are advisers involved in the analyzis and interpretation of the data produce by the monitoring system? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_analyzes_and_interprets_the_data_Distributors*: Are distributors involved in the analyzis and interpretation of the data produce by the monitoring system? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_analyzes_and_interprets_the_data_other*: Are other stakeholders involved in the analyzis and interpretation of the data produce by the RMS, according to the respondant? Possible values are *'0'* = no and *'1'* = yes. 
  + *participation_financement_monitoring_nouvelle_version*: categories of stakeholders involved in financing the RMS according to the respondant. Possible values are *'Academic'*, *'Private'*, *'Public'* or any combinations of the previous values. The field is left empty if the information was missing. 
  + *profil_repondant*: which category of stakeholder the respondant belongs to? Possible values are *'Academic'*, *'Company'*, *'Official'* or *'Other'*. 
  + *q_sampling_locations_randomly*: Are the locations for the RMS were sampled randomly, according to the respondant? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_sampling_locations_selection_pressure*: Are the locations for the RMS were based on selection pressure, according to the respondant? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_sampling_locations_loss_efficacy*: Are the locations for the RMS were sampled based on the observation of a loss of efficacy in the field, according to the respondant? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_sampling_locations_other*: Are the locations for the RMS were sampled in a based on other strategy, according to the respondant? Possible values are *'0'* = no and *'1'* = yes. 
  + *q_moyens_collecte_data*: which media are used to record the data? Possible values are *'paper'*, *'electronic'*, missing data *'NA'* or any combination of the previous values. 
  + *q_frequence_publications_res*: how often are the results published? Possible value are *'during cropping season'* if the results are published during the cropping season, *'yearly'* if the results are published once a year, *'less frequently'* if the results are published less than once a year, *'other'* if the results are published at another frequency and *'not published'* if the results are never made publicly available, according to the respondant. Missing value are indicated with *'NA'*. 
  + *type_monitoring_par_repondant*: which type of RMS the entry was completed for by the respondant. Possible values are *'Academic'*, *'Private'* or *'Public'*. 
  + *coexistence_chiffre*: Number of coexisting RMS catefories in the country according to the respondant. 
  + *q_nb_participant_choice*: Number of different categories of stakeholders that take part in the choice of the themes included in the RMS. 
  + *q_nb_participant_analysis*: Number of stakeholders that take part in the analyses of the RMS. 


## R scripts
In this section, you will find the list of the different scripts used in the article with a brief description of their purpose. 
+ **dataloading.R:** the script to load the different datasets and the necessary package in the environment. 
+ **LogRegTests_ana.R:** the script used for the logistic regression analyses. It also contains the code for the Figures S1 and S2. 
+ **KhideuxTests_ana.R:** the script used for the chisquare tests used throughout the manuscript. 
+ **maprespondant_fig.R:** the script used for producing the map Figure 2A. 
+ **barplot_fig.R:** the script used for producing the barplot Figure 2B, Figure 2C, Figure 2D, Figure 4C, Figure 4D and Figure 5C. 
+ **venndiag_fig.R:** the script used for producing the Venn's diagram Figure 4A and Figure 5A.
+ **stacked_fig.R:** the script used for producing the stackedbar Figure 3A, Figure 3B, Figure 3C and Figure 4B. 
+ **boxplot_fig.R:** the script used for producing the boxplot Figure 5B. 
+ **donutplot_fig.R:** the script used for producing the donutplot Figure 5D. 


## Authors
Benoit Barrès wrote the first draft of **dataloading.R**, **LogRegTests_ana.R**, **venndiag_fig.R** and **stacked_fig.R**. Christophe Plantamp wrote the first draft of **barplot_fig.R** and **donutplot_fig.R**. Pauline de Jerphanion wrote the first draft of  **KhideuxTests_ana.R**, **maprespondant_fig.R** and **boxplot_fig.R**. Benoit Barrès revised, edited, homogenized and commented the final version of the code and handled the github repository.


## Citation
You can cite cite the related study as follow: 
+ R4P [Monitoring systems for resistance to plant protection products across the world: Between redundancy and complementarity. *Pest Management Science*, 77: 2697–2709, 2021. doi:10.1002/ps.6275.](https://onlinelibrary.wiley.com/doi/full/10.1002/ps.6275)

If you want to use (some of) the code found on this page or if you want to cite this repository: 
+ Benoit Barrès, Christophe Plantamp and Pauline de Jerphanion. [Supporting data and code for: Monitoring systems for resistance to plant protection products across the world: Between redundancy and complementarity. Zenodo; 2020.](https://zenodo.org/badge/latestdoi/158614822)
