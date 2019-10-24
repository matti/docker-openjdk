FROM ubuntu:18.04 as builder

WORKDIR /

ADD https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz .
WORKDIR /openjdk
RUN tar --extract --file /openjdk-11.0.2_linux-x64_bin.tar.gz --directory "/openjdk" --strip-components 1

FROM ubuntu:18.04
ENV JAVA_HOME=/opt/openjdk
ENV PATH=/opt/openjdk/bin:$PATH

COPY --from=builder /openjdk /opt/openjdk/
