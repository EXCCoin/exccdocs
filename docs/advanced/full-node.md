# Running a Full Node

---

This guide provides comprehensive information on running a ExchangeCoin full node.

## What is a full node?

A full node is a program that independently validates transactions and blocks without relying on a third party. In this guide, we'll use [exccd](https://github.com/EXCCoin/exccd), the most widely used full node implementation for ExchangeCoin.

## Why run a full node?

There are several reasons to run a full node:

- **Support the network:** Full nodes serve as the backbone of ExchangeCoin. By validating and broadcasting transactions without depending on third parties, they help maintain the network's decentralization, security, and robustness.
- **Safety & Privacy:** Lightweight nodes, unable to fully validate transactions and blocks, must trust third parties to do so. This means the third party gains access to information about your transactions and any personal data you share. Many lightweight wallets depend on a centralized server to process transactions. Even  [Simplified Payment Verification (SPV)](../wallets/spv.md) wallets, which typically connect directly to full nodes in the network, still rely on those full nodes to process and broadcast their transactions.

## Requirements

The basic requirements for running a full node include:

- \>8 GB disk space (as of April 2023).

!!! note "Note"
    The blockchain size continuously increases as new blocks are added to the chain. To accommodate future growth and new version migrations, it's a good idea to have ~2X the [current raw blockchain size](https://explorer.excc.co/charts?chart=blockchain-size) in hard disk space.

- \>2 GB of RAM
- Supported Operating System (OS) &mdash;Windows 7/8.x/10/11 (server preferred), macOS, Linux
- Reliable internet connection

If running a node on your own hardware (i.e. not on remote servers), you will also need:

- The ability to open a port for incoming internet traffic. On a home Wi-Fi network, this may require adjusting your router's settings.
- A secure location to keep your device running
- If you require a silent node (as hard disk drives can be noisy), consider using an SSD or USB drive. Raspberry Pi 3/4 can be an excellent choice here.

## Guides

Below are some guides from the community that walk you step-by-step through setting up a full node on various hardware and operating systems. For generic high-level instructions, see the [Steps](#steps) section below.

- [Running a Decred Raspberry Pi Node](https://medium.com/@_Checkmatey_/running-a-decred-raspberry-pi-node-ac605b70c652): A more beginner-friendly guide that uses a VNC server (remote desktop). This guide intends to be a gentle introduction to using SSH on the command line. 
- [My experience setting up a Decred full-node](https://medium.com/crypto-rocket-blog/my-experience-setting-up-a-decred-full-node-8a9bbf55bc30): Another beginner-friendly guide that walks through setting up a full node on a Raspberry Pi using an Ubuntu terminal on a Windows PC. 
- [Installing exccd](https://stakey.club/en/installing-exccd/): A more advanced guide to installing a full node (Mac or Debian) that also covers manual installation (from binaries or source) and configuring exccd to run on Tor for extra security. 

Because **ExchangeCoin** is a **Decred** fork, all above guides applies for **EXCC** as well.

## Steps

Below are the basic high-level steps to install a full node on any hardware and OS. These instructions use [exccinstall](../wallets/cli/cli-installation.md), the automatic installer and upgrader software. In addition to installing `exccd`, it will also install `exccwallet` (which allows you to create wallets) and `exccctl` (which allows you to control `exccwallet` and `exccd` from the command line). You can also just install `exccd` on its own from [binaries or source files](https://github.com/EXCCoin/exccd#installing-and-updating); a full node does not require a wallet unless you want to use your full node to validate and broadcast your own transactions.

1. **Download, verify, and install exccd**
        - Follow the instructions for your OS in the [CLI Installation guide](../wallets/cli/cli-installation.md). The `exccd` executable will be installed in a directory named `/excc` under your OS's home directory.
2. **Start `exccd`**
        - Navigate to the `/excc` directory and launch `exccd`. See the [Operating System Differences](../wallets/cli/os-differences.md) page for OS-specific commands.
        - `exccd` will boot up, begin connecting to peers and downloading the full ExchangeCoin blockchain.
3. **Enable incoming connections**
        - `exccd` will automatically begin downloading the blockchain and connecting to peers. To maximize your positive impact on the ExchangeCoin network, it is important to allow inbound peers to connect to your node. Allowing inbound peers will allow new participants in the ExchangeCoin network to connect to your node, and also enable your node to serve lightweight clients such as SPV wallets. This may require changing the settings of your router. If this is the case:
                1. Find your [Local IP address](https://www.howtogeek.com/236838/how-to-find-any-devices-ip-address-mac-address-and-other-network-connection-details/).
                1. Edit the settings of your router to open port 9666 (port forwarding). This [process](https://www.wikihow.com/Set-Up-Port-Forwarding-on-a-Router) depends on the type of router you have.
        - If running a firewall, you'll also need to configure it to allow inbound connections on port 9666.
4. **Wait for exccd to sync**
        - Check a ExchangeCoin block explorer such as [exccdata](https://explorer.excc.co/) and wait until the block height displayed matches the block height shown locally.
5. **Leave running**
        - Leave your node running, online, in a safe space, 24/7/365.

Congratulations, you are now running a ExchangeCoin full node to support the network!
