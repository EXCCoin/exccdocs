# Introduction to ExchangeCoin Governance

---
ExchangeCoin has been designed to prevent powerful individuals or centralized planning committees from exerting an undue influence on the project's future. Instead, ExchangeCoin's governance model revolves around ticket-holder voting. Proposed modifications to the system are presented to the community for voting, with only approved changes implemented.

Anyone possessing a sufficient amount of EXCC can participate in governance by time-locking their coins to [purchase tickets](../proof-of-stake/overview.md), as outlined in our proof-of-stake overview. Some of the ticket holder voting is conducted on-chain, whereas some is off-chain.

Block validation and voting on consensus rule changes are carried out on-chain.

---

## On-Chain Voting

In every mined block, five tickets are randomly selected and requested to [vote on-chain](../proof-of-stake/overview.md), as described in our proof-of-stake overview. On-chain voting serves two primary purposes: validating blocks generated by Proof-of-Work (PoW) miners and voting on proposed consensus rule modifications.

Once a ticket is called to vote, the locked EXCC in that ticket is unlocked and returned to the purchaser's wallet, along with the PoS reward if the ticket was successful in voting.

### Block Voting

Tickets are used to vote in favor of or against the preceding block of transactions created by a PoW miner. For a block to be mined, at least three of the five tickets summoned to vote must approve it. If the majority of votes reject the prior block, the miner who produced it loses their block reward, and the transactions from that block are returned to the mempool.

This mechanism functions as a means of preventing malicious PoW miner behavior (such as the creation of empty blocks) while also serving as the foundation for ExchangeCoin's fork resistance.

### Consensus Rule Voting

Tickets are utilized to vote on the activation of proposed [consensus rule changes](consensus-rule-voting/overview.md). For a proposed change to be implemented, it must receive approval from at least 75% of non-abstaining tickets. The proposed rule change will be pre-coded in the full node software and remain dormant until it is automatically activated if the voters approve the change, eliminating the need for human intervention.
