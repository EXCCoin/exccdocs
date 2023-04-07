# Buying Tickets and Fees

---

#### 1. Is there a way to see tickets purchased by a local wallet?

Use the `gettickets` command to show all of your tickets.
The mandatory boolean parameter specifies whether to include immature tickets.

```no-highlight
exccctl --wallet gettickets true
```

---

#### 2. Do I pay a transaction fee for the `ssgen` transaction?

No, `ssgen` transactions do not impose a fee (unlike the original ticket purchase transactions which are competing for limited space in each block). They are effectively like proof-of-work coinbase transactions in this regard.

---

#### 3. How do I change the ticket fee?

```no-highlight
exccctl --wallet setticketfee <fee>
```

---

#### 4. How do I manually buy tickets?

```no-highlight
exccctl --wallet purchaseticket <fromaccount> <spendlimit> <minconf>
```

Where:

| Option        | Explanation|
|---------------| ---|
| `fromaccount` | Usually "default" (unless you have created a different one).|
| `spendlimit`  | Maximum number of EXCC you want to spend on tickets.|
|  `minconf`    | This can be set to 0.|

---

#### 5. How should I set the ticketfee?

The `ticketfee` plays a role in determining the order in which `mempool` tickets enter the voting pool. Higher fees encourage proof-of-work miners to prioritize your tickets, which increases the likelihood of your tickets being included in the next block. While it might seem like a good idea to set a high `txfee` to stay at the front of the line, it's not always the best strategy, as the `mempool` queue is often short or empty. Additionally, the `txfee` will reduce your EXCC profit, as it's charged on every ticket and non-refundable regardless of whether the ticket votes or not.

Let's consider a constant ticket price of 10 EXCC. In every block, 20 tickets can move into the voting pool from the mempool, which amounts to a value of 200 EXCC. Each block generates approximately 30 EXCC and returns 50 EXCC to voters. With 3 EXCC going to the ExchangeCoin Treasury, only 27 EXCC ends up with miners. This means that, assuming all returns are reinvested, 77 EXCC is freed up for each block to go back into tickets. This is less than half of what the block can handle. More EXCC can only enter the `mempool` via external investment (buying from an exchange) or from miners who have been saving their EXCC for a ticket price drop.

In the case of a ticket price drop, a miner aims to get into the pool before the price changes again, which happens every 144 blocks (approximately 12 hours). Whether they get in during the first block or the 100th doesn't matter, as in 144 blocks, 2,880 tickets will be accepted, with a value of 28,800 EXCC. The proof-of-stake network currently does not have that level of volume. However, there is one scenario where setting a higher fee might be beneficial: if the stake cost is about to change in a few blocks, the `mempool` isn't empty, and you want to secure the current price. In this case, setting a slightly higher than average fee can help ensure you get in before the price change, especially if the next change would cause you to miss out on a ticket.
