# docker-lpic2-ldap-server

Simple OpenLDAP server with a user/group tree to demonstrate authentication against an LDAP.
Meant to be used together with another "ldap-client" container.
You can connect through SSH with ldapuser / ldaptest

Administer Base dc=floss,dc=cat:
cn=admin,dc=floss,dc=cat / password

Try to:

- Add new users and groups. You have an example at tree.ldif (ldapadd)
- Integrate your system's auth with this LDAP server (pam_ldap and libnss_ldap)
- ...
