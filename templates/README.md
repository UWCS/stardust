# Templates

Templates for pages to use, they are written for Tera, which is very similar to Jinja -- the most common templating engine. 
Templates for the actual pages are kept in the theme's `templates`, but you can include some here if wanted.

It is best to keep this dir just for shortcodes and any pages you might want an editor to change the source of regularly (should not be many ever).

## Shortcodes

Shortcodes are shorthand for longer HTML code, and can be used in Markdown bodies, invoked in the form `{% shortcode(...) %}`, and when a body is required:
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

More info on shortcodes in general can be found on [Zola's site](https://www.getzola.org/documentation/content/shortcodes/).