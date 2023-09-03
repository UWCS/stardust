# News

The list of all news for this academic year (obviously). Event file have their date prepended -- so they stay vaguely in order. If you have a set of news items (e.g. FNG) you can put them in their own folder, as with events (check the steps there). Haven't done this here yet as it seems less necessary.

Pages in Zola either have the date as a field in their [frontmatter](https://www.getzola.org/documentation/content/page/), or inferred from the start of the file name (in `yyyy-mm-dd-title.md` format). News pages also have a list of categories under the `[taxonomy]` header. The main body of the newsletter follows the frontmatter, where you can use normal Markdown features. 

News items can be given categories to index them by in the categories field.

```markdown
+++
title="A News Article"
date="2024-01-01"

[taxonomies]
categories = ["Test", "Newsletter"]
+++

Any content above the more comment will be picked as the preview (otherwise it is the first 200 characters)
<!-- more -->

Some **more content** for the news article, this can be [markdown](https://commonmark.org/help/) you know
```
