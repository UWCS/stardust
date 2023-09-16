# Events

> When copying and creating a new week, the week number and **base date need setting.** No tweaks to the actual events are necessary as they are relative to the week. 

The list of all events this academic year (obviously). Events with dates in the past are only displayed on `events/archive/current, but both read from this directory.

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

## Generating weekly events

Sometimes you want a weekly event, without manually copying the file each time. `gen_seq.py <template.md> <term no> <start week> <end week>` will create copies of the event for each week in the range (inclusive) for the term. 