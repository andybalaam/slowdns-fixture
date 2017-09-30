FROM ubuntu:17.10

RUN apt update && apt install -y python3 python3-dnslib net-tools

COPY slowdns slowdns

CMD ["/slowdns"]
#CMD ["python3", "-m", "dnslib.proxy", "--tcp"]
#CMD ["python3", "-m", "dnslib.proxy", "--help"]
#CMD ["python3", "-m", "dnslib.intercept", "--help"]
