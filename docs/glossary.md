# Glossary

---

## A

---

#### Account

Accounts allow you to keep separate records of your EXCC funds. Transferring EXCC across accounts will create a transaction on the blockchain.

#### Address

An address in the context of cryptocurrency is similar to an email address and represents a possible destination for a payment. However, addresses come in different types and are often intended for a single use only. This is because they not only indicate the destination of a payment, but also include requirements necessary to redeem funds.

#### ASIC

An ASIC is a specialized computing device that has been optimized for a specific task to achieve high efficiency. In the world of cryptocurrency, ASICs are usually designed to perform Proof-of-Work (PoW) mining. ASICs typically have much higher hashrates compared to general-purpose CPUs or GPUs.

#### Atom

The smallest unit of ExchangeCoin currency. One atom is one hundred millionth of a single EXCC (0.00000001 EXCC).

## B

---

#### Block

In the context of ExchangeCoin, a block refers to the data structure in which transactions are grouped before being added to the distributed ledger. The difficulty of mining in ExchangeCoin is adjusted such that new blocks are added to the chain every five minutes on average.

#### Block explorer

A block explorer is a tool that enables users to view and navigate through blocks in a more accessible format than the raw data that comprises them.

#### Block header

A block header is metadata located at the beginning of a block that provides a summary of the contents of the block. The hashing of a block header results in a unique value, which is commonly used as the primary method of identifying a specific block.

#### Block reward

The block reward is a distributed reward (in EXCC) for successfully creating a block of transactions. It is split between PoW miners, active and chosen voters, and the Treasury. The block reward reduces exponentially with block height, but ExchangeCoin’s algorithm interpolates this decay over time to prevent market shocks that usually occur in algorithms that involve large and infrequent reductions. The block reward initially started at 31.19582664 and adjusts every 6,144 blocks (approximately 21.33 days) by reducing by a factor of 100/101.

#### Block voting

In each block, five tickets are randomly selected to vote on the regular transaction tree of the previous block and any open consensus rule change proposals. A voting ticket approves or rejects the regular transaction tree of the previous block. If a majority of voting tickets vote Yes, the regular transaction tree of the previous block is accepted. If a majority of voting tickets vote No (or there is a tie), the regular transaction tree of the previous block is rejected, and the transactions are returned to the mempool.

## C

---

#### Change

ExchangeCoin has a concept of change, similar to the concept of change when using physical cash. For instance, if you received 5 EXCC in a single transaction and intended to spend 1 EXCC, your wallet would create a transaction to send 1 EXCC to the recipient and another transaction to send the remaining 4 EXCC to another address you own, which is called a change address.

#### Change Address

A change address is created by your wallet to receive change. Your wallet generates a new change address for each transaction, which improves user privacy. Not using dedicated change addresses, or re-using existing ones, would enable a passive observer to infer a significant amount of information about your transaction sizes and where you are sending transactions to.

#### Coin Type

