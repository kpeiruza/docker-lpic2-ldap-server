# docker-lpic2-ldap-server

Simple OpenLDAP server with a user/group tree to demonstrate authentication against an LDAP.
Meant to be used together with another "ldap-client" container.
You can connect through SSH with ldapuser / ldaptest

Administer Base dc=floss,dc=cat:
cn=admin,dc=floss,dc=cat / password

Just launch it:

*docker run -p 389:389 --name lpic2ldap -d kpeiruza/lpic2-ldap-server*


Try to:

- ssh ldapuser@$(docker inspect  -f '{{ .NetworkSettings.IPAddress }}' lpic2ldap)
- Manage users and groups with ldapadd/ldapmodify/ldapdelete. You have an example LDIF at tree.ldif
- Integrate your system's auth with this LDAP server (pam_ldap and libnss_ldap) (remember to launch the container with -p 389:389)
- ...
