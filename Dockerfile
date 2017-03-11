# Download base image CentOS 7
FROM centos:centos7
LABEL maintainer "Lukas Maly <Iam@LukasMaly.NET>"

# Update CentOS Software repository
RUN yum -y update && yum -y upgrade

# Define the ENV variable
EVN teco_conf_dir /etc/teco/
ENV teco_conf_file PLCComS.ini
ENV teco_log_dir /var/log/teco/
ENV teco_log_file PLCComS.log
ENV teco /opt/teco/

RUN mkdir -p ${teco_conf_dir}
RUN mkdir -p ${teco_log_dir}
RUN mkdir -p ${teco}

# Copy binary file
COPY PLCComS_x86_64 ${teco}

# Copy PLCComS configuration
COPY ${teco_conf_file} ${teco_conf_dir}

# Volume configuration
VOLUME ["${teco_log_dir}", "${teco_conf_dir}"]

# Configure Services and Port
COPY start.sh ${teco}start.sh
CMD ["./start.sh"]

# EOF
