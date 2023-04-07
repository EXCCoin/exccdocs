# Solo Proof-of-Stake (PoS) Voting

Last updated for CLI release v{{ cliversion }}.

---

## Overview

ExchangeCoin's Proof-of-Stake system necessitates participants to maintain a constant internet connection with their wallets in order to buy tickets, partake in governance, and receive voting rewards. This presents additional risks compared to storing coins in cold storage (e.g., paper wallets). Using a [Voting Service Provider (VSP)](../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp) can mitigate most risks by maintaining multiple always-online wallets that vote on your behalf, although this solution may not be suitable for all users.

This guide will help you create a setup similar to running your own VSP. "Hot" wallets stay online continuously for voting activities, while a separate "cool" wallet handles ticket buying, receives voting rewards, and crucially, doesn't require a constant internet connection.

Your voting setup will benefit from redundancy and low latency, as you'll be operating multiple hot wallets on servers situated in various geographic locations (3 are recommended). Additional advantages of this arrangement over using a VSP include the elimination of the risk of a VSP operator voting against your preferences, no VSP fees, and a contribution to the decentralization of the ExchangeCoin network. The only extra costs involved are those associated with maintaining remote servers, which may be considerably lower than paying VSP fees if you hold a significant number of tickets.

To minimize the risks associated with maintaining an internet-connected ExchangeCoin wallet for ticket purchases, users may want to consider establishing a secure cool wallet (not entirely a cold wallet). This guide will provide a low-cost solution that safeguards users from various common risks while explaining the reasoning behind the recommendations.

---

## Setting Up A Secure "Cool" Wallet

### Hardware and Operating System

The initial concept we'll discuss is compartmentalization. It's unnecessary for a machine storing large amounts of cryptocurrency to serve multiple purposes, such as gaming, word processing, web browsing, or downloading torrents. The only software installed on this machine should be essential for managing your ExchangeCoin wallet, and it should never connect to public Wi-Fi networks or any other networks you don't fully trust.

ExchangeCoin software has modest hardware requirements, so there's no need for an expensive or high-performance machine. 20GB of storage and 2GB of RAM should suffice. Single-board computers like the Raspberry Pi 3 Model B are viable options, but a more powerful machine will provide a better user experience.

ExchangeCoin software is compatible with almost any operating system; however, for optimal security, it's advised to use an OS that prioritizes security and privacy. [Qubes OS](https://www.qubes-os.org/) and [OpenBSD](https://www.openbsd.org/) are solid choices, among others. Windows and macOS are not recommended, and thus, won't be covered in the remainder of this guide.

---

### Installing ExchangeCoin

Once your machine is set up you will need to install the ExchangeCoin CLI tools.

1. Import the ExchangeCoin Team Official PGP Key in GnuPG.

    `gpg --keyserver pool.sks-keyservers.net --recv-keys 9DD10FAFB2A53E14BEF1B10D9AEB846958227764`

2. Download the installer, manifest, and signature files.

    `wget https://github.com/EXCCoin/excc-release/releases/download/v{{ cliversion }}/{exccinstall-linux-amd64-v{{ cliversion }},manifest-exccinstall-v{{ cliversion }}.txt,manifest-exccinstall-v{{ cliversion }}.txt.asc}`

3. Verify the manifest. The output from this command should say "Good signature from ExchangeCoin Release <support@excc.co>". Warnings about the key not being certified with a trusted signature can be ignored.

    `gpg --verify manifest-exccinstall-v{{ cliversion }}.txt.asc`

4. Verify the SHA-256 hash in the manifest matches that of the binary - the following two commands should have the same output.

    `sha256sum exccinstall-linux-amd64-v{{ cliversion }}`

    `grep exccinstall-linux-amd64-v{{ cliversion }} manifest-exccinstall-v{{ cliversion }}.txt`

5. Make the binary executable.

    `chmod +x exccinstall-linux-amd64-v{{ cliversion }}`

6. Run it to install the ExchangeCoin CLI tools and to create your wallet.

    `./exccinstall-linux-amd64-v{{ cliversion }}`

7. Add the path to the ExchangeCoin binaries to your `.profile`.

    `echo "PATH=~/excc:$PATH" >> ~/.profile && source ~/.profile`

--8<-- "seed-warning.md"

---

Once the wallet is created we can do a few things to make life easier.

1. Make sure you have `tmux` installed.

2. Create a `bash` script called `excc.sh` which will start a `tmux` session for each application, start `exccd`, start `exccwallet`, prompt us for the password to unlock the wallet, and start `exccctl`.

    `echo "tmux new -d -s exccd 'exccd'; tmux new -d -s exccwallet 'exccwallet --promptpass'; tmux attach -t exccwallet" > ~/excc.sh;`

3. Now make it executable with `chmod +x ~/excc.sh`

4. Now you can start `exccd`, `exccwallet`, and unlock the wallet just by running `./excc.sh`.

The next step will be to start buying tickets manually or using `ticketbuyer` in conjunction with a series of hot wallets you will set up later in this guide.

---

### Ticket Buying

Now from your cool wallet you can purchase tickets using the following command once your wallet is unlocked:

`exccctl --wallet purchaseticket default 150 1 HotWalletAddressFromVotingWallet 10`

