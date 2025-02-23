+++
title = "Events Calendar"
weight = 2
sort_by = "weight"
template = "events/events.html"
page_template = "event.html"

[extra]
hide = true
+++

A pretty view view of our events, looks similar to our social posts.

<!-- more -->

{% note(type="primary") %}
{{ icon(icon="ph-list") }}**[Events List](@/events/_index.md):** Standard week-by-week list of events  
{{ icon(icon="ph-archive") }}**[Events Archive](@/events/archive/_index.md):** Events from previous years  
{{ icon(icon="ph-clock") }} **[Past Events](@/events/archive/calendar.md):** Events from earlier this term
{% end %}