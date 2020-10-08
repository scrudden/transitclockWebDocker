FROM tomcat:9.0
MAINTAINER Sean Óg Crudden
ENV TRANSITCLOCK_PROPERTIES /usr/local/transitclock/config/transitclock.properties
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
ADD web.war web.war
ADD api.war api.war

RUN wget http://stedolan.github.io/jq/download/linux64/jq

RUN chmod +x ./jq

RUN cp jq /usr/bin/

# WORKDIR /

# RUN  curl -s https://api.github.com/repos/TheTransitClock/transitime/releases/latest | jq -r ".assets[].browser_download_url" | grep 'Core.jar\|api.war\|web.war' | xargs -L1 wget

# Deploy API which talks to core using RMI calls.
#RUN mv api.war  /usr/local/tomcat/webapps

# Deploy webapp which is a UI based on the API.
#RUN mv web.war  /usr/local/tomcat/webapps

ADD transitime/transitclockWebapp/target/web.war /usr/local/tomcat/webapps/
ADD transitime/transitclockApi/target/api.war /usr/local/tomcat/webapps/

RUN mkdir /usr/local/transitclock

RUN mkdir /usr/local/transitclock/config

ADD config/postgres_hibernate.cfg.xml /usr/local/transitclock/config/hibernate.cfg.xml

ADD config/transitclock.properties /usr/local/transitclock/config/transitclock.properties
