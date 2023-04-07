# Redeem Script

---

!!! note
    The introduction of [vspd](https://github.com/EXCCoin/vspd) in 2023 significantly changed how VSPs function. Redeem scripts are no longer a part of the process. The information below applies only to legacy VSPs running [exccstakepool](https://github.com/EXCCoin/exccstakepool) software.

When users register with a [Voting Service Provider](../glossary.md#voting-service-provider) (VSP), they create a 1-of-2 multisignature script in collaboration with the VSP. This script is known as the redeem script.

When a VSP user purchases a new ticket, the voting rights are assigned to a hash of the redeem script. The redeem script includes a public key from both the user and the VSP, allowing either party to vote or revoke the purchased tickets.

---

## Importance of backing up scripts

Initially, when a user signs up for a VSP, the redeem script is known only to the user and the VSP. When a ticket votes or is revoked, the redeem script is revealed on-chain as part of the process.

The VSP manages voting and revoking for the user, but if the VSP goes offline, it is the user's responsibility to vote for the remaining active tickets or revoke expired ones. To do this, the user's wallet must also know the redeem script.

Upon registering with a VSP, the user's wallet automatically stores a copy of the redeem script. However, users currently cannot reconstruct these scripts from their seed, which is why they must back up their redeem scripts to avoid having locked funds due to an offline VSP.

---

## Consequences of losing the script

A user who purchased a ticket through an unavailable VSP and lost their redeem script will be unable to vote or revoke their tickets.

Users risk having their funds locked if the following conditions are met:

- The user has not backed up their redeem script
- The user lost all access to their existing wallet
- The user has not backed up their wallet (or underlying wallet.db) containing the script
- The VSP went offline before ever voting or revoking a ticket with that redeem script
- The user's wallet has been offline for the entire period, not voting or revoking a ticket with that redeem script
- The VSP operator does not respond to requests for the redeem script copy

---

## Recovery methods

When a redeem script is first generated, it is known only by the VSP and the user; thus, it cannot be recovered if both parties lose it. However, when a ticket votes or is revoked, the redeem script is revealed as part of the process.

Only redeem scripts that have been used at least once to vote or revoke a ticket can be recovered. If this applies to you, you can find it using ExchangeCoin's block explorer, [exccdata](https://dcrdata.org).

1. Locate one of your vote or revoke transactions. To do this, create a new wallet using your seed phrase and examine your past tickets.

2. Use exccdata to search for the transaction. Once found, look under the 'Transaction Details' tab for the decoded JSON. In this JSON file, find the `scriptSig` in the `vin` key.

3. Under `scriptSig`, you should see an `asm` field, which is a deserialized form of the script. The `asm` value should be a long string separated by whitespace. Take the second part of the `scriptSig` `asm`; this is your redeem script.

4. Import the script into your wallet to vote or revoke your tickets as usual.
