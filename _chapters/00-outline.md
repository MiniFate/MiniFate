---
---

{% include macros.html %}

> NOTE: this outline is for dev work only. the final product will have an auto-generated TOC if any

## Introduction

{GameName} is a roleplaying game that emphasizes the importance of captivating characters, unique settings, and thrilling conflicts to great story telling.
It uses Aspects to allow the players to focus their attention only on the details that matter.
Everything else is allowed to slide.
The result is a punchy, quick-moving game with plenty of opportunities for memorable moments.

{% comment %} <!-- Do we need this? -->
The players and the GM work together to tell stories about the adventures of the PCs.
They may tell an action story, where the PCs hack away at bloodthirsty monsters in defense of civilization.
Or it could be a story of exploration, where the PCs venture into deep space in search of a new home.
It could even be a tale of political intrigue, where PCs build influence through secrets and scandals.
{% endcomment %}

### Who You Need

To play {GameName}, you need one GM (game master) and at least two players.
Each player takes on the role of a PC (player character).
The GM is responsible for the world around the PCs, including its cast of NPCs (non-player characters).

The GM and PCs are not opponents, even though the PCs and NPCs will often be enemies.
Play is collaborative.
Everyone at the table has the same goal: telling a good story and having a good time.

> Throughout the rules we will include examples in boxes like this one.
>
> Our example players are named Alex and Barry.

### What You Need

{GameName} requires a few things to get started:
pens to write with,
paper to [record your character on][character_sheet],
a set of four Fate dice,
and some tokens to represent Fate Points.

[character_sheet]: /character_sheet.html

Fate dice (sometimes called Fudge dice) are six-sided dice.
They are marked with {{pos}} on two sides, {{zero}} on two sides, and {{neg}} on two sides.
To keep things moving quickly, it's best to have a set of four dice for each player.
If you don't have specially marked Fate dice, you can use normal six-side dice as follows:

| D6 Roll  | Fate Roll |
|:--------:|:---------:|
| 1 or 2   | {{neg}}   |
| 3 or 4   | {{zero}}  |
| 5 or 6   | {{pos}}   |

You'll also need a way to keep track of fate points for each player.
Poker chips are perfect, but in a pinch you can just mark them down with pencil.

```
Do we need Fate dice? Not great to ask people to buy a weird thing, and not great that the modal outcome is zero.
```

### Acknowledgements

Thanks to
Bryan Fowler,
Andy Julin,
Andy Pokel,
Roxanne Radpour,
Allan Straub,
Evelyn Wu,
and
Jan Zirnstein.
We could not have made {GameName} without your help playtesting!

We would also like to thank [Evil Hat][evil_hat] for inspiring our rule system.

[evil_hat]: https://evilhat.com/

## Getting Started

Before jumping into your adventure, you need a setting and some characters.
In {GameName}, that means writing down a handful of aspects.
This chapter explains what aspects are and how to use them to lay the foundation for your story.

### Core Concept: Aspects

Aspect are short, improvised phrases written down for the whole table to see. 
They are central to {GameName} in two ways:
1. They keep everyone on the same page. If it's written down as an aspect, it's true and important. If an aspect is no longer true and important, update it or erase it.
2. They provide a scaffold for players to riff off one another in creative ways, earning bonuses in the process (more on this later).

Some aspects are concrete, like a description of a person or place.
Others are abstract, pointing out a relationship or instinct.
An aspect can even be meta, such as a callback or an inside joke.
Don't get hung up on making your aspects perfect.
Write what feels right.
You can always make tweaks later.

### Setting Creation

Your setting is defined by two aspects: a Genre and a Conflict.
The Genre aspect gives a sense of what, when, and where the story takes place.
The Conflict aspect is the source of dramatic tension.
Talk them through as a group and write these two aspects down where everyone can see them.
Don't worry about making them perfect.
You can come back and revise them later.

Keep in mind that aspects, including your Genre and Conflict, are best kept short and punchy.
This is not the time to go deep on history, politics, geography, or cosmology for your in-game world.
Think of these aspects like the blurb on the back of a book, or the first trailer for a movie.
The pieces don't all need to be there.
Just write down enough to get you excited about it!

