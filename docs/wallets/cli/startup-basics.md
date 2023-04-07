# Startup Basics

---

This guide is intended for users of ExchangeCoin's command-line applications. If you are using Exilibrium, you can safely ignore the use of configuration files as Exilibrium handles basic configuration automatically. Please note that some of our guides show configuration file settings, while others show startup command flags.

---

## Configuration File Locations

ExchangeCoin software reads configuration files during the startup process to determine settings. Command line flags, such as `exccwallet --testnet`, can be replaced by values in the corresponding configuration file, for instance, `testnet=1 in exccwallet.conf`. Each application's home directory contains the configuration file, and the default location of this directory on Windows, macOS, and Linux can be found below:

| OS      | exccd, exccwallet, exccctl App Directories    |
| -------:|:------------------------------------------:|
| Windows | `%LOCALAPPDATA%\Exccd\`                     |
|         | `%LOCALAPPDATA%\Exccwallet\`                |
|         | `%LOCALAPPDATA%\Excctl\`                   |
| macOS   | `~/Library/Application Support/Exccd/`      |
|         | `~/Library/Application Support/Exccwallet/` |
|         | `~/Library/Application Support/Excctl/`    |
| Linux   | `~/.exccd/`                                 |
|         | `~/.exccwallet/`                            |
|         | `~/.exccctl/`                               |

Each of these folders is allowed its own `.conf` file, named after the individual application (`e.g. exccd uses exccd.conf`). Please also note that the `Exccd` and `Exccwallet` home directories are automatically created when each application is first launched. You will have to manually create a `Excctl` home directory to utilize a config file.

The [exccinstall](cli-installation.md) installation method automatically creates configuration files, with the [minimum configuration settings](../../advanced/manual-cli-install.md#minimum-configuration) already enabled. 

For users who manually install the ExchangeCoin software, sample configuration files are included in the .zip/.tar.gz package. It is suggested that these files are copied to the appropriate directory mentioned earlier and then renamed by removing 'sample-' from the filename. The sample files have various settings commented out, which are disabled by default. Users can enable these settings by deleting the semi-colon before the line. More information can be found here: [Manual Installation](../../advanced/manual-cli-install.md#installation)

---

## Startup Command Flags

The configuration file is not the only way to set application parameters; they can also be passed directly to the application during launch. For instance, the following OS-specific commands can be used to launch `exccd` for Testnet use instead of setting `testnet=1` in the config file:

    Windows: exccd.exe --testnet
    macOS: ./exccd --testnet
    Linux: ./exccd --testnet

The above example would first look to the `exccd` configuration file for settings and then look to the executable command to enable the testnet setting. 

---

## Advanced Usage

[Full List of Options for Each Application](exccd-and-exccwallet-cli-arguments.md)


## Next

[exccd Setup Guide](exccd-setup.md)
