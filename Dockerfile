
FROM amazoncorretto:17
MAINTAINER SGvero
COPY target/confbsas-sgv-v1.war confbsas-app.war
ENTRYPOINT ["java", "-war", "confbsas-app.war"]