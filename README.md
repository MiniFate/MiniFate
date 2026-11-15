# Mini Fate

A slimmed-down hybrid of Fate Core and Fate Accelerated, powered by skills and aspects.

## Project Status

We're rebooting after some time away!
Live iteration in `_chapters`.
Previous work has been demoted to `_loose-notes`.

## Bookkeeping

This repo is set up as a [Jekyll](https://jekyllrb.com/) site.
It can be hosted on [GitHub Pages](https://pages.github.com/) (though we haven't got that set up yet).

## Local checks

Install Make and Docker, and start Docker before running these commands from
the repository root:

```sh
make check
```

This builds the site and checks internal links, images, and alt text inside
Docker.

Browser tests also require uv and Python 3.12 or newer on the host. uv can
download a compatible Python version if one is unavailable. On Linux, install
Chromium's system libraries once (this command may request sudo access):

```sh
cd _scripts
uv run --locked --group browser playwright install-deps chromium
cd ..
```

Then run:

```sh
make check-browser
```

This builds the site in Docker, installs headless Chromium on the host, and
runs the browser tests for layout, anchor links, list markers, colors, and
printing. Run both check targets to match CI coverage.

## Links

- [Fate Core](https://www.evilhat.com/home/fate-core/)
- [Fate Accelerated](https://fate-srd.com/fate-accelerated/get-started)
