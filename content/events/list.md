+++
title = "Events List"
weight = 2
sort_by = "weight"
template = "events_list.html"
page_template = "event.html"
+++

A list view of our events, for ease of browsing.

<!-- more -->

{% note(type="primary") %}
{{ icon(icon="ph-calendar-blank") }}**[Weekly Calendar](@/events/_index.md):** Standard week-by-week list of events  
{{ icon(icon="ph-archive") }}**[Events Archive](@/events/archive/_index.md):** Events from previous years  
{{ icon(icon="ph-clock") }} **[Past Events](@/events/archive/current.md):** Events from earlier this year
{% end %}