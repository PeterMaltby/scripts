#!/bin/bash
# [:EVAL:]expand("%:t")[:END:]
# author: [:EVAL:]$USER[:END:]
# created: [:EVAL:]strftime('%Y-%m-%d')[:END:]
[:EVAL:]system("figlet -f small -k " . toupper(expand('%:t:r')) . " | sed 's/^/# /'")[:END:]#############################################################
