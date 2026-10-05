+++
title = "Summer Holidays Tech Meeting Minutes"
date = "2026-08-28T18:00:00Z"

[taxonomies]
categories = ["Meeting Minutes"]
+++

Reviewing Authentik, email reliability, event recording, website development, cupboards, servers, and gaming support.
<!-- more -->

## Minutes by Crystal

## Attendance
- Thomas S.
- Crystal
- Raven
- Alfie
- Ollie
- Tara
- Vlad

## Authentik 
- AdamRMS doesn't have OAuth support -> Can't integrate with Keycloak/Authentik easily
- Sign up codes might work for people to create their own accounts
- Raven's progress:
  - Hijacked Keycloak ACS and Authentik works
- Tom S.'s suggestion:
  - Make a bridge between Warwick's OAuth 1.0 and Authentik
  - May require Tabula's API
- IDG is ignoring us
- Migration: Authentik -> Keycloak (should be feasible)
  - Portainer and linking of old to new accounts may be difficult
- LDAP is not required anymore as the old storage server used it
- Amphi has been rewritten in Haskell by Alex Dixon

## Email Fix
- Tom mentioned that emails are being dropped and the treasurer needed to use their personal warwick emails (eg Bending Spoons and Luna)
- MXRoute has previously disabled our accounts and we pay appx.  £12-£15 for a year/three years
- PurelyMail is appx. the same
- Vlad suggests some support ticket like system so emails are not ignored (with tags)
  - Inspired by DCS Tech
- Most execs ignore emails hence double-replying shouldn't be a problem

## Event Recording
- Need availability of events for awareness -> Require deadline
- Raven’s suggestion: 
  - Add a form of publicity request system (eg pinging tech officers)
- Ensure people are happy to be recorded in advance
- Ed said that the botched recording for formal languages is unlisted on YouTube

## New Website
- Potential for an intermediate step of removing Zola fork
- Require discussion:
  - Static site, Generator, etc.
- Current website revamping:
  - Update assets and photos
  - Group exec photo to be updated with current exec cycle
  - Update exec page (resignations + new gaming)

## Cupboards Management
- Alfie and Tara have organised and labelled the cupboards
- DCS tech is unhappy with the stuff on top of cupboards
- Kevin tested hard drives during last year's cupboard organisation
- Raven’s suggestions:
  - Giving/selling away unnecessary tech items that are taking up space or serve no purpose (eg to tech crew)
    - Inventorying everything to avoid unnecessary and unknown accumulation
- We would appreciate custody of label maker

## Server Killing
- Hopper is dead
- Requires moving off of the old DCS network and requires a conversation with IDG Networking & Infrastructure (which may be difficult)
- We need to be given a datacentre VLAN from them
- Shouldn't break the current set up before doing this successfully
- Nuke Milner when we've got the details
- No benefit to nuking the Proxmox servers but need to clean them up
- New drives may be in order because we're getting SMART errors
- Raven's Broad Plan
  1. Data Checking across infrastructure 
    - Few trackers to check things only meaning still require manual checking 
  2. Hopper gone so require Portainer
  3. Hopefully proper update plans in place
  4. Ideally automated to make it feasible
    - A lot of things are out of date
    - Difficult to update things
  5. Round Access Control
    - Give admin access back to the infrastructure
    - Eg improved with Tailscale ideally with UWCS accounts

## More Gaming Execs
- Should abide by Coop rule
- In order for gaming Execs to have exec merchs, we must elect them soon
- Require by-election

## Summary of Things to Do:
- Discuss with Gaming about 2 obsolete boxes
- Vlad will take a look at the non-functional images
- Vlad/Olly will add OAuth to make it available to everyone (must be careful with perms)
- Discuss with Lea about re-keying the cupboards (gaming needs fixing)
- Raven to revamp website
- Raven to handle Portainer migration
