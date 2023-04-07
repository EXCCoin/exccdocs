# Common Errors and Solutions

---

## Proof-of-Stake (PoS)

#### 1. Some of my missed/expired tickets are still locked after more than a day

##### Exilibrium

1. Delete the wallet and restore from seed

2. Open Tickets view, click import script button, paste the VSP script into the textbox, enter the private passphrase and click Save.

3. Wait until the rescan completes.

##### Command Line

1. Start the wallet process with the `--enablevoting` flag. It will not issue revocations without it.

2. Unlock the wallet with `promptsecret | exccctl --wallet walletpassphrase - 0`. The wallet must be unlocked for it to be able to create the revocations and sign them.

3. Instruct `exccd` to notify the wallet about missed tickets again so it will issue the revocations with `exccctl rebroadcastmissed`.

Upon completion, you should observe information regarding the revocation transactions in the wallet log. Once these revocation transactions are included in a block (which should be the subsequent block), the funds will transition to the `immaturestakegeneration` category as displayed in the `exccctl --wallet getbalance` output. Finally, after **256 blocks**, the funds will shift to the spendable category, making them available for spending.
