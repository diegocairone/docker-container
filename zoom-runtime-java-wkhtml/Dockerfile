# Passed in From CI/CD Pipeline
# RUNTIME_IMAGE should be openjdk:11-jre-slim in order for ImageMagick lib to works
ARG RUNTIME_IMAGE
FROM ${RUNTIME_IMAGE}
RUN apt update && apt install --assume-yes wget imagemagick xfonts-75dpi xfonts-base gvfs colord glew-utils libvisual-0.4-plugins gstreamer1.0-tools opus-tools qt5-image-formats-plugins qtwayland5 qt5-qmltooling-plugins librsvg2-bin lm-sensors
RUN mkdir -p /tmp/filestore-pdf-space/bin
WORKDIR /tmp/filestore-pdf-space/bin
RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb
RUN dpkg -i *.deb
RUN rm wkhtmltox_0.12.6-1.buster_amd64.deb
RUN ln -s /usr/local/bin/wkhtmltopdf /bin/wkhtmltopdf
RUN ln -s /bin/wkhtmltopdf /tmp/filestore-pdf-space/bin/wkhtmltopdf
WORKDIR /app
# Generate Self-signed Cert
RUN mkdir cert
RUN keytool -genkey -noprompt -alias zoom -keyalg RSA -keystore /app/cert/zoom.keystore -dname 'CN=localhost, OU=tech, O=zoomcare.net, L=unknown, ST=unknown, C=unknown'  -storepass password -keypass password
