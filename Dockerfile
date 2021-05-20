FROM openjdk:8u111-jre

ENV ARTIFACT_DOWNLOAD_URL="https://ak-delivery04-mul.dhe.ibm.com/sar/CMA/RAA/07qj8/0/ibm-ucd-7.0.0.1.987254.zip"

COPY install.properties /tmp
COPY entrypoint.sh /ucd_entrypoint.sh

RUN curl -Lk $ARTIFACT_DOWNLOAD_URL > /tmp/ucd-server.zip \
  && unzip -d /tmp /tmp/ucd-server.zip \
  && cat /tmp/ibm-ucd-install/install.properties | grep version >> /tmp/install.properties \
  && mv /tmp/install.properties /tmp/ibm-ucd-install/install.properties \
  && sed -i '85isync' /tmp/ibm-ucd-install/install-server.sh \
  && chmod +x /tmp/ibm-ucd-install/install-server.sh \
  && chmod +x /ucd_entrypoint.sh \
  && rm /tmp/ucd-server.zip

ENTRYPOINT ["/ucd_entrypoint.sh", "ucd"]
