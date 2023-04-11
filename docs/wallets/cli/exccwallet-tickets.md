# Buying Tickets With exccwallet

Last updated for CLI release v{{ cliversion }}.

---

This guide provides step-by-step instructions for buying tickets using `exccwallet`. Prior to starting, it is recommended to decide whether to solo vote or use a Voting Service Provider (VSP). For more information on the pros and cons of each approach, please refer to the [How to Stake](../../proof-of-stake/how-to-stake.md) page.

**Prerequisites:**

- Use the latest [exccinstall](cli-installation.md) to install `exccd`, `exccwallet,` and `exccctl`. Additional steps will be required if another installation method was used.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](os-differences.md).
- [Setup exccd](exccd-setup.md) and have it running in the background.
- [Setup exccwallet](exccwallet-setup.md) and have it running in the background.
- Familiarize yourself with the [basics of using exccctl](exccctl-basics.md).
- You should also be familiar with the [staking process](../../proof-of-stake/overview.md) and the [ticket lifecycle](../../proof-of-stake/overview.md#ticket-lifecycle)

Please note that this guide assumes you have set up `exccd` and `exccwallet` using configuration files. If you used `exccinstall`, you already have configuration files. Using configuration files is highly recommended as it makes it easier to issue commands to `exccwallet` and exccd through `exccctl`. For instructions on minimum configuration (saving your RPC username and RPC password), please see [here](../../advanced/manual-cli-install.md#minimum-configuration).

---

## Step 1. Enable Voting

### Solo-voting

!!! warning
    Solo-voting with a voting wallet that doesn't stay online 24/7 may result in missed votes and forfeited stake rewards.

To solo-vote, you simply set the `enablevoting` option when starting `exccwallet`, unlock the wallet with your private passphrase, and buy tickets. With `enablevoting` enabled and `exccwallet` unlocked, your wallet will automatically handle voting.

To set up your `exccwallet` for solo-staking, add the following line to your `exccwallet.conf` config file:

```ini
enablevoting=1
```

Once `exccwallet` is restarted with that line in `exccwallet.conf`, your wallet will be configured for solo-voting and you can start [purchasing tickets](#step-2-purchase-tickets).

### VSP Voting

 You can find a list of VSPs [here](../../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp).

 Once you have decided on a VSP, delegating voting to a VSP for purchased tickets is accomplished with the following configuration options set in your exccwallet.conf file.

- `vsp.url`
- `vsp.pubkey`

```ini
; ------------------------------------------------------------------------------
; VSP settings
; ------------------------------------------------------------------------------

; The URL of the VSP.
vsp.url=https://testnet-vsp.excc.co

; The base64 encoded public key of the VSP server.  This can be found on the
; VSP website in the footer.
vsp.pubkey=QrYmJzCOiFE/rHGUgykpGs8UQHSUzEVOFYcAIt23cfY=
```

---

## Step 2. Purchase Tickets

There are two ways to purchase tickets: manual or automatic. Manual ticket buying provides more control over the purchasing process, allowing you to choose when to purchase tickets, how much to pay for each ticket, and how often to unlock the purchasing wallet. The automatic ticket buyer, on the other hand, is more convenient and requires less maintenance, but it requires the purchasing wallet to remain online continuously.

Both manual and automatic ticket purchasing require your wallet to be
[unlocked](exccctl-basics.md#unlocking-your-wallet).

!!! tip
    To find the current ticket price, issue the `exccctl --wallet getstakeinfo`
    command and look for the `difficulty` value.
    This is the price of each ticket in the current price window.
    You will want to adjust your `spendlimit` argument in the `purchaseticket`
    command to be greater than this `difficulty` value when purchasing tickets
    manually.

### Manual Ticket Purchase

The `purchaseticket` RPC command allows you to attempt purchasing a ticket using available funds. It requires two parameters to function:

1. `fromaccount` -  A string specifying the account to purchase tickets from, such as "default".
1. `spendlimit`  -  A number specifying the limit on the amount to spend on a ticket, such as 50.

More advanced parameters can be listed with the command `exccctl --wallet help purchaseticket`.
If the purchaseticket command is successful it will output the hash of the
purchased ticket.

```sh
$ exccctl --testnet --wallet purchaseticket default 100
[
  "69b855e0d318dc5a21ff0f2717ad149b324027a1e46ecd28d0a18ea1ca249f5b"
]
```

The ticket has now entered the mempool and begins the
[ticket lifecycle](../../proof-of-stake/overview.md#ticket-lifecycle).

For **solo voters** the process is complete. If they are using separate ticket
buying and voting wallets, the ticket buying wallet can now be closed.

For **VSP users**, after purchasing the ticket, they need to keep their wallet open for a few moments to allow the VSP to register the newly purchased ticket and pay the fee. The `exccwallet` log will display a "successfully processed" message once the registration is complete. At this point, the ticket buying wallet can be closed.

```no-highlight
[INF] WLLT: Published ticket purchase 69b855e0d318dc5a21ff0f2717ad149b324027a1e46ecd28d0a18ea1ca249f5b
[INF] VSPC: VSP requires fee 0.00010829 EXCC
[INF] VSPC: successfully processed 69b855e0d318dc5a21ff0f2717ad149b324027a1e46ecd28d0a18ea1ca249f5b
```

### Automatic Ticketbuyer

`exccwallet` includes a built-in `ticketbuyer` which can buy tickets for you automatically.
It can be enabled by adding the following line to your `exccwallet.conf` config file:

```ini
enableticketbuyer=1
```

If you don't want `ticketbuyer` to spend all of your funds, there is one more option which allows you to specify a balance which will not be spent:

```ini
ticketbuyer.balancetomaintainabsolute=<balance>
```
