# Merch Site

This is a port of the old site, which was Flask/SSG from a yaml file, now ported to Zola to use the existing website structure. 

## File Organisation
Products are stored in category folders, and images for each product are in the sub-folder.

```
merch
├── _index.md
├── accessories
│   ├── _index.md
│   ├── cards.md
│   ├── stickers
│   │   ├── index.md
│   │   ├── img1.png
│   │   └── another.jpg
│   └── socks
│       ├── index.md
│       └── ... images
└── category2
    ├── _index.md
    ├── product3.md
    └── ...
...
```

### Categories
(e.g. `accessories` and `category2`) require an `_index.md` with (note `_` for categories, no `_` for products):
```toml
+++
title = "Category Name"     # Name of category on page
weight = 1                  # Order to sort by

[extra]
hide = false                # Whether to hide category on main page
+++
```

### Products
Products can be standalone files (`cards.md`) if you don't need images (rare). Otherwise, you'll want a folder with the product url (e.g. `stickers`), and a `index.md` and any images inside, images are displayed alphabetically by name. `index.md` should look like:

```toml
+++
title = "Sticker Pack"

[extra]
price = "3.23"      # Price to display (without £ symbol)
link = "https://www.warwicksu.com/..."   # Link to SU purchase page

+++

Product Description **(in markdown)** ....
```

### The Intro
`merch/_index.md` includes the waffle for the intro to the shop, open & close datetimes of the shop (note timezones GMT/BST), whether to hide the link in the navbar, and whether to preview shop contents. 

By default, the shop's contents will only be shown between the open and close dates, with a countdown to both dates. If `preview = true`, the items will be shown without purchase links before opening. Note this doesn't affect the behaviour once opened at all.