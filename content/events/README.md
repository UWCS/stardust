# Events

The list of all events this academic year (obviously). Events with dates in the past are only displayed on `events/archive/current, but both read from this directory.

Event file have their date prepended -- so they stay vaguely in order. If you have a run of events (e.g. FNG) you can put them in their own folder, as long as you include an `_index.md` with `transparent = true` to have them included in the main events list.

Pages in Zola either have the date as a field in their [frontmatter](https://www.getzola.org/documentation/content/page/), or inferred from the start of the file name (in `yyyy-mm-dd-title.md` format). News pages also have a list of categories under the `[taxonomy]` header. The main body of the newsletter follows the frontmatter, where you can use normal Markdown features. A template news page is as follows:

Events have a few more properties, to render correctly on the events page. Instead of categories, we use `tags`, so news and events are separated. A dedicated `time` field is provided, if you want specific text for it (e.g. if you are unsure of the start time). A `location` can be provided also, with an optional `location_url` as a link, or if not provided, it will search it on the campus map.

`icon` and `colour` are used for rendering the circles on the main events page: `icon` can be a [Phosphor](https://phosphoricons.com/) icon (e.g. `ph-heart`), [Bootstrap](https://icons.getbootstrap.com/) icon (e.g. `bi-discord`), or a local image or svg (e.g. `icons/fng.svg`) -- these can be in `static/icons/` either in the main repo.

```markdown
+++
title = "An important event"

[taxonomies]
tags = ["Gaming", "Test"]

[extra]
time = "2:30pm"
# Only required when different from the event (start) date
end_date = "2023-01-01"
end_time = "12:30pm"
location = "CS0.01"

icon = "bi-discord"
colour = "#995A22"
+++

Some event content, can also be markdown
```

## Generating weekly events

Sometimes you want a weekly event, without manually copying and renaming the folder each time. `gen_seq.py <file> <n>` will create `n` copies of the event with the date and week number incremented, where the filename is formatted `202Y-MM-DD-<name>-t#w#.md`. At some point, we'll extend this so you can include the week number and such in the generated copyies.

### Example Weekly Event

1. Create directory `content/events/fng`
2. Add an `_index.md` reading:
```markdown
+++
title = "Friday Night Gaming"
transparent = true
+++
```
3. Create a `2023-09-29-fng-t1w0.md` with the content you require:
```markdown
+++
title = "Friday Night Gaming"

[taxonomies]
tags = ["Friday Night Gaming"]

[extra]
time = "7pm-late"
location = "CS Dept"

icon = "icons/fng.svg"
colour = "#3d53ff"
+++

The Friday night fun continues!

...
```
4. Navigate to `content/events`
5. Run `python3 gen_seq.py fng/2023-09-29-fng-t1w0.md 6`
    - This will generate `fng/2023-09-29-fng-t1w1.md`, `fng/2023-09-29-fng-t1w2.md`, ...
    - Until there is `n` copies -- including the original.