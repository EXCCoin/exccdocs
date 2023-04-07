# Decentralized Stake Pooling 

---

ExchangeCoin's approach to Proof of Stake (PoS) pooling addresses the challenge of allowing multiple participants to contribute to a single ticket purchase and subsequently share the staking rewards proportionally. This is accomplished through a combination of transaction inputs, output commitments, and round-robin signing.

Here's a breakdown of the PoS pooling process in ExchangeCoin:

1. Multiple inputs are allowed in a ticket purchase transaction. Each input represents a contribution from a participant in the pool.
2. The transaction commits to the UTXO subsidy amount for each input proportionally, ensuring that each participant will receive a share of the staking reward based on their initial contribution.
3. The transaction also commits to a new output public key or script for the proportional rewards, allowing the subsidy to be distributed trustlessly among the contributors.
4. The ticket can be signed round-robin before being submitted to the network, ensuring that each participant has a say in the ticket's submission.
5. The control over the production of the vote is given to another public key or script, which cannot manipulate the subsidy distribution among the participants.
6. Distributed vote production can be achieved by using a script in the ticket that allows multiple signers, giving each participant the ability to contribute to the vote generation.

This innovative approach to PoS pooling in ExchangeCoin enables a trustless and secure way for multiple participants to pool their resources, similar to Proof of Work (PoW) mining pools, while maintaining the decentralization and security inherent in the PoS consensus mechanism.
