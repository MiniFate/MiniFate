---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
author: Alexander Gude and Charles Fyfe
---

<header class="title-block">
  <p class="folio">Book I · The Basics</p>
  <h1>Aspect<span class="middot">·</span>RPG</h1>
  <p class="subtitle">a small game of consequential phrases</p>
  <hr class="dingbat">
</header>

{% comment %}
Dump the content of each chapter here in order to create one
giant page.
{% endcomment %}
{% for chapter in site.chapters %}
  {{ chapter.content }}
{% endfor %}
