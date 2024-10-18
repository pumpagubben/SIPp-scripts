#!/bin/bash
export TERM=vt100

# Files
SIPP_PATH=$SIPP
# Trunk accounts list:
USERS_FILE=$USER_ACCOUNTS
# Register Scenario file:
SIPP_SCENARIO_FILE="../sipp_scenarios/REGISTER_INVITE_client2.xml"



# Remote host/IP:
REMOTE_HOST=sipserver.stage.iotcomms.io
REMOTE_DOMAIN=eriktest.stage.iotcomms.io
REMOTE_PORT=5061

# HA IP address
#HA_IP=212.112.183.29
HA_IP=bergenudd.org


$SIPP_PATH/sipp $REMOTE_HOST:$REMOTE_PORT -sf $SIPP_SCENARIO_FILE -inf $USERS_FILE -recv_timeout 10000 -t l1 -l 1 -m `grep "^[0-9a-z]" $USERS_FILE|wc -l` -key HA_ip $HA_IP -key remote_domain $REMOTE_DOMAIN

