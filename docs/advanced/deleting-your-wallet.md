# Deleting Your Wallet 

---

There could be several reasons for deleting your wallet:

* Restoring your wallet from a seed.
* Losing the seed and wanting to create a new wallet.
* Removing the wallet from a specific computer.

First, locate the `exccwallet` application directory, which varies by platform. This is the same directory where your configuration files are located.

In that directory, delete the `mainnet/wallet.db` file. This will entirely remove your wallet from the computer. To access it again, you'll need to restore it from the original seed.

It's important to note that deleted files may be recoverable using file recovery tools, although it's not guaranteed. If you're deleting the wallet for security reasons, consider using a secure deletion tool like
[GNU shred](https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).
