FROM        docker.io/redhat/ubi9
RUN         dnf install xz -y
RUN         cd /opt && curl -L https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-x64.tar.xz | tar -xJ
ENV         PATH=$PATH:/opt/node-v20.17.0-linux-x64/bin
RUN         mkdir /app
WORKDIR     /app
COPY        package.json server.js run.sh /app/
RUN         npm install
ENTRYPOINT  ["bash", "run.sh"]
