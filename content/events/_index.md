+++
title = "Events"
+++

<p class="lead">Our events have moved! Please visit the <a href="https://events.uwcs.co.uk">UWCS Events Page</a> for full information</p>
<p>You can get up to date info on our <a href="https://discord.uwcs.co.uk">Disord Server</a></p>
<p>Or add <a href="https://events.uwcs.co.uk/uwcs.ics">this calendar</a> to your calendar app</p>
<p>For compatibilities sake, below is a preview of the new events page</p>

<iframe src="https:/events.uwcs.co.uk/stardust/" style="border: 0" width="100%" frameborder="0"></iframe>

<script>
    window.addEventListener("message", function(event) {
        if (event.data.type === "setHeight") {
            document.querySelector("iframe").style.height = event.data.height + "px";
        }
    });
</script>