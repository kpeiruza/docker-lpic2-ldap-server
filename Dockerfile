FROM library/debian:jessie
MAINTAINER kenneth@floss.cat
ADD debconf-ldap.txt /tmp
#ADD supervisord.conf /etc
RUN debconf-set-selections < /tmp/debconf-ldap.txt
RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y slapd ldap-utils && \
	rm -rf /var/lib/apt/lists/*
ADD slapd.sh /
RUN chmod +x /slapd.sh
CMD [ "/slapd.sh" ]
EXPOSE 389:389
