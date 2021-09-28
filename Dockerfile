FROM phusion/baseimage:master

CMD ["/sbin/my_init"]

RUN apt update && apt install --yes build-essential git wget  m4 python3 python3-dev python3-setuptools python3-pip libelf-dev tmux iproute2 pkg-config -y

#RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 3


RUN wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 12

RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-12 100
RUN update-alternatives --install /usr/bin/llvm-objdump llvm-objdump /usr/bin/llvm-objdump-12 100

RUN ln -sv /opt/eclat-daemon/hike_v3/tools/bpftool /usr/local/bin/

RUN mkdir /opt/eclat-daemon
#ADD ./eclat-daemon /opt/eclat-daemon-prod





RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*






