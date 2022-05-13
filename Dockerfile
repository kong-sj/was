FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install apache2 vim curl wget net-tools default-jdk
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz -P /usr/share/
RUN tar xvzf /usr/share/apache-tomcat-9.0.62.tar.gz -C /usr/share/
RUN mv /usr/share/apache-tomcat-9.0.62 /usr/share/tomcat8
RUN perl -p -i -e '$.==2 and print "secretRequired=\"false\""' /usr/share/tomcat8/conf/server.xml
RUN sed -i 's/address=\"::1\"/address=\"0.0.0.0\"/g' /usr/share/tomcat8/conf/server.xml

