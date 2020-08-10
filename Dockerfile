FROM centos:centos7
LABEL maintainer="Jibi Jose <jibijose@yahoo.com>"

ENV CB_HOST=localhost
ENV CB_BUCKET=pillow
ENV CB_USER=Administrator
ENV CB_PASSWORD=password
ENV MIN_SIZE=password
ENV MAX_SIZE=password
ENV THREAD_COUNT=2
ENV ITEMS_COUNT=1000
ENV MUTATION_PERCENTAGE=100
ENV BATCH_SIZE=10
ENV JSON_FLAG=--json
ENV SUBDOC_FLAG=--subdoc
ENV COMPRESS_FLAG=--compress
ENV TIMINGS_FLAG=--timings

RUN yum -y update && \
yum -y install wget && \
wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-2-x86_64.rpm && \
rpm -iv couchbase-release-1.0-2-x86_64.rpm && \
yum -y install libcouchbase-devel libcouchbase2-bin gcc gcc-c++ && \
mkdir -p /home/cbc-pillowfight && \
groupadd -r cbc-pillowfight -g 433 && \
useradd -u 431 -r -g cbc-pillowfight -d /home/cbc-pillowfight -s /sbin/nologin -c "Docker image user" cbc-pillowfight && \
chown -R cbc-pillowfight:cbc-pillowfight /home/cbc-pillowfight
USER cbc-pillowfight

ENTRYPOINT cbc-pillowfight -U couchbase://${CB_HOST}/${CB_BUCKET} -u ${CB_USER} -P "${CB_PASSWORD}" -m ${MIN_SIZE}  -M ${MAX_SIZE} -t ${THREAD_COUNT} -I ${ITEMS_COUNT} -r ${MUTATION_PERCENTAGE} -B ${BATCH_SIZE} ${JSON_FLAG} ${SUBDOC_FLAG} ${COMPRESS_FLAG} ${TIMINGS_FLAG}
