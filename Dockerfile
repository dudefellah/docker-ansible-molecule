FROM python:3-buster

COPY entrypoint.sh /entrypoint.sh
COPY requirements.txt /tmp/requirements.txt

RUN apt-get update && \
 apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get -y install docker-ce docker-ce-cli containerd.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists && \
    chmod 755 /entrypoint.sh && \
    pip3 install -r /tmp/requirements.txt && \
    rm -f /tmp/requrements.txt

ENTRYPOINT ["/entrypoint.sh"]
CMD ["molecule", "test", "--all"]
