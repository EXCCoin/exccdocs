# Proof-of-Work (PoW) Mining

---

Proof-of-work mining, often referred to as PoW mining, involves dedicating your computer's hardware and resources to process network transactions and construct the blocks that comprise the ExchangeCoin blockchain.

Each time a miner creates a valid block, they receive the fees from all included transactions as well as a block reward (newly minted EXCC).

The block reward decreases by a factor of 100/101 every 6,144 blocks (roughly 21.33 days). For more information on the block reward and coin supply growth, visit the [Issuance](../advanced/issuance.md) page.

When proof-of-stake tickets are called to vote on a block, they possess the ability to strip the reward from the miner of the previous block. This power can be exercised if the miner constructs a block that goes against the network's best interests, such as creating an empty block when there are transactions waiting in the mempool.

ExchangeCoin blockchain is built on a Proof-of-Work + Proof-of-Stake hybrid consensus. We decided to use the Equihash (N=144, K=5) Proof-of-Work algorithm to make our blockchain ASIC resistant. That way we can ensure that every EXCC supporter can actively participate in securing transactions by mining. We avoid the issues of centralization of computing power (work) by a single actor, as has occurred on other blockchains.

---

## Mining on a shared pool with your GPU.

Join our [Mining Pool](https://pool.excc.co) and follow the simple instructions to start mining ExchangeCoin.

## Solo Mining or Pool Mining

##### Solo Mining

**Solo mining is not recommended and is not covered by this documentation!** The ExchangeCoin network regularly sees a network hash rate of up to 50k/s. Solo mining is generally only done by advanced individuals or organized groups with a large cluster of GPUs, so it is not addressed here.


#### Pool Mining

When you mine in a pool, your hashrate is combined with all the other pool miners’ hashrates to look for the correct solution for a block. You will receive a reward based on the amount of work your miner performs in the pool. Most mining pools pay on a pay-per-share method meaning that miners earn a steady amount of ExchangeCoin rather than the “all or none” of solo mining.
