FROM library/debian:jessie
MAINTAINER kenneth@floss.cat
COPY debconf-ldap.txt /tmp
#ADD supervisord.conf /etc
RUN	debconf-set-selections < /tmp/debconf-ldap.txt && \
	rm /tmp/debconf-ldap.txt && \
	apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y --no-install-recomends slapd ldap-utils libpam-ldap libnss-ldap ssh && \
	sed -i "s/compat$/\0 ldap/" /etc/nsswitch.conf && \
	mkdir /var/run/sshd && \
	rm -rf /var/lib/apt/* /var/lib/dpkg /usr/share/doc /usr/share/man && \
	echo "session optional pam_mkhomedir.so umask=0077 skel=/etc/skel" >> /etc/pam.d/common-session
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY slapd.sh /
COPY tree.ldif /root/
#	Initialize LDAP, add tree.ldif and then run SSH
EXPOSE 22 389
ENTRYPOINT ["/slapd.sh"]
