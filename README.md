# Simple Nano Node Script
A script to setup a nano node

Please check docs.nano.org for specs your server should have.

Following docs.nano.org guide to setup a node can be confusing for some. 

This script will install server requirements, pull the latest docker image and download a synced ledger with some nice feedback along the way. 

1) Download
2) `chmod +x nodesetup.sh`
3) `./nodesetup.sh`
4) Enjoy
--

## Node Requirements
The following are minimum recommended specifications for non-voting nodes and Represntative nodes with less than 0.1% of the online voting weight (regular Representatives):

2GB RAM (additional RAM or swap space may be needed if bootstrapping a new node from scratch)
Dual-Core CPU
100 Mbps bandwidth (2TB or more of available monthly bandwidth)
SSD-based hard drive with 80GB+ of free space
