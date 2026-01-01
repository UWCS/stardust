# Exec

This directory includes a list of all exec "categories" (which allows e.g. for "Gaming" to be considered a role category that includes "Gaming Coordinator" and "Gaming Frep"). The descriptions of category/role responsibilities are in the respective markdown files.

If there's a new, or changed role category, ensure the name is reflected correctly here. Other data about role categories and their respective role (including who currently holds them) are contained within `data/roles.toml`, which is pulled into `roles_data` in `base.html`. You should also update `stardust-theme` to include an `svg` icon for the role under `static/assets/exec-icons` (find/create these from the Figma). Similarly, add any new/changed role colours in `stardust-theme` under `templates/macros/colours.json` (source from Figma).

To add/change names for exec:
- Modify `data/roles.toml` as outlined.
- Add an exec picture to `static/images/exec-pics` - this should be a 1:1 `jpg`, ideally below 1MB, with the filename as the lowercase of the name without spaces as defined in `data/roles.toml`. For example, `ravenlucia.jpg`

The markdown format within this folder (ignoring `history.md`), is now much simpler:
```markdown
+++
title = "Role Category Name (e.g. Gaming)
+++
<role description>
```