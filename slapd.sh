#!/bin/sh
set -e
#	Launch Slapd and keep it "interactive"
/usr/sbin/slapd -h "ldap:/// ldapi:///" -g openldap -u openldap -F /etc/ldap/slapd.d
#-d 3
echo "Adding LDIF"
sed "s/REPLACETLD/dc=floss,dc=cat/" /root/tree.ldif | ldapadd -x -D "cn=admin,dc=floss,dc=cat" -wpassword -H ldap://localhost 
#	Launch SSH Server
/usr/sbin/sshd -D
