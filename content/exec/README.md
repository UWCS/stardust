# Exec

~~This page (slightly confusingly) renders to https://uwcs.co.uk/contact, the name is to make it a bit more intuitive for referencing elsewhere.~~

This directory includes a list of all exec roles with description, roles, etc. You can edit these here and you should pull from this info to create other exec info pages.

If there is a new, or changed role, ensure the name is reflected correctly here, along with modifying `stardust-theme` to include an `svg` icon for the role under `static/assets/exec-icons`. It's also helpful to add the colours for the roles in `stardust-theme` under `templates/macros/colours.json`.

Each follows the format:
```markdown
+++
title = "Exec Officer"
weight = <order>
date = "1970-01-01"

[extra]
people = ["First Last", "A Name"]
discords = ["@firstlast", "@discord"]
email = "rolename@uwcs.co.uk"
+++
<role description>
```

The `weight` field allows sorting the roles as expected (low numbers first).