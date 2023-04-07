# Verifying Binaries

---

## Overview

### What is a binary?

Binaries are often the most convenient method for users to install software.

A binary is a machine-language formatted file that a computer can read and execute. Programmers usually don't write software in machine-language. Instead, they write code in human-readable programming languages like Go, JavaScript, C, or Python, known as source code. Advanced users and programmers can compile the source code to create an executable binary.

For non-programmers who don't want to download compilers to run software, they can simply download a pre-compiled binary executable. This binary file has been compiled from the source code into a stand-alone program by someone else.

### The Importance of Verifying Binaries Before Execution

It's crucial not to blindly trust a binary's safety, even when downloaded from a reputable website.

Running a binary compiled by someone else means placing trust in the compiler. This has inherent risks, as binary code isn't human-readable, making it impossible to know if the binary was compiled from the actual source code or if the source code was tampered with by an attacker.

Imagine an attacker creating malware disguised as an ExchangeCoin binary. They could attempt to deceive you into running their malware through fake download locations, phishing, or a [Man-in-the-middle attack](https://en.wikipedia.org/wiki/Man-in-the-middle_attack).
Even when downloading from a trusted source (like GitHub), an attacker might intercept and replace the download with malware. Running the binary without verification exposes you to security risks.

To safeguard yourself, always confirm that the binary is genuine ExchangeCoin software.

### How to Ensure a Binary Hasn't Been Tampered With?

The core concept of [file verification](https://en.wikipedia.org/wiki/File_verification)
is based on hashing. The ExchangeCoin project enhances this by using
[GnuPG](https://gnupg.org/index.html) to sign their hashes, ensuring that the files originate from ExchangeCoin.

When the ExchangeCoin project compiles source code into binaries, each binary is hashed using [SHA-256](https://en.wikipedia.org/wiki/SHA-2).
The hashes are stored in a `manifest.txt` file, which is then signed using ExchangeCoin's public GnuPG key, creating a unique signature file, `manifest.txt.asc`.

To confirm that your downloaded binary matches the ExchangeCoin project's binary release, follow these steps:

1. **Verify the `manifest` is directly signed by the ExchangeCoin project**: Download the `manifest.txt` and signature `manifest.txt.asc`. Use GnuPG to check the signature against the public ExchangeCoin release signing key.

   * SUCCESS: Matching signatures indicate that the manifest is from the ExchangeCoin project, and the hashes within it are reliable.

   * FAIL: Mismatched signatures mean your manifest isn't the official ExchangeCoin project manifest. Do not proceed, delete the files, and address any security issues before trying again.

2. **Verify the binary hash aligns with the `manifest` hash**: Hash your downloaded binary and ensure its hash corresponds with the hash in the ExchangeCoin project's `manifest.txt`.

   * SUCCESS: If your hash matches the manifest's hash, you can trust and run the binary.

   * FAIL: If your hash doesn't match, your binary doesn't correspond with the ExchangeCoin project's official binary release. Do not proceed, delete the binary, and address any security issues before trying again.

---

## Detailed Instructions

### Preliminary Steps

First, go to the [ExchangeCoin releases](https://github.com/EXCCoin/excc-binaries/releases)
page and download:

* The binary installer for your specific OS / architecture
* The file manifest and hashes, ending in `-manifest.txt`
* The signature for the manifest, ending in `-manifest.txt.asc`

Also, make sure GnuPG is installed:

* On Windows, install GnuPG with the latest version of [gpg4win](https://www.gpg4win.org/).
* On macOS, install GnuPG with the latest version of [GPGTools](https://gpgtools.org/).
* On Linux, GnuPG is installed by default.

With GnuPG installed, the following instructions will work from any terminal on
Windows, macOS, or Linux/UNIX

### Add the ExchangeCoin project's release public keys to your GnuPG keyring

You only need to do this step one time, so you can skip this step when
verifying later releases on the same computer.

There are several ways to import the ExchangeCoin release public keys into GnuPG.
The most direct method is to use the ASCII Key Block below:

??? info "ExchangeCoin Team PGP ASCII Key Block (click to expand)"

    ```no-highlight
    -----BEGIN PGP PUBLIC KEY BLOCK-----

    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
    =ppZY
    -----END PGP PUBLIC KEY BLOCK-----


    ```

Simply copy that entire text, save it as key.txt, and open a terminal.

In the terminal, use the `cd` command to navigate to the directory path where
you've saved key.txt. Then use the `gpg --import` command.

(Note that Windows uses `\` for directory paths, but Linux/macOS use `/`)

```no-highlight
$ cd /path/to/the/key
$ gpg --import < key.txt
```

You can then delete key.txt.

You could also skip the entire "save it as a file" step and just type
`gpg --import`, press `enter` so you're on a new line, then paste the raw text
of the key block directly into your terminal. `enter` again for a new line,
`Ctrl + Z` and `enter` on Windows or `Ctrl + D` on Linux, and you're done.

Example output:

```no-highlight
gpg: key 9AEB846958227764: "ExchangeCoin Team (The Official ExchangeCoin Team PGP Key) <support@excc.co>" imported
gpg: Total number processed: 1
gpg:               imported: 1
```

Just to confirm, you can check if the ExchangeCoin release public keys are on your
GnuPG keyring:

```no-highlight
$ gpg --list-keys support@excc.co
```

Example output:

```no-highlight
pub   rsa4096 2023-04-07 [SC]
      9DD10FAFB2A53E14BEF1B10D9AEB846958227764
uid           [ultimate] ExchangeCoin Team (The Official ExchangeCoin Team PGP Key) <support@excc.co>
sub   rsa4096 2023-04-07 [E]
```

### Verify that the manifest was directly signed by the ExchangeCoin project

If you have the ExchangeCoin project's release public keys on your GnuPG keyring, you
can verify if the signature for the manifest was created by the ExchangeCoin release
signing key.
<!-- TODO Update with real data after proper release is done -->
In a terminal, navigate to where you saved both the `manifest.txt` and the
`manifest.txt.asc`. Then ask GnuPG to verify the signed manifest, like so:

```no-highlight
$ gpg --verify <your manifest.txt.asc file>
```

For example, if you wanted to verify `decred-v1.7.2-manifest.txt.asc`:

```no-highlight
$ gpg --verify decred-v1.7.2-manifest.txt.asc
```

Example output:

```no-highlight
gpg: assuming signed data in 'decred-v1.7.2-manifest.txt'
gpg: Signature made Wed 11 May 2022 11:41:05 AM EDT
gpg:                using RSA key F516ADB7A069852C7C28A02D6D897EDF518A031D
gpg: Good signature from "ExchangeCoin Release <release@decred.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: FD13 B683 5E24 8FAF 4BD1  838D 6DF6 34AA 7608 AF04
     Subkey fingerprint: F516 ADB7 A069 852C 7C28  A02D 6D89 7EDF 518A 031D
```

If you see `Good signature from "ExchangeCoin Release <release@decred.org>"`, then
you're successful! You can trust that the `manifest.txt` came directly from the
ExchangeCoin project.

The WARNING shown is not a problem. It just means you haven't told GnuPG that
you want to trust ExchangeCoin.

### Verify that the binary hash matches the manifest hash

Now that you know you can trust the `manifest.txt`, open it and view the
SHA-256 hashes. Find the row for the binary (or zip of binaries) you're
interested in. The first 64 characters are the "correct" hash from the ExchangeCoin
project. You want to check your binary and make sure you get the same hash.

There are many ways to generate a SHA-256 hash, but here are a few:

=== "Windows"
    * If you have [7-Zip](https://7-zip.org/) installed, simply open up Windows
      Explorer, right click on the binary file, mouseover `CRC SHA`, then click
      `SHA-256`.

    * In a terminal:
      ```no-highlight
      $ certutil -hashfile <your binary file> SHA256
      ```

=== "macOS"
    * In a terminal:

      ```no-highlight
      $ shasum -a 256 <your binary file>
      ```

=== "Linux"
    * In a terminal:

      ```no-highlight
      $ sha256sum <your binary file>
      ```

Example output:

```no-highlight
ab0c4d53576f4bd486c8c64451edc0b000a5eaae6e18e29e367f24522e11a7c6  decred-linux-amd64-v1.7.2.tar.gz
```

If your output hash matches the hash from the manifest, you're done! The binary
for your platform is now verified, and you can be confident it was generated by
the ExchangeCoin Project. It's safe to install the software.

---

## Links for further reading

[https://gnupg.org/gph/en/manual.html#CONCEPTS](https://gnupg.org/gph/en/manual.html#CONCEPTS)

[https://alexcabal.com/creating-the-perfect-gpg-keypair](https://alexcabal.com/creating-the-perfect-gpg-keypair)
