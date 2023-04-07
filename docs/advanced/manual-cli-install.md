# Manual CLI Installation

Last updated for CLI release v{{ cliversion }}.

---

The newest binary releases can be found [here](https://github.com/EXCCoin/excc-binaries/releases). With the exception of the `.exe`, `.AppImage` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be extract and go, instructions are provided for Windows, macOS, and Linux below.

=== "Windows"

    1. Download the correct file for your computer:

        | Architecture | Filename                                     |
        | ------------ | ---------------------------------------------|
        | 32-bit       | `excc-windows-386-v{{ cliversion }}.zip`   |
        | 64-bit       | `excc-windows-amd64-v{{ cliversion }}.zip` |

    1. For your security, verify that your download hash matches the hash in the ExchangeCoin releases manifest. For detailed instructions, read about [Verifying Binaries](verifying-binaries.md).

    1. Navigate to download location and extract the `.zip` file:

        Right click on the `.zip` file, select "Extract All..." and a prompt should open asking for the directory to use. The default will extract the `.zip` to a folder with the same name.

=== "macOS"

    1. Download the correct file for your computer:

        | Architecture | Filename                                       |
        | ------------ | ---------------------------------------------- |
        | 64-bit       | `excc-darwin-amd64-v{{ cliversion }}.tar.gz` |
        | M1 Chip      | `excc-darwin-arm64-v{{ cliversion }}.tar.gz` |

    1. For your security, verify that your download hash matches the hash in the ExchangeCoin releases manifest. For detailed instructions, read about [Verifying Binaries](verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Finder:** simply double click on the `.tar.gz` file.

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        Both of these should extract the `.tar.gz` file into a folder that shares the same name. (e.g. `tar -xvzf excc-darwin-amd64-v{{ cliversion }}.tar.gz` should extract to `excc-darwin-amd64-v{{ cliversion }}`).

=== "Linux"

    1. Download the correct file for your computer:

        | Architecture | Filename                                      |
        | ------------ | --------------------------------------------- |
        | 32-bit       | `excc-linux-386-v{{ cliversion }}.tar.gz`   |
        | 64-bit       | `excc-linux-amd64-v{{ cliversion }}.tar.gz` |
        | 32-bit ARM   | `excc-linux-arm-v{{ cliversion }}.tar.gz`   |
        | 64-bit ARM   | `excc-linux-arm64-v{{ cliversion }}.tar.gz` |

    1. For your security, verify that your download hash matches the hash in the ExchangeCoin releases manifest. For detailed instructions, read about [Verifying Binaries](verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Ubuntu File Browser:** simply right click on the `.tar.gz` file and select "Extract Here".

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        Both of these should extract the `.tar.gz` file into a folder that shares the same name. (e.g. `tar -xvzf excc-linux-amd64-v{{ cliversion }}.tar.gz` should extract to `excc-linux-amd64-v{{ cliversion }}`).

=== "BSD"

    1. Download the correct file for your computer:

        | Architecture  | Filename                                        |
        | ------------- | ----------------------------------------------- |
        | FreeBSD amd64 | `excc-freebsd-amd64-v{{ cliversion }}.tar.gz` |
        | OpenBSD amd64 | `excc-openbsd-amd64-v{{ cliversion }}.tar.gz` |

    1. For your security, verify that your download hash matches the hash in the ExchangeCoin releases manifest. For detailed instructions, read about [Verifying Binaries](verifying-binaries.md).

    1. Navigate to download location and extract the `.tar.gz` file:

        **Terminal:** use the `tar -xvzf filename.tar.gz` command.

        The `.tar.gz` file will be extracted into a folder that shares the same name. (e.g. `tar -xvzf excc-openbsd-amd64-v{{ cliversion }}.tar.gz` should extract to `excc-openbsd-amd64-v{{ cliversion }}`).

---

## Minimum Configuration

At the very minimum, for `exccd`, `exccwallet`, and `exccctl` to be able to communicate with each other, they need to be launched with the same `rpcuser`/`rpcpass` combination. For manual configuration please follow these steps:

1. If the OS-specific home directories listed in [Configuration File Locations](../wallets/cli/startup-basics.md#configuration-file-locations) do not exist, please create them for `exccd`, `exccwallet`, and `exccctl`.

1. Choose an arbitrary username and password, these will only be used for each application to communicate via remote procedure call. The easiest configuration is to set them all equal.

1. Using your favorite text editor, create a new text file and add the following lines:

        [Application Options]
        rpcuser=<chosen-username>
        rpcpass=<chosen-password>

    Save it as `exccd.conf` in `exccd`'s home directory.

1. Create another new text file and add the following lines:

        [Application Options]
        username=<chosen-username>
        password=<chosen-password>

    Save it as `exccwallet.conf` in `exccwallet`'s home directory.

1. Create a third text file and add the following lines:

        [Application Options]
        rpcuser=<chosen-username>
        rpcpass=<chosen-password>

    Save it as `exccctl.conf` in `exccctl`'s home directory.

---

## Additional Configuration Options

All command line options can be put in the config file. The sample config files in the release package give additional options or you can run one of the programs with the `-h` flag to show a list and description of all options for the specified application.

There is also a full list of options for each application which can be found [here](../wallets/cli/exccd-and-exccwallet-cli-arguments.md).
