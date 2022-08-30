FROM phusion/baseimage:focal-1.0.0

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --allow-downgrades --allow-remove-essential \
        --allow-change-held-packages \
        php8.0-cli \
        php8.0-common \
        php8.0-curl \
        php8.0-dev \
    && apt-get clean \
    && update-alternatives --set php /usr/bin/php8.0

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

# Set default work directory
WORKDIR /var/www
