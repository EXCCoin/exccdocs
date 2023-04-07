# Proof-of-Stake General FAQ

---

#### 1. When did ExchangeCoin's Proof-of-Stake start?

ExchangeCoin's Proof-of-Stake (PoS) was introduced during Hard Fork of ExchangeCoin software in 2018.
Since that time ExchangeCoin uses Decred's codebase.

Ticket purchases were enabled as soon as the initial coins became spendable. However, voting commenced at block 4,096, also known as the Stake Validation Height.

The first 4,096 blocks served as a bootstrapping phase, allowing the ticket pool to grow towards its target size. This ensured blockchain continuity by minimizing the risk of an empty ticket pool when voting started and helped to distribute the initial set of tickets among a broader group of participants.

---

#### 2. Do I need to be constantly connected to the network to participate in PoS?

A wallet must be online 24/7 to cast votes when tickets are chosen. There are two primary methods to achieve this:

1. Set up and maintain a solo staking wallet that stays online constantly.
2. Utilize a [Voting Service Provider](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp)
   (VSP) that will vote on your behalf, charging a small portion of the PoS reward as a fee for their service.

---

#### 3. What is the "ticket price"?

The ticket price is determined by an algorithm designed to maintain the ticket pool size, which is the total number of tickets in the PoS system ticket pool, close to a target of 40,960 tickets.

The ticket price fluctuates based on ticket demand and the current number of tickets in the pool. The algorithm adjusts the ticket price every 144 blocks, known as a buying window. Each block can contain 20 new ticket purchases, allowing a maximum of 2,880 tickets to be added to the PoS system ticket pool during each buying window.

Regardless of whether your ticket votes, misses, or expires, the ticket price is always refunded.

---

#### 4. What is a Voting Service Provider?

A Voting Service Provider (VSP) operates similarly to a Proof-of-Work (PoW) mining pool but for the Proof-of-Stake (PoS) system. Using the options in your ExchangeCoin wallet, you can delegate your voting rights to a VSP. If your ticket is chosen to vote, the VSP casts the vote on your behalf, and you receive the PoS reward. Unlike mining pools, the PoS reward isn't shared among the users of the VSP; the full reward goes to the owner of the specific ticket that voted.

A VSP enables you to buy tickets and vote without the need to maintain an online and unlocked wallet. It's important to note that your funds remain in your wallet. You don't send anything to the VSP; you only grant it permission to vote on your behalf. A VSP can't access your funds.

VSPs typically employ multi-wallet redundancy by having multiple wallets physically distributed worldwide. This reduces the likelihood of a missed vote due to wallet downtime and minimizes latency between the wallet and the network, further decreasing the chance of a missed vote.

---

#### 5. Can I cancel my ticket?

No. The locking of funds is a crucial aspect of ExchangeCoin's PoS security and governance model. With funds locked in tickets, ticket holders demonstrate their vested interest and are appropriately incentivized. Funds are returned to the ticket holder's wallet once the ticket has either voted or been revoked due to a missed or expired vote.

---

#### 6. Is Proof-of-Stake (PoS) susceptible to large exchanges using their customers’ EXCC?

The quantity of EXCC a person (or exchange) owns is not the primary concern, but rather the number of tickets. Funds used to buy tickets are locked until the purchased ticket votes, meaning EXCC involved in PoS are effectively nontransferable. For an exchange to use their customers' EXCC for voting, they would have to move them out of the wallets and lock them for up to 5 months. Customers would notice changes in their balances (EXCC locked in PoS won't appear as spendable), and they wouldn't be able to withdraw any funds, causing the exchange to experience a significant liquidity loss.

Additionally, there's a hard limit of 20 tickets added per block, preventing any exchange from flooding the pool beyond this rate.

Lastly, there's a soft cap on the total number of tickets in the pool. The ticket price is adjusted every 144 blocks (2,880 tickets) based on the number of tickets in the pool and the rate of new ticket additions during the last window. Eventually, the ticket price would become so high that even an exchange wouldn't be able to buy many tickets. And remember, their EXCC are locked, so they can't buy more when the price drops again.

---

#### 7. Can large balance holders, such as the original developers, unduly influence Proof-of-Stake (PoS)?

The pool size limitations prevent any one person or group from flooding the PoS pool with a large number of their own tickets. Even if they bought up the entire pool (with substantial fees), they would likely get only around 4,000 tickets (based on previous ticket windows). So, a large balance holder could buy two windows out, giving them about 14% of all tickets. However, their buying power for the new window would be significantly reduced as their funds would be locked in the tickets they had bought earlier.

Tickets for a block are chosen randomly, and to force a vote to go a certain way, one would need 60% of 75% of blocks in the voting period. Even with a huge expenditure of capital, achieving this is nearly impossible.

Voting Service Providers (VSPs), though unable to access users' funds, can change votes on tickets assigned to them. To prevent VSPs from becoming too large in relation to others, users are encouraged to join smaller VSPs. ExchangeCoin was designed to minimize the impact of large PoW mining pools, PoS VSPs, and individuals (including developers) with significant holdings.

---

#### 8. Why is the ticket pool target size 40,960?

The target of 40,960 tickets was chosen before ExchangeCoin's launch to ensure that tickets would have a 99.5% chance of voting before expiration.

---

#### 9. If my ticket expires without voting, do I lose the transaction fee?

Yes, the fee paid to mine the ticket transaction is not refunded.

---

#### 10. What happens if less than 3 of the selected tickets vote on a block?

Miners don't start mining the next block until at least 3 of the selected tickets vote on the current block. If a block doesn't receive the required votes, it is orphaned by the next block another miner finds. Miners continue working on the previous block until 3+ votes for the new block appear, at which point they switch to the new block. If 3+ votes never show up, another candidate block will be found by other miners, with different tickets selected due to the different hash.

---

#### 11. Are vote choices set when a ticket is purchased, or when a ticket votes?

Voting choices can be set and changed at any time after a ticket is purchased. The vote choice is recorded on the blockchain and can no longer be changed only when the ticket is called to vote. There could be weeks or even months between a ticket being purchased and it being called to vote. A ticket could be purchased before a voting agenda even exists.