> Alex wants to play a swashbuckling pirate.
> Barry wants to play a streetwise wizard.
> After a bit of haggling, they settle on something that works for them both:
>
> {:.key-def}
> |    Genre: | `Swagger and Sorcery on the Seven Seas` |
>
> The conflict is trickier.
> They're not exactly looking for a hack-and-slash treasure hunt.
> They want a bit of suspense and intrigue.
> Planning out the whole conspiracy on the first day would spoil the fun, so instead they plant an ominous clue to get them started:
>
> {:.key-def}
> | Conflict: | `The Pirate King has Vanished Without a Trace` |
>
> Who is the Pirate King? What authority does he hold? What happened to him? Alex, Barry, and the GM all start thinking about possible answers to those questions.

### Character Creation

Player characters (PCs) start at level 2.
That means:
- They have 2 aspects.
- They get a +2 bonus to any roll that's in line with those aspects.
- They have 2 stress boxes.
- The PC's player starts each session with 2 fate points.

As PCs level up, these numbers all scale.
Character advancement is discussed in the next chapter (as are rolls, fate points, and stress boxes).
Bookkeeping is all kept on the PC's [character sheet]({% link character_sheet.md %}).

Every PC starts with two aspects: a Concept and a Trouble. 
The Concept gives a high-level description of the character.
Along with the setting aspects, a PC's concept should give a decent sense of who the PCs is and how they fit into the story.

The Trouble fleshes out the PC by showing them from a less-flattering angle.
It could be a bad habit, a damaged relationship, or an old mistake that still hangs over them.
Your PC's Trouble is an invitation for the rest of the table to throw complications into the PC's path --- entangling them into the story in the process.

{% comment %}
I think we should probably err on the side of brevity. The examples below are probably sufficient. But here are a few others to keep in our pocket.

- `Cutthroat with a Conscience`
- `Pastry Chef by Day, Freebooter by Night`
- `The Queen's Favorite Pirate Hunter`

- `Soft Spot for Losers Like Me`
- `Everyone I Care About Gets Hurt`
- `Secretly Two Kids in a Trenchcoat`

{% endcomment %}

> Alex wants to play Torbyorn Yorgensen, a fearsome pirate captain --- or rather, a former captain who lost everything in a night of drunken gambling. 
> Now he's washed up on the ramshackle {BoatName}.
> He's good in a fight, a natural leader, but with a chip on his shoulder and plenty to prove.
> Alex writes the aspects:
>
> {:.key-def}
> | Concept: | `Speak Softly and Carry a Magic Axe` |
> | Trouble: | `Lost My Boat in a Game of Cards`    |
>
> Barry's PC is Naka of Three Bridges: a streetwise misanthrope with the power to breathe fire.
> A series of suspicious "retirements" have recently left her at the helm of the {BoatName}. 
> She now finds herself responsible for (and surrounded by) a crew of fearsome pirates.
>
> {:.key-def}
> | Concept: | `Last Daughter of the First Dragon` |
> | Trouble: | `Old Habits, New Responsibilities`  |
>
> As with the setting aspects, these PC aspects give everyone plenty to chew on.
> Who won Torbyorn's boat?
> Where are they now?
> And who pulled strings to put Naka in command? 

### Non-Player Characters

NPCs are the characters in the story that bring the world to life.
They are created and played by the GM.
NPCs include everyone from background characters at a pirate bar, to marauding goblins attacking a village, to the unsettling general of the empire's army.

NPCs have the same pieces as PCs, but the assembly is more free-form. This allows the GM to create NPCs on the fly that make sense with the narrative:
- Each NPC has at least one aspect. Important NPCs may have several.
- Each NPC has a level, which is used for rolls. For example, a level 3 NPC rolls with a +3 bonus on any action in line with its aspects.
- NPCs have stress boxes. The number of stress boxes need not be the same as the level. Trivial NPCs may have zero stress boxes.

NPCs do not have fate points.
Instead, the GM has fate points, and can use them on behalf of NPCs.
The GM starts with the same number of fate points as each player.
That is, if the PCs are level 3, the GM starts with three fate points.

Importantly, an NPC can represent multiple people!
An unruly mob can be represented as a single NPC with the aspect `Torches and Pitchforks`.
This helps keep bookkeeping manageable, even when scenes get busy.

