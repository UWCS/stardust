+++
title = "Migration: reloaded"
date = "2016-01-19"

[extra]
original = "https://uwcs.co.uk/news/migration-reloaded-1474488924539/"    
categories = ["News Item"]
+++

TL;DR we're moving away from codd on the 25th. If you have anything running please move it to nodd.uwcs.co.uk in the next two weeks. The domain uwcs.co.uk will be updated accordingly in just over two weeks. The new IRC server is up at irc.uwcs.co.uk

You may remember me writing at the end of last term about us migrating our hosting infrastructure. I said it would be done by the end of term, and you might have gathered by now that we didn't manage to pull that off. Sorry about that.

After dealing with one of the target servers not wanting to be a server any more, we are now ready to migrate (I mean it this time\!). After a brief outage on 25/01/2016, users will be directed to nodd (new-codd) instead of codd. Codd will remain accessible at codd.uwcs.co.uk until 08/02/2016 (two weeks) to allow you to deal with any running programs you may have (e.g. tmux, screen, and irssi). If you need to bind to ports, ports 7000-8000 are available for users to bind to. After the two week grace period, codd.uwcs.co.uk will point to nodd.

How can we be sure it will actually happen this time? I held off writing this until we had everything already running in parallel (and tested\!). All we have to do now is push the button.

We will also be moving our IRC network, and from today (19/01/2016) all IRC requests will be routed to nodd. You might notice a brief disconnect, but things should be pretty smooth on this front. The main public channels will be created, but if you have any hidden channels you'll have to recreate them yourself. BadgerBOT has upped sticks and awaits you when you join nodd. The irc server on codd will be unavailable after the two week grace period.

Want to get ahead of the game? Nodd is already up at nodd.uwcs.co.uk, so you can log in and start using it right away. All of your files are available, and you can double check that your website is being served correctly. You can also point your IRC client there and recreate any hidden channels you own.

