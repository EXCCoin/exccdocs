# Wallets and Seeds

---

#### 1. Why should I not store my seed in a file on my machine or share the seed with someone?

Your seed is crucial for the security of your wallet and its funds. It is used to recreate your wallet and its accounts, granting complete control to anyone who has access to the seed. If your seed is compromised, an attacker could use it to drain your funds by transferring your EXCC to wallets they control. Sharing your seed with anyone, even someone you trust, is highly discouraged, as it creates potential security risks and could lead to the misuse of your wallet's access or less secure storage of the seed.

The safest method for storing your seed is on a physical medium, such as writing it down on paper. Treat this paper as if it were the key to a personal vault containing gold because, in essence, that is what your seed words represent. Store it securely to ensure the safety of your wallet and its funds.

---

#### 2. How can I convert my wallet seed hex to seed words?

You can use the [BIP39 Tool](https://github.com/iancoleman/bip39) utility to convert a ExchangeCoin seed from hex to the seed words needed for importing into wallets.

This utility is executed only on client's side but for better security it is advisable to download it and run offline.

---

#### 3. Can someone steal my coins if they access wallet.db?

No one can steal your coins if they gain access to your `wallet.db` file unless they also have your private passphrase. If you chose to use public encryption, they wouldn't have access to your extended public keys or addresses either.

---

#### 4. Can someone use a brute-force attack on a random wallet to regenerate its seed words?

A wallet seed is a 32-byte (256-bit) cryptographically secure random number. An extra byte is added as a checksum, totaling 33 bytes. These 33 bytes are mapped to a [set of English
words](https://en.wikipedia.org/wiki/PGP_word_list), creating a 24-word seed. Since each of the 32 bytes has 256 possible values, there are 256^32 possible seeds, making a brute-force attack computationally infeasible.

To put this in perspective, assuming there are 7 billion people on the planet,
with each person owning 10 computers, and each computer testing a billion
possibilities a second, it would still take approximately 26x10^48^ (that’s 26
trillion trillion trillion trillion) years to brute-force a single seed.

---

#### 5. My seed is not working. What can I do?

If using the CLI wallet, make sure all words are on a single line separated by spaces. Also, double-check your words for typos by comparing them to the [PGP word list](https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 6. What is the difference between a testnet and mainnet public key address?

A mainnet public key address starts with the numbers `22`, while a testnet public key address starts with the letters `Ts`. The 2-byte prefix identifies the network and type.

---

#### 7. I have lost my seed. What can I do?

If you lost your seed and wallet or wallet's passphrase, your funds are permanently lost. If you still have access to the wallet and passphrase, **immediately create a new wallet** with a properly stored seed and transfer your funds to the new wallet. If you have live tickets, maintain both wallets until all tickets have voted, then transfer remaining funds to the new wallet. Backup your `wallet.db` file securely until all funds are transferred.

---

#### 8. Could wallet security be improved using 2-Factor Authentication (2FA)?

2-Factor Authentication (2FA) would not provide extra security for Exilibrium or exccwallet because it is primarily designed for client/server applications where the client and server are separate entities. In these cases, 2FA helps ensure the authenticity of the client's identity to the server by requiring a combination of "something you know" (password) and "something you possess" (smartphone with TOTP app like Google Authenticator or Authy).

However, in the case of Exilibrium or exccwallet, both the client and server implementations of TOTP would exist on the same machine. This significantly reduces the security benefits of 2FA since an attacker who compromises the machine would have access to both the client and server components.

For a more in-depth explanation of why 2FA doesn't provide extra security for local apps like Exilibrium or exccwallet, you can refer to the Exodus wallet article titled [Why
local apps and 2FA aren't friends
yet](https://support.exodus.io/article/1208-why-local-apps-and-2fa-arent-friends-yet).
