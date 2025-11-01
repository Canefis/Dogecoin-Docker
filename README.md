# Dogecoin-node-Docker

Ubuntu 24.04 (x64) update & install midnight commamnder for usability:
```
sudo apt update && apt install mc -y
```


**1. Docker Installation**

# Download and extract precompiled binaries for doge core:
```
wget https://github.com/dogecoin/dogecoin/releases/download/v1.14.9/dogecoin-1.14.9-x86_64-linux-gnu.tar.gz
```
```
tar -zxvf dogecoin-1.14.9-x86_64-linux-gnu.tar.gz
```
```
cd dogecoin-1.14.9-x86_64-linux-gnu/bin/
```
```
mc
```
Copy all files into root/ & quit by pressing "F10"


# Cretae docker file:
```
cd ../
cd../
```
```
sudo nano Dockerfile
```

## Configuration

**Dockerfile** (copy below info into docker file, ctr+x & yes Enter for safe changes)
```
FROM ubuntu:24.04
RUN apt-get update -y
WORKDIR /app
COPY . .
CMD ["/app/dogecoind, "-printtoconsole"]
```
**Build local docker image**
```
sudo docker build -t doge .
```

**Mainnet Setup**

Example dogecoin.conf:

```
server=1
port=8332
rpcport=9002
rpcuser=user
rpcpassword=password
prune=2500
wallet=default
zmqpubhashblock=tcp://127.0.0.1:6002
```
```
sudo mkdir -p /data/.doge
```
Place your conf data into /data folder:
```
sudo nano /data/.doge/dogecoin.conf
```
Past and save by pressing ctr+x & yes Enter


**Run docker container from local image**
```
sudo docker run -d --network host --name doge --restart
always --log-opt max-size=10m -v /data/.doge:/root/.dogecoin doge
```
**Create wallet**
```
sudo docker exec doge /app/dogecoin-cli createwallet default
```
**Create wallet address**
```
sudo docker exec doge /app/dogecoin-cli getnewaddress
```