{% comment %} TODO #55 Add example NPCS: https://github.com/MiniFate/MiniFate/issues/55 {% endcomment %}

## How to Play

The story in {GameName} plays out scene-by-scene.
The GM generally opens each scene with a quick description.
Play proceeds conversationally from there as the players and GM improvise back and forth.
Players speak as their PCs and describe their actions, while the GM narrates how the world responds.
Players may also ask the GM for further details to help them immerse themselves in the PCs' surroundings.

PC choices are made by the players, while the success of PC actions is judged by dice.
That is, the player decides which NPCs to attack and which to barter with.
The dice show whether a sword strikes home or a lie rings true.
This dichotomy ensures that each PC has strengths and weaknesses, while still allowing players the freedom to play their PCs in a way that feels true to them.

### Rolling the Dice

Dice in {GameName} add drama and excitement to the story.
The GM should call for a roll only when failure is possible for a skilled here _and_ failure would add an interesting twist.
A `Swashbuckling Genius` should succeed automatically in defending against the attack of a `Nameless Deckhand`.
She _would_ need to roll to subdue him before his friends can escape, or to recognize him as a `Student of the Blade Dancers`.

| Die Face  | Value |
|:---------:|:-----:|
| {{neg}}   | -1    |
| {{zero}}  | 0     |
| {{pos}}   | +1    |

To set the target number for a roll, the GM chooses a difficulty from 0 (easy) to 6 (hard).
They then roll four dice and add the result.

The player then rolls four dice.
If one of the PC's aspects is relevant to the roll, the player adds their level to the roll.

If the player's roll meets or exceeds the target difficulty, they succeed.
If they beat the difficulty by 3 or more they succeed with style.
Otherwise, they fail.

> TBY is level 3. He gets a +3 bonus when he rolls to hit something with his axe. Success. Inflicts stress on an NPC.
>
> Naka tries to cook a tasty dinner. None of her aspects apply. She rolls and does not add +3. Target difficulty is 2, but she rolls badly. GM creates the aspect `The Shits`


```
TODO: below here is accurate but rough
```

Success means the player gets to do one of the following:

```
- Does every success create an aspect?!
- If you have multiple free invokes on the same aspect, can you burn them all at once?
```

{% comment %}
This list is hard to read.
Maybe bold statements and then explanations?
Like:
**CREATE AN ASPECT**: Add a scene aspect with...

Or maybe images?
{% endcomment %}


- **Create, change, or remove a scene aspect**:
  Players can create a new scene aspect with one free invocation,
  change an existing scene aspect by rewriting it and gaining one free invocation,
  or remove an existing scene aspect along with any unused free invocations on it.
- **Mark one stress box on an opposing character**:
  Players can mark off one stress box on an opposing character's stress track.
  If all stress boxes on a character's stress track are marked, that character is removed from the current scene.


Success with style means the player may choose any two options, including choosing the same option twice.
Failure means the GM chooses one option to use against the character.

Taking a character out of a scene means they cannot act further until the scene ends. The specifics depend on the narrative.
For example:

 -  In a sword fight, the character may be wounded or killed.
 -  In a drinking contest, the character may pass out or get sick.
 -  In a card game, the character could go broke or be accused of cheating.

The details chosen should make sense for the story and progress the narrative.

### Fate Points

In {GameName}, fate points are exchanged to control the narrative.
Players spend fate points to dictate the story without rolling dice or asking the GM's permission.
Players are paid fate points to compensate them when they voluntarily give up their agency.

Fate points can be spent to:

- **Invoke an aspect**:
  Add +2 to a roll if there is a relevant aspect that would help.
  An aspect can only be invoked once per roll, but multiple aspects can be invoked on the same roll if the player has multiple fate points to spend.
- **Create an aspect**:
  Write down a new aspect about the world.
  This establish a new fact in the game because aspects are always true.
  The new aspect can be invoked by paying additional fate points.

Fate points are earned through accepting compels.
The GM compels a player by offering a fate point to forfeit a roll and instead lets the GM decide the result.
If the player accept, the GM pays out the fate point and narrates what happens.
Players can suggest a compel to the GM and are free to negotiate any compel offered.
A compel can always be refused by the player.

