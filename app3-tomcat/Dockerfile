FROM tomcat
WORKDIR /usr/local/tomcat
RUN rm -rf webapps
RUN mv webapps.dist webapps
COPY sample.war /usr/local/tomcat/webapps
COPY HelloWorld-1.war /usr/local/tomcat/webapps
