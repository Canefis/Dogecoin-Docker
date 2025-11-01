FROM ubuntu:24.04
RUN apt-get update -y
WORKDIR /app
COPY . .
CMD ["/app/dogecoind", "-printtoconsole"]
