<!--
Table of content generated and auto-updated using Yu Zhang's "Markdown All in One" VSCode extension
-->

<br />
<div align="center">
  <a href="https://github.com/UWCS/stardust">
    <img src="static/images/dots_logo_bg.png" alt="Logo" width="120" height="120">
  </a>

  <h3 align="center">Stardust</h3>

  <p align="center">
    <i>UWCS' Static Website</i><br>
    <a href="https://uwcs.co.uk">https://uwcs.co.uk</a>
  </p>
</div>


<!-- Requires blank line after tag open & before close else it won't render. -->
<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
[![build][build-shield]][build-url]

</div>

## Built With

<div align="center">

[![rust][rust-shield]][rust-url]
[![zola][zola-shield]][zola-url]
[![tera][tera-shield]][tera-url]
[![chrono-english][chrono-english-shield]][chrono-english-url] <br><br>
[![markdown][markdown-shield]][markdown-url]
[![html][html-shield]][html-url]
[![js][js-shield]][js-url]
[![css][css-shield]][css-url]
[![sass][sass-shield]][sass-url]
[![bootstrap][bootstrap-shield]][bootstrap-url]

</div>

<!-- omit from toc -->
## Project Info
Stardust is UWCS' static website, created by [Owen](https://github.com/ericthelemur) and currently maintained primarily by [Raven](https://github.com/raven0034).

The website's HTML is generated from content written in [Markdown][markdown-url], using [Zola](https://www.getzola.org), which has an integrated Jinja2-like templating engine [Tera](https://keats.github.io/tera/).

- **Custom forks of Zola & Tera are used - make sure to follow the installation instructions for setting the website up locally!**

