#!/bin/bash
export TERM=vt100

source connection_secrets.sh 

# Files
SIPP_PATH=$SIPP
# Trunk accounts list:
USERS_FILE=$USER_ACCOUNTS
# Register Scenario file:
SIPP_SCENARIO_FILE="../sipp_scenarios/INVITE_client2-g722-dtmf.xml"



# Remote host/IP:
REMOTE_HOST=$R_HOST
REMOTE_DOMAIN=$R_DOMAIN
REMOTE_PORT=$R_PORT

# HA IP address
#HA_IP=
HA_IP=$L_IP


$SIPP_PATH/sipp $REMOTE_HOST:$REMOTE_PORT -sf $SIPP_SCENARIO_FILE -inf $USERS_FILE -recv_timeout 10000 -t l1 -l 1 -m `grep "^[0-9a-z]" $USERS_FILE|wc -l` -key HA_ip $HA_IP -key remote_domain $REMOTE_DOMAIN

