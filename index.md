---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

{% comment %}
Dump the content of each chapter here in order to create one
giant page.
{% endcomment %}
{% assign sorted_chapters = site.chapters | sort %}
{% for chapter in sorted_chapters %}
  {{ chapter }}
{% endfor %}
