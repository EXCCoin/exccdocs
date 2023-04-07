# Configuration

---

#### 1. What are the default ports `exccd` and `exccwallet` listen on?

##### `exccd`

|                |Mainnet|Testnet|Simnet|
|----------------|---   |---    |---|
| *Peer to Peer* | 9666 | 11999 | 11998|
|  *RPC Server*  | 9666 | 19666 | 19556|

##### `exccwallet`

|                   |Mainnet|Testnet|Simnet|
|-------------------|---   |---    |---|
| *JSON-RPC Server* | 9110 | 19110 | 19557|
|  *gRPC Server*    | 9111 | 19111 | 19558|

---

#### 2. What do you mean by configuration files for `exccd`, `exccwallet`, and `exccctl`?

Each application (`exccd`, `exccwallet`, `exccctl`) can have its own configuration files. Use `-h` and look at the path in parentheses of the configuration file option (`-C`, `--configfile`) to see the default path. Create a text file at the path and named according to that path you just looked up.

Then you can use the `exccd` [sample config file](https://raw.githubusercontent.com/EXCCoin/exccd/master/sampleconfig/sampleconfig.go) and `exccwallet` [sample config file](https://raw.githubusercontent.com/EXCCoin/exccwallet/master/sample-exccwallet.conf) to set whatever options you want. You can do the same thing for `exccctl` too. The format is the same. Every command line option listed by `-h` can be specified in the config files (just use the long option name).

Once those are created and in place, you do not have to add all of the options to the command line all the time. For instance, you can run `exccctl` without passing in any parameters on the command line:

```no-highlight
$ exccctl getnetworkhashps
2547036949350
```

---

#### 3. Can I run mainnet and testnet daemons and wallets at the same time and on the same machine?

Yes, just add `--testnet` to the appropriate spots (`exccd`, `exccwallet`, `exccctl`) and everything will work. This is why they use different ports and data/log directories.

---

#### 4. What are the security implications of using the same RPC server authentication passwords with `exccd` and `exccwallet`?

Using the same credentials for both exccd and `exccwallet` may not be a significant issue if both are on the same machine. However, in more secure setups where the wallet is on a separate machine, it's crucial not to use the same credentials for both. `exccd` must be on an Internet-facing machine to stay synced with the network, whereas the `exccwallet` containing your funds should ideally not be on a system with Internet access for optimal security.

For the most secure setup, use one "cold" `exccwallet` instance on a non-Internet-accessible machine and a second "hot" `exccwallet` instance (with a different seed) for staking coins, both using different credentials.

---

#### 5. Why am I connecting to only 8 outbound peers?

There is an intentional, unconfigurable limit of 8 outbound peers. More outbound peers do not provide any benefits and can actually be detrimental for both you and the network. This has been thoroughly tested in Bitcoin, including btcsuite (the upstream project for ExchangeCoin). Increasing outbound connections would waste valuable slots of the relatively few public peers available.

On the other hand, increasing your maximum connections (which raises the number of allowed inbound connections) helps the network by ensuring more slots are available for new nodes and [SPV](../wallets/spv.md) clients.

---

#### 6. Why do I have no inbound connections after forwarding the appropriate port?

When your node is new to the network, it may not receive inbound connections immediately. The node address manager segregates node addresses into groups and selects them non-deterministically in a cryptographically random manner. This process promotes greater peer diversity and reduces the chances of an attacker coercing your node into connecting only to nodes they control.

It typically takes several days for your node to mature and start receiving incoming connections. To check if your node is ready to accept inbound connections, use the `exccctl` command `getnetworkinfo`. Under `localaddresses`, you can see the address and port at which your node is accepting incoming connections. Ensure that this address is correct and that the specified port is open.

```json
"localaddresses": [
    {
      "address": "***.***.*.***",
      "port": *****,
      "score": 0
    }
]
```

---

#### 7. How do I run exccd and exccwallet as a background daemon?

`exccd` and `exccwallet` do not provide a `--daemon` or `--detach` flag to run as a
daemon as this is considered bad practice.
[This blog post](https://www.mikeperham.com/2014/09/22/dont-daemonize-your-daemons/)
by Mike Perham provides some background information.

Modern operating systems provide specialized facilities for running processes as
background daemons.
For example, systemd and Upstart are Linux utilities specifically designed to
run long-lived daemons.
MacOS X provides a daemon service named
[launchd](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html).
This is the recommended method for running `exccd` or `exccwallet` as daemons.

The [exccd GitHub repository](https://github.com/EXCCoin/exccd/tree/master/contrib)
provides a sample service files for a variety of operating systems.
A detailed guide on using this file to configure `dcrd` (Decred's daemon) as a service on Debian 9
can be found at [stakey.club](https://stakey.club/en/dcrd-as-a-linux-service/).
This guide can be fully utilized with ExchangeCoin daemon as well (`exccd`).
