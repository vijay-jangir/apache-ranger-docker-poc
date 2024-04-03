FROM centos:centos7 as base

RUN --mount=type=cache,target=/var/cache/yum yum update -y \
    && yum -y install vim wget tar gcc java-1.8.0-openjdk-devel python3-3.6.8 \
    && yum clean all -y

ENV JAVA_HOME /usr/lib/jvm/java-openjdk
ENV RANGER_HOME /opt/ranger
ENV MAVEN_HOME /opt/maven
ENV RANGER_VERSION 2.4.0
ENV MAVEN_VERSION 3.6.3

ENV MAVEN_OPTS "-Xmx2048m -XX:MaxMetaspaceSize=512m"

COPY ./ /opt/ranger/target/

# Or you can use the binary from the official site: https://ranger.apache.org/download.html (currently no pre-built available)
RUN cd /opt/ranger \
    && rm -rf ~/.m2 \
    && ls | grep -v target | xargs rm -rf \
    && rm -rf target/*.zip


FROM base

ENV MYSQL_CONNECTOR_JAVA_VERSION 5.1.41

RUN yum update -y \
    && yum -y install mysql \
    && yum clean all -y

RUN wget -P /opt https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION.tar.gz \
    && wget -P /opt https://jdbc.postgresql.org/download/postgresql-42.7.3.jar \
    && tar -zxvf /opt/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION.tar.gz -C /opt \
    && rm -f /opt/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION.tar.gz \
    && ln -s /opt/postgresql-42.7.3.jar /opt/postgresql.jar \
    && ln -s /opt/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION/mysql-connector-java-$MYSQL_CONNECTOR_JAVA_VERSION-bin.jar /opt/mysql-connector-java.jar
