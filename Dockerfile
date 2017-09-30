FROM alpine
RUN apk update && apk upgrade
RUN apk add git make openssl gcc build-base automake autoconf ncurses-dev
WORKDIR /
RUN git clone https://github.com/jonas/tig.git && cd tig && \
    git checkout tig-2.2.2 && make configure && ./configure && make && make install
RUN git clone https://github.com/therickys93/testing.git && cd testing && make && make install
RUN apk add vim tmux emacs
ADD .vimrc /root/
ADD .emacs /root/
ADD alias.sh /etc/profile.d/
CMD ["/bin/sh", "-l"]