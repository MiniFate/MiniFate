---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
---

{% comment %}
Dump the content of each chapter here in order to create one
giant page.
{% endcomment %}
{% for chapter in site.chapters %}
  {{ chapter }}
{% endfor %}
