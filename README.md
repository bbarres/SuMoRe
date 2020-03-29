[![DOI](https://zenodo.org/badge/158614822.svg)](https://zenodo.org/badge/latestdoi/158614822)

# Supporting code and data for: Picture of Plant Protection Products resistance monitoring over the world: Between diversity and complementarity
*This repository contains the R code used for the data analyses and production of the figures of the related article*

![alt text](https://vy7bgw.db.files.1drv.com/y4mJcCXlpEQlZMq8mdAu7b8K9pAc2N3boQ0iHSWn7cREMnjbGu5gK6GN6kIKv2LL5keC8Owf4SR-42JjveGIyxCv_zIyeiYiNByIBwWocLjOE6ictf_lu-Sjv-hhGo5AMhAkOZydDdqd6wRrOgbOPYguZAP5y9CNEpH_q6z3i4Dj9Zvcyxzi3o-iXj5_cQLBi53AXTp6-cEPoKxU8n3vdG5OQ?width=1584&height=588&cropmode=none)


## Context


## Datasets
In this section, you will find the list of the datasets used in this study. The data files can be found in the ***data*** folder. For the data tables, the name of the different variables are listed and explained as well. 

+ **20181211_data_pays.csv**: The first dataset contains information about countries for which at least there was one respondant to the survey. It sums up the number of classes of pests that are monitored, the type of usage information available in the different countries and some information linked to the developement of the countries. 
  + *pays*: the name of the countries
  + *coexistence_pays*: type of monitoring cited at least once by the survey's respondant. 
  + *Indice.Dvpt.Humain*: The value of the Human Developement Indice (HDI)
  + *Indice.Dvpt.Humain_classes*: The same information as the previous one but grouped into classes of 0.1 bin. 
  + *nb_bioagr_surv*: the number of pests surveyed in the country according to the survey's respondant
  + *q136_q137_UsagePPP*: the type of PPP usage monitoring, this could be made by monitoring sale, by a survey or by both.
  
+ **20181114_data_repondant.csv**: The second dataset contains...
  + *first variable*: 
  + *second variable*: 

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
+ **maprespondant_fig.R**: the script used for producing the map figure xxxxxxx
+ **stacked_fig.R**: the script used for producing the stackedbar figure xxxxxxx
+ **venndiag_fig.R**: the script used for producing the Venn's diagram figure xxxxxxx


## Citation
You can cite cite the related study as follow: 
+ R4P [Picture of Plant Protection Products resistance monitoring over the world: Between diversity and complementarity. *in preparation*.]()

If you want to use (some of) the code found on this page or if you want to cite this repository: 
+ Benoit Barrès, Christophe Plantamp and Pauline de Jerphanion. bbarres/SuMoRe: [Supporting code and data for: Picture of Plant Protection Products resistance monitoring over the world: Between diversity and complementarity. Zenodo; 2020.](https://zenodo.org/badge/latestdoi/158614822)