+++
title = "Easter Holidays Tech Meeting Minutes"
date = "2026-04-09T13:00:00Z"

[taxonomies]
categories = ["Meeting Minutes"]
+++

Planning infrastructure migration, documentation and tooling work, and recording and photo projects for Term 3.
<!-- more -->

## Minutes by Odin

> "I love it when Raven shits on people, it brightens my day." - Charis (2026)

## Attendance
- *[President]* **Tom F**
- *[Secretary]* **Odin**
- *[Tech]* **Charis**
- *[Tech]* **Vlad**
- *[Tech]* **Tara**
- *[Tech]* **Luna**
- *[Tech]* **Olly**
- *[Tech]* **Alfie**
- *[Tech]* **Raven** (muted)

## Apologies
- *[President]* **Tom S**

## Agenda 1: Cupboard Organising & AdamRMS
### AdamRMS / Account Access
- **Tara:** Said she had written part of this agenda a couple of weeks ago, but Alfie would know more.
- Need to roll out AdamRMS to the rest of exec.
  - It is still unclear how account distribution should work.
  - Options mentioned included signup codes and OAuth.
- **Raven:** Said the society is planning to move to Authentik at some point.
- **Tara:** Asked how that would work.
- **Raven:** Said they and Tom S would figure it out.
- **Tara:** Asked for a fuller rundown of how the auth setup works.
- **Raven:** Said they would explain properly once they are less ill.
- **Tom F:** Asked how difficult it would be to use Keycloak for now and switch to Authentik later.
- **Vlad:** Thought that should be workable.
- **Raven:** Said it should work in theory; it just needs doing.
- **Tom F:** Said the move to Authentik has been pending for a long time already.
- **Raven:** Said they intend to make progress on it soon, though IDG delays have slowed things down.
- **Tom F:** Said that if account access is needed, Tech should set it up now and fix the implementation later rather than block itself.

### Cupboard / Equipment
- **Alfie:** Said TEDx are still storing their Blackmagic Pocket 4K in the tech cupboard.
  - It is convenient.
  - It is not UWCS property.
  - There is a standing agreement that UWCS can use the camera in exchange for storing it.
- **Charis:** Asked what the actual issue was with keeping the Blackmagic camera there.
- **Alfie:** Clarified that the concern is ownership rather than convenience.
- **Tara:** Said the next practical step is to document the arrangement somewhere appropriate.
- **Alfie:** Can look at doing that in Term 3, but does not have time right now.
- **Tara:** Said that once Warwick TV has a larger tech crew, they could also start using AdamRMS.

## Agenda 2: Server Infrastructure
### Migration Plan
- **Vlad:** Said Tech now has a server in Germany rented from Hetzner.
  - It is running Proxmox.
  - It is clustered with local infrastructure.
  - The aim is to make it easier to move services across.
- Most core services are currently on Milner, so DNS work will be part of the process.
- Hetzner was chosen because of cost and its generally strong reputation.
- **Tara:** Asked whether there were specific areas others could help with.
- **Vlad:** Said help would be useful with container work and with pointing `uwcs.co.uk` at the new server.
- **Vlad:** Wants a minimum working subset of services running on Hetzner first, then maintenance on the existing servers afterwards.
- **Tom F:** Asked how this fits with the migration map that had been drawn up in `#tech-zone` before Easter.
- **Tara:** Said the current phase is moving existing servers onto a VPS.
- **Raven:** Asked roughly when the restructuring should happen.
- **Vlad:** Thought it would be best left until after exams.
- **Raven:** Said they expect to be freer after exams as well, and linked that to the Authentik work.
- **Vlad:** Said there is nothing stopping the old and new setups running in parallel for a while.
- **Raven:** Said that has effectively already been happening, but IDG issues mean it is not yet properly usable.

### Maintenance / Access
- **Raven:** Warned that the restructuring will require downtime.
  - If maintenance is known in advance, Tech should give at least seven days' notice.
  - People get antsy about unscheduled maintenance.
- **Charis:** Asked whether any upcoming work would require physical access to the servers, and suggested keeping track of that explicitly.
- **Raven:** Said they are around year-round, and Skiros is usually local when not out of the country.
  - There is also a port in CS0.03 patched to the servers.
  - Historically, the main physical fix needed has been turning Milner back on.
  - Most other intervention can be done remotely from the LAN.
