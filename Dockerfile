FROM postgres:10.0

# see https://hub.docker.com/r/seanedwards/postgres-contrib/~/dockerfile/

RUN apt-get -y update && apt-get -y install \
  protobuf-c-compiler libprotobuf-c0-dev curl \
  gcc make postgresql-server-dev-10 g++

RUN curl -s https://codeload.github.com/citusdata/cstore_fdw/tar.gz/v1.6.0 -o /tmp/cstore.src.tgz
WORKDIR /usr/src
RUN tar xfz /tmp/cstore.src.tgz
WORKDIR /usr/src/cstore_fdw-1.6.0
RUN make && make install

RUN curl -s https://codeload.github.com/citusdata/postgresql-hll/tar.gz/v2.10.2 -o /tmp/hll.src.tgz
WORKDIR /usr/src
RUN tar xfz /tmp/hll.src.tgz
WORKDIR /usr/src/postgresql-hll-2.10.2
RUN make && make install

