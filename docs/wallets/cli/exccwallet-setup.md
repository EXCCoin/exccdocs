# exccwallet Setup Guide

This guide is intended to help you set up the `exccwallet` application using [startup flags](startup-basics.md#startup-command-flags).

**Prerequisites:**

- Use the latest [exccinstall](cli-installation.md) to install `exccwallet`. Additional steps will be required if another installation method was used.
- Review how the launch commands differ for the Command Prompt (Windows) and Bash (macOS/Linux) shells, and how the home directories differ [here](os-differences.md).
- [Setup exccd](exccd-setup.md) and have it running in the background.

---

`exccwallet` is a daemon responsible for managing ExchangeCoin wallets for a single user. It enables users to manage their accounts, addresses, and transactions, as well as track balances across addresses. Additionally, it allows stakeholders to participate in Proof-of-Stake voting.

`exccwallet` requires a `wallet.db` file to exist in its home directory before it can be run. This file contains all the wallet's accounts, addresses, and transactions, and can only be created by creating a new wallet. If you used `exccinstall`, this process would have been handled automatically for you. If you have deleted your wallet.db file or used a different installation process, you can manually create a new wallet using the command outlined in the  [manual wallet creation command](#manual-wallet-creation-command) section.

--8<-- "seed-warning.md"

---

## Manual Wallet Creation Command

If you do not already have a `wallet.db` file stored in `exccwallet`'s home directory, you must run the `exccwallet --create` command. Steps for this can be found below.

1. Open a new shell window (Bash/Command Prompt/etc,..).
2. Navigate to the directory of the `exccwallet` executable.
3. Enter the command `exccwallet --create` (review the Prerequisites above if you are unsure whether you should use `./exccwallet` or `exccwallet.exe` for the previous command).

---

## Wallet Creation Walkthrough

During the wallet creation process, you will set a private passphrase and have the option to set a public passphrase. This is done by following these steps:

1. Set Passphrases for Your Wallet

    Once you have executed the `exccwallet --create` command, you will be prompted to enter your private passphrase:

        Enter the private passphrase for your new wallet:

    This passphrase is used to unlock your wallet when creating transactions or voting with Proof-of-Stake. It is essential to use a unique and strong password to protect the private keys within your wallet file from theft.

    After confirming your private passphrase, you will see the following prompt:

        Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:

    The public passphrase is optional and is used to encrypt all of the public data (transactions and addresses) within your wallet file. If your wallet file is stolen, an adversary cannot link you to your transactions.

2. Record Your Seed

    Before proceeding to create a new seed for your wallet, it is crucial to review the Critical Information section above to ensure the safety of your funds.

    Once you have set your private passphrase and optional public passphrase, you will be prompted with the option to use an existing wallet seed. This guide assumes that you do not have an existing seed, so you can simply hit Enter to proceed.

        Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:

    This guide assumes you do not have an existing seed, so continue by hitting `Enter` which will answer the prompt with the default `[no]`. NOTE: If you wish to restore your wallet by using your seed, you would simply enter `[yes]` here and follow the instructions on screen.

    After answering `[no]`, your seed phrase (wallet generation seed) and its hex will be displayed in the window. Please read through the IMPORTANT section displayed immediately after the hex.

    It is essential to emphasize the importance of securely storing your seed phrase. If you have not already memorized it, please refer to the Critical Information section above and take the necessary steps to ensure it is saved in a secure location.

    Once you have written down the seed phrase and hex, type `OK` and press `Enter`. NOTE: if you did not write the phrase down before continuing, you should start this process over after [deleting your wallet file](../../advanced/deleting-your-wallet.md)

    After pressing `Enter`, you should see the following message:

        Creating the wallet...
        The wallet has been created successfully.

    The wallet will then be created. This might take a few minutes if you have a slow computer.

---

## Launching exccwallet

In order to launch `exccwallet`, you first must have [created your wallet](#wallet-creation-walkthrough) and
[connected exccd to the ExchangeCoin network](exccd-setup.md#connect-to-the-excc-network).

1. Configure RPC Username and Password

    If you used [`exccinstall`](cli-installation.md), your configuration files are already setup with the RPC username/password for `exccd`, `exccwallet`, and `exccctl`.

    If you did not use `exccinstall`, you will need to enable the bare minimum settings in your configuration files. Follow [this guide](../../advanced/manual-cli-install.md#minimum-configuration) to do so.

2. Start exccwallet

    Assuming the configuration files are set up correctly, open another command prompt or terminal window in your ExchangeCoin directory. You can also use the existing window if you just created your wallet. Then, enter the command provided below (refer to the Prerequisites section of this guide to ensure that you have the correct command for your operating system and shell application).

        exccwallet

    Your `exccwallet` will now connect to the network via `exccd`. It will begin to scan the network for your active addresses which can take a few minutes on slow computers. Eventually it will start showing lines like:

        [INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990

    This means your wallet is successfully connected to the network
    through your daemon.

---

To learn how to use `exccd` and `exccwallet`, visit the [exccctl Basics](exccctl-basics.md) guide. You'll learn how to unlock your wallet, send and receive EXCC using `exccctl`, check your balance, and check various network stats.
