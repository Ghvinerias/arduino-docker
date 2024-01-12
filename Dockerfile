# Use the official Python base image
FROM ubuntu:latest

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
      vim \
      curl \
      ca-certificates \
      gcc 
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
RUN arduino-cli config init
COPY ./arduino-cli.yml /root/.arduino15/arduino-cli.yaml
RUN arduino-cli core update-index
RUN arduino-cli core install esp32:esp32
