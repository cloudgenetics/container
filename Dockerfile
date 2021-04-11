FROM fedora:33
MAINTAINER Krishna Kumar <krishnak@utexas.edu>

# Update to latest packages, remove vim-minimal & Install Git, GCC, Clang, Autotools and VIM
RUN dnf update -y && \
    dnf remove -y vim-minimal sqlite && \
    dnf install -y awscli bzip2 bzip2-devel gcc gcc-c++ kernel-devel libcurl libcurl-devel make \
                   ncurses ncurses-devel python3 python3-devel pip unzip vim xz-devel wget zlib-devel && \
    dnf clean all

# Set working directory
WORKDIR /tmp
    
# STAR
RUN wget https://github.com/alexdobin/STAR/archive/2.7.8a.tar.gz && \
    tar -xzf 2.7.8a.tar.gz && cd STAR-2.7.8a/bin/Linux_x86_64/ && \
    cp -R ./* /usr/local/bin/
    
# SAMTOOLS
RUN wget https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2 && \
    tar -xvf samtools-1.12.tar.bz2 && cd samtools-1.12 && \
    ./configure && make -j 2 && make install
    
# Subread    
RUN wget https://sourceforge.net/projects/subread/files/subread-2.0.1/subread-2.0.1-Linux-x86_64.tar.gz/download && \
    mv download subread-2.0.1-Linux-x86_64.tar.gz && tar -xzf subread-2.0.1-Linux-x86_64.tar.gz && \
    cd subread-2.0.1-Linux-x86_64/bin && mkdir -p /usr/local/bin/subread/ && \
    cp -R ./* /usr/local/bin/subread/
ENV PATH="/usr/local/bin/subread/:${PATH}"

# Fetch and run
ADD fetch_and_run.sh /usr/local/bin/fetch_and_run.sh
ENTRYPOINT ["/usr/local/bin/fetch_and_run.sh"]