Replacing `HotWalletAddressFromVotingWallet` with your hot wallet voting address, which you will generate when you set up your remote servers for voting, and using the command above will attempt to purchase `10` tickets with a max price of `150` `EXCC` each and delegate voting rights to your hot wallets.

If you wish to automate ticket purchases using `ticketbuyer` you will need to add the following info in your `~/.exccwallet/exccwallet.conf`, where `HotWalletAddressFromVotingWallet` is once again the address you generated on your voting VPS.

```ini
enableticketbuyer=1
ticketbuyer.votingaddress=HotWalletAddressFromVotingWallet
ticketbuyer.balancetomaintainabsolute=0
```

Using the automated ticket buyer will require you to leave your wallet online.

---

## Setting Up "Hot" Voting Wallets

For individuals without access to their own remote servers, Virtual Private Servers (VPS) offer a solution. Firstly, you'll need to select at least one VPS provider. Below is a brief list of reputable providers; feel free to mix and match any number of them. Ideally, your VPS should have at least 2 GB of RAM.

* [SporeStack](https://sporestack.com/)
* [Hetzner.de](https://www.hetzner.com/)
* [Digital Ocean](https://digitalocean.com/)
* [OVH](https://www.ovh.com/)

Note: Another aspect to consider is storage space. Since you'll need to store the complete ExchangeCoin blockchain, which is constantly growing, it's important to keep in mind that while it's currently quite small, it will eventually grow to a point where you may need to upgrade your VPS instances' storage space. To check the current size of the blockchain, use the [exccdata charts](https://explorer.excc.co/charts#blockchain-size).

---

### Configuration

To generate a voting address, you'll need to get ExchangeCoin up and running on your remote servers. This address will be specified when purchasing tickets to grant the hot wallets voting rights. Follow the steps below to set up your hot wallet. You can then repeat the steps for each additional remote server, or if using a single VPS provider, you might be able to clone the VPS from your provider's control panel and select a different geographic location for hosting (each hot wallet should use the same seed). It's highly recommended to run at least three geographically distributed hot wallets. This approach minimizes the chance of missing votes and ensures the lowest latency by spreading them around the world.

Use SSH to connect to one of the remote servers you have set up. Once connected, download and install the latest version of ExchangeCoin using [exccinstall](https://github.com/decred/decred-release/releases).

To avoid a super long-winded section on setting up the wallets I'll just include the script I've written to set everything up:

```no-highlight
#!/bin/bash

sudo apt update;
sudo apt upgrade;
sudo apt install tmux curl;

v=v{{ cliversion }};
a=amd64;
b=exccinstall-linux-${a}-${v};
wget https://github.com/EXCCoin/excc-release/releases/download/${v}/${b};
chmod +x ${b};
./${b};
echo "tmux new -d -s exccd 'exccd'; tmux new -d -s exccwallet 'exccwallet --enablevoting --promptpass'; tmux attach -t exccwallet" > ~/excc.sh;
chmod +x ~/excc.sh;
echo "PATH=~/excc:$PATH" >> ~/.profile;
source ~/.profile
```

You may want to change the `v=v{{ cliversion }}` to the latest version if a newer one has been released and `a=amd64` to whatever CPU architecture your VPS is using.

Start everything: `./excc.sh`

The first time you do this the blockchain will be downloaded, I would wait until that process is complete before continuing. You can check what the latest block is on [exccdata](https://explorer.excc.co/).
Then you can moitor the download progress by doing `tmux attach -t exccd`.

To detach from this session press `<CTRL>` + `<B>` and then `<D>` on your keyboard.

Once the initial sync is complete do `tmux attach -t exccwallet` and enter your password.

Now we will generate an address which we will use to delegate voting rights using:

`exccctl --wallet getnewaddress`

Copy that address and use it for your cool wallet instead of the example `HotWalletAddressFromVotingWallet`.

You are free to close your `SSH` session and everything that is in a `tmux` session will continue running. You can reconnect and attach to the `exccd` and `exccwallet` sessions to verify this.

If using a VSP, now is the time to clone this instance into another geographic region. Otherwise, repeat the above steps on your other remote servers with one change - when creating the wallet choose "restore" and reuse the seed you generated for the first voting wallet.

You will also want to open up TCP port `9666` for all your voting nodes so they have better connectivity to the ExchangeCoin network. On AWS this is done in the "Security Groups" section under "Networking" in EC2. On Google Cloud you can run `gcloud compute firewall-rules create exccd --allow tcp:9666 --source-ranges=0.0.0.0/0` in the console to achieve the same thing.

---

### Proof-of-Stake Voting

In order for your hot wallets to vote as you wish when there are on-chain votes you will need to connect to each one and specify your voting choices. This is done by using the following commands:

To see what votes are available.

`exccctl --wallet getvotechoices`

To set a vote preference.

`exccctl --wallet setvotechoice <agendaid> <yes|no>`

For example, if you wished to vote `yes` for the proposed `sdiff` algo change which was the first hard fork vote you would do:

`exccctl --wallet setvotechoice sdiffalgorithm yes`

And remember, this process will need to be repeated on each VPS instance running a hot voting wallet.
