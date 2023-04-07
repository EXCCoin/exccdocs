# exccd Setup Guide 

This guide is intended to help you setup the `exccd` application using [startup flags](startup-basics.md#startup-command-flags). 

**Prerequisites:**

- Use the latest [exccinstall](cli-installation.md) to install `exccd`. Additional steps will be required if another installation method was used.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](os-differences.md).

---

`exccd` is the ExchangeCoin node daemon, which works in the background and maintains the complete transaction history of ExchangeCoin blockchain. It facilitates transaction relaying to other nodes on the network. Essentially, it is your own personal ExchangeCoin blockchain server. The complete blockchain `data` is stored in the data folder within the `exccd's` home directory.

**Advanced Users: If you are running in headless mode via SSH,** you
will need to use a terminal multiplexer such as [screen](https://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
or [tmux](https://tmux.github.io/). Where you see the instruction to
move to another shell, you'll need to start a new window in `screen`
or `tmux`.

---

## Connect to the ExchangeCoin Network

When launching `exccd` for the first time, it will start downloading the blockchain and connect to the ExchangeCoin network. In order for `exccwallet` and `exccctl` to communicate with exccd, the configuration files must have `rpcuser` and `rpcpass` settings enabled. These settings allow for authentication when `exccwallet` and `exccctl` connect to `exccd`.

1. Configure RPC Username and Password

    If you used [`exccinstall`](cli-installation.md), your configuration files are already setup with the RPC username/password for `exccd`, `exccwallet`, and `exccctl`.

    If you did not use `exccinstall`, you will need to enable the bare minimum settings in your configuration files. Follow [this guide](../../advanced/manual-cli-install.md#minimum-configuration) to do so.

2. Start exccd

    Assuming that you have set up your configuration files correctly, open another shell window within your ExchangeCoin directory, or use the last window if you have just created your wallet. To run ExchangeCoin CLI applications, enter the appropriate command based on your OS/Shell application. Refer to the prerequisites section of this guide for the correct command.

        exccd

3. Wait for exccd to Sync to the ExchangeCoin Blockchain

    After launching `exccd` successfully, you will notice messages appearing in your shell window as the daemon connects to the network and starts processing blocks. It is important to wait until this process is completed, as the entire blockchain is being downloaded into the `exccd` data directory.

    You will see a line at the start like this:

        22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9666

    Then, as it continues to download blocks, you will see lines like this:

        22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)

    After `exccd` has finished syncing, the output will show a message stating the current block height. You can also confirm that the blockchain is fully synced by comparing the block height shown in `exccctl getinfo` or `exccwallet getinfo` output against the current block height on the [the official block explorer](https://explorer.excc.co/). If the heights match, then the blockchain is fully synced.

    The ExchangeCoin blockchain is considered to be fully synced when the most recent block has been processed and its height matches the current block height. You can verify this by either comparing the date and time in the log message or checking the height of the last processed block against the last block height on the explorer.

    Note that this connection will be used in the future. You must leave this `exccd` instance running in order to use `exccwallet`.

---

Now that you've set up `exccd`, visit the [exccwallet Setup](exccwallet-setup.md) guide.
