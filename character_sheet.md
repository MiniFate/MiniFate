---
layout: default
title: Character Sheet
---

## Character Sheet

{% comment %}<!--
<button onclick='window.print();return false;' />Print</button>
-->{% endcomment %}

<div class="character-sheet">

{% comment %} Name {% endcomment %}
<div id="sheet-name" class="character-sheet-section" markdown="1">
<h3 id="character-name"><label class="aspect-label" for="name">Name</label></h3>
<input id="name" class="character-name" type="text" name="Character Name">

</div>

{% comment %} Backstory {% endcomment %}
<div id="sheet-backstory" class="character-sheet-section" markdown="1">
<h3 id="backstory"><label for="backstory-input">Backstory</label></h3>

<textarea id="backstory-input" rows="8"></textarea>

</div>

{% comment %} Aspects {% endcomment %}
<div id="sheet-aspects" class="character-sheet-section" markdown="1">
### Aspects

<label class="aspect-label" for="concept">Concept</label>
<input id="concept" class="aspect-box" type="text" name="Concept Aspect">

<label class="aspect-label" for="trouble">Trouble</label>
<input id="trouble" class="aspect-box" type="text" name="Concept Aspect">

</div>

{% comment %} Fate Points {% endcomment %}
<div id="sheet-fate-points" class="character-sheet-section" markdown="1">

<div class="fate-points-block">
  <span id="fate-points-text" class="fate-points-text">Fate Points</span>
  <br>
  <span id="fate-points-number" class="fate-points-number">2</span>
</div>

<div class="fate-points-block">
  <span id="refresh-text" class="fate-points-text">Refresh</span>
  <br>
  <span id="refresh-points-number" class="fate-points-number">2</span>
</div>

</div>

{% comment %} Stress {% endcomment %}
<div id="sheet-stress" class="character-sheet-section" markdown="1">
### Stress

<label class="stress-box-label" for="stress-box-1">Stress box 1</label>
<input id="stress-box-1" class="stress" type="checkbox">
<label class="stress-box-label" for="stress-box-2">Stress box 2</label>
<input id="stress-box-2" class="stress" type="checkbox">

</div>

{% comment %} Consequence {% endcomment %}
<div id="sheet-consequence" class="character-sheet-section" markdown="1">
### Consequence

<label class="aspect-label consequence-label" for="consequence-input">Consequence</label>
<input id="consequence-input" class="aspect-box" type="text" name="Concept Aspect">
</div>

</div>
