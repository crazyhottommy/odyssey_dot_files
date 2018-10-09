#!/bin/bash

## Odyssey  hpc .profile.d/01_odyssey_config.sh
## v 1.0 | 10/2010 
## originally from Samir Amin


######################################################## 

############### 01. Start exporting PATH ###############

#########################################################
export ODYAPPS="${HOME}/apps";
#export GMLIBS="/scratch/genomic_med/libs";

## HOME specific paths ##
mypathmunge ${HOME}/bin

#mypathmunge ${HOME}/.aspera/connect/bin after

## Odyssey APPS paths ##
mypathmunge $ODYPPS/ncdu/ncdu=1.13/bin after

#########################################################

################ 02. Start exporting modules ###########

#########################################################
# module load cmake/3.4.1
# module load autoconfig/2.69
# module load boost/1.57.0


##########################################################

####### 03. Start exporting libs and final config #########

###########################################################

#### SETUP Anaconda Python and R ####
## 1. prefix anaconda python to your PATH
mypathmunge ${HOME}/anaconda3/bin