A unique number assigned to a cryptocurrency, which is used by [HD
Wallets](#hierarchical-deterministic-hd-wallet) during the process of generating public/private keypairs.
Cryptocurrencies with assigned coin types are listed in
[SLIP-0044](https://github.com/satoshilabs/slips/blob/master/slip-0044.md).
The coin type of ExchangeCoin is 21370.

#### Coinbase maturity

After a block is mined, newly created ExchangeCoin from coinbase and stakebase transactions cannot be spent until the coinbase maturity period has passed. In ExchangeCoin, the coinbase maturity period is 256 blocks.

#### Coinbase transaction

Every block mined in ExchangeCoin contains a single coinbase transaction. This transaction creates new ExchangeCoin and constitutes the Proof-of-Work and Treasury portions of the block reward. Coinbase transactions are part of the regular transaction tree and can be rejected if Proof-of-Stake voters vote to reject the block that contains them. ExchangeCoin created in coinbase transactions cannot be spent until the coinbase maturity period has passed.

#### Cold wallet

A cold wallet is a type of ExchangeCoin wallet that is used to generate private keys and store ExchangeCoin while being completely offline. Methods of cold storage include generating a wallet on a computer that is never connected to the internet, using a dedicated hardware wallet, or using a paper wallet.

#### Command Line Interface (CLI)

A command line interface (CLI) is a type of user interface that enables users to interact with a software program using textual commands. A CLI wallet is a type of ExchangeCoin wallet that is operated using various tools and commands.

#### Confirmation

A transaction is confirmed in ExchangeCoin when it has been included in a block that has been verified by the network and added to the blockchain. Each additional block added to the blockchain reconfirms all transactions in all previous blocks. The number of times a transaction has been confirmed is used as a measure of confidence that the transaction will remain in the blockchain. A wallet or other service may require a certain number of confirmations before it considers a transaction to be valid. For example, if a wallet requires three confirmations to consider a transaction valid, it would require the next two blocks after the block including the transaction to confirm the transaction.

#### Consensus rules

Consensus rules are software-encoded rules that govern how nodes in a network agree on the state of the ledger. These rules specify what data blocks can contain, how block data is structured, and how nodes validate blocks.

#### Consensus rules voting

To make any changes to ExchangeCoin's consensus rules, an [on-chain voting process](governance/consensus-rule-voting/overview.md) is conducted for around one month. The change is implemented only if at least 75% of votes are in favor.

#### Constitution

A [document](governance/exchangecoin-constitution.md) which defines the purpose and guiding principles of the ExchangeCoin project.

#### Credits

The full unit of the ExchangeCoin currency (i.e. 1 EXCC).

## D

---

#### Difficulty

Difficulty is a metric that measures how hard it is to mine a new block, i.e., to find a hash below a given target. In ExchangeCoin, the PoW difficulty is calculated based on the exponentially weighted average of differences in previous block times.

#### Distributed ledger

A distributed ledger is a cryptographically secure ledger that is composed of nodes in a network. Each node holds a copy of the same ledger.

#### Double-spend

Double-spending is an attack where a set of coins is spent in more than one transaction. Successful double-spending can result in inflation by creating new coins that did not exist previously.

## E

---

#### EXCC

Ticker for the ExchangeCoin currency.

#### Exilibrium

A GUI (Graphical User Interface) [ExchangeCoin wallet](https://github.com/EXCCoin/exilibrium/) maintained by the core team.

#### Elliptic Curve

In mathematics, an elliptic curve is a plane algebraic curve defined by an
equation of the form _y^2^ = x^3^ + ax + b_{: .dcrm }.
Elliptic curves have a number of interesting properties which make them useful
for cryptographic purposes.

For example, elliptic curve point multiplication is used as the basis of
producing a one-way function.
The multiplication of two points on an elliptic curve yields a third point on
the curve whose location has no immediately obvious relationship to the
locations of the first two, and thus repeating this N times will yield a point
that may be essentially anywhere.
Assuming N is sufficiently large, reversing this process is computationally
infeasible.

#### Elliptic Curve Cryptography (ECC)

An approach to public-key cryptography based on the algebraic structure of
elliptic curves over finite fields.

ECC requires significantly smaller keys to achieve equivalent security compared
to non-EC cryptography techniques - for example, a 256 bit ECC key is equivalent
to a 3072 bit RSA key.
This is a particularly useful property in the context of a cryptocurrency, which
fundamentally depends upon transmitting and storing a large number of
cryptographic keys.
ECC also has lower CPU and memory requirements compared to most non-EC
techniques.

#### Expired ticket

Tickets that reached the end of their window without being called to vote - these can be revoked, but do not grant a reward.

## F

---

#### Faucet

A mechanism for obtaining free (testnet) coins.

#### Fork

In the context of blockchains, the term fork has two common meanings; it can refer to either a code fork or a chain fork. A [code fork](https://en.wikipedia.org/wiki/Fork_(software_development)) is when developers take a copy (fork) of the source code of a project and begin independently developing it, creating a separate version of the software. For instance, the OpenBSD operating system is a fork of NetBSD. If the state of the blockchain is also forked, as was the case with Bitcoin Cash, it is also considered a “chain fork”. In this case, owners of coins on the original chain will have equivalent coins on the new chain when the chains diverge. ExchangeCoin began its life as a source code fork of [btcd](https://github.com/btcsuite/btcd), an alternate full node implementation of Bitcoin. Significant changes were then made before launch, including modifications to the consensus rules, a Proof-of-Stake (PoS) layer to enable on-chain governance, a new hashing algorithm and other innovations. ExchangeCoin is not a chain fork, as it did not copy the state of the Bitcoin blockchain, and instead started from its own genesis block. 

It is also worth noting that chain forks can and do regularly occur without any code changes. This happens unintentionally when nodes in the network temporarily disagree on the state of the blockchain. Typically, these forks are short lived and resolve when the nodes reach consensus. In [sustained chain splits](https://blog.goodaudience.com/blockchain-forks-and-chain-splits-why-we-should-avoid-them-f54c693a90f1) such as Bitcoin Cash, there is sufficient economic and hash power to support multiple competing versions of the blockchain for an extended period of time.

Forks can be [hard forks](#hard-fork) or [soft forks](#soft-fork). Soft forks are backwards compatible, whereas hard forks are not. 

#### Full node

A full node is a software that fully validates all transactions and blocks, providing users with complete control over their funds and preventing the need to trust a third-party. Full nodes also participate in relaying transactions and blocks to other nodes, which forms the peer-to-peer network that powers the ExchangeCoin cryptocurrency.

## G

---

#### Genesis block

The genesis block is the first block of the ExchangeCoin blockchain, created on Monday, 16-Jul-18, and has a block height of zero.

## H

---

#### Hard Fork

A hard fork is a permanent split in the blockchain that occurs when there are non-backwards compatible changes made to the consensus rules. Nodes using the old rules will create blocks or transactions that are considered invalid by nodes using the new rules, resulting in two separate chains. In ExchangeCoin, hard forks are coordinated using [consensus rule voting](governance/consensus-rule-voting/overview.md), which allows for changes to be made predictably without dividing the network and enables Proof-of-Stake voters to have a say in accepting or rejecting proposed changes. 

#### Hash

The output of a cryptographic hashing function that produces a fixed-size value from variable-size input. While it is computationally easy to create a hash from an input, it is extremely computationally difficult to calculate an input that will produce a given hash.

#### Hash function

A cryptographic function that produces a fixed-size hash value from variable-size transaction input. ExchangeCoin's Proof-of-Work uses the Equihash 144,5 hashing function.

#### Hashrate

The number of hashes per second computed by miners on the network.

#### Hierarchical Deterministic (HD) Wallet

Using the algorithm initially defined in
[BIP-0032](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki), a
Hierarchical Deterministic (HD) wallet is able to automatically derive a
tree-like structure of public/private keypairs from a single [seed
phrase](#seed).
This eliminates the need for the user to constantly generate and backup new
public/private keypairs themselves.
Instead, the user only needs to backup the seed phrase, and the full wallet and
all of its associated keys can be regenerated when necessary.

#### Hot wallet

A ExchangeCoin wallet which is connected to the Internet. Proof-of-stake voting wallets are an example of hot wallets, they are constantly connected to the ExchangeCoin network because they can be called to vote at any time.

#### Hybrid PoW/PoS

In ExchangeCoin, a [hybrid PoW/PoS system](research/hybrid-design.md) is used, whereby blocks mined by PoW miners must be approved by ticket holders, which are pseudorandomly selected from the ticket pool. This provides a check on PoW miners and increases the overall cost of attacking the network. When a block is approved, 70% of the block reward goes to the PoW miner, 30% goes to the holders of tickets called to vote (approve blocks).

## I

---

#### Immature ticket

Once tickets are mined they are immature for 256 blocks (about 20 hours) and cannot be called to vote until after this period elapses.

#### Inflation

See [Issuance](#issuance).

#### Issuance

Increase in the [available supply](advanced/issuance.md) of ExchangeCoin as new EXCC is minted into existence through the block reward.

## L

---

#### Live ticket

Tickets that are waiting to be called.

## M

---

#### Mainnet

The proper ExchangeCoin network - a term used to differentiate from testnet.

#### Mempool

The mempool is the set of transactions that have been broadcast to the network and are waiting to be included in a block by miners. Transactions in the mempool have not yet been confirmed by being included in a block, and can be removed from the mempool if they are not confirmed within a certain amount of time.

#### Miners

Miners are participants in the Proof-of-Work (PoW) consensus mechanism who compete to add new blocks to the blockchain. They do this by solving complex mathematical problems, and are rewarded with block rewards and transaction fees for successfully validating blocks.

#### Mining Pool

A mining pool is a group of miners who combine their computational resources to increase their chances of mining a block and earning the associated rewards. When a member of a mining pool successfully mines a block, the rewards are split among all pool members in proportion to the hashpower they contribute to the pool.

#### Missed ticket

A missed ticket is a term used in Proof-of-Stake (PoS) consensus mechanisms to describe a ticket that has been called to vote but did not receive a reward. This can happen if the wallet that purchased the ticket does not respond when called to vote, or if the vote is not included in the following block by a miner.

#### Multisignature

A multisignature transaction is a type of transaction that requires more than one private key to authorize. This provides increased security, as multiple parties are required to sign off on the transaction before it can be executed. Multisignature transactions can support multiple keys (N) and a subset of those (M) are required to transact (commonly known as "MofN"). For example, a 2 of 3 multisignature transaction would require signatures from two out of three possible private keys to authorize the transaction.

## N

---

#### Nonce

The term nonce comes from "number used once". In the context of ExchangeCoin, it is usually a 4-byte field in the block header used by proof-of-work miners, along with some additional bytes used as an extra nonce, to make the block's hash lower than or equal to the current difficulty target of the network.

## O

---

#### Orphan block

Valid blocks that are not included in the definitive blockchain are called orphaned blocks. Orphaned blocks can occur naturally when two miners produce blocks at similar times. Orphan blocks can also be created when they build on an unknown block, which makes them orphans.

#### Orphan transaction

A transaction with missing inputs is called an orphan transaction. Orphan transactions can occur when the parent transaction is unknown, making the transaction an orphan. Orphan transactions can also occur when they are part of a block that has been abandoned and have not been included in another block. When a block with specific transactions, such as coinbase transactions and votes, is orphaned, the transactions in that block become orphaned transactions.

## P

---

#### Private key

An enormous number that, when kept confidential, allows for the legitimate spending of ExchangeCoin while preventing others from doing so. Wallets encrypt private keys to prevent theft.

#### Private passphrase

A passphrase used to encrypt parts of the `wallet.db` file, including private keys. Without the passphrase, private keys cannot be accessed.

#### Proof-of-Stake (PoS) voting

The method by which ticket holders vote to approve blocks confirmed by PoW miners, earn staking rewards, and vote on consensus rule changes and Politeia proposals.

#### Proof-of-Work

The mechanism that miners use to demonstrate that they have contributed computational power to create a new block. Miners create a hash of the block header repeatedly until they find a hash that is equal to or below the current difficulty. When shared with the network, this hash can be easily validated, providing proof of the miners' work.

#### Protocol rules

See [Consensus Rules](#consensus-rules).

#### Public key

An astronomically large number generated algorithmically from a private key. Public keys can be freely shared without revealing any information about the private key they are generated from. The user’s public key is used to prove that a transaction was signed using their private key.

## Q

---

#### Quorum

The minimum level of participation required in order for a decision-making process to produce an actionable outcome. Changes to the consensus rules require at least 10% of votes to be for or against the change in order to be valid. Politeia proposals require 20%.

## R

---

#### Redeem Script

A [redeem script](proof-of-stake/redeem-script.md) is 1-of-2 multisignature
script generated during the user registration process of
[exccstakepool](https://github.com/EXCCoin/exccstakepool) (legacy VSP software no
longer in use, superseded by [vspd](https://github.com/EXCCoin/vspd)).
Allocating voting rights to the hash of this shared script would enable either
the user or the VSP to vote tickets purchased by the user.

#### Regnet

Regnet is a blockchain network with low difficulty levels that allows developers to mine new blocks at will, which is primarily used for testing purposes. It is particularly useful for unit tests, RPC server tests, and consensus rule tests. However, Regnet is not intended for full integration testing with other applications, such as mining software or wallets.

#### Regular transaction tree

The regular transaction tree is where most of the transactions in a block occur, including sending EXCC to an address and coinbase transactions such as PoW miner rewards and Treasury stipends.

#### Reorg

A reorganization of the blockchain occurs when a set of blocks is replaced by another set that has more work. The depth of the reorg is determined by the number of blocks that are replaced.

#### Revoked ticket

When a ticket that was missed or expired is revoked, the EXCC used to purchase it becomes spendable again.

#### Rule Change Interval (RCI)

The Rule Change Interval is the interval during which ticket holders can vote on consensus rule changes. On the mainnet, this occurs every 8,064 blocks (~4 weeks). Once the conditions for a vote have been met during a [Stake Version Interval (SVI)](#stake-version-interval-svi), voting is scheduled to begin on the first block of the next RCI, with the final vote tally taking place on the last block of the RCI.

#### Rule change proposal

A rule change proposal is a proposal to change the consensus rules of the ExchangeCoin blockchain. Such proposals must be implemented as latent code within the software running the network's nodes. If the proposal passes, the latent code activates one month later.

## S

---

#### Seed

A 256-bit (32-byte) cryptographically secure random number used to recover a wallet. Along with the seed, a 33-word "seed phrase" is created when setting up an ExchangeCoin wallet. This seed phrase can restore the wallet's private keys, transaction history, and balances using any ExchangeCoin wallet on any computer, in case the wallet is lost or corrupted.

#### Signature

A cryptographic mechanism to prove that a private key was used to validate or authorize data.

#### Simnet

A testing environment with very low difficulty designed for developers to mine new blocks locally for testing purposes.

#### Simple Payment Verification (SPV)

A wallet mode that downloads only blocks related to addresses owned by the wallet, allowing it to operate with less stringent hardware requirements and load significantly faster than in fully validating mode. While SPV wallets cannot vote, they can purchase tickets and allocate voting rights to a [Voting Service Provider (VSP)](#voting-service-provider).

#### Soft Fork

A change to consensus rules that is backwards compatible, allowing nodes running older versions without the new rules to still validate transactions and blocks. However, nodes running older versions can only partially validate transactions and blocks created by nodes using the new rules, as they cannot understand new transaction types added via soft fork. 

#### Stake transaction tree

[Transactions](https://www.reddit.com/r/decred/comments/66j4l4/decred_proof_of_stake_explained/dgjsyxd) relating to ticket buying and ticket voting rewards.

#### Stake Version Interval (SVI)

Stake Version Interval (SVI) is a specific interval, which is used to decide if a vote on consensus rule changes can start. On the mainnet, this interval is every 2,016 blocks, approximately one week. Prior to the start of the vote, 75% of tickets that vote during the SVI must be using software that includes the proposed latent software change.

#### Stakebase transaction

Each block that is mined will have a stakebase transaction for each ticket that voted on that block. Stakebase transactions consist of two inputs, the spent ExchangeCoin used to purchase the ticket and the newly created ExchangeCoin which constitutes the reward for voting. In the event of revoking an expired or missed ticket, stakebase transactions are also created, but no voting reward is generated. Since stakebase transactions belong to the stake transaction tree, they cannot be rejected by proof-of-stake voters, even if they vote to reject the block that contains them.

#### Stakepool

See [Voting Service Provider](#voting-service-provider).

#### Staking

Colloquial term for time-locking EXCC in exchange for tickets.

## T

---

#### Testnet

Testnet is a parallel network used for testing purposes. It allows users to freely obtain EXCC from faucets to experiment and test various functionalities of the ExchangeCoin network.

#### Ticket

Tickets are time-locked EXCC which holders can use to vote and participate in the decision-making process of the ExchangeCoin network. The EXCC used to buy a ticket is unlocked after the ticket is called to vote on-chain, along with a reward. If a ticket expires before it's called to vote, the EXCC is unlocked but no reward is granted.

#### Ticket pool

The ticket pool is the collection of live tickets available to be called to vote in the ExchangeCoin network. The optimal size for the ticket pool is 40,960, and it's algorithmically adjusted to maintain this size.

#### Ticket price

The ticket price is the amount of EXCC required to purchase a ticket for participating in the ExchangeCoin network's decision-making process. It's algorithmically adjusted to maintain the optimal size of the ticket pool. The algorithm for setting the ticket price was changed by DCP-0001, which was the first consensus rules change to be adopted using an on-chain vote.

#### Ticket-splitting

Ticket-splitting is the process of multiple participants pooling their funds to purchase Proof-of-Stake tickets. However, the software that allowed participants to coordinate split ticket purchases without giving up custody of their EXCC, dcr-split-ticket-matcher, is no longer supported as of ExchangeCoin release 1.6.

#### Tor

[The Onion Router](https://www.torproject.org/) (Tor) is a free and open-source software that enhances security and privacy for users communicating over a network. It's commonly used for anonymous communication and to protect against internet traffic analysis.

#### Transaction fees

Transaction fees are payments made to include a transaction in a block. In ExchangeCoin, the default transaction fee is set at 0.0001 EXCC/kB.

## U

---

#### Unmined ticket

When a ticket is purchased, it is initially unmined until the transaction is included in a block.

#### UTXO

An Unspent Transaction Output (UTXO) refers to an output of a transaction that has not yet been spent. It represents some amount of EXCC that can be used as input for a new transaction. The total balance of a user is the sum of all the UTXOs that the user has the private keys to spend. 

## V

---

#### Voted ticket

Tickets that have been called and responded with votes. Once a ticket has voted, the EXCC locked to purchase it becomes spendable after 256 blocks.

#### Voters

People who buy tickets and vote with them.

#### Voting Service Provider

Voting Service Providers are non-custodial services that can be authorized to vote on behalf of a ticket. They usually provide a number of geographically distributed servers to reduce the chance of missed tickets.

## W

---

#### Wallet

A wallet is a file that stores private keys and allows users to view and create transactions on the blockchain. ExchangeCoin offers a GUI wallet (Exilibrium) and Command Line Interface (CLI) wallet tools for advanced users, in addition to being supported by numerous third-party wallets.

#### Watch-only

Watch-only refers to an address or pubkey script stored in the wallet without the corresponding private key, allowing the wallet to monitor for outputs but not spend them.

#### Work

Work refers to the cumulative number of hashes calculated by proof-of-work miners to produce the blockchain.
