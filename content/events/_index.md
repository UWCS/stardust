+++
title = "Events"
weight = 3
+++


{% note(type="warning") %}
Please see our [Discord](https://discord.uwcs.uk) for the latest information!
{% end %}

{% note(type="info") %}
You can add [our calendar](https://events.uwcs.co.uk/uwcs.ics) to your calendar app.
{% end %}

{% note(type="primary", icon="ph-archive") %}
Our events have moved! Please visit the [new UWCS Events Page](https://events.uwcs.co.uk) for full information, including the archive of past events!
{% end %}

*For compatibility's sake, below is a preview of the new events page.*

<iframe src="https:/events.uwcs.co.uk/stardust/" style="border: 0" width="100%" frameborder="0"></iframe>

<script>
    window.addEventListener("message", function(event) {
        if (event.data.type === "setHeight") {
            document.querySelector("iframe").style.height = event.data.height + "px";
        }
    });
</script>