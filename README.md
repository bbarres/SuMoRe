[![DOI](https://zenodo.org/badge/158614822.svg)](https://zenodo.org/badge/latestdoi/158614822)

# Supporting code and data for: Picture of Plant Protection Products resistance monitoring over the world: Between diversity and complementarity
*This repository contains the R code used for the data analyses and production of the figures of the related article*

![alt text](https://vy7bgw.db.files.1drv.com/y4mJcCXlpEQlZMq8mdAu7b8K9pAc2N3boQ0iHSWn7cREMnjbGu5gK6GN6kIKv2LL5keC8Owf4SR-42JjveGIyxCv_zIyeiYiNByIBwWocLjOE6ictf_lu-Sjv-hhGo5AMhAkOZydDdqd6wRrOgbOPYguZAP5y9CNEpH_q6z3i4Dj9Zvcyxzi3o-iXj5_cQLBi53AXTp6-cEPoKxU8n3vdG5OQ?width=1584&height=588&cropmode=none)


## Context
Some general information on the survey and the main aims of the study. Basically, exploring the monitoring system of pesticide resistance in the world. 

## Datasets
In this section, you will find the list of the datasets used in this study. The data files can be found in the ***data*** folder. For the data tables, the name of the different variables are listed and explained as well. 

+ **20181211_data_pays.csv**: the first dataset contains information about countries for which there was at least one respondant to the survey. It sums up the number of classes of pests that are monitored, the type of usage information available in the different countries and some information linked to the development level of the countries. 
  + *pays*: name of the country. 
  + *coexistence_pays*: type of monitoring cited at least once by the survey's respondant. 
  + *Indice.Dvpt.Humain*: value of the Human Development Index (HDI) as of 2019. 
  + *Indice.Dvpt.Humain_classes*: the same information as HDI but grouped into classes of 0.1 bin. 
  + *nb_bioagr_surv*: number of pests surveyed in the country according to the survey's respondant. 
  + *q136_q137_UsagePPP*: type of PPP usage monitoring. This could be made by monitoring sale, by a survey or by both. This is the combined information for all the respondant of one country. 
  
+ **20181114_data_repondant.csv**: the second dataset contains information about the respondant and their answers to questions related to PPP monitoring in their respective coutry. 
  + *q160*: anonymised respondant ID. 
  + *q2*: country of the respondant. 
  + *q136-137.recodée*: type of PPP usage monitoring. This could be made by monitoring sale, by a survey or by both. If the respondant did not answer to this question, the field is left blank. The respondant can also answer that he/she doesn't know the information. 
  + *Domaine_competences_repondant*: the type of pesticide classes of which the respondent claims to be knowledgeable. The value can be fungicide (*'fung'*), herbicide (*'herb'*), insecticide (*'ins'*) or any combination of the three classes. Missing data are indicated by *'NA'*. 
  + *mailles_sales_PPP_q142bis*: the within country geographical level at which the sales figures are collected. The value can be: *'country'*, *'region'*, *'sale location'*,*'postal code of the user'*, *'do not know'* and *'other'*. Missing data are indicated by *'NA'*. 
  + *mailles_autres_donnees_usages_PPP_q153bis*: the within country geographical level at which the other method (ie different of sales figures) of PPP monitoring are collected. The value can be: *'country'*, *'region'*, *'sale location'*, *'postal code of the user'*, *'do not know'* and *'other'*. Missing data are indicated by *'NA'*. 
  + *mailles_données_usages_comb*: the combination of the two precedent fields. The value can be a combination of: *'country'*, *'region'*, *'sale location'*, *'postal code of the user'*, *'do not know'* and *'other'*. Missing data are indicated by *'NA'*. 
  + *continent*: the continent of the country of the respondant. 
  
+ **20181121_data_monitoring.csv**: The third dataset contains...
  + *first variable*: 
  + *second variable*: 


## R scripts
In this section, you will find the list of the different scripts used in the article with a brief description of their purpose. 
+ **dataloading.R**: the script to load the different datasets and the necessary package in the environment
+ **LogRegMonito.R**: the script used for the regression analysis
+ **barplot_fig.R**: the script used for producing the barplot figures xxxxxxx
+ **boxplot_fig.R**: the script used for producing the boxplot figure xxxxxxx
+ **donutplot_fig.R**: the script used for producing the donutplot figure xxxxxxx
+ **maprespondant_fig.R**: the script used for producing the map, Figure 2A
+ **stacked_fig.R**: the script used for producing the stackedbar figure xxxxxxx
+ **venndiag_fig.R**: the script used for producing the Venn's diagram figure xxxxxxx


## Citation
You can cite cite the related study as follow: 
+ R4P [Picture of Plant Protection Products resistance monitoring over the world: Between diversity and complementarity. *in preparation*.]()

If you want to use (some of) the code found on this page or if you want to cite this repository: 
+ Benoit Barrès, Christophe Plantamp and Pauline de Jerphanion. bbarres/SuMoRe: [Supporting code and data for: Picture of Plant Protection Products resistance monitoring over the world: Between diversity and complementarity. Zenodo; 2020.](https://zenodo.org/badge/latestdoi/158614822)