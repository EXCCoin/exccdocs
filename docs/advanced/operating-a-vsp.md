# Operating a Voting Service Provider (VSP)

---

## Overview

VSPs play a crucial role in the ExchangeCoin infrastructure, making proof-of-stake participation much more accessible to average users. Increasing the number of VSPs promotes decentralization, improves the stability of the ExchangeCoin network, and offers stakeholders more options.

This high-level guide outlines how to set up a VSP and the steps required to list a VSP on [excc.co](https://excc.co/vsp) and in the Exilibrium wallet. The guide is intentionally written at a high level and with minimal details, as a degree of system admin experience is assumed for VSP operators.

---

## Operator Requirements

* Familiarity with Linux system administration, e.g., configuring and running `nginx`, `ssh`, `IPSec`, `duplicity`, `monit`
* Experience with compiling from source, setting up, and maintaining `exccd` and `exccwallet`
* Effective communication skills in English
* Willingness to stay connected with the ExchangeCoin community for essential news and updates
* Availability to update VSP binaries when new releases are rolled out
* Ideally, operators should be pairs of individuals or larger groups, such as corporate entities, to prevent extended outages during the unavailability of a single person

---

## VSP Requirements

To configure a VSP, several requirements must be met:

* A minimum of one machine to host the web front end, handling web connections from VSP users.
* At least three machines to host voting wallets. This is necessary because at least one voting wallet needs to be connected to the network and ready to vote at all times.
* Each voting wallet should be connected to a dedicated local instance of `exccd`.
* The physical or virtual machines hosting the configuration must be spread across 3 or more separate locations.
* Specifically, voting wallets must be in 3+ physically distinct locations.
* The web frontend must have an IP address different from the voting wallets and is ideally situated in another physical location.
* Source code for the VSP is accessible [on GitHub](https://github.com/EXCCoin/vspd) and binaries must be compiled from the source.
* The VSP must operate on testnet for 1 week to ensure proper functionality. Uptime and the number of votes made versus missed will be monitored.
* The VSP must run on mainnet in test mode (no public access) until a VSP operator demonstrates that they have successfully voted 1 ticket of their own using the VSP.
* The operator must implement an adequate monitoring solution, ideally with alerts for server downtime and application error logging.

---

## Further Information

For more detailed instructions on setting up a VSP, visit GitHub's [vspd repo](https://github.com/EXCCoin/vspd).
For additional support, contact the [ExchangeCoin community](https://excc.co/community).
