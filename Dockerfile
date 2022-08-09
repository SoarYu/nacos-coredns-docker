FROM golang:1.17
ENV GOPROXY https://goproxy.cn

# 编译构建
RUN git clone https://github.com/SoarYu/nacos-coredns-plugin.git
RUN cp nacos-coredns-plugin/bin/build.sh ~/
RUN sh ~/build.sh

# 导出默认端口，tcp和udp的都要导出
EXPOSE 53 53/udp

VOLUME ["/etc/coredns/Corefile"]

CMD ["/go/src/coredns/coredns", "-conf", "/etc/coredns/Corefile"]

