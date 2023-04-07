# CLI Installation guide

Last updated for CLI release v{{ cliversion }}.

---

`exccinstall` makes it easy to install ExchangeCoin Command Line Interface (CLI) tools on a single machine. Everything is automatically configured to work right out of the box. This includes `exccd`, `exccwallet`, `exccctl`.

`exccinstall` is a tool that automates the installation and upgrading process for ExchangeCoin software. The latest version of exccinstall can be downloaded from here.: <https://github.com/excc/excc-release/releases>. Binaries are provided for Windows, macOS, Linux, and BSD.

By running `exccinstall`, users can automatically download the precompiled and signed binary package available on GitHub. The tool also verifies the signature of the package, copies the binaries to a designated folder based on the operating system, creates configuration files with settings to facilitate communication between the three applications, and guides users through the wallet creation process. Upon completion of `exccinstall`, users can launch the software without any further configuration required.

!!! tip "Looking for a more advanced setup?"
    
    If you are interested in advanced configurations or Solo PoS Voting, consider reading the [Solo Voting](../../advanced/solo-proof-of-stake-voting.md) guide.

    If you are interested in networking between multiple devices, consider reading the [Secure Cold Wallet](../../advanced/secure-cold-wallet-setup.md) guide.

=== "macOS"

    1. Download the correct file for your computer:

        | Architecture | Filename                                       |
        | ------------ | ---------------------------------------------- |
        | 64-bit       | `excc-darwin-amd64-v{{ cliversion }}.tar.gz` |
        | M1 Chip      | `excc-darwin-arm64-v{{ cliversion }}.tar.gz` |
    
    1. For your security, verify that your download hash matches the hash in the ExchangeCoin releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Finder:** simply double click on the `.tar.gz` file.

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        Both of these should extract the `.tar.gz` file into a folder that shares the same name. (e.g. `tar -xvzf excc-darwin-amd64-v{{ cliversion }}.tar.gz` should extract to `excc-darwin-amd64-v{{ cliversion }}`).

    1. Make the downloaded file an executable within your terminal and run it:

        To run `exccinstall`, navigate to the directory where the exccinstall file was downloaded using the `cd` command. Then, set the `u+x` mode on the `exccinstall` file using the `chmod` command. Finally, execute the exccinstall executable that is created. Here is an example of the commands:

        `cd ~/Downloads/`

        `chmod u+x exccinstall-darwin-amd64-v{{ cliversion }}`

        `./exccinstall-darwin-amd64-v{{ cliversion }}`

    1. The executable binaries for `exccd`, `exccwallet`, and `exccctl` can now be found in the `~/excc/` directory. Before the `exccinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/exccwallet-setup.md#wallet-creation-walkthrough) of the exccwallet Setup guide to finish.

=== "Linux"

    1. Download the correct file for your computer:

        | Architecture | Filename                                      |
        | ------------ | --------------------------------------------- |
        | 32-bit       | `excc-linux-386-v{{ cliversion }}.tar.gz`   |
        | 64-bit       | `excc-linux-amd64-v{{ cliversion }}.tar.gz` |
        | 32-bit ARM   | `excc-linux-arm-v{{ cliversion }}.tar.gz`   |
        | 64-bit ARM   | `excc-linux-arm64-v{{ cliversion }}.tar.gz` |

    1. For your security, verify that your download hash matches the hash in the ExchangeCoin releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Ubuntu File Browser:** simply right click on the `.tar.gz` file and select "Extract Here".

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        Both of these should extract the `.tar.gz` file into a folder that shares the same name. (e.g. `tar -xvzf excc-linux-amd64-v{{ cliversion }}.tar.gz` should extract to `excc-linux-amd64-v{{ cliversion }}`).

    1. Make the downloaded file an executable within your terminal and run it:

        To install the ExchangeCoin software using the `exccinstall` file, first navigate to the directory where the file was downloaded using the `cd` command. Then, grant execute permission to the file using the `chmod` command with the `u+x` option. Finally, run the `exccinstall` executable file that is created. Here is an example of the commands you can use (make sure to adjust the directories and filenames as needed):

        `cd ~/Downloads/`

        `chmod u+x exccinstall-linux-amd64-v{{ cliversion }}`

        `./exccinstall-linux-amd64-v{{ cliversion }}`

    1. The binaries for `exccd`, `exccwallet`, and `exccctl` can now be found in the `~/excc/` directory. Before the `exccinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/exccwallet-setup.md#wallet-creation-walkthrough) of the exccwallet Setup guide to finish.

=== "Windows"

    1. Download the correct file for your computer:

        | Architecture | Filename                                     |
        | ------------ | ---------------------------------------------|
        | 32-bit       | `excc-windows-386-v{{ cliversion }}.zip`   |
        | 64-bit       | `excc-windows-amd64-v{{ cliversion }}.zip` |

    1. For your security, verify that your download hash matches the hash in the ExchangeCoin releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Navigate to download location and extract the `.zip` file:

        Right click on the `.zip` file, select "Extract All..." and a prompt should open asking for the directory to use. The default will extract the `.zip` to a folder with the same name.

    1. Run the exccinstall executable file. You can either double click it or run it from the Command Prompt.

    1. The binaries for `exccd`, `exccwallet`, and `exccctl` can now be found in the `%HOMEPATH%\excc\` directory (usually `%HOMEPATH%` is `C:\Users\<username>\`). Before the `exccinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/exccwallet-setup.md#wallet-creation-walkthrough) of the exccwallet Setup guide to finish.

=== "BSD"

    1. Download the correct file for your computer:

        | Architecture  | Filename                                        |
        | ------------- | ----------------------------------------------- |
        | FreeBSD amd64 | `excc-freebsd-amd64-v{{ cliversion }}.tar.gz` |
        | OpenBSD amd64 | `excc-openbsd-amd64-v{{ cliversion }}.tar.gz` |

    1. For your security, verify that your download hash matches the hash in the ExchangeCoin releases manifest. For detailed instructions, read about [Verifying Binaries](../../advanced/verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        The `.tar.gz` file will be extracted into a folder that shares the same name. (e.g. `tar -xvzf excc-openbsd-amd64-v{{ cliversion }}.tar.gz` should extract to `excc-openbsd-amd64-v{{ cliversion }}`).

    1. Make the downloaded file an executable within your terminal and run it:

        Navigate to the directory where the exccinstall file was downloaded using the `cd` command, run `chmod` with `u+x` mode on the exccinstall file, and run the executable that is created. Below is an example of the commands (change directories or filename as needed):

        `cd ~/Downloads/`

        `chmod u+x exccinstall-linux-amd64-v{{ cliversion }}`

        `./exccinstall-linux-amd64-v{{ cliversion }}`

    1. The binaries for `exccd`, `exccwallet`, and `exccctl` can now be found in the `~/excc/` directory. Before the `exccinstall` process completes, you will be taken to the wallet creation prompt. Follow the steps within the [Wallet Creation Walkthrough](../../wallets/cli/exccwallet-setup.md#wallet-creation-walkthrough) of the exccwallet Setup guide to finish.
