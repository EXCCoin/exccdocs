# Blocks

---

#### 1. Can a block become orphaned after being confirmed multiple times?

A block can become orphaned after being confirmed multiple times, but only in the case of a sufficiently long reorg. This would require more hash power working on the other side of a fork than the hash power working on the current best chain.

---

#### 2. Can we remove the testnet block explorer given that one for mainnet is available?

The testnet block explorer will be kept up, as testnet serves as a testing ground for new features and having a separate explorer for it is useful.

---

#### 3. What do "[INF] CHAN: Adding orphan block" messages mean?

"[INF] CHAN: Adding orphan block" messages indicate that a block has been received for which the parent is not yet known. This usually occurs when syncing `exccd` and is resolved once the parent blocks are received.

---

#### 4. Should I download the blockchain again with every new software release?

You should not have to download the blockchain again with every new software release, as the system is typically designed to migrate and work with existing data.

---

#### 5. What is the genesis block number?

The genesis block is block height 0 (block number 0). Each subsequent block increases in height by 1.

---

#### 6. What do "[INF] CHAN: FORK: Block 000..." messages mean?

Here is an example message taken from `exccd` logs:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

"[INF] CHAN: FORK: Block 000..." messages indicate that two miners found a solution to a block around the same time and submitted their solved blocks to the network. Nodes will accept the first block they see and consider subsequent blocks as part of a side chain. This resolves itself when the next block is found and defines the longest chain, orphaning the other blocks that were not built upon.
