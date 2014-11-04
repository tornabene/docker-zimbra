FROM ubuntu:trusty

MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>

RUN apt-get -y update
RUN apt-get -y install openssh-server && mkdir /var/run/sshd

RUN apt-get -y install sudo wget tar curl
ADD singleuser /etc/sudoers.d/singleuser
RUN chown root. /etc/sudoers.d/singleuser

RUN apt-get -y install perl sysstat  hostname libidn11 libpcre3 libexpat1 libgmp3-dev patch pax sqlite3 libperl5.18 libaio1 unzip
 
RUN mkdir /tmp/zcs 
WORKDIR /tmp/zcs
RUN pwd

ENV ZIMBRA zcs-8.0.8_GA_6184.UBUNTU14_64.20140925165809.tgz
RUN wget http://files2.zimbra.com/downloads/8.0.8_GA/$ZIMBRA
#RUN wget  http://10.10.130.35/$ZIMBRA
WORKDIR /tmp/zcs
RUN tar xzvf $ZIMBRA

ADD config.defaults /tmp/zcs/config.defaults
ADD utilfunc.sh.patch /tmp/zcs/utilfunc.sh.patch
#ADD utilfunc.sh.patch /tmp/zcs/utilfunc.sh.patch
#RUN cd /tmp/zcs/zcs-* && patch util/utilfunc.sh </tmp/zcs/utilfunc.sh.patch
ADD utilfunc.sh /tmp/zcs/utilfunc.sh
RUN cd /tmp/zcs/zcs-* && cd  util && cp /tmp/zcs/utilfunc.sh utilfunc.sh

RUN cd /tmp/zcs/zcs-* && ./install.sh -s --platform-override /tmp/zcs/config.defaults
RUN mv /opt/zimbra /opt/.zimbra

VOLUME ["/home"]
VOLUME ["/opt/zimbra"]

EXPOSE 22
EXPOSE 25
EXPOSE 456
EXPOSE 587
EXPOSE 110
EXPOSE 143
EXPOSE 993
EXPOSE 995
EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 8443
EXPOSE 7071

ADD start.sh /start.sh

CMD ["/start.sh"]
