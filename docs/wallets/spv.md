# Simple Payment Verification (SPV)

---

## What is SPV?

Simple Payment Verification (SPV) enables the usage of an ExchangeCoin wallet without downloading the entire ExchangeCoin blockchain. An SPV-enabled wallet only downloads full blocks containing its relevant transactions (i.e., transactions involving the wallet's addresses). This results in downloading tens of megabytes instead of multiple gigabytes, reducing the wallet's hardware requirements and significantly decreasing the initial load time for new wallets.

SPV has been integrated directly into the `exccwallet` CLI tool, which is used by Exilibrium and other official wallets. Therefore, all users of official wallets can enable SPV.

## Why was SPV added to `exccwallet`?

Hardware requirements for running an ExchangeCoin wallet are significantly reduced in SPV mode. Storage and download demands are minimized as an SPV wallet only downloads blocks containing relevant transactions and headers for the remaining blocks in the chain. Processing power requirements are also decreased, as an SPV wallet only validates the proof-of-work and header chain, rather than validating every transaction in every block and ensuring block content consistency with the headers.

Due to these reduced requirements, ExchangeCoin wallets can operate on a broader range of devices, particularly mobile devices. Smartphones and tablets often have limitations in CPU power, storage, or download capacity, and mobile operating systems restrict background processing for each application, making running a full node impractical or impossible.

SPV also significantly decreases the time required for a new wallet to become operational, enhancing the user experience.

## How does SPV work?

Every block added to the ExchangeCoin blockchain begins with 180 bytes of data called the [block header](https://devdocs.decred.org/developer-guides/block-header-specifications/). The block header contains key information about the block, such as the block hash, Merkle root (the sum of all transaction hashes in the block), and the proof-of-work miners' nonce. A predetermined filter is also created for each block based on all its transactions.

When an SPV wallet initializes, it connects to the ExchangeCoin network using peer-to-peer connections and downloads the complete set of headers and filters. It then validates the header chain to ensure its validity and proof-of-work. Once complete, the wallet uses the filters to locally identify blocks containing its transactions without uploading any private data to remote nodes. The wallet then downloads these blocks via the peer-to-peer network, scans them for relevant transactions, and updates its transaction history and balance accordingly.

## Are there any disadvantages?

- SPV does not support voting wallets. Voting wallets are responsible for validating the last block, and a wallet cannot ensure validity without fully validating the entire blockchain leading up to that block. It is possible to buy tickets and delegate voting rights to a [Voting Service Provider](../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp). Keep in mind that if a VSP fails to revoke a missed ticket, an SPV wallet cannot revoke the missed ticket until it reaches the confirmation depth of an expired ticket.

- SPV wallets only download blocks containing transactions related to their owned addresses, which may slightly reduce privacy compared to downloading every block. However, this decrease in privacy is minimal and can be mitigated by downloading blocks from multiple peers, preventing any single peer from seeing the complete list of blocks downloaded by a wallet. Even if a passive network observer can see which blocks a wallet downloads, they cannot determine which transactions in those blocks are relevant.

- Wallets in SPV mode can only validate the downloaded block headers, not the filters. This allows for a "false-negative" attack, where a malicious peer, knowing a wallet is waiting for a specific transaction, could send a fake filter excluding the transaction. Consequently, the wallet would not download the block and remain unaware of the transaction's existence. However, fully validating nodes and wallets would still see this transaction, and it would appear in the block explorer. DCP-0005 was activated through a consensus rule vote in early 2020, allowing SPV wallets to easily verify the filter's validity without downloading their blocks. A "false-positive" scenario is not possible. If a malicious node provides a fake filter containing a non-existent transaction, the wallet will download the full block, compare it to the filter, and discover the filter's inaccuracy.

## How do I use SPV?

#### `exccwallet` CLI

To activate SPV mode in `exccwallet`, simply include the `--spv` flag when starting the process. There is an optional `--spvconnect` flag that disables DNS seeding and allows you to specify a full node's IP for syncing. You can specify `--spvconnect` multiple times to sync with multiple peers.

#### Exilibrium

When launching Exilibrium for the first time, a dedicated screen appears during the setup wizard, asking if you want to enable SPV mode.

If you have used Exilibrium before, you can switch to SPV mode via the settings tab. This tab also contains an "SPV Connect" textbox, allowing you to specify the IP address of a full node to sync from.
