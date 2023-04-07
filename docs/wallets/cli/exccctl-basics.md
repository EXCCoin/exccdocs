# `exccctl` Basics

**Prerequisites:**

- Use the latest [exccinstall](cli-installation.md) to install the command line tools.
- [Setup exccd](exccd-setup.md) and have it running in the background.
- [Setup exccwallet](exccwallet-setup.md) and have it running in the background.

---

`exccctl` is a command-line interface client that interacts with exccd and `exccwallet` via remote procedure call (RPC). It provides various functionalities such as checking your balance, buying tickets, creating transactions, and viewing network information.

Unlike exccd and `exccwallet`, `exccctl` is not a daemon, which means it does not run permanently in the background. Instead, it executes the requested RPC method, prints the response, and then terminates immediately.

---

## Usage

To call `exccd` RPC methods:

```no-highlight
exccctl <options> <rpc method> <rpc method args>
```

To call `exccwallet` RPC methods:

```no-highlight
exccctl <options> --wallet <rpc method> <rpc method args>
```

To list available options:

```no-highlight
exccctl --help
```

To list available RPC methods:

```no-highlight
exccctl -l
```

---

## Unlocking Your Wallet

Some functionality of `exccwallet` requires the wallet to be unlocked.

The command to unlock your wallet follows:

```no-highlight
promptsecret | exccctl --wallet walletpassphrase - 0
```

In the above command, the `--wallet` flag is used to specify that the command should be sent to `exccwallet`. The actual command being executed is walletpassphrase, which requires two parameters: your private passphrase and a time limit. A time limit of `0` means that `exccwallet` will be unlocked without a time limit. It is important to note, however, that this only unlocks the wallet for the current session. If you close the window that `exccwallet` is running in, or stop/restart `exccwallet`, you will need to unlock it again the next time you start it.

If the command was successful, you will not get a confirmation from `exccctl`, but if you look at your `exccwallet` session, it will say:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

NOTE: Because unlocking the wallet is required for many functions of `exccwallet`, `exccwallet` can be started with the `--promptpass` flag or setting `promptpass=true` in `exccwallet.conf`.

---

## Checking Your Balance

To send the `getbalance` command to `exccwallet` using `exccctl`, enter the following in your shell:

```no-highlight
exccctl --wallet getbalance
```

This will return all of the balances for all of your accounts.

---

## Getting a New Receiving Address

To send the `getnewaddress` command to `exccwallet` using `exccctl`, enter the following in your shell:

```no-highlight
exccctl --wallet getnewaddress
```

This will generate and return a new payment address. To minimize address reuse, use this command to get a new address for each transaction you wish to receive.

---

## Sending EXCC

To send EXCC to an address, issue the `sendtoaddress` command to `exccwallet` using `exccctl`. Enter the following in your shell, filling in the receiving address and amount to send:

```no-highlight
exccctl --wallet sendtoaddress <address> <amount>
```

If successful, `exccctl` will return a transaction hash that can be used to watch the transaction on the official [ExchangeCoin Block Explorer](../../getting-started/using-the-block-explorer.md).

---

## Check Network Stats

There are many different commands to check different network stats. Here we will cover sending `getinfo` to `exccd` and `getstakeinfo` to `exccwallet`.

To get information about your local `exccd` node, issue the `getinfo` command to `exccd` using `exccctl`. Enter the following in your shell:

```no-highlight
exccctl getinfo
```

To get staking information about the Proof-of-Stake network, issue the `getstakeinfo` command to `exccwallet` using `exccctl`. Enter the following in your shell:

```no-highlight
exccctl --wallet getstakeinfo
```

---

## Additional Commands

More commands can also be found on the [exccctl RPC Commands](exccctl-rpc-commands.md) page.
