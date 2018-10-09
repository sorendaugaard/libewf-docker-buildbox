# Libewf buildbox
FROM ubuntu

RUN apt-get update && apt-get install -y autopoint debhelper dh-autoreconf python-dev python3-dev libfuse-dev devscripts pkg-config byacc flex zlib1g-dev libssl-dev

RUN cd ~ && \
    mkdir src && \
    cd src && \
    echo "Cloning libewf" && \
    git clone https://github.com/sorendaugaard/libewf.git && \
    cd libewf

RUN cd ~/src/libewf && \
    ./synclibs.sh --use-head && \
    ./autogen.sh && \
    ./configure --enable-python --enable-python2 --enable-python3
