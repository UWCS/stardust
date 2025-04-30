# UWCS Stardust

The new, improved and, most importantly, simplified website for the 23/24 academic year. It's a static site generated with [Zola](https://www.getzola.org/), why not something more standard? I'd prefer not to deal with Ruby (or Go, when Rust is an option 🎆). Zola uses [Tera](tera.netlify.app/) as a template engine, which is very similar to Jinja or every other template engine. All the content is written in [Markdown](https://www.markdownguide.org/basic-syntax/), and we have the option to write content using any old editor and Git or with [Decap CMS](https://decapcms.org/) (formerly Netlify CMS) at https://new.uwcs.co.uk/admin/ . We have a GitHub Action setup to automatically rebuild the site on any pushes to `master`.

## Installation
### On Hopper / NixOS
1. Install Custom Zola: `nix profile install github:UWCS/stardust`
2. Follow steps for All Platforms

### Other Platform
1. Install my fork of Zola:
    - Run script `install-linux.sh`, `install-windows.ps1` or `install-mac-m1.sh` to download and install prebuilt releases of (my fork of) Zola
    - If this doesn't work, install Rust (see [rustup.rs](https://rustup.rs/)) then run/follow `install-source.sh` 
        - (script may change by OS, but clone then build should always work, even if release build may take a while)
    - If you get **errors about missing square root**, you are running standard Zola, **not this fork.**
2. Follow steps for All Platforms

### All Platforms
2. Clone this repo (with submodules) `git clone --recurse-submodules`
3. Run Zola with `zola serve` in project root
    - This rebuilds the website on changes, and serves it at http://127.0.0.1:1111 (view in browser)
    - This has occasionally caused problems, if it does replace it with:
        - `python3 -m http.server --directory public -b 127.0.0.1 1111 > web.log &`
        - then run `zola build --base-url http://127.0.0.1:1111` on any changes
4. Write some Markdown in `content/`!

Note, if you want to build the full site (including the archive), comment out `"**/archive/*"` in `ignored_content` in `config.toml`, but **DO NOT COMMIT THIS**. Adding 3k pages does up the build time a fair bit.

## Editor Usage

Best way is to run a copy locally and use an editor like VS Code to edit content and push changes to GitHub. This should be relatively straight forward, as you all are CS students. Content is written in [Markdown](https://commonmark.org/help/) (with a few bonuses), and you can mix in HTML inline if you need to. You'll mostly be concerning yourself with `content/news` and `content/events` for news and events respectively (unsurprisingly). The other directories are for the other static info pages and their resources. `_index.md` is the content for the directory's page, and all other markdown `.md` files turn into a corresponding HTML page when rendered.

If you want to include images in the post, you can create a folder for it in `content` - e.g. `content/resources/git-good` and write the content in `index.md`. **Note `index.md` denotes a page with some [colocated assets](https://www.getzola.org/documentation/content/overview/)** (images in the markdown dir, not separated into `/static`) **whereas `_index.md` denotes a section** with child pages -- the difference is often kinda subtle, but worth noting (sections don't come up in page lists for instance).

### CMS

Alternatively (e.g. if you are on mobile), try the only slightly janky CMS at https://uwcs.co.uk/admin/ . It should allow editing of the important bits of news and events, though deeper customisation is unavailable. You need to login to it with GitHub, and it will automatically make a commit for you when you save a change. Shortcode previews are in active developemtn, so may or may not work as expected, but they should render fine.

Note: Currently the CMS is broken for events because of the nested folders. Hopefully this is fixable at some point.

### Website Updates

When commits are pushed to GitHub, the website will automatically fully re-render itself. Since rendering the archive pages take a while, the changes will first be available on https://draft.uwcs.co.uk, which also shows pages marked as draft. This should take around 20s from commit. Shortly after, the full main website will be rendered.

In future, Decap (the CMS) should support a release system, so we'd only make releases (on GitHub) update the main site. If you want to work on something without it on live, use a branch or a local fork. 

### News

Pages in Zola either have the date as a field in their [frontmatter](https://www.getzola.org/documentation/content/page/), or inferred from the start of the file name (in `yyyy-mm-dd-title.md` format). News pages also have a list of categories under the `[taxonomy]` header. The main body of the newsletter follows the frontmatter, where you can use normal Markdown features. A template news page is as follows:

```markdown
+++
title="A News Article"
date="2024-01-01"

[taxonomies]
categories = ["Test", "Newsletter"]
+++

Any content above the more comment will be picked as the preview (otherwise it is the first 200 characters)
<!-- more -->

Some **more content** for the news article, this can be [markdown](https://commonmark.org/help/) you know
```

### Events

Events are organized into folders by term then by week. This means we can provide event dates in the form of `Monday 7pm` or any of a range of options. These are all taken relative to the `extra.base_date` of the week the event is in. The event end time/date is optional and will be parsed relative to the start date (so `in two hours` would work). If the event is multi-day, specify the day here too, and I recommend setting the `display_` properties for a better display of events. Location will be room searched (like with Apollo) to find a link. If no results are found or it's off campus, you can give a `location_url` too. 

The colour and icon of an event need to be given. `icon` can be a [Phosphor](https://phosphoricons.com/) icon (e.g. `ph-heart`), [Bootstrap](https://icons.getbootstrap.com/) icon (e.g. `bi-discord`), or a local image or svg (e.g. `assets/su-logo.svg`). In general, prefer Phosphor over Bootstrap and a custom image last. `colour` can be a CSS hex code (e.g. `#FF4000`), normal colour (`red`), or a UWCS set colour (`gaming` or `social`) (check `themes/uwcs/templates/macros/colours.json` for the full list). These are the same names as in Figma.

The display properties are useful when we have a multi day event that the standard event system can't really handle (it assumes single day events). If you have a multi-day event, you should specify `display_day` at a minimum so the events page knows what (custom) day to put it on -- can be things like `Wed & Thurs`, `Weekend`, `All Week`, etc. `display_date` can be used to set a custom date range string, so is probably less useful. `display_time` is the time as written on both the event circle and event detail page, it can be useful to say e.g. `from 7pm`. Unfortunately, for other events systems, we still need exact datetime set as well.

```markdown
+++
title = "An important event"
date = "Thurs 7pm"

[taxonomies]
tags = ["Welcome Week", "Test"]

[extra]
end = "9pm"    # Optional, end date of event, relative to start date

# Location will be room searched if on campus. Specify a URL if off campus or room search can't find
location = "CS Dept"
location_url = "https://some.web/url"   # Optional, custom link to location

# Icon for the event, can be a Phosphor or Bootstrap icon or local image (hopefully a white svg)
# e.g. ph-code, bi-heart or assets/su-logo.svg (upload custom if necessary)
icon = "ph-code"
# Colour can be a UWCS colour or a normal CSS colour
colour = "gaming"

# Optional display properties for custom options for events list
# display_day could be Weekend or All Week, for example
display_day = "Wed & Thurs"             # Optional, for day in events list view
display_date = "Wed 27 - Thurs 28 Sep"  # Optional, for date in detail view
display_time = "from 7pm"               # Optional, for time in both
+++

Some event content, can also be markdown
```

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

Detailed info on each shortcode can be found in `templates/shortcodes` or `themes/uwcs/templates/shortcodes`.

## Dev Usage

Most of the formatting is in the theme at [uwcs/new-site-theme](https://github.com/UWCS/new-site-theme/) and uses [Sass](https://sass-lang.com/) and [Bootstrap](https://getbootstrap.com/docs/5.3/getting-started/introduction/). The SASS is compiled separately, as it adds significant time to each `zola build` when it usually hasn't changed. Run `theme/uwcs/uwcs-bootstrap/build.sh` to re compile the css. This will call `sass` or `grass` if existing, otherwise will download `grass` for you (the Rust sass compiler that Zola uses).

The basic structure of the project is explained in [Zola's docs](https://www.getzola.org/documentation/getting-started/directory-structure/). Referenced static files can be colocated (in same dir as markdown) or in the static folder separately. Kinda nice, but a bit limited if you want a page's images in a folder, but avoid making the page into a section.

### Zola's Terminology

- Page: a page of content, written in markdown, with a html template attached. Usually has a title and date.
- Section: A page with child pages. Represented as a directory with a `_index.md` file representing the parent.
- Taxonomy: An index of the pages, e.g. categories of news
- Macros: Template only shorthands for content. Powerful, but kinda awkward and used by Tera
- Shortcodes: Markdown only shorthands, slightly less powerful, but can well just call macros. 
    - Macros and shortcodes can be linked with some boilerplate, but still the separation is annoying

## Explaining some of the quirks in no particular order

### Mixing Macros and Shortcodes
- Not possible by default, but doable with a bit of boilerplate.
1. Create the thing as a macro in the macros folder
2. In the shortcode, import the relevant macro file and call it
- See `shortcodes/uwcs_dots.html` for an example.

### Shortcodes in CMS Editor
- This is janky. 
- Very basic shortcodes are reasonably easy to support (100% trying to avoid remaking shortcode logic in JS)
- Decap requiring a lot of boilerplate and not being able to nest shortcode makes this messier too
    - See `shortcodes/gen_component_top.html`
- The components are registered to Decap in `admin/_index.md`, and a new entry needs to be added for each shortcode
- It uses the expanded shortcode as the preview, so it can't preview anything with even an `if` in 
- This is very jank, and we need to choose either to not support the CMS with shortcodes or to duplicate the shortcodes into JS.

### Exec lists
- All exec lists should generate out of the content in `content/exec/` - current examples are `exec/_index.md` and `about/exec/_index.md`
- Also provides an RSS feed if you wanna automate elsewhere

### News
- Relatively basic templates, archive is split per academic year for a little order
- Archive was messily converted off wagtail, so should be complete
    - Please do fix or let me know about errors in the formatting as MD conversion was new

### Resources
- Some of these guides have a lot of images, so are their own section for colocation, but this means they don't appear on the main subpage list
- So we are currently relying on the existing paragraph of waffle to link to places -- do make sure to keep this up
- Maybe fix sometime if I can make a suitable mixed template (cannot mix sections and pages (def not in pagination), but can list both at least)
- Note: also cannot have assets in a `./images` folder or something, Zola doesn't copy that -- might put in a PR to Zola for that at some point

### Sponsors
- Uses a slightly cursed double layer section - the parent lists each subsection in order and all subpages of the subsections
- Cannot use transparent here, as we want grouping by the subsection, not mixed
- This also gives us a per tier page -- neat!

- Sponsor images also need to have a transparent bg so the white out effect can work properly (and looks ok on light and dark mode)

### Room Lookup
- Nowhere is safe from room lookup
- Will attempt to search for locations on the uni map for non-archived events
- Provide an `extra.location_url` for an event to set a custom one
- Or disable entirely by setting `room_links` to `false` in `config.yml`
    - Must be done if build env doesn't have internet access
- Set alternate room names in `macros/custom-room-mapnames.json`

### Events
- Not nearly as cursed as it was, now we've organized them by week, although the CMS doesn't really like the layout any more. 
- Most of the actual event rendering is from macros in `macros/events.html` -- the circles and the week & term formats. 
    - It also includes the layout script, but that should probably be moved to its own file now it is actually being repeated.
- One minor quirk is how the terms and weeks are reversed for the archive page
