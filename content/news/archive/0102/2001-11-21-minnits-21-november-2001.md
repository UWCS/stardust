+++
title = "Minnits - 21 November 2001"
date = "2001-11-21"

[taxonomies]
categories = ["Meeting Minutes"]

[extra]
original = "https://uwcs.co.uk/news/minnits-21-november-2001-1474488869960/"
+++

### Compsoc Exec Minnits

#### 21 November 2001

#### Present

  - Henry Southgate
  - Tom Cropper
  - Chris Smith
  - Alexis Birkill
  - James Ross
  - Richard Colfer
  - Jake Staines
  - Tom Ward

#### s4 De-brief

As most of the exec were aware, last weekend was that of s4, our uber-LAN. So what did we think of it?

James reckoned that there wasn’t enough variation, and he had a point. There was a lot of Quake3, Starcraft, CS, OpFlash etc - but these are either FPS or RTS; there was little, for example, driving going on.

Another problem was that people kept ‘dipping in and out’. This could be solved with a time-share situation; one person brings a box and someone else can play on it also. The problem wwith this is that the box owner would have to be able to trust his timesharee. For this reason, it would be a private arrangement only.

It was noted at this point that Matt Stewart-Smith:

  - Uses the same root password for everything.
  - Is a fool for bringing a huge monitor and making Chris Smith carry it.

Apparantly the MP3 server roxored. However there were some bugs that JR will mail HS to fix. H to delete Nutsy’s account because he queues crap. Apparantly.

WRT the length of the LAN, some people felt that it was too long - however it was generally agreed that we would have one 50h LAN per term, and a couple of day-long LANs to tide people over.

##### Bee

Last LAN, Adam Chalkley didn’t turn up, having told us the night before. This LAN, Adam Chalkley didn’t turn up “’cos he couldn’t be arsed”. Jake to speak to him about this; he will be put to the bottom of the signup list for the next LAN. This kind of thing is not acceptable; if it occurs again then a ban may be in order.

#### Karting

After hassling the rest of the exec, Henry “McRae” Southgate managed to get a current total of 8 people on the signups for Karting. Rest of the exec to push this as much as possible.

We will meet at 1:00pm in Rootes Reception, to leave at 1:30, arriving to start by 2.

#### Molotov

##### Things to do

Firstly, ircd needs to be recompiled. This is to fix things like max nick length, max topic length, chanserv, nickserv etc.

Next, James has been having trouble with Apache; it’s set on an uber-secure setting, so whenever he wants to do something cool and funky he needs to edit the config file. Most of this is OK now though.

JR to speak to Chris Salmon about Tomcat.

##### Game Servers

Currently, the only port anyone can access any gameservers on is the cstrike port; obviously this sucks. Tom to keep looking into this, and to consider the fact that a firewall may be stopping access.

##### Members

We’ll advertise molotov in the next newsletter, and let people sign up. H to mail mailing list with lame-proof instructions to giving members accounts.

The quota will be set by default to 10M. 20M of additional space may be purchased for £5 a shot.

H to update the useradd script to do quotas.

Jake to put the remaining members into the database.

##### DB

James will copy the database across tomorrow. Tom will put PostgreSQL on instead of mySQL. Quite how these two operations will interact, and how it’ll all turn out afterwards, is anyone’s guess; I’m betting it won’t be pretty.

Perl modules needed.

For the record, the following items are case-sensitive in MySQL.

  - database names
  - table names

Also, the following items are not case-sensitive in MySQL.

  - field names

In addition, a ‘show tables’ does not convert to lower-case.

I know this because I have just checked :-).

#### Website

The website has made no progress, due to lack of time on James’s behalf. James to do more stuff.

#### Refresher’s Fayre

Thanks to the unbelieveable turnup last year (1 more membership), we’re not going to be at the refresher’s Fayre this year.

Not even a little bit.

#### Money

Alexis to pay in Jingly’s recepit; H to give Alexis his recepit.

Nuff said.

#### Cat5

Woo\! We’ve finally got a cheque from David Apthorpe. This is good news.

#### Tutorials

Jake will have the poster masters done by tomorrow morning; Toaster to meet Jake on campus at 11 to get the masters, photocopy them, and then distribute around campus with a liberal dash of parsley.

#### Games

When all the servers are up and running, we will advertise molotov as being a functioning game server, and to a big launch.

An IRC client is needed for gaming sessions.

We can advertise the counterstrike server and use it on gaming sessions; the address will be cstrike.warwickcompsoc.co.uk.
