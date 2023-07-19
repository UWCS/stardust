+++
title = "Admin"
template = "admin/admin.html"

[extra]
hide = true

+++

{% gen_component_top(name="note", components=["type", "icon", "body"], types=["string", "string", "markdown"]) %}
if (data.type == "") data.type = "primary";
if (data.icon == "") {
    if (data.type == "success") data.icon = "check-circle-fill";
    else if (data.type == "warning") data.icon = "exclamation-triangle-fill";
    else if (data.type == "danger") data.icon = "x-octagon-fill";
    else if (data.type == "info") data.icon = "info-circle-fill";
}
{% end %}
{{ note(type="${data.type}", icon="${data.icon}", body="${data.body}") }}
{{ gen_component_end() }}

{{ gen_component_top(name="youtube", components=["id", "playlist", "class"], types=["string", "string", "string"]) }}
{{ youtube(id="${data.id}", playlist="${data.playlist}", class="${data.class}") }}
{{ gen_component_end() }}

{{ gen_component_top(name="pdf", components=["pdf", "width"], types=["string", "string"]) }}
{{ pdf(pdf="${data.pdf}", width="${data.width}") }}
{{ gen_component_end() }}