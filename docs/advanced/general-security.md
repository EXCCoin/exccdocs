# Security

---

This page provides a list of suggestions to improve your security when working with `EXCC` or cryptocurrencies in general.

This list is not exhaustive and does not guarantee complete protection, only ideas.

## System setup

Here are some measures you can take when setting up your hardware and software to enhance your system's security.

- **Disk encryption:** Almost all Operating Systems (OSes) support disk encryption. While not foolproof, it does offer some protection. Remember that a skilled attacker can extract disk encryption keys from your device's RAM if they access your machine while it's powered on. We strongly suggest utilizing ZFS filesystem which includes easily encrypted partitions / dataspaces.

- **Remove unnecessary software:**  Every installed software increases the system's attack surface, as it may contain exploits or vulnerabilities. If you store a significant amount of cryptocurrency on your machine, remove all unnecessary software.

- **Run an open source OS:** Many users rely on Windows or Mac as their OS, but with closed source code, it's impossible to know what these OSes are doing at all times. Running an open-source OS (e.g., Linux variants, *BSD) provides some assurance that your sensitive information, including wallet keys, is not being sent to corporate or government servers.

- **Run Qubes:** Qubes is the only OS that uses the on-board IOMMU (memory management unit) to partition networking devices from the OS main memory by default on compatible hardware. Qubes also enables the creation of single-purpose virtual machines or “AppVMs,” which are nearly ideal for cryptocurrency applications. Please keep in mind that Qubes requires very good knowledge about Linux overall.

- **Buy all computer components in person:** To avoid potential interception and malware implantation by Three-Letter Agencies (TLAs), purchase all computers and components in person at a store near you.

- **Disable ME or similar:** Intel CPUs have shipped with a co-processor called the Intel Management Engine (ME) since 2006. This coprocessor has full access to the system and poses a security vulnerability. Some US Government agencies disable ME, and while Intel doesn't officially support disabling it, individuals can use tools like [me_cleaner](https://github.com/corna/me_cleaner) to remove it manually.

- **Electromagnetic shielding:** Remote monitoring of monitors and LCDs through "Van Eck phreaking" and leaked EM signals from keyboards is possible. Counteract this by using electromagnetic shielding, a technique employed by nation-state militaries and intelligence services since the 1960s or earlier.

## Operations security (OPSEC)

With a secure system in place, follow these operational security measures:

- **Limit physical access to hardware:** Store your machine in a locked room with limited access to prevent attackers from physically accessing it.

- **Avoid using your machine in public places:** This extends to fiat banking as well. Public computing exposes you to the presence of other parties, their devices, and surveillance cameras.

- **Keep mobile devices away from your machine:** Modern phones and tablets have multiple microphones that can pick up audio from 20-30 feet away. Keep mobile devices in a separate room while entering sensitive information (e.g., wallet seeds, passwords, and passphrases).

- **Only run `exccwallet` on ticketbuying machine:** Run `exccwallet` on a secure machine and have it connect to a remote `exccd` to minimize traffic to and from your machine.

- **Audit your traffic:** Using Commercial-off-the-shelf (COTS) gear, you can audit network traffic to and from your computer down to [Layer 2](https://en.wikipedia.org/wiki/Layer_2) (the layer where data packets are encoded and decoded into bits). Keep in mind that you cannot audit most Transport Layer Security (TLS) traffic offline because of how ephemeral keys are used.
