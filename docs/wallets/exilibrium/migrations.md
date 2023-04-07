# Exilibrium Migrations

This page provides a summary of migrations executed by recent versions of Exilibrium, their purpose, and any potential impact on custom configurations.

Migrations are displayed according to the version in which they were first implemented, so users updating across multiple versions may be subject to multiple migrations.


## Version 1.6.3

!!! info "Requires unlocking the wallet"

    The upgrade for version 1.6.3 requires unlocking the wallet with the private passphrase. This is a one-time request and you should **NOT** be asked for the passphrase after reopening the wallet.
    
### Per-account locking

For enhanced security, `exccwallet` now includes a per-account locking mode that allows users to unlock specific accounts, rather than the entire wallet. This feature mitigates the risk of having all funds compromised in the event of certain attack scenarios.

Per-account locking also facilitates ticket purchasing and privacy-enabled wallets, since only the relevant accounts are unlocked during these operations.

To activate this functionality, Exilibrium will request the current private passphrase during the first startup of v1.6.3. This passphrase will be applied to all accounts.

With per-account locking, users do not need to manually unlock individual accounts, as Exilibrium will handle this process automatically as needed.
