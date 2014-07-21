sudo knife winrm 54.83.73.127 'chef-client -o java,tomcat7-windows' -m -x Administrator -P $(cat /vagrant/_testAdmin)
