+++
title = "IRC Guide"
date = "2023-05-02"
+++
IRC (Internet Relay Chat) is an older protocol for text chat, and is
supported in our Discord server by a bot that broadcasts messages to an
IRC client and vice versa. Our Discord server is optimised for Discord
clients, but if you would prefer to connect through IRC, this guide will
explain how to do that.

(If you already know how to use IRC, the URL is irc.uwcs.co.uk)

**Setting Up IRC With A Shell Account**

If you want permanent IRC, with easy access from any computer and many
phones (see the
[JuiceSSH](https://play.google.com/store/apps/details?id=com.sonelli.juicessh&hl=en_GB)
App), there are some easy steps to follow below. If you just want to
know how to join channels and move between them, skip to the bottom
sections.

**Step One: Request A Shell Account**

To get a shell account, see the instructions on our tech wiki:
<https://techteam.uwcs.co.uk/en/services/shell-accounts>

**Step Two: Get An SSH Client**

On Windows, you need to download a program called PuTTY to access your
shell account. To do this, click
[here](https://puttytray.goeswhere.com/).

Now, if you're on a MAC or a Linux computer, then skip this part! Open
up PuTTY and your cursor should be in the top text box labeled
"hostname". In here, with the username you chose, type
"username@lovelace.uwcs.co.uk". Then, click the "Open" button at the
bottom of the page. This will now open a terminal. If a message appears
saying something about unverified hostname or fingerprint, just ignore
it and continue (probably by typing "yes" and hitting enter). Then enter
your password when prompted. Congratulations, you've accessed your shell
account!

If you're a MAC or Linux user, all you need to do is open a terminal and
type "ssh username@lovelace.uwcs.co.uk", and be aware of the same
warning as above.

**Step Three: Setting Up Irssi**

In your terminal, type "tmux". Tmux is a program that will allow you to
always have IRC open, even when you aren't logged into your shell
account. If you ever need to exit tmux, typing "ctrl b" then letting go
and then typing "d" will detach it. Typing "tmux attach" in your shell
account terminal will bring it back.

To set up Irssi, the IRC client, type "irssi ---connect irc.uwcs.co.uk"
(that's a double dash before the connect) after you've opened tmux.
You're now in the CompSoc IRC! Time to join some channels...

**Step Four: Joining Channels And Moving Around**

To join a channel, type "/join #channelName" and you will instantly move
to that channel. We suggest joining #compsoc first, but there are many
other channels that are very active, such as #cs (Computer Science),
#tech, #anime and many more that people will inform you of if you ask!
There is no limit to the amount of channels you can join and it is the
same command, typed in the bottom bar, every time. You will see that the
channels are numbered at the bottom of the screen, and channel 1 is the
entry channel and does not have other people in it.

The bottom status bar, along with showing you what channel you are in,
will also have a list of "active" channels. These are channels that have
had someone say something in them that you have not yet seen. To cycle
through active channels, you can keep pressing "alt a".

To change between channels 1-9 you can type "alt 1", "alt 2" etc, and to
access channels above that range you can type "alt leftArrow" or "alt
rightArrow" which will move you up or down a channel. Typing "/win
number" will take you to the channel with that number.

To talk in a channel, just type and press enter! We encourage saying
hello when you enter a new channel, everyone is very friendly!

**Step Five: Leaving And Returning Next Time**

To leave Irssi, you need to detach tmux by typing "ctrl b" then
releasing, then typing "d". In windows, you can now press the cross
button on PuTTY, on Linux or MAC, you can type "ctrl d" and you will be
disconnected.

To access IRC again, in Windows you must open up PuTTY again, go through
the same steps until you've entered your password, then type "tmux
attach" and you will be in IRC again. On Linux and MAC, type "ssh
username@lovelace.uwcs.co.uk" and then do the same thing.
:::