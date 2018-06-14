FROM centos:7
LABEL maintainer="Sebastian Szary <sebastian@szary.org>"

RUN yum install -y pyliblzma deltarpm && \
    yum install -y epel-release && \
    yum install -y ipa-client ipa-admintools pam_krb5 nss-pam-ldapd && \
    yum clean all

RUN yum localinstall https://github.com/ubccr/mokey/releases/download/v0.0.6/mokey-0.0.6-14.el7.centos.x86_64.rpm -y && \
    yum clean all

COPY mokey.yaml /etc/mokey/mokey.yaml
COPY start.sh /start.sh
RUN chmod 0755 /start.sh

CMD ["/start.sh"]
