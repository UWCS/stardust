+++
title = "2026 Winter Tech Meeting Minutes"
date = "2026-01-05T15:00:00Z"

[taxonomies]
categories = ["Meeting Minutes"]
+++

Planning T2 Tech Matters
<!-- more -->

# Agenda (Minutes Next Section)
Note:
- Raven Lucia (RL)
- Vlad Manoila

## Agenda ALL

- Something about ripping the servers out (emails can be found on hopper, downtime needs 7 days notice iirc)
   - RL:
      - Correct, see 4.4.10.b of constitution
      - Potential motion for AGM could be refining how "planned maintenance" is defined - e.g. when DCS’ planned power cuts were going to occur, we couldn’t give notice until they’d officially given notice, despite knowing it was going to happen
      - For unplanned maintenance/power cuts, notice should be reasonably given about the outage, and updates on expected timeline for restoration
- Something about un-ripping the servers and installing Gentoo (as opposed to Nix) on all of them (yes including Milner you can forget about OPNsense, gentoo has nftables too) /s /s /s /s /s - in all seriousness we need to use something future tech officers won’t hate us for
   - RL: Please keep in mind that there’s a balance between doing tech projects with particular tooling/frameworks/OSs because they’re cool/a hobby, versus doing them in a way that prioritises functionality and longer-term effectiveness, rather than needing to rewrite/restructure every year or 2
- Something about fixing the wiki, and who should have access to it (RL 02/01/26: Given Vlad perms, can't see CC account)
- [redacted]
   - RL: holes discussed in-private between myself and Tom S, [redacted] to Hopper (repurpose)
- (maybe) sexy-fying the website (I’m really envious of tech crew’s site) (please can we kill stardust/zola/current website) + potentially running analytics on the current site so that we know what to focus on
   - RL:
      - Theme stuff can be sorted with the current website & with stardust & zola, doesn’t require rewrite
      - Virtually every other SSG has similar/more limitations and/or is slower, as much as I hate to admit it
      - Working to reduce dependency on cursed bs with templates - e.g. most recently with exec display
      - Mainly just needs detangling and better docs
      - Similarly, working to reduce and/or remove dependency on custom fork of zola, easier now events website is a thing
         - I also have a branch that aims to simplify the local setup & testing of stardust this is a point of confusion in the past
      - Completely rewriting the website is not a small task, and something that’s more reasonable as a summer project if it were to be done at all
      - TC wiki’s repo seems to be inaccessible atm
- Public NTP server when?
- Portainer license expires 06/01/26 - RL has sent renewal request & to follow-up

# Minutes
## Attendance
- Olly
- Tabby
- Vlad
- Raven
- Tom S
- Josh
- Artem
- Charis

## Agenda ALL
- Preferable to nuke Hopper
	- Tom S has collected list of emails/there is a script
		- People can migrate to Portainer/alternatives
			- Possibly migrate static sites to Portainer
	- Tom S and Raven to look at emails today
	- Easy to chuck USB in the back of Hopper
		- DCS Tech fine giving us physical access

- Figure out what we want to stick on Hopper
	- Distro
	- [redacted] services e.g.
		- [redacted]
		- [redacted]
		- [redacted]

- Sort control access from there with Authentik where we can

- Should in theory take a few weeks at most
	- Don't collide with e.g. publicity

- Raven to create Google doc / Notion for infra ideas

- Olly suggests grab new Portainer license key using fresh email
	- License expires 06/01 - tech@uwcs.co.uk
	
- Maintainability of services
	- Don't overly use esoteric stuff etc - want long-term maintainability for future tech/exec/members
	- Update tech team wiki to cover gaps in docs - doc restructures as they go along
		- Possibly migrate to Nextjs (tcc current)

- `tech-team` --> renamed `ask-tech-team`

- Unified perms
	- In theory easier with Authentik
	- One source of truth for auth across sources
	- Avoid issues with having to add people separately to different things

- Website shenanigans
	- Lower priority overall
	- Large undertaking to rewrite
	- Raven believes re-theming etc can be done as-is
	- Mainly beneficial to do minor tweaks to begin with e.g. alignment and whatnot
	- Raven to look at tweaking design for accessibility of meeting minutes (constitutional requirement to publish) in the next couple of days and (longer endeavour throughout T2) to revamp Resources section etc