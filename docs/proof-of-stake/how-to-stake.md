# How to Stake/Vote

---

Engaging in ExchangeCoin's Proof-of-Stake mechanism necessitates the use of a constantly online voting wallet. This wallet must be online and unlocked 24/7, prepared to sign vote transactions as soon as tickets are chosen to vote on a block.

Advanced users with some system administration skills might opt to operate their own voting wallet, known as [Solo voting](#solo-pos-voting). 
Meanwhile, beginners or those who cannot or do not want to maintain an always-online voting wallet can choose to use a [Voting Service Provider (VSP)](#voting-service-providers) instead.

---

## Solo PoS Voting

Solo PoS voting is recommended primarily for advanced users.

* The use of command-line tools is necessary, as Exilibrium does not support this feature.
* Your voting wallet must be online and unlocked 24/7.
* Voting wallet downtime may lead to missed votes and lost voting rewards.
* You must be confident in your ability to secure your voting hardware.

Reasons to participate in solo voting include contributing to the decentralization of the ExchangeCoin network, maintaining complete control over your funds and wallet, enhancing privacy, and avoiding VSP fees.

The [Buying Tickets with exccwallet](../wallets/cli/exccwallet-tickets.md) guide provides instructions on setting up a voting wallet and purchasing tickets using `exccwallet`.

---

## Voting Service Providers

Voting Service Providers (VSPs) operate a collection of voting wallets, allowing users to add their tickets to these wallets in return for a nominal fee.

* VSPs are completely non-custodial - they never have access to any of their
  user’s funds - the user is only delegating the rights to vote their tickets to
  the VSP.
* Purchasing tickets with a VSP is simple within Exilibrium.
* Your wallet doesn't need to remain online, as the VSP's wallets are consistently online on your behalf. This convenience also enhances security, as it is safer to keep your wallet offline when not in use.
* VSPs infrequently miss votes since they are a pool of wallets, often located in multiple physical locations. If you attempted solo voting with a single wallet and experienced unreliable internet/power, there would be a higher risk of missing votes and voting rewards.

A directory of VSPs and related statistics is maintained on [excc.co](https://excc.co/vsp/).

To promote network decentralization, it is advised to join a smaller VSP with fewer live tickets. While VSPs control the tickets delegated to them, they could theoretically vote against the ticket owners' preferences. Such behavior could be easily detected, and any VSP attempting this would likely be deserted by the stakeholder community. Nonetheless, it is a good practice to limit the influence of individual VSPs to minimize the potential damage from such attacks.

VSPs differ from Proof-of-Work (PoW) mining pools, as they do not pool work or rewards. The number of tickets a VSP possesses does not impact the frequency of ticket calls or rewards received.

All VSPs utilize the same fundamental code, but the extent of redundancy may vary. Increased redundancy results in a lower likelihood of missed votes, although all VSPs experience some missed votes caused by PoW miners. This occurs when miners discover a solution for the next block so rapidly that votes haven't had time to propagate throughout the network.

PoS voting with a VSP can be performed using `Exilibrium` or `exccwallet`.

- `Exilibrium` - GUI wallet for Windows/macOS/Linux. The [Staking menu, Purchase tab](../wallets/exilibrium/using-exilibrium.md#staking) is used to buy tickets.
- `exccwallet` - CLI wallet for Windows/macOS/Linux. The [Buying Tickets with exccwallet](../wallets/cli/exccwallet-tickets.md) guide explains how to purchase tickets via command line.
