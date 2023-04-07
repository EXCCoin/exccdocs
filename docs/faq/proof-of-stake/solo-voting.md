# Solo Voting

---

#### 1. Is hash power necessary to participate in Proof-of-Stake (PoS)?

No, purchasing PoS tickets and voting do not require any hash power.

---

#### 2. What occurs if my wallet is unreachable or locked when my tickets are selected by miners?

If your wallet is offline or locked when your tickets are selected, you will miss out on the rewards, and your ticket will be removed from the pool. You can then revoke the ticket to reclaim the funds that were locked when it was purchased.

---

#### 3. Can I test if my machine is reachable for voting?

Your voting wallet and machine do not need to be reachable for voting. Voting is deterministic on a per-block basis. Your wallet will know if your ticket is selected based on the current block, and it will automatically broadcast a vote to the network just like other transactions.

---

#### 4. Is it possible to run multiple voting-only wallets with the same seed on various servers?

Yes, you can run multiple voting-only wallets with the same seed on different servers.

Using the same seed for multiple wallets on separate servers may cause issues if the wallets are creating new addresses since each wallet is unaware of addresses created by the others. However, voting-only wallets do not face this issue because voting does not require creating new addresses.
