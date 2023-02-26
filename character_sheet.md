---
---

<div class="pagebreak"></div>

## Character Sheet

{% comment %}<!--
<button onclick='window.print();return false;' />Print</button>
-->{% endcomment %}

<div class="character-sheet">

{% comment %} Name {% endcomment %}
<div id="character-name" class="character-sheet-section" markdown="1">
<h3 id="character-name"><label class="aspect-label" for="name">Name</label></h3>
<input id="name" class="character-name" type="text" name="Character Name" placeholder="Character Name">

</div>

{% comment %} Backstory {% endcomment %}
<div id="character-backstory" class="character-sheet-section" markdown="1">
### Backstory

<textarea rows="8"></textarea>

</div>

{% comment %} Aspects {% endcomment %}
<div id="aspects" class="character-sheet-section" markdown="1">
### Aspects

<label class="aspect-label" for="concept">Concept</label>
<input id="concept" class="aspect-box" type="text" name="Concept Aspect" placeholder="Concept">

<label class="aspect-label" for="trouble">Trouble</label>
<input id="trouble" class="aspect-box" type="text" name="Concept Aspect" placeholder="Trouble">

</div>

{% comment %} Fate Points {% endcomment %}
<div id="fate-points" class="character-sheet-section" markdown="1">

<div id="fate-points-block" class="fate-points-block">
  <span id="fate-points-text" class="fate-points-text">Fate Points</span>
  <br>
  <span id="fate-points-number" class="fate-points-number">2</span>
</div>

<div id="fate-points-block" class="fate-points-block">
  <span id="refresh-text" class="fate-points-text">Refresh</span>
  <br>
  <span id="refresh-points-number" class="fate-points-number">2</span>
</div>

</div>

{% comment %} Stress {% endcomment %}
<div id="stress" class="character-sheet-section" markdown="1">
### Stress

<label class="stress-box-label" for="stress-box-1">Stress Boxes:</label>
<input id="stress-box-1" class="stress" type="checkbox">
<input id="stress-box-2" class="stress" type="checkbox">

</div>

{% comment %} Consequence {% endcomment %}
<div id="consequence" class="character-sheet-section" markdown="1">
### Consequence

<label class="aspect-label consequence-label" for="consequence">Consequence</label>
<input id="consequence" class="aspect-box" type="text" name="Concept Aspect" placeholder="consequence">
</div>

</div>
