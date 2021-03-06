#!/usr/bin/env python3

from itertools import product

DIE_FACES = {
    "p": "{{pos}}",
    "n": "{{neg}}",
    "z": "{{zero}}",
}

for combo in product(DIE_FACES.keys(), repeat=4):
    key = f"dice-{''.join(combo)}"
    value = ""
    for char in combo:
        value += DIE_FACES[char]

    line = f'{{% capture {key} %}}<span class="dice-roll">{value}</span>{{% endcapture %}}'
    print(line)
