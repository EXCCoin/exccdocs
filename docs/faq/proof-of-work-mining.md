# Proof-of-Work (PoW) Mining

---

#### 1. How long does it take for mined coins to get to my wallet?

The coinbase maturity is [256 blocks](https://github.com/EXCCoin/exccd/blob/5b62c1864a39091ef951d07843087ff076e999af/chaincfg/mainnetparams.go#L188).
That means the coins will not show up as spendable for that many blocks.

---

#### 2. How do I find out which block I mined?

There will be an entry in the `exccd` log that looks something like:

```no-highlight
Accepted block 000... via getwork.
```
