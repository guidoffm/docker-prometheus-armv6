# Description

This image can be used to run prometheus on ARM v6 chips, e.g. Raspberry Pi Zero

# Run

    docker run -d -p 9090:9090 --restart always -v prometheus:/prometheus --name prometheus prometheus-armv6:latest
