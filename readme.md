# AttackBox for TryHackMe SOCMas 2025
[Explanation of what an attack box is for TryHackMe](https://help.tryhackme.com/en/articles/6721845-the-attackbox-explained)

I've customized the Kali Linux image from [Kasm Workspaces](https://docs.kasm.com/docs/latest/). It allows accessing and controlling the desktop from inside a browser. These images are intended to be used inside their platform, but for our purposes we do not need Workspaces itself, we just run [customize](https://docs.kasm.com/docs/latest/how-to/building_images) the image and run it in docker.

The customization includes installing openvpn, allowing running commands as sudo without password, and generating Hungarian locale so I can use accented characters in the terminal correctly.

Base image used: https://hub.docker.com/r/kasmweb/kali-rolling-desktop

Possible improvements:
* Set password for sudo instead of using it without password
* Instead of installing openvpn in the container, use a vpn sidecar as recommended by Kasm: https://www.kasmweb.com/docs/latest/how_to/vpn_sidecar/vpn_sidecar.html

## Steps to start
* git clone project
* Download your OpenVPN Connection pack from the TryHackMe Website [using their guide](https://intercom.help/tryhackme_help/en/articles/6496038-connecting-to-openvpn-on-linux-and-mac)
* Rename downloaded file to `tryhackme.openvpn` and move to the folder of cloned project
* Make a folder called `home` inside the cloned project
* Start docker container with `docker compose up -d`. This will download and build the necessary image
* In your browser, connect to https://localhost:6901 . It will prompt for user:
    username: `kasm_user`
    password: `KaliForWin1` (can change in docker-compose.yml)
* Double-click `TryHackMe VPN` icon on desktop. It starts a terminal window, while that is running you are connected to TryHackMe
* In another terminal window, check if connection was successful with `ping 192.168.128.1` based on [this article](https://help.tryhackme.com/en/articles/6496058-troubleshooting-openvpn-on-linux-and-mac)
* You should be good to go with the lessons requiring an attack box!

# TryHackMe notes

## day 2
* Clone project with `git clone https://github.com/trustedsec/social-engineer-toolkit.git`
* in the cloned folder run `sudo apt install set -y` to install dependencies
* run with `sudo setoolkit`