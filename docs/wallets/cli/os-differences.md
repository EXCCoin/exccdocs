# Operating System Differences 

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

### Launch Commands

Launching the command line applications (`exccd`,`exccwallet`,`exccctl`) differs depending on the shell used in your operating system.
For Windows users, the Command Prompt and PowerShell are available for use. On macOS and many Linux distributions, Bash is the default shell within the Terminal application.

Below are examples of basic run commands for Bash and Command Prompt:

**Command Prompt:** `exccd.exe`, `exccwallet.exe`, `exccctl.exe` <br />
**Bash:** `./exccd`, `./exccwallet`, `./exccctl`

Some of our guides might be OS-agnostic with the launch commands. If a guide says to run `exccctl --wallet getbalance`, it's referring to using `exccctl.exe --wallet getbalance` for Command Prompt and `./exccctl --wallet getbalance` for Bash.

### Application Directory Locations

The command line clients (`exccd`, `exccwallet`, `exccctl`) also differ in their directory locations for each application. This includes blocks, wallets, log files, and configuration files, which are all stored within the data directory. To help you locate these directories, we have provided a table below with the default application directories for each application.

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
