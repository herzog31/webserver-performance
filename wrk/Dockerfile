FROM debian:jessie
MAINTAINER William Yeh <william.pjyeh@gmail.com>

ENV VERSION 4.0.1
ENV TARBALL https://github.com/wg/wrk/archive/$VERSION.tar.gz


RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update  && \
    echo "==> Install curl & helper tools..."  && \
    apt-get install -y -q --no-install-recommends curl make gcc libssl-dev  && \
    \
    \
    \
    echo "==> Download & compile..."  && \
    cd /tmp  && \
    curl -L --insecure $TARBALL -o wrk-src.tar.gz && \
    tar xvzf wrk-src.tar.gz  && \
    cd /tmp/wrk-$VERSION  && \
    make  && \
    cp wrk /opt  && \
    \
    \
    \
    echo "==> Clean up..."  && \
    cd /tmp  && \
    rm -rf wrk*  *.tar.gz  && \
    apt-get remove -y --auto-remove curl make gcc  && \
    apt-get clean


# configure
VOLUME [ "/data" ]
WORKDIR /data

# for convenience
ENV PATH /opt:$PATH
RUN date '+%Y-%m-%dT%H:%M:%S%:z' > /var/log/DOCKER_BUILD_TIME


# Define default command.
ENTRYPOINT ["wrk"]
