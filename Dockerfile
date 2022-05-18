FROM tomcat

COPY . .

RUN apt-get update ; apt-get install maven default-jdk -y ; update-alternatives --config javac

RUN mvn clean package ; cp target/*.war /usr/local/tomcat/webapps/

RUN mkdir /etc/contrast

COPY contrast_security.yaml /etc/contrast/

RUN chown -R root:root /etc/contrast

CMD ["catalina.sh","run"]
