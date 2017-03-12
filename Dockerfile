# Download base image Alpine Linux
FROM alpine
LABEL maintainer "Lukas Maly <Iam@LukasMaly.NET>"

# Define the ENV variable
ENV TECO_CONF_DIR /etc/teco
ENV TECO_CONF_FILE PLCComS.ini
ENV TECO_LOG_DIR /var/log/teco
ENV TECO_LOG_FILE PLCComS.log
ENV TECO_DIR /opt/teco

# Install cURL
RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

RUN mkdir -p ${TECO_CONF_DIR}
RUN mkdir -p ${TECO_LOG_DIR}
RUN mkdir -p ${TECO_DIR}

#RUN mkdir -p ${TECO_DIR} \
#	&& cd ${TECO_DIR} \
#	&& curl -o PLCComS_x86_64 https://github.com/smejdil/PLCComS/raw/master/PLCComS_x86_64 \
#	&& chmod 700 ${TECO_DIR}/PLCComS_x86_64

# Copy binary file
COPY PLCComS_x86_64 ${TECO_DIR}
RUN chmod 700 ${TECO_DIR}/PLCComS_x86_64

# Copy PLCComS configuration
COPY PLCComS.ini ${TECO_CONF_DIR}
COPY FIXED_Foxtrot.pub ${TECO_CONF_DIR}

# Volume configuration
VOLUME ["/var/log/teco", "/etc/teco"]

# Start PLCComS_x86_64
COPY start.sh /start.sh
CMD ["./start.sh"]

# EOF
