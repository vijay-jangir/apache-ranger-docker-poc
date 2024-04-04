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

COPY ./atlas_bin_archive /atlas_bin_archive

RUN cd /opt \
	&& cat /atlas_bin_archive/* | tar -xz -C /opt/atlas --strip-components=1 

# COPY ./ranger-2.4.0-atlas-plugin.tar.gz /ranger-atlas-plugin.tar.gz
# RUN cd /opt/atlas \
# 	&& tar xzf /ranger-atlas-plugin.tar.gz   \
# 	&& ln -s /opt/atlas/ranger-2.4.0-atlas-plugin /opt/atlas/ranger-atlas-plugin

USER root
ADD resources/entrypoint.sh /entrypoint.sh
RUN rm -rf /atlas_bin_archive && rm -rf /ranger-atlas-plugin.tar.gz

RUN rm -rf /opt/atlas/models/{2..4}000*
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

USER atlas

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]

EXPOSE 21000
