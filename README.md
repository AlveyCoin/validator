# Validator Setup Script

Validator node setup script for Alvey Chain

## Before you Start

You and you alone are responsible for securing the server where your Alvey Validator Node is hosted. 
There are many guides available on the internet and youtube tutorials that can help you through hardening your VPS. Here are just a few examples to get you started but there are many more. 

[Initial Server Setup](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)
[Securing Your Linux VPS](https://www.digitalocean.com/community/tutorials/an-introduction-to-securing-your-linux-vps)
[Hardening Access to Your Server | Linux Security Tutorial](https://www.youtube.com/watch?v=eeaFoZlSq6I)
[5 Steps to Secure Linux (protect from hackers)](https://www.youtube.com/watch?v=ZhMw53Ud2tY)

## Private Keys 

When running `./init_validator.sh` at the end of the install process you will see two sets of data that you need to copy. The first set of data will print the Validator address, BLS Public key and the Node ID

`[SECRETS INIT]
Public key (address) = 0xC12bB5d97A35c6919aC77C709d55F6aa60436900
BLS Public key       = 0x9952735ca14734955e114a62e4c26a90bce42b4627a393418372968fa36e73a0ef8db68bba11ea967ff883e429b3bfdf
Node ID              = 16Uiu2HAmVZnsqvTwuzC9Jd4iycpdnHdyVZJZTpVC8QuRSKmZdUrf` 

The Public key (address) and BLS Public key are the ONLY 2 data items you need to give for voting. 

The final step in the install script will print on screen your `Private Key` and prompt saying `please make a copy of your and store this somewhere safe - DO NOT SHARE YOUR PRIVATE KEY WITH ANYONE! Once this is done, press any key to continue.."` 

Once again NEVER SHARE YOUR PRIVATE KEY WITH ANYONE! You can import this private key to metamask to collect earnings from running your validator.

## How to Use

1. SSH into you're newly created VM
2. Run `git clone https://github.com/AlveyCoin/validator && cd validator`
3. Make the setup scripts executable and run them
   1. Run `chmod +x init_validator.sh`
   2. Run `chmod +x start_validator.sh`
   3. Run `./init_validator.sh`
   4. Run `./start_validator.sh`
   
4. Confirm Alvey Node is Running `sudo systemctl status alvey.service`
5. You should see an output like: 

`alvey.service - Alvey Node Service
     Loaded: loaded (/etc/systemd/system/alvey.service; disabled; vendor preset: enabled)
     Active: active (running) since Mon 2022-11-21 19:56:48 UTC; 8s ago` 

## Minimum system requirements

| Type | Value                                                                                          | Influenced by                                                                                                                |
|------|------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| CPU  | 2 cores                                                                                        | <ul><li>Number of JSON-RPC queries</li><li>Size of the blockchain state</li><li>Block gas limit</li><li>Block time</li></ul> |
| RAM  | 2 GB                                                                                           | <ul><li>Number of JSON-RPC queries</li><li>Size of the blockchain state</li><li>Block gas limit</li></ul>                    |
| Disk | <ul><li>10 GB root patition</li><li>30 GB root partition with LVM for disk extension</li></ul> | <ul><li>Size of the blockchain state</li></ul>









