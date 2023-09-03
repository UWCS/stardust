# UWCS New Site

The new, improved and, most importantly, simplified website for the 23/24 academic year. It's a static site generated with [Zola](https://www.getzola.org/), why not something more standard? I'd prefer not to deal with Ruby (or Go, when Rust is an option 🎆). Zola uses [Tera](tera.netlify.app/) as a template engine, which is very similar to Jinja or every other template engine. All the content is written in [Markdown](https://www.markdownguide.org/basic-syntax/), and we have the option to write content using any old editor and Git or with [Decap CMS](https://decapcms.org/) (formerly Netlify CMS) at https://new.uwcs.co.uk/admin/ . We have a GitHub Action setup to automatically rebuild the site on any pushes to `master`.

## Installation

1. Install Rust (see [rustup.rs](https://rustup.rs/))
2. Install [my fork](https://github.com/ericthelemur/zola) of Zola (see [install from source](https://www.getzola.org/documentation/getting-started/installation/#from-source))
  - If you get **errors about missing square root**, you are running standard Zola, **not this fork.**
3. Clone this repo (with submodules) `git clone --recurse-submodules`
4. Run Zola with `zola serve` in project root
    - Or `zola build` to build the static version (I've found this slightly more stable)
    - Use `python3 -m http.server --directory public 1111` and add `zola build --base-url http://127.0.0.1:1111` to preview the built version
5. Write some Markdown in `content/`!

When working on a local version, I recommend uncommenting `"**/archive/*"` in `ignored_content` in `config.toml`, but **DO NOT COMMIT THIS**. This stops the archive being rendered for quicker build times. The `# DRAFT` marks the start of draft only lines, so I can jank automate them in the build process.

## Editor Usage

Best way is to run a copy locally and use an editor like VS Code to edit content and push changes to GitHub. This should be relatively straight forward, as you all are CS students. Content is written in [Markdown](https://commonmark.org/help/) (with a few bonuses), and you can mix in HTML inline if you need to. You'll mostly be concerning yourself with `content/news` and `content/events` for news and events respectively (unsurprisingly). The other directories are for the other static info pages and their resources. `_index.md` is the content for the directory's page, and all other markdown `.md` files turn into a corresponding HTML page when rendered.

If you want to include images in the post, you can create a folder for it in `content` - e.g. `content/resources/git-good` and write the content in `index.md`. **Note `index.md` denotes a page with some [colocated assets](https://www.getzola.org/documentation/content/overview/)** (images in the markdown dir, not separated into `/static`) **whereas `_index.md` denotes a section** with subpages -- the difference is often kinda subtle, but worth noting.

### CMS

Alternatively (e.g. if you are on mobile), try the only slightly janky CMS at https://new.uwcs.co.uk/admin/ . It should allow editing of the important bits of news and events, though deeper customisation is unavailable. You need to login to it with GitHub, and it will automatically make a commit for you when you save a change. Shortcode previews are in active developemtn, so may or may not work as expected, but they should render fine.

### Website Updates

When commits are pushed to GitHub, the website will automatically fully re-render itself. Since rendering the archive pages take a while, the changes will first be available on https://draft.uwcs.co.uk, which also shows pages marked as draft. This should take around 20s from commit. Shortly after, the full main website will be rendered.

In future, the CMS should support a release system, so we'd only make releases (on GitHub) update the main site.

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

Events have a few more properties, to render correctly on the events page. Instead of categories, we use `tags`, so news and events are separated. A dedicated `time` field is provided, if you want specific text for it (e.g. if you are unsure of the start time). A `location` can be provided also, with an optional `location_url` as a link, or if not provided, it will search it on the campus map.

`icon` and `colour` are used for rendering the circles on the main events page: `icon` can be a [Phosphor](https://phosphoricons.com/) icon (e.g. `ph-heart`), [Bootstrap] icon (e.g. `bi-discord`), or a local image or svg (e.g. `assets/su-logo.svg`)

```markdown
+++
title = "An important event"

[taxonomies]
tags = ["Welcome Week", "Test"]

[extra]
time = "2:30pm"
end = "2024-01-01T13:00:00"
location = "CS0.01"

icon = "bi-discord"
colour = "#995A22"
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

- `note`: Callout block with customizable icon and colour
- `youtube`: YT video and/or playlist link support
- `pdf`: PDF embed
- `uwcs_dots`: The dots logo, idk about sizing
- `blue`: The blue region with a oval top and bottom separator, like the frontpage

Detailed info on each shortcode can be found in `templates/shortcodes` or `themes/uwcs/templates/shortcodes`.

## Dev Usage

Most of the formatting is in the theme at [uwcs/new-site-theme](https://github.com/UWCS/new-site-theme/) and uses [Sass](https://sass-lang.com/) and [Bootstrap](https://getbootstrap.com/docs/5.3/getting-started/introduction/).

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
2. In the shortcode, import the relevnant macro file and call it
- See `shortcodes/uwcs_dots.html` for an example.

### Admin Config
- The admin config is supposed to be yaml, but is quite nice to have templating inside it (for category picking especially)
- Zola only templates HTML files, so make the config render into a `.html` file, but point the CMS at it anyway
- There is a warning in the console about MIME types, but I can live with that

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
- A truly horrifying macro nest. It does a lot tho
- Grouping events by week and term is made awkward by seemingly not being able to build dictionaries in template
    - So can't build a map to render at the end
    - Instead we are iterating over the events, finding the day of each, when the day differs, it finds the next day/week/term
    - At this point it inserts the end week/term, generates the gap, then starts a new block
    - Only days are generated at once, since grid needs some more specific stuff - luckily enough this is simple(ish)
- It also gets term dates and week numbers/names from Tabula -- that's some of the mess, Tabula's data is weird