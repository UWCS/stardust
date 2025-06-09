+++
title = "If Your Website Hosted By Us Has Suddenly Stopped Working..."
date = "2016-10-10"

[extra]
original = "https://uwcs.co.uk/news/if-your-website-hosted-us-has-suddenly-stopped-working/"
+++

<p>So, it's possible that your website that is hosted with us, whether you're a society or an individual, has stopped working if you point to it from an outside domain name (ie, not just "username.uwcs.co.uk"). This will tell you how to fix it.</p>

<!-- more -->

This was not an intended side effect of moving to a new website\! I'm so sorry if this has affected you, and what I'm going to tell you now is the simplest fix for it. If for some reason it doesn't work, or you've lost the login details of your domain name provider, we can help you, but it will take longer than applying this fix (email academic-president@uwcs.co.uk or tech@uwcs.co.uk for help\!).

First, log in to your domain name providers website (e.g, fasthosts, 1&1 etc). Then navigate to your domain's DNS settings. Here, set the nameservers back to your providers default nameservers (this maybe isn't required, but when I tested it using my own personal website, it seemed to work best). After doing that, add an A record (or edit the existing one if there is, there's probably an add/edit button somewhere) and where it says to put in an IPV4 (or just IP) address, put in "137.205.37.210" without the quotes, then press save. This might take a bit of time to work (usually around an hour) but it should fix the problem. If it doesn't contact me on the email above and we can fix this\!

Once again, sorry about that\!

Love Rhiba xx