A player might invoke or create an aspect in a way that harms another player's character.
In this case, the GM should give the spent fate point to that player to compensate them.
Treat this like a compel: you need the harmed player to accept.
If they refuse, figure out a different course of action.

Players begin each session with fate points equal to their PC's level.
The GM starts with fate points equal to the highest level PC to spend on their own rolls.
The GM has an unlimited pool of fate points for compels.

```
TBY's trouble tells us that he plays cards.
Maybe he's bad, and a degenerate gambler?
Maybe he's great, but got cheated?
Tagging the aspect allows us to flesh out that part of the story.
```

## Conflicts

<!-- TODO: Reword -->
Most of the gameplay in {GameName} is conversational, with occasional dice rolls to determine the path the story takes.
But sometimes you will need to role a lot of dice; that is when you turn to conflicts.

A conflict is any situation where the PCs are up against opponents.
This can include battles with mythical creatures or other enemies,
negotiations to broker a peace treaty between warring factions,
or even a race against time to see if the PCs can get to the capital ahead of their rival's army.

Pretty much the same as roleplaying, but:
- Different pacing due to lots of rolls
- Map, optionally, depending on the situation
- Worrying about stress and consequences
- Play is clockwise around the table instead of unstructured

### Stress and Consequences

Each PC has one stress box per level.

If you run out of stress boxes, you can take a consequence to soak one extra hit.
This is a big deal!
The consequence goes in your next level aspect.
It clears at the end of the story arc.
When you write your new aspect, it should be a callback to the consequence.

> Naka takes a consequence: `Blood in the Water`. New aspect next level is `Delicious to Sharks`
>
> TBY takes a consequence: `Run Clean Through`. He's pretty tough. The guy behind him wasn't. New aspect is `Sworn to Avenge the Cook`


### Drawing a Map

<!-- TODO: Diagrams -->

In a fight, you need to know who's within arm's reach, who's within a few paces, and who's within sight.
{GameName} handles that with zones.
Draw each zone on a map with as much or as little detail as needed.

Characters in the same zone can interact with each other and any object in the zone.
However, they need permission from one of their aspects to interact with things outside the zone.
A character may move to an adjacent zone on their turn in addition to their action.

Zones can also have aspects, which may restrict free movement or visibility between zones.
Consider what makes sense from a narrative perspective when deciding whether a character can move or act over a zone boundary.

> The {BoatName} is circling a mountain outpost exchanging cannon fire after a failed attempt to bypass the Empire's northern border.
> There are three zones on the board: The {BoatName}, the sky, and the outpost.
> The sky has the aspect `A Very Long Way Down`.
> <figure class="map">
>   <img
      src="images/boat_and_tower_map.svg"
      alt="A map showing a roughly boat shapped object on the left labeled '{BoatName}'. On the boat is drawn a cirlce labeled 'Tor Byorn'. On the right side is a rounded square labeled 'Outpost'. Between the boat and the outpost are the text 'Sky' and the aspect 'A very long way down' written under it in a smaller font."
    />
>   <figcaption>The map sketched by the GM, showing the three zones, the aspect for the Sky, and Tor Byorn's position.</figcaption>
> </figure>
>
> Tor Byorn is stuck on the {BoatName}, unable to bring his axe to bear on the canons poking holes in his ship since the sky's aspect indicates that he can't cross the zone.
> Tor Byorn's player decides the Dwarf has had enough enough.
> He roles to create the aspect `Flying Leap` which would give him the ability to cross the intervening zones.
> If the Dwarf's rolls succeeds, his aspect will allow him to jump the gap between the ship and outpost, if he rolls poorly...
> Well, it is `A Very Long Way Down`.

### Character Advancement

At the end of each story arc, each PC gains a level.
That means they also write a new aspect, add a stress box, and gain an additional fate point per session.
If the PC has a consequence, it clears at this time.

The new aspect should aim to show the PC from a new angle, to demonstrate how they have grown.
If the PC had a consequence, the new aspect should be a callback to it.
Otherwise, the new aspect can refer to a notable exploit.
It can also be about the PC's relationship, positive or negative, with another character.
It's generally best to write the new aspect right away, while the just-completed story arc is fresh.
You can always tweak it later.


[fate_core]: https://www.evilhat.com/home/fate-core/
[fae]: https://www.evilhat.com/home/fae/
