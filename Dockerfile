FROM conda/miniconda3

RUN     apt-get update -y && \
        apt-get install -y  \
        wget curl jq git \
        bash bash-completion \
        gcc musl-dev openssl \
        make groff tree vim \
        ca-certificates less \
        apt-transport-https default-jdk \
        maven vim && \
        rm /bin/sh && \
        ln -s /bin/bash /bin/sh && \
        rm -rf /var/lib/apt/lists/*

# # INSTALL GO
# ARG GO_VERSION=1.11.5
# RUN     wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz && \        
#         tar -xvf go$GO_VERSION.linux-amd64.tar.gz  && rm -rf go$GO_VERSION.linux-amd64.tar.gz && \
#         mv go/ /usr/local/ && mkdir /root/go_path && \
#         echo 'export GOROOT=/usr/local/go' >> /root/.bashrc && \
#         echo 'export GOPATH=/root/go_path' >> /root/.bashrc && \
#         echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc && \
#         echo 'export GOROOT_BOOTSTRAP=/usr/local/go' >> ~/.bashrc 

RUN conda install -y nb_conda_kernels
RUN conda create -y -n py27 python=2.7 ipykerne

