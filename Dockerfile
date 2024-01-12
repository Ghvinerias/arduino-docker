# Use the official Python base image
FROM ubuntu:latest

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
      vim \
      curl \
      ca-certificates \
      gcc \
      python3-pip
RUN pip install pyserial
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
RUN arduino-cli config init
RUN arduino-cli config set board_manager.additional_urls "https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json"
RUN arduino-cli config set library.enable_unsafe_install true
RUN arduino-cli core update-index
RUN arduino-cli core install esp32:esp32
RUN arduino-cli lib install "ArduinoJson"
RUN arduino-cli lib install "ArxContainer"
RUN arduino-cli lib install "CAN"
RUN arduino-cli lib install --git-url https://github.com/collin80/can_common
RUN arduino-cli lib install "due_can"
RUN arduino-cli lib install --git-url https://github.com/collin80/esp32_can
RUN arduino-cli lib install "ESP32Servo"
RUN arduino-cli lib install "MsgPack"
RUN arduino-cli lib install "Packetizer"
RUN arduino-cli lib install --git-url https://github.com/aed3/PS4-esp32
RUN arduino-cli lib install "Task Scheduler"
