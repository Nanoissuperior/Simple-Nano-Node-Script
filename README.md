![image](https://user-images.githubusercontent.com/50946350/113024019-2d7cea00-917e-11eb-99be-c7d829b4485d.png)



# Simple Nano Node Script
### A script to setup a nano node

Following docs.nano.org guide to setup a node can be confusing for some. This script will setup a nano node from start to finish. It will install server requirements, pull the latest docker image and download a synced ledger with some nice feedback along the way. 
(Script based on Ubuntu Server running as a sudo user)

It is advised that you run this on a fresh installation of Ubuntu, please check node requirements shown below. Although this script has been tested it may still have bugs.

1) git clone
2) `chmod +x nodesetup.sh`
3) `./nodesetup.sh`
4) Enjoy

You will receive some prompts along the way, respond to these when needed.

- Please note you should only use this script from a trusted source. 
- You are responsible for the results of running this scipt on your server.
- This script will run an apt upgrade, if you do not want this comment out the line.
- If you get stuck find me on discord and tell me.

## Node Requirements
The following are minimum recommended specifications for non-voting nodes and Represntative nodes with less than 0.1% of the online voting weight (regular Representatives):

- 2GB RAM 
- Dual-Core CPU
- 100 Mbps bandwidth (2TB or more of available monthly bandwidth)
- SSD-based hard drive with 80GB+ of free space

## Further information
-RPC will not be enabled, to do so edit /home/Nano/config=rpc.toml and then restart the node.

-For more information on Nano Nodes visit : https://docs.nano.org/running-a-node/overview/ 

-Ledger pulled from https://mynano.ninja