- **Charis:** Noted that recent Hopper maintenance did require physical access, so it is still worth tracking.
- **Raven:** Said Hopper has already been nuked, and that Tom S sent a deprecation email at the end of Term 2.
- **Tom F:** Asked whether the maintenance deadline was still vague or whether people would know when the maintenance was actually happening.
- **Raven:** Said "soon tm", which Tom F was unimpressed by.

### Communication
- A suggestion was raised that Tech could send deprecation emails early for more services, so infrastructure can be taken down when needed.
- **Vlad:** Joked that this would amount to emailing people that the servers could fall over at any moment.
- **Tara:** Asked whether any third-year projects depend on UWCS services.
- **Raven:** Said yes, mainly Portainer, but stressed that UWCS does not offer these services under any binding contract.
  - Ideally, projects should not be dependent on society infrastructure.
  - A warning email would still be a good idea.
- **Tom F:** Joked about downtime announcements in Comic Sans on Instagram Reels.
- **███ █:** "██ ██ ██████ ██ ██ ████ ███ ████ █████ ██ ██████████████ █████████, █████ ████ ███!"

## Agenda 3: Photo Gallery
- **Tom F:** Asked whether there had been any progress on a UWCS photo gallery.
- **Raven:** Said no.
- **Tom F:** Recalled that Tom S had once mentioned a possible service for this.
- **Tara:** Suggested Piwigo, which the Drama archive uses, unless something more advanced is wanted.
- **Raven:** Mentioned PhotoPrism.
- **Tom F:** Said it had been brought up before, but then got lost during elections.
- **Raven:** Said it could potentially be integrated into the main website.
  - The main website is also a pain to work with.
  - If not done sooner, it could become a summer project.
- **Tara:** Asked whether the gallery should just be launched separately from the website.
- **Raven:** Was happy with that as an initial approach.

### Photo Consent / Older Photos
- **Raven:** Asked what date range the gallery should start from.
  - It would be nice to show older events so people can see what they looked like.
  - The harder part is going back through old photos and dealing with opt-outs.
- **Tara:** Suggested starting with the current generation, perhaps the last year or two.
- **Tom F:** Agreed that doing it going forward may be the easiest option.
- **Tom F:** Suggested something similar to WHACK's photo-lanyard system.
- **Raven:** Asked how WHACK handled that, noting that lanyard minimum-order quantities can be excessive.
- **Odin:** Said they did not remember photo lanyards at WHACK.
- **Tom F:** Explained that WHACK handled it fairly quietly.
  - There was signage saying photography would be taking place.
  - People who did not want to appear in pictures could ask exec for a lanyard.
- **Raven:** Questioned whether it needed to be that complicated, suggesting a simpler "move out of shot if you do not want photos" approach.
- **Odin:** Pointed out that there have been times when photos were taken without people realising.
- **Charis:** Said clearer systems help photographers, especially at large events.
- **Tom F:** Provisional plan is to make a public photo gallery, likely using PhotoPrism.
  - Happy to invest in signage and lanyards.
- **Raven:** Said they may experiment with PhotoPrism later that afternoon.

## Agenda 4: Possible Ticketing System
- **Raven:** Raised the idea because a lot happens in `#tech-zone`, and a ticketing system would make requests easier to track, even if it feels a bit corporate.
- DCS Tech and IDG both use tracking systems.
- **Charis:** "I love it when Raven shits on people, it brightens my day."
- **Tom F:** Joked about using Jira.
- **Raven:** Objected strongly.
- **Tom F:** Suspected there is probably a Discord bot for this.
- **Tara:** Pointed out that not everyone uses Discord.
- **Tara:** Said she had tried `TicketTool` on her own server and thought it worked quite well.
  - Asked whether people would be up for using it.
- **Raven:** Asked Tom F whether "the talking to:tm:" had happened yet.
- **Tom F:** Asked whether that conversation should happen now or later.
- **Tom F:** Said the ideal setup would allow people to submit tickets both through Discord and via the web.
  - Even a website link in Discord might be enough.

## Agenda 5: Training for Tech Recordings
### Setup
- Current recording setup discussed was:
  - camera with microphones connected
  - camera into a capture card
  - capture card into a recording PC
  - laptop input as needed
