#!/bin/sh
read -p 'Node IP: ' nodeIP
read -p 'Node Name: ' nodeName
read -p 'Password: ' nodePass
sudo knife bootstrap windows winrm $nodeIP -x administrator -P "$nodePass" --node-name $nodeName --run-list 'tomcat7-windows'

