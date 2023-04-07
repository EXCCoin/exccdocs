# Using the Block Explorer

---

## Overview

All blocks and transactions on the ExchangeCoin blockchain can be viewed through the utilization of the exccdata block explorer. The source code for [exccdata](https://github.com/EXCCoin/exccdata) is available on GitHub.

Public instances of exccdata are available for the following networks:

- [mainnet](https://explorer.excc.co)
- [testnet](https://testnet-explorer.excc.co)

---

## Blocks

Blocks within the ExchangeCoin blockchain can be easily located by searching for their unique block height number, by clicking on a `Height` value from the home page, or by their corresponding `BlockHash` value. It is important to note that older blocks have lower block numbers.

Each block contains two main sections:

1. **The Block Header**
    - This section provides a summary of essential information regarding the block, including a reference link to the previous block within the chain.
2. **Transactions**
    - This section includes several types of transactions, such as:
        - Proof-of-Work rewards
        - Proof-of-Stake votes and rewards
        - Proof-of-Stake ticket purchases
        - Standard transactions that involve the transmission of EXCC across the network.

---

## Block Headers

The table below illustrates the various types of information available in the top section of the
[exccdata](https://explorer.excc.co) block explorer. Most of this information can also be found within the block header, although the block explorer provides additional context.

| Value                    | Explanation|
|--------------------------| ---|
| `Block Hash`             | The unique hash of this specific block, which was found by the miner.|
| `Confirmations`          | The number of new blocks which follow this block in the chain.|
| `Size`                   | The size of the block (in kB).|
| `Height`                 | The height of the blockchain in which this block resides.|
| `Version`                | The version of the block header.|
| `Merkle Root`            | A hash value of all the transaction hashes and stake hashes (ticket purchases, votes, and revocations) included in this block.|
| `Stake Root`             | Originally, this was a hash value of all the stake related transaction hashes in this block. However, as of [DCP-0005](https://github.com/decred/dcps/blob/master/dcp-0005/dcp-0005.mediawiki), the stake hashes were moved into the Merkle Root, and the Stake Root was repurposed to house header commitments. These includes additional proofs and compact filters, which enable a more secure SPV mode for lightweight clients.|
| `Number of Transactions` | The number of regular transactions (EXCC sent from one user to another).|
| `Block Reward`           | The amount of new EXCC minted in this block.|
| `Time`                   | The time this block was created by a miner and was included in the blockchain.|
| `Nonce`                  | The value used by a miner to find a valid solution for this block.|
| `VoteBits`               | Used to signify the voting result on the previous block. This will either be 0 or 1. If 1, the previous block was approved by proof-of-stake voters. If 0, the previous block was disapproved by proof-of-stake voters and all non-stake transactions in the block were invalidated, including the newly generated block reward for the proof-of-work miner and the ExchangeCoin Treasury.|
| `Final State`            | The hash value of the final state of the lottery used to determine which tickets were eligible to vote on the previous block, and thus be included in this block. It consists of the five winning ticket hashes, as well as the state of the pseudorandom number generator that was used to select those winning tickets from the live tickets pool.|
| `Voters`                 | The number of successful proof-of-stake votes cast in this block. The maximum value is 5. Tickets can fail to vote when called upon, but a minimum of 3 votes are required.|
| `Fresh Stake`            | The number of stake ticket purchases in this block, which will be added to the ticket pool.|
| `Revocations`            | The number of tickets that failed to vote and were revoked.|
| `PoolSize`               | The total number of active proof-of-stake tickets.|
| `Bits`                   | A compact version of the network difficulty at the time the block was mined.|
| `SBits`                  | The price of one proof-of-stake ticket.|
| `Stake Version`          | The stake version used for voting on the created block.|
|  `Difficulty`            | The proof-of-work network difficulty.|

## Transactions

This section displays all transactions that have been included in the current block. Transactions are selected from the network mempool based on the highest fee first principle. The transactions within the block overview are organized in the following order: standard transactions (peer-to-peer transfers), proof-of-stake votes, and proof-of-stake ticket purchases. The subsequent sections will detail each transaction type.

---

### Standard transactions

Here’s the information included in standard ExchangeCoin transactions.

|Value               | Explanation|
|---                 | ---|
|`Size`              | The size of the transaction in bytes.|
|`Fee rate`          | The rate of fees collected by the network (per kB).|
|`Received Time`     | The time the network confirmed the transaction.|
|`Mined Time`        | The time a miner included the transaction in a block.|
|`Included in Block` | The block number that the transaction became a part of.|

Please note that the fields `Received Time`, `Mined Tim`e, and `Included in Block` will not be populated until a miner verifies and incorporates the transaction into an ExchangeCoin block. Once the transaction has been confirmed within a block, it is considered complete.


---

### Ticket purchases

In the case of a ticket purchase (stake submission), there are a few differences in how the transaction is displayed compared to a standard transaction.

Under the Details section, the word `Ticket` will be displayed above the sender's wallet address on the left-hand side, while the words `Subsidy Commitment` will appear on the right-hand side. For instance, a user may have purchased a stake ticket for 8.75411638 EXCC and received 7.15994209 EXCC in change. The address mentioned on the left under `Ticket` is where the funds used to purchase the ticket are stored. The first output on the right-hand side refers to the address that retains voting rights for this particular ticket, whereas the second output, `Subsidy Commitment`, indicates where the reward will be transferred. Please note that the block explorer may not yet show this information. Finally, the third output represents the address where any change from this transaction will be sent.

---

### Proof-of-stake votes

In the Details section, note the identifying terms such as `Vote`, `Stake Base`, `Block Commitment`, and `Vote Bits`. 
These terms indicate that the transaction is a vote that has been cast by a proof-of-stake ticket holder. For instance, in this particular example, the user had previously purchased a ticket for 8.99472311 EXCC and received 10.82959184 EXCC after casting their vote via this transaction.
