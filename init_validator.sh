#!/bin/bash

NODEIP=$(curl -s4 icanhazip.com)


echo "Updating Firewall..."
sudo ufw allow 1478

echo "Installing dependencies..."
echo
echo

# Install dependencies
sudo apt install wget
wget https://golang.org/dl/go1.18.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile

# Clone and build alvey
git clone https://github.com/AlveyCoin/alveychain.git && cd alveychain
echo "Building Go executable, please wait..."
go build -o alvey main.go

# Initialize validator dir
echo "Initializing validator directory.."
cp ../genesis.json . && chmod +x genesis.json
echo
./alvey secrets init --data-dir data-dir
echo

## Show private key
pk=$(cat data-dir/consensus/validator.key)
echo "Private Key = $pk"
echo

## Prompt user
echo
echo
read -n 1 -s -r -p "Additionally, please make a copy of your \`Private Key\` and store this somewhere safe - DO NOT SHARE YOUR PRIVATE KEY WITH ANYONE! Once this is done, press any key to continue.."
echo
