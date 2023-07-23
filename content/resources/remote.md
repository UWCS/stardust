+++
title = "Remoting into DCS"
date = "2022-10-13"
+++

### Connection Address:

**`uXXXXXXX@remote-YY.dcs.warwick.ac.uk`**  
where the X's are replaced by your full 7-digit university id, and the Y's by the last two digits of it.

### Making a Connection:
The steps you need to follow at the start will slightly vary depending on your operating system.

#### Windows/Mac/Linux

1. On Windows, open up the **Command Prompt** (cmd). Otherwise, open the **Terminal** app.
2. Type: `ssh [connection address here]`, and hit enter/return.

#### Android
1. Install and open [Termux](https://play.google.com/store/apps/details?id=com.termux).
2. Type: `pkg install openssl` and hit enter/return.
3. If asked to confirm, answer with `y`
4. Type: `ssh [connection address here]`, and hit enter/return.

#### iOS
1. Install and open [Shelly](https://apps.apple.com/gb/app/shelly-ssh-client/id989642999)
2. Click **+**
3. In **SSH Server Address**, type out the connection address, then tap **Connect**.
4. Tap **Connect**


### Verification:
These steps will be similar, regardless of your device.

1. If you're asked about certificates, click **Yes** (if you want to check, the signature can be found [here](https://warwick.ac.uk/fac/sci/dcs/intranet/user_guide/remote-login/sshfingerprints)).
2. Enter your **DCS password**. This will have been emailed to you inside a `.txt` attachment in the past few days. (don't worry if you can't see anything while typing your password; this is normal)
3. You're in! You should see a system welcome message:

![Screenshot of SSH terminal](/resources/ssh-term.png)

---

More detailed information can be found in the [DCS Unix User Guide](https://warwick.ac.uk/fac/sci/dcs/intranet/user_guide/remote-login/) (along with how to access a desktop environment remotely).
If you have any issues, please do ask for help.

---

# Connecting with VS Code
(Note: editing this SSH config will also allow you to connect in a similar way through normal SSH)
This is a more fully featured connection, and operates like VS Code on your own PC but with all files and terminals on the department servers.

1. Install the `Remote-SSH` extension
4. Add the config to VS Code:
4.1. On your PC in VS Code, press F1, search for `Remote-SSH: Open Configuration File` - open the default file.
4.2. Add this to the file (you can change `DCSRemoteYY` to whatever name you want for the config).
```
Host DCSRemoteYY
    HostName remote-YY.dcs.warwick.ac.uk
    User uXXXXXX
```

 > Note: As before, YY is the last 2 digits of your student ID

5. PC: Connect by pressing F1 again and searching for Remote-SSH: Connect to Host, then select `DCSRemoteYY`, select Linux (only prompted first time you connect)

## Using an Authentication Key
To avoid having to enter your password each time, you can use some authentication keys.

1. On your PC, enable/install [`OpenSSH`](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui#install-openssh-for-windows) or another ssh client and run `ssh-keygen`
	- This creates `id_rsa` (private key) and `id_rsa.pub` (public key) n `~/.ssh` or `C:/Users/<user>/.ssh`.
2. Copy the contents of `id_rsa.pub` from your PC to `~/.ssh/authorized_keys` *on DCS*
	- This file may need to be created first time, and if you want to add multiple, simply list them on separate lines.
    - Some systems have a `ssh-copy-id` which makes this copying very easy
3. Make the Remote-SSH configuration read, the only difference is adding the identity file:
```
Host DCSRemoteYY
    HostName remote-YY.dcs.warwick.ac.uk
    User uXXXXXX
    IdentityFile C:/Users/<user>/.ssh/id_rsa
```
4. Attempt to connect like before, if you aren't prompted for a password, your key has been setup correctly.