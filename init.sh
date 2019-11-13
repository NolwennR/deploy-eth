apt-get update
sudo apt-get -y upgrade
curl -O https://storage.googleapis.com/golang/go1.2.1.linux-amd64.tar.gz
tar -xvf go1.13.4.linux-amd64.tar.gz
sudo mv go /usr/local
export PATH=$PATH:/usr/local/go/bin
source ~/.profile

sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y ethereum

sudo apt-get install -y git
go get github.com/ethereum/go-ethereum/cmd/puppeth