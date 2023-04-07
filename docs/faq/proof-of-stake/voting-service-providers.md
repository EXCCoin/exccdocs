# Voting Service Providers

---

Voting Service Providers (VSPs) offer the convenience of not having to run a full node and keeping your wallet unlocked while still participating in the voting process. Here are answers to some common questions about VSPs:

---

#### 1. Are there any other benefits to a Voting Service Provider (VSP) other than not needing to run a full node and keeping your wallet unlocked? For example, will it have a better chance of voting, or vote quicker?

VSPs do not increase the chance of a ticket voting or speed up the voting process. However, they often have multiple wallets distributed globally, reducing the chance of a missed vote due to wallet downtime and minimizing network latency.

---

#### 2. Does a Voting Service Provider (VSP) split the reward between all participants (% based on the amount of tickets you submitted to the VSP)?

While it's technically possible to create a VSP that supports proportional reward splitting, the current VSP reference implementation does not enable this.

---

#### 3. I have to run my wallet to buy tickets, but will they vote properly without me if I shut it down and the Voting Service Provider (VSP) votes for me instead?

You only need to run your wallet to purchase tickets, after which the VSP will vote on your behalf. The reward address in the ticket purchase is a consensus-enforced commitment to one of your own addresses, for which only you have the private key.

---

#### 4. Are there any issues that could arise from a Voting Service Provider (VSP) having too many people. For example, force voting a block in or out?

Although it's possible for a VSP with too many users to force vote a block in or out, VSPs should allow each user to select their individual voting preferences to prevent this from happening.

---

#### 5. What safeguards are in place to stop Voting Service Provider (VSP) owners disappearing with the funds in the tickets they vote for?

The VSP design prevents VSP owners from stealing funds, as they only have the ability to vote on tickets, not spend any funds. The ticket purchase contains a consensus-enforced commitment for the final subsidy address, so there is no way for the VSP to steal funds. If a VSP owner disappears, votes will be missed, and the ticket will be revoked, returning the original coins to the owner (minus the initial transaction fee). In this scenario, the ticket owner can run their own wallet to vote.

---

#### 6. What happens if my Voting Service Provider (VSP) goes down?

If your VSP goes down permanently, you can still vote on your own tickets and revoke any missed or expired tickets.