Stardust replaced our old website [Dextre](https://github.com/UWCS/uwcs-dextre) from the 2023/2024 academic year onwards.

GitHub Actions workflows rebuild and deploy to [https://uwcs.co.uk](https://uwcs.co.uk) on push to `master`.

<!-- omit from toc -->
# Contents
- [Contacts for queries](#contacts-for-queries)
  - [Some known issues](#some-known-issues)
- [Installation](#installation)
  - [1. Cloning the project](#1-cloning-the-project)
  - [2. Zola](#2-zola)
    - [Hopper/NixOS](#hoppernixos)
    - [Other Platforms](#other-platforms)
    - [Debugging \& Extra Info](#debugging--extra-info)
  - [3. Deploying the site](#3-deploying-the-site)
- [Contributing](#contributing)
  - [Making changes](#making-changes)
    - [1. IMPORTANT: Git submodules](#1-important-git-submodules)
    - [2. Crash-Course to Zola's terminology](#2-crash-course-to-zolas-terminology)
    - [3. Creating/editing content](#3-creatingediting-content)
    - [4. Create a PR!](#4-create-a-pr)
  - [What to do if something weird happens](#what-to-do-if-something-weird-happens)
    - [GitHub Actions failures](#github-actions-failures)
    - [Everything else](#everything-else)
- [Section-specific information](#section-specific-information)
  - [Exec lists](#exec-lists)
  - [Sponsors](#sponsors)
  - [Events](#events)
- [Example Markdown Pages](#example-markdown-pages)
  - [News](#news)
  - [Events](#events-1)
    - [General Info](#general-info)
    - [Provided Shortcodes](#provided-shortcodes)
    - [Example](#example)
- [Misc](#misc)
  - [Room Lookup](#room-lookup)
  - [Shortcodes in CMS Editor](#shortcodes-in-cms-editor)
- [The Not At All Comprehensive List Of Todos](#the-not-at-all-comprehensive-list-of-todos)

# Contacts for queries

- This `README`, and others, such as the [merch `README`](content/merch/README.md), contain a lot of useful info, please give them a read to see if these help solve your issue - even if they don't, some of the details may help someone assist you with your query :)

- [Raven](https://github.com/raven0034) is the current primary contributor, you're welcome to contact them for any queries, feedback, help setting up/contributing etc
    - You can reach them via `raven0034` on Discord

- If you cannot reach them, join [our Discord](https://discord.uwcs.uk), and send a message in the `tech-team` channel, where the Tech Officers & Sysadmins can try and help

## Some known issues
- Installation scripts not functioning as intended post-migration from [Owen's Zola fork](https://github.com/ericthelemur/zola) to [Raven's Zola fork](https://github.com/raven0034/zola)
    - The release paths differ on Raven's fork since it scraps Owen's GitHub Actions workflow and instead uses the (now fixed) pre-existing GitHub Actions workflow from upstream

    - Also needs to account for `aarch64` vs `x86_64` releases properly, where on Owen's fork, only the latter was relevant

    - Nix stuff does not point to the new fork currently

    - Raven to fix Very SoonTM

- (Not entirely confirmed) some Windows-specific inconsistencies in html generation causes some note shortcode usages to render incorrectly
    - First observed on upgrading and migrating Zola forks

- Campus map links are broken due to the uni shifting to a new system for Reasons - issue is being deferred to new events site when it lands

# Installation

## 1. Cloning the project
- Clone this repository using `git clone --recurse-submodules`
    - Currently, the repository has a theme submodule [`stardust-theme`](https://github.com/UWCS/stardust-theme.git)
        - *Required* for the website to correctly function
        - Contains most of the formatting for the website, using [Sass][sass-url] and [Bootstrap][bootstrap-url]
    - For contributors: make sure to read the [submodules information section](#1-important-git-submodules) before starting changes


- When pulling changes, use `git pull --recurse-submodules` (assuming Git 2.13+)
    - If you don't want to type `--recurse-submodules` each time, run once: `git config submodule.recurse true` (`git config --global [...]` to apply to any repos you have)

- The theme submodule references a specific commit hash, and the repository exists in a "detached state"
  - This can cause some issues when contributing 
    - This pulls the exact commit reference in a "detached state" from the branch, see the Contributing section for mitigating issues from this when contributing


## 2. Zola

### Hopper/NixOS
- Install fork of Zola (currently [Raven's fork][zola-url]): `nix profile install github:UWCS/stardust`

### Other Platforms
- Install fork of Zola
    - [`install-linux.sh`](install-linux.sh), [`install-mac-m1.sh`](install-mac-m1.sh) and [`install-windows.ps1`](install-windows.ps1) exist - if these fail, you can follow their steps manually:
        1. Download [latest pre-built release](https://github.com/raven0034/zola/releases/) for the relevant platform, produced by GitHub Actions
        2. Places the `zola` binary in `./bin`
        3. Adds `zola` to `PATH`
    
    - If your platform is not supported/you're modifying Zola yourself:
        - Install Rust (see [rustup.rs](https://rustup.rs/))
        - [`install-source.sh`](install-source.sh) exists, which builds Zola from source - *this can take a while (e.g. on Raven's M1 MacBook Pro, it can take around 5 minutes)*

        - To do this manually:
            - Clone the fork of Zola: `git clone https://github.com/raven0034/zola.git`
            - Change directories: `cd zola`
            - Run `cargo install --path .`
                - *For more info on Cargo, check out the [docs](https://doc.rust-lang.org/cargo/)*

### Debugging & Extra Info

1. Errors about _missing square root_ means you are not running the fork of Zola

2. Errors that include `main panicked [...] invalid time` means you are running Owen's fork of Zola, which is outdated

3. [Raven's fork][zola-url] is based on Zola 0.20 (rather than 0.17.2 as previously), with the following:
    - Upstream changes merged on top of Owen's changes (for both Zola and Tera - [Raven's Tera fork][tera-url])

    - Zola's tests and GitHub Actions workflows fixed

    - An issue in `chrono-english` fixed where it failed to appropriately handle `12:XXPM` times correctly
        - The author previously blindly added 12 to any afternoon times, resulting in a panic in `chrono` for any `12:XXPM` where `24` is passed to a function that expects (reasonably) a range of `0 - 23`

        - [Raven's chrono-english fork][chrono-english-url] is forked from [Nukesor's fork](https://github.com/Nukesor/chrono-english). The original author, until recently, did not update the repository to reflect the changes made in the `0.1.7` release on Cargo

## 3. Deploying the site

- Run `zola serve` from the project root - this rebuilds on changes, and serves to http://127.0.0.1:1111
    - Raven has experienced issues with this quite frequently, so, alternatively:
        1. Start a http server
            - For most POSIX-like shells:
                - `python3 -m http.server --directory public -b 127.0.0.1 1111 > web.log &`

            - For Powershell:
                - `Start-Process -NoNewWindow -FilePath "python" -ArgumentList "-m http.server 1111 --directory public --bind 127.0.0.1" -RedirectStandardOutput "web.log"`

        2. Run `zola build --base-url http://127.0.0.1:1111 --force` - needs to be re-run for any changes

        - *You may also find this alternative preferable when contributing so you can make larger changes without it redundantly building on every save*
    
    -  ## __**IMPORTANT**__
        - In [`config.toml`](config.toml), `ignored_content` contains `"**/archive/*"`

        - [`content/events/archive`](content/events/archive) & [`content/news/archive`](content/news/archive) combined contain 3000+ pages

        - To avoid weirdness (needs further investigation) with some changes not properly showing, `zola build` with `--force` is usually used - forcibly removing `public/`, and triggering a full rebuild

        - 3000+ pages can take a while to build (2-3m on `sites` on [`localtoast`](https://techteam.uwcs.co.uk/en/servers/Localtoast), 30-40s on W11 on Raven's desktop with an i7-12700k, and 5-10s on Raven's M1 MacBook Pro (Sequoia))

        - You can comment the line in [`config.toml`](config.toml) out to build the full website, but __**do not commit this**__

        - This should become much less of a problem with the introduction (soonTM) of Joel's events website [fulcrum](https://github.com/UWCS/fulcrum), which shifts `content/events` away from this repo


# Contributing

## Making changes

### 1. IMPORTANT: Git submodules

- `stardust-theme` is a separate git repository from the `stardust` repository

- `stardust` has `stardust-theme` registered as a submodule pointing to `themes/uwcs`
    - The `stardust-theme` repository can be managed via Git by changing directories to `themes/uwcs`
        - Any changes to `stardust-theme` need to be committed and pushed _within_ `themes/uwcs`

        - You must check out branches on _both_ repositories, checking out a branch on one does not also do so on the _other_ - they are not linked
            - `stardust-theme` is referenced by a _commit hash_ - when cloning recursively, `stardust-theme` is in a detached state pointing to _only_ the specific commit

            - Whilst you can (usually) make and commit changes in the detached state, you will run into problems at some point during the process
                - Start by checking out `stardust-theme` to a specific branch

                - If you start making changes before doing this, see the [Git docs on detached heads](https://git-scm.com/docs/git-checkout#_detached_head) for more details on detached heads and how to recover to a branch

        - Changes from `stardust-theme` will only reflect on `stardust` after `stardust` has been pointed to the new commit hash
            - To do this, change to the base path for `stardust`

            - Run `git add themes/uwcs`, commit, and push
        
            - **IMPORTANT FOR THOSE WITH WRITE ACCESS:** (As far as Raven has been able to briefly observe) In its normal setup, the live deployment *will not work* if there is a "branch conflict" - ie **do not point to a `stardust-theme` commit that is *not* on its `master` branch**

### 2. Crash-Course to Zola's terminology

- **Page:** Contains frontmatter, then the body, in [Markdown](https://commonmark.org/help/) with optional HTML template/in-lining. Usually has at least a date and time attached.

- **Frontmatter:** Used to define various properties about a page (usually minimum of title and date), defaults to using TOML in the following form at the start of the markdown file:
    - ```markdown
        +++
        title="A Really Imaginative Title"
        date="2025-09-01"
        +++
        ```

- **Body:** Where the actual content is written, nothing too special

- **Section:** A page with child pages - a directory with a `_index.md` file for the parent page

- **Co-located assets:** pages with [co-located assets](https://www.getzola.org/documentation/content/overview/#asset-colocation) are denoted by an `index.md`
    - For example, [`content/resources/git-good`](content/resources/git-good) contains co-located assets, with several images and a couple of PDFs (in the same folder, rather than [`static/`](static/))

- Taxonomy: An index of the pages, e.g. categories of news

- Macros: Powerful (slightly awkward) template-only content shorthands used by Tera

- Shortcodes: Slightly less powerful markdown-only shorthands - but they can call macros
    - Macros and shortcodes can be linked with some boilerplate
        1. Create the macro
        2. In the shortcode, import the macro file and call it
        - Example: [uwcs_dots shortcode](https://github.com/UWCS/stardust-theme/blob/master/templates/shortcodes/uwcs_dots.html)

- The basic project structure is explained in [Zola's docs](https://www.getzola.org/documentation/getting-started/directory-structure/)

### 3. Creating/editing content

- Least janky way to edit/create content is to clone the repo (see above) and use e.g. VSCode to edit
    - The [CMS](https://decapcms.org) Editor exists at https://uwcs.co.uk/admin - it's somewhat limited and janky as hell, but can allow some edits
        - Exec part of the current cycle's GitHub organisation have access to this, and when a change is saved, a commit is automatically made to this repository

- Primary interest if you're not trying to get into the weeds is [`content/`](content/)

- Each markdown file is a different page, with frontmatter and a body
    - The `Example Markdown Pages` section has detailed examples of how to layout a page, and the various properties that can be specified in the frontmatter

- The URL of a page is its filepath, excluding up to and including [`content/`](content/)
    - For example, [`content/news/archive/2324/2024-05-05-hewwo-my-fewwow-pwogwammers-uwu-newsletter-t3-w3.md`](content/news/archive/2324/2024-05-05-hewwo-my-fewwow-pwogwammers-uwu-newsletter-t3-w3.md) points to https://uwcs.co.uk/content/news/archive/2324/2024-05-05-hewwo-my-fewwow-pwogwammers-uwu-newsletter-t3-w3/

    - For `_index.md` and `index.md`, drop `_index`/`index` out of the URL
        - For example, https://uwcs.co.uk/news/ rather than `https://uwcs.co.uk/news/_index/`

- Each rendered folder & sub-folder in [`content/`](content/) has either an `_index.md` (most common) or `index.md` for co-located assets
    - For example, for [`content/news`](content/news), simply create the `.md` and write your Markdown, yippee, after a rebuild, your new page exists!

    - Prior to a new academic year, newsletters in [`content/news`](content/news) (*not* the `_index.md`) get archived
        - For example, 2023/2024's newsletters can be found under [`content/news/archive/2324`](content/news/archive/2324) with an archive-specific `_index.md`

        - For future years, the previous years' `_index.md` can be copied over, changing `title`, `description` and `weight` (e.g. `24` for 2024/2025) for the current year
    
    - With usage of co-located assets, for example the guides in [`content/resources`](content/resources), some contain a lot of assets in their own section
        - As a result, these guides do not currently appear on the main subpage list & search, and need to be _manually_ linked - see [`content/resources/_index.md`](content/resources/_index.md) for full details

- There is more information for specific sections in the `Section-specific information` section

### 4. Create a PR!

- Once you've made all your changes (and tested them!), make a PR to the main repo, and someone will review it in due time!

## What to do if something weird happens

### GitHub Actions failures
- Mainly relevant for those with write access (ie mostly exec & sysadmins)
  
- If it's failing for a locally unreproducable reason, get in contact with the named contacts directly, as this is *likely* something that requires access to `sites` on `localtoast` to properly diagnose

- There's usually little point in re-running the same build multiple times

- Whilst occasionally some quirks can be temporarily worked around by e.g. deleting and re-committing the changes in some form, it's preferable not to do this to avoid clogging up the commit history, and to let somebody try sort out a proper fix for the issue
  
### Everything else
- Weird, wonderful and whacky things happen sometimes ~~which make Raven tear their hair out for a few hours~~, and that's okay!

- First follow the `Who to contact for queries?` section. If it's something not easily resolved, feel free to create an issue on the repository and it'll be reviewed as soon as reasonably possible!

# Section-specific information

## Exec lists
- Contained in [`content/exec`](content/exec/) with a (for some reason) separate section in [`content/about/exec`](content/about/exec) which has e.g. the exec history spaghetti diagram maintained by the Publicity Officers via Figma

- Each role has its own Markdown in [`content/exec`](content/exec) with:
    - Names of current exec in the role
    - Role description/responsibilities
    - Contact email

- The lists are generated out of [`content/exec/_index.md`](content/exec/_index.md) and [`content/about/exec/_index.md`](content/about/exec/_index.md)
    - Rendering exec with multiple roles is janky - it's done by additionally adding them to [`content/exec/_index.md`](content/exec/_index.md) like:

        ```markdown
            multiple_roles = { "Person A" = ["Role A1", "Role A2"], "Person B" = ["Role B1", "Role B2"] }
        ```

- Exec images are stored under [`static/images/exec-pics`](static/images/exec-pics) as JPGs (aspect ratio 1:1), matching the names stored in the roles' markdown, in lower-case, and without spaces
    - Make sure to crop to 1:1 and compress these before committing so they're not unnecessarily large. For the 2025/2026 cycle, Raven aimed to keep them mostly at a maximum of 1MB.

- Provides an RSS feed for external automation

## Sponsors
- Contained in [`content/sponsors`](content/sponsors), with folders per tier, markdown per sponsor

- Uses a janky double-layer section - parent lists the subsections (tier) ordered, each containing their subpages (sponsors)
    - This also gives us a per tier page

- Sponsor images need to have a transparent effect so the white-out effect, and rendering well on both light & dark mode, work

## Events
- CMS is borky with the layout (good news, it's not needed soon!)
- Most event rendering is done via `stardust-theme` under `templates/events`, particularly `macros/events.html` - this handles the circles, and week & term formatting
    - The older archives currently go newest --> oldest (annoying) whilst circle years are old --> newest (sensible)


# Example Markdown Pages

## News

- Zola pages have their date as a field in their [frontmatter](https://www.getzola.org/documentation/content/page/) - or inferred from the filename in `yyyy-mm-dd-title.md` format

- News pages have a list of categories under `[taxonomies]`

- After the frontmatter, you can use normal Markdown for the main body

```markdown
+++
title="A News Article"
date="2024-01-01"

[taxonomies]
categories = ["Test", "Newsletter"]
+++

Any content above the more comment will be picked as the preview (otherwise it is the first 200 characters)
<!-- more -->

Some **more content**, in [markdown][markdown-url]
```

## Events

### General Info
- Organised in folders by term and week

- `icon` can be (preference order):
    - [Phosphor](https://phosphoricons.com/) icons (e.g. `ph-heart`)
    - [Bootstrap](https://icons.getbootstrap.com/) icons (e.g. `bi-discord`)
    - Local images like `stardust-theme`'s `static/assets/su-logo.svg`

- `colour` can be:
    - Hex codes (e.g. `#FF4000`)

    - "Normal" colours (e.g. `red`)

    - UWCS role colour, as defined in [`stardust-theme`'s colours JSON](https://github.com/UWCS/stardust-theme/blob/master/templates/macros/colours.json) (e.g. `gaming`)
        - Should be kept consistent with Figma

### Provided Shortcodes

Shortcodes can be used in Markdown bodies, invoked in the form `{% shortcode(...) %}`, and when a body is required:
```markdown
{% note(type="info") %}
Some longer note text
{% end %}
```

- `icon`: An icon from Phosphor, Bootstrap or local, `icon` param is formatted the same as for events
- `note`: Callout block with customizable icon and colour
- `youtube`: YT video and/or playlist link support
- `pdf`: PDF embed
- `uwcs_dots`: The dots logo, idk about sizing
- `blue`: The blue region with a oval top and bottom separator, like the frontpage

Detailed info on each shortcode can be found in [`templates/shortcodes`](templates/shortcodes) or `themes/uwcs/templates/shortcodes`.

### Example

```markdown
+++
title = "An important event"

# Start datetime - ISO-8601 or human-readable variant relative to the week's extra.base_date
date = "Thurs 7pm"

[taxonomies]
tags = ["Welcome Week", "Test"]

[extra]
# Optional, end datetime of event, can be taken relative to start date
# Can have e.g. "in 2 hours"
end_time = "9pm"

# Location will be room searched (like Apollo) if on campus. Specify location_url if it's off-campus or room search can't find it
location = "CS Dept"
location_url = "https://some.web/url"   # Optional, custom link to location

# Icon for the event, can be a Phosphor or Bootstrap icon or local image (hopefully a white svg)
# e.g. ph-code, bi-heart or assets/su-logo.svg (upload custom if necessary)
icon = "ph-code"
# Colour can be a UWCS colour or a normal CSS colour
colour = "gaming"

# Optional extra display properties for custom options for events list
# display_day could be Weekend or All Week, for example
# useful for better display of multi-day events
display_day = "Wed & Thurs"             # Optional, for day in events list view
display_date = "Wed 27 - Thurs 28 Sep"  # Optional, for date in detail view
display_time = "from 7pm"               # Optional, for time in both
+++

Some normal markdown here - content above the more comment will be picked as the preview (otherwise it is the first 200 characters)
<!-- more -->
```

# Misc

## Room Lookup
- Currently broken as per [Known Issues](#some-known-issues)

- Attempts to find locations via campus map for non-archived events

- Override with `extra.location_url`

- Set `room_links` to `false` in `config.yml` to disable entirely
    - Must be done when no internet access

- Alternate room names can be found in `stardust-theme` under `templates/macros/custom-room-mapnames.json`

## Shortcodes in CMS Editor
- Basic shortcodes are relatively easy to support
    - Want to avoid re-writing shortcode logic in JS

- Made messier by Decap needing boilerplate and being unable to nest shortcodes
    - See via `stardust-theme` in `templates/shortcodes/gen_component_top.html`

- The components are registered to Decap in [`admin/_index.md`](admin/_index.md), and a new entry needs to be added for each shortcode

- It uses the expanded shortcode as the preview, so it can't preview anything with even an `if` in

# The Not At All Comprehensive List Of Todos

Raven to look at ~~when they're a bit bored and don't have the attention span to continue digging big holes on the EarthSMP~~

- If reasonable, adding a more convenient centralised install & build script
    - e.g. detect presence of Rust and Cargo, prompt for install if not present, correctly detecting platform for and downloading the correct Zola release should `bin/zola` not exist, and build
        - Potentially could be helpful to abstract to a config e.g.
            - Allow custom directories for `zola` binaries, and build output
            - Allow specifying command(/script?) for deployment
            - Specify current `zola` version/hash etc to help provide more friendly error outputs to people
    
    - Can likely merge the `.sh` scripts together

- Linked to above, https
    - With example configs & docs roughly reflecting the `nginx` and `cloudflared` setup Raven used locally during the July 2025 power outage

- Review the most recent `0.1.8` release of `chrono-english` to see if the fork dependence can be removed.
    - Linked: see if fork dependence generally can be reduced when `fulcrum` arrives

- Possibly PR/issues guides/templates

- Consider sensible ways of abstracting some stuff out that would be more accessible elsewhere
    - Primarily stuff e.g. in `content/resources/` *may* benefit from e.g. being in their own repo and kinda "dropped in"

<!-- Repo info badges -->
[build-shield]: https://img.shields.io/github/actions/workflow/status/UWCS/stardust/deploy.yaml?branch=master&style=for-the-badge
[build-url]: https://github.com/UWCS/stardust/actions/workflows/deploy.yaml

[contributors-shield]: https://img.shields.io/github/contributors/UWCS/stardust.svg?style=for-the-badge
[contributors-url]: https://github.com/UWCS/stardust/graphs/contributors

[forks-shield]: https://img.shields.io/github/forks/UWCS/stardust.svg?style=for-the-badge
[forks-url]: https://github.com/UWCS/stardust/network/members

[stars-shield]: https://img.shields.io/github/stars/UWCS/stardust.svg?style=for-the-badge
[stars-url]: https://github.com/UWCS/stardust/stargazers

[issues-shield]: https://img.shields.io/github/issues/UWCS/stardust.svg?style=for-the-badge
[issues-url]: https://github.com/UWCS/stardust/issues

<!-- Built with badges -->

[rust-shield]: https://img.shields.io/badge/Rust-1.87.0-orange?style=for-the-badge&logo=rust&logoColor=fff
[rust-url]: https://www.rust-lang.org/

[markdown-shield]: https://img.shields.io/badge/Markdown-%23000000.svg?style=for-the-badge&logo=markdown&logoColor=fff
[markdown-url]: https://www.markdownguide.org/basic-syntax/

[html-shield]: https://img.shields.io/badge/HTML-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=fff
[html-url]: https://developer.mozilla.org/en-US/docs/Web/HTML

[js-shield]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=000
[js-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript

[css-shield]: https://img.shields.io/badge/CSS-639?style=for-the-badge&logo=css&logoColor=fff
[css-url]: https://developer.mozilla.org/en-US/docs/Web/CSS

[sass-shield]: https://img.shields.io/badge/Sass-C69?logo=sass&style=for-the-badge&logoColor=fff
[sass-url]: https://sass-lang.com/

[zola-shield]: https://img.shields.io/badge/Zola%20(fork)-0.20.0-blueviolet?style=for-the-badge&logo=zola&logo-color=fff
[zola-url]: https://github.com/raven0034/zola

[tera-shield]: https://img.shields.io/badge/Tera%20(fork)-1.20.0-orange?style=for-the-badge&logo=rust&logoColor=fff
[tera-url]: https://github.com/raven0034/tera

[chrono-english-shield]: https://img.shields.io/badge/chrono--english%20(fork)-0.1.7-blue?style=for-the-badge&logo=rust&logoColor=fff
[chrono-english-url]: https://github.com/raven0034/chrono-english.git

[bootstrap-shield]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=fff
[bootstrap-url]: https://getbootstrap.com

