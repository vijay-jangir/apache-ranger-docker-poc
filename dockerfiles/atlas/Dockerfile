FROM centos:7


RUN yum update -y \
	&& yum install -y python python36 python36-devel.x86_64 java-1.8.0-openjdk java-1.8.0-openjdk-devel net-tools \
	&& yum -y groupinstall "Development Tools" \
	&& yum -y install gcc openssl-devel bzip2-devel libffi-devel \
	&& yum clean all

RUN groupadd hadoop && \
	useradd -m -d /opt/atlas -g hadoop atlas

# RUN pip3 install amundsenatlastypes==1.1.0

USER atlas

COPY ./apache-atlas-*-bin.tar.gz /apache-atlas.tar.gz
RUN cd /opt \
	&& tar xzf /apache-atlas.tar.gz -C /opt/atlas --strip-components=1

COPY ./ranger-2.4.0-atlas-plugin.tar.gz /ranger-atlas-plugin.tar.gz
RUN cd /opt/atlas \
	&& tar xzf /ranger-atlas-plugin.tar.gz   \
	&& ln -s /opt/atlas/ranger-2.4.0-atlas-plugin /opt/atlas/ranger-atlas-plugin

COPY model /tmp/model
COPY resources/atlas-setup.sh /tmp
COPY resources/credentials /tmp
COPY resources/init_amundsen.py /tmp

COPY resources/atlas-application.properties /opt/atlas/conf/

USER root
ADD resources/entrypoint.sh /entrypoint.sh
RUN rm -rf /apache-atlas.tar.gz
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
COPY ./resources/ranger/install.properties /opt/atlas/ranger-atlas-plugin/install.properties
RUN /opt/atlas/ranger-atlas-plugin/enable-atlas-plugin.sh

USER atlas

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]

EXPOSE 21000
