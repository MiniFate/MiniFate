#!/usr/bin/env python3

from itertools import product

DIE_FACES = {
    "p": "{{pos}}",
    "n": "{{neg}}",
    "z": "{{zero}}",
}

output = []
for combo in product(DIE_FACES.keys(), repeat=4):
    key = f"dice-{''.join(combo)}"
    value = ""
    for char in combo:
        value += DIE_FACES[char]

    line = f"{{% capture {key} %}}{value}{{% endcapture %}}"
    print(line)
