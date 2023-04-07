# General Information on Privacy

---

This page offers a list of suggestions for enhancing your privacy when using EXCC or other cryptocurrencies. Keep in mind that this list is not exhaustive and does not guarantee complete privacy. 
If you are in a high-risk situation, such as living under an oppressive regime, we recommend further research on the subject.

---

## Transaction Graphs

The ExchangeCoin blockchain maintains a public ledger of all ExchangeCoin transactions, which includes the transaction amounts, senders, and recipients. While senders and recipients are identified by cryptographic public keys instead of personal identities, this only provides pseudonymity rather than true anonymity. The public information can be used to construct a transaction graph, which illustrates how ExchangeCoin has been transferred among network participants.

If one of your transactions is linked to your real-world identity, an observer might be able to create a transaction graph to profile your activities. They could potentially deduce other transactions you've been involved in or even estimate your total balance.

One way your personal identity could be connected to your blockchain activity is through the use of a block explorer. The block explorer administrator might be able to see your IP address and the addresses or transactions you're browsing, potentially inferring ownership of those addresses or transactions. To mitigate this risk, consider using blockchain explorers exclusively via Tor.

---

## Transaction Broadcasting

When broadcasting a transaction from your exccd node, other peers on the network might deduce that the transaction belongs to you and associate it with your public IP address. To mitigate this risk, consider routing your exccd traffic through Tor. Another option is to broadcast your transaction using a public website while maintaining anonymity through Tor. For instance [exccdata](https://github.com/EXCCoin/exccdata) provides this functionality and is accessible as a hidden service on Tor via the URL <http:///> <!-- TODO: update TOR url for exccdata -->.

Keep in mind that different wallets may use different address types, which could also provide hints about your identity. When combined with other signals, this information could potentially reveal your identity.

---

## Trade-offs of Reusing vs Not Reusing Addresses

For privacy purposes, it is best practice to never reuse an address. Instead, consider a cryptocurrency address as an invoice that should be used only once. Unlike a bank account number, an "address" is not designed for reuse. Privacy-conscious users should generate a new address for every transaction and avoid reusing addresses unless absolutely necessary.
However, there may be situations where address reuse is preferred or even required. 

---

## Change Address

When only a portion of an Unspent Transaction Output ([UTXO](../glossary.md#utxo)) is spent, a change output is generated, which could potentially compromise privacy. For instance, the change UTXO might be combined with another UTXO in a future transaction, indicating that both UTXOs belong to the same user.

Wallet software usually doesn't display information about individual UTXOs, such as multiple UTXOs being spent in a single transaction. To ensure maximum privacy, it's essential to know precisely which UTXOs are spent in each transaction. [This article](https://medium.com/@nopara73/coin-control-is-must-learn-if-you-care-about-your-privacy-in-bitcoin-33b9a5f224a2) provides a good introduction to privacy-preserving coin control.

---

## Avoid Identification when Acquiring Cryptocurrencies

Steer clear of obtaining cryptocurrencies from websites that require KYC/AML or any other forms of identification. Be mindful that centralized exchanges can be hacked, potentially exposing collected information. It's also possible that an oppressive government may seize the collected data. Cryptocurrency ATMs may be equipped with cameras, fingerprint scanners, or nearby cameras that could reveal your identity.

---

## Avoid Leaving Identifiers in Public Places

Often, this involves physical items such as leaving a printed QR code, writing your nickname or real name on a piece of paper, or accidentally imprinting your name on the next page of a sticky note stack. Be cautious not to leave your phone or computer unlocked in public places with crucial information displayed on the screen.

---

## Hiding Cryptocurrency Usage Itself

Use VPN or Tor.
Avoid linking your VPN or Tor usage with social networks or any software or website that might identify you.
Remember that cookies exist.
Utilize a browser profile exclusively for your crypto-related activities.
Close all unnecessary programs.
Download random data so that the size of your downloaded data isn't precisely blockchain-sized.

---

## System Security

The privacy techniques mentioned above may not offer any benefits if your machine's security is compromised. Refer to the [General Security](../advanced/general-security.md) guide for more information on maintaining the security of your machine and operating system.

---

## More Information

- [Coin Control](https://medium.com/@nopara73/coin-control-is-must-learn-if-you-care-about-your-privacy-in-bitcoin-33b9a5f224a2)  
- [Merge Avoidance](https://medium.com/@octskyward/merge-avoidance-7f95a386692f)  
- [Bitcoin Wiki - Privacy](https://en.bitcoin.it/wiki/Privacy#Bad_privacy_example_-_Exchange_front_running)  
- [Bitcoin Transaction Graph Analysis (University paper)](https://arxiv.org/abs/1502.01657)
