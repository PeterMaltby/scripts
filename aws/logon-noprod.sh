#!/bin/bash
# logon-noprod.sh
# author: peter.maltby1
# created: 2023-03-21
#  _     ___    ___   ___   _  _       _  _   ___   ___  ___   ___   ___  
# | |   / _ \  / __| / _ \ | \| | ___ | \| | / _ \ | _ \| _ \ / _ \ |   \ 
# | |__| (_) || (_ || (_) || .` ||___|| .` || (_) ||  _/|   /| (_) || |) |
# |____|\___/  \___| \___/ |_|\_|     |_|\_| \___/ |_|  |_|_\ \___/ |___/ 
#                                                                         
#############################################################

export AWS_PROFILE=golf && export
AWS_DEFAULT_PROFILE=golf && export
AWS_SDK_LOAD_CONFIG=1
aws-azure-login --profile golf --mode=gui
