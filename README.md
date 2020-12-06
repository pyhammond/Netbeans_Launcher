# Netbeans_Launcher
A shell script and Automator App that Launch Apache NetBeans with my ssh-agent configuration and also connects to our company's VPN at the same time.

## Some Advice
If you are upgrading to the latest version of [Apache NetBeans](https://netbeans.apache.org/ "Apache NetBeans"), I would advise _against_ allowing NetBeans to convert your NetBeans configuration from the previous version.  This has caused me much grief when trying to get my Subversion/ssh configuration working.  If you need to flush the config for your new version and start over, you can just delete the directory at `~/Library/Application Support/NetBeans/12.1` or whatever the version of NetBeans you are running is called under that NetBeans directory in `~/Library/Application Support/NetBeans`.

## Files
There are just two files in this repo:
1. [ssh_launcher.sh](https://raw.githubusercontent.com/pyhammond/Netbeans_Launcher/main/ssh_launcher.sh "Raw Shell Code") is the shell script containing the commands built into the Automater App.
2. [NetBeans Launcher.app](https://github.com/pyhammond/Netbeans_Launcher/raw/main/NetBeans%20Launcher.zip "Zipped MacOS App") is the App version built in Automator that contains the code in the above shell script.  Feel free to open it in Automator and edit it if necessary.

Best of luck !