- There was some discussion of CS104 and how camera positioning there can feel very front-row-heavy.
- **Tara:** Suggested wireless HDMI as one possible approach.
- **Odin:** Mentioned a possible Amazon listing.
- Another past setup involved using a blue USB stick with OBS and working through the lecture-capture camera.
- **Tara:** Has seen that done, but would rather avoid relying on the lecture system directly.
  - If something goes wrong with the stream, it is awkward to interrupt the lecture.
- **Raven:** Recalled that lecture-capture PCs can struggle if asked to stream and record at the same time.
- **Tara:** Said the practical alternatives are using your own laptop or an e-waste PC.

### Equipment / Use Cases
- **Alfie:** Said someone bought a new capture card and that he had posted a picture in chat, though he did not know the exact model.
- **Raven:** Said they had wanted more capture cards anyway because of WASD.
  - During the Mario Kart run, Tech had two Elgatos but still needed a software workaround to move video around.
  - More capture cards would be useful.
- **Tara:** Said there may also be chances to stream parts of LAN competitions.
  - She, Finn, and Owen had been discussing that.
  - The society has equipment in the cupboard that is not used often outside one-off events.
  - If UWCS maintains good trust with other societies, it would be good to use that equipment more often.
  - One idea is something similar to WASD, such as streaming a multiplayer race.
- **Raven:** Said one difficulty at WASD was that the learning curve for getting involved was too steep.
  - Term 3 is a good time to experiment with that kind of event.
- **Tara:** Also mentioned BONCS and revision lectures as possible things to stream.
- **Tom F:** Would prefer those to be recorded, rather than only streamed.
- **Tara:** Said it would still be good to get the ball rolling.

### Training Session
- **Tom F:** Suggested booking a room for an hour.
- **Tara:** Said she already has a workable setup and mainly needs time to teach other people.
- There was discussion of availability around the 15th to 20th April.
- **Raven:** Said the old tech strategy of "do it live" should be avoided.

## Agenda 6: Documentation
- **Tara:** Said lots of docs are out of date.
  - People should each take a few pages.
  - Read them over.
  - Either update them or remove them.
- **Tara:** Also suggested a page in the content management system showing when pages were last updated.
- **Raven:** Said anyone who has logged into the wiki should already have wiki access.
- **Tara:** Asked whether there was anything in particular that people wanted to take ownership of.
- **Raven:** Said they will be writing something there "soon tm".
  - Before they either leave Warwick or stay over the summer, they want clearer documentation and a more structured process.
  - That should make it more transparent which members hold what information and how people should get in touch.
- **Tom F:** Asked whether anyone wanted to add anything else under documentation.
- **Tara:** Asked whether she could add public comments.
- **Raven:** Said yes.
- **Tom F:** Asked whether that could instead just happen in `#ask-tech-team` on Discord.
- **Raven:** Said comments can be turned off if they become a problem, but doubted many people would use them anyway.
- **Tara:** Added the first comment.

## Agenda 7: Website and Diagram
- **Tom F:** Said the website and spaghetti diagram both need updating.
- **Raven:** Is waiting on photos from people.
  - Would rather do the update in one go.
  - Last cycle had very patchy photo coverage.
  - Does not want to leave it too long.
  - Wants the new exec on the site by the start of Term 3.
  - Will start chasing people for photos.
- **Raven:** Thinks this is likely to become a summer project and was not well enough to discuss it in depth during the meeting.

## Agenda 8: Discord Permissions
- It is standard for Tech Officers to receive admin permissions.
- **Tom F:** Said he has now done this for Welfare and intends to do the same for Tech.
- **Tom F:** Said that, █████ ███ ███████████ ██ ███ ████ ████, he has a very low tolerance for misuse.
  - If one person gives him reason to intervene, everyone will lose the permission.
- Everyone acknowledged this.

## Closing Words
- General feeling that most major tech work is now focused on post-exam infrastructure changes, clearer documentation, and making better use of existing equipment.
- The meeting closed with responsibility assignments for the main workstreams.

## Assignments
- **Alfie:** Cupboard organising and AdamRMS.
- **Vlad:** Server infrastructure, working with Charis.
- **Raven:** Public photo gallery.
- **Olly:** Possible ticketing system.
- **Tara:** Training people for tech recordings.
- **Charis:** Documentation upkeep, post-exams.
- **Luna:** Website updates.
  - Raven may end up helping with this anyway.
