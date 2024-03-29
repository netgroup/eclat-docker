FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install --yes build-essential git wget m4 python3 python3-dev python3-setuptools python3-pip -y
RUN apt install --yes libelf-dev tmux screen iproute2 pkg-config net-tools iputils-ping tree clang-format -y
RUN apt install --yes tcpdump vim tcpreplay software-properties-common jq -y
RUN apt install --yes nano netcat -y
RUN apt install --yes libc6-dev-i386 -y

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 3


RUN wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 12

RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-12 100
RUN update-alternatives --install /usr/bin/llvm-objdump llvm-objdump /usr/bin/llvm-objdump-12 100
RUN update-alternatives --install /usr/bin/llvm-objcopy llvm-objcopy /usr/bin/llvm-objcopy-12 100

RUN ln -sv /opt/eclat-daemon/hike/tools/bpftool /usr/local/bin/

ADD ./eclat-daemon /opt/eclat-daemon
RUN cd /opt/eclat-daemon && pip install -r requirements.txt && pip install ipython

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo "alias eclat='python eclat.py'" >> $HOME/.bash_aliases
