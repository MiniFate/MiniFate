---
---

{% include macros.html %}

> NOTE: this outline is for dev work only. the final product will have an auto-generated TOC if any

# Introduction

Robin Hood is a beloved outlaw, skilled with both sword and bow.
He leads a band of Merry Men against the tyrannical Sheriff of Nottingham.
He's loyal to the absent King Richard in the face of the usurper Prince John.
And he's in love with Maid Marian.
With just those few sentences, we're ready to tell a story.
Everything else --- where he's from, what he carries, and the state of the world --- can wait until it becomes important.

{GameName} is a role-playing game that takes that same theatricality to heart.
Players get to decide what sort of story they're telling, and what details matter.
Everything else is allowed to slide.
The result is a punchy, quick-moving game with plenty of opportunities for memorable moments.

## Who You Need

To play {GameName}, you need one GM (game master) and at least two players.
Each player takes on the role of a PC (player character).
The GM is responsible for the world around the PCs, including its cast of NPCs (non-player characters).

The GM and PCs are not opponents, even though the PCs and NPCs will often be enemies.
Play is collaborative.
Everyone at the table has the same goal: telling a good story and having a good time.

## What You Need

{GameName} requires a few things to get started:
pens to write with,
paper to record your character on,
a set of four Fate dice,
and some tokens to represent Fate Points.

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
Poker chips are perfect for this, but in a pinch you can just mark them down with pencil.

## Acknowledgements

Bryan Fowler,
Andy Julin,
Andy Pokel,
Roxanne Radpour,
Allan Straub,
Evelyn Wu,
and
Jan Zirnstein.

TODO: Call out Evil Hat here too

# Getting Started

Before your first session, the group decides they want their game to be "steampunk Robin Hood".
As it turns out, that can mean a bunch of different things. <!-- lose this line? -->
To {A}, that means a swashbuckling adventure where bandits thumb their noses at the lecherous sheriff.
{B} is picturing something gritty; soldiers return from a holy war to find that England no longer feels like home. <!-- is dystopian steampunk allowed? or is steampunk supposed to be optimistic? -->
{C} doesn't much care about the setting, as long as she can play as a wizard.
And {D}, thinking back to the childhood movie, is looking forward to the talking animals.

<!-- passive voice or not? probably go through and make this consistent at the end -->
Before starting the game, everyone needs to be on the same page.
{GameName} provides a powerful tool for that: aspects.

<!--
Alliterative player and PC names?
Easy to keep track of so we can introduce them once, use player and PC names as convenient.

Rowan plays Robin Hood
Morgan plays Maid Marian
Lee/Jordan plays Little John
Frankie/Taylor plays Friar Tuck
Gabby is the GM
-->

## Core Concept: Aspects

At face value, an aspect is just a short phrase written down for the whole table to see.

- aspects are short improvised phrases. can be about anything: people, places, things, relationships, scenes, overall setting.
- aspects are true. otherwise, rewrite it or get rid of it.
- aspects keep everyone on the same page about what's important. the focus of the scene. like lighting or music or director's notes in a movie. depending on the framing, TODO FOOBAR can be tense or sad or sexy.
- aspects provide scaffolding for building out the story/world. introduce things that you can come back to later: people, places, relationships, technologies. `Hunted by the Sheriff of Nottingham`, `Disheartened Veteran of the Tenth Crusade` `something flying boat something`
- aspects provide bonuses on rolls. there's a chapter about that later. probably do NOT introduce fate points here.
- writing good aspects. you can lean on inside jokes and pop culture.

## World Building

In {GameName}, setting creation and character creation happen together.
It is good to have a rough idea of what type of game the players and GM want to play, but ultimately settings are defined by their characters and vice versa.
A ~~Pirate Captain Who Hates Violence~~ in a world where ~~Magic is Suddenly Real~~ is very different than one on the ~~Blood Drenched Sands of the Caribbean~~.

The game creation process should be collaborative, so it is often best to set aside the first game session in order to design the setting and the PCs together.
A good way to structure world building is to come up with a broad definition of the setting and then build the PCs.
This lets you use character creation to define the details of the world.

## Setting Creation

The setting is {GameName} is given aspects just like everything else important to the narrative.
Start with two aspects to describe the world: a genre and a conflict.
The genre aspect gives a sense of what, when, and where the story takes place.
The conflict aspect introduces the who and the why of the setting's biggest source of dramatic tension.

Write the aspects down somewhere everyone can see them, but don't worry about making them perfect as they're just a starting point.
As the story progresses the setting may change; when this happens feel free to add or modify setting aspects.

> Our players want to adventure as "Robin Hood in steampunk England", but that means something slightly different to each of them.
> They start by writing down two placeholder aspects while they brainstorm variations:
>
> {:.key-def}
> | Genre:    | ~~Steampunk outlaws of Sherwood Forest~~ |
> | Conflict: | ~~The sheriff is working with the usurper, King John~~ |
>
> {RobinPlayer} wants a bit of a dark, gritter setting.
> They propose modified aspects that hint at the sudden change society went through and the lingering political chaos:
>
> {:.key-def}
> | Genre:    | ~~England's steam revolution was sudden and violent~~ |
> | Conflict: | ~~King John used the chaos to usurp the throne~~ |
>
> {MarianPlayer} is fine with that, but wants to make sure the grit doesn't erase all the cool gadgets and airships!
> {TuckPlayer} is also OK with dark and gritty, but he envisions his character as a magic user.
> Together, the propose:
>
> {:.key-def}
> | Genre:    | ~~Steam power and magic have up-ended society, but the feudal system grinds on~~ |
> | Conflict: | ~~King John used the chaos to usurp the throne~~ |
>
> They propose working some magic into the 
> TODO: ~~Robbing from the rich and giving to the poor isn't as easy as it sounds~~
> ~~Rich vs poor doesn't matter when there is magic~~
> ~~Something something sheriff~~

Once you're happy with your setting, it's time to build the characters that will inhabit it

## Character Creation

Player characters (PCs) are mechanically simple but narratively diverse.
To start each PC has two aspects: their concept and their trouble.

Your PC's concept aspect answers the question "Who are you playing?"
It describes what makes the PC a unique, exciting character.
A character's concept alongside the setting aspects should give a good idea of who they are and how they'll play.
Some example concepts are:
~~Rightful King Hiding in the Wild~~,
~~Loner Hacker Who Knows The World Is Not What It Seems~~,
or ~~Backwater Farm Boy Looking to Join The Academy~~.

Your PC's trouble aspect describes the sort of things that get in the PC's way and gives them depth.
The trouble aspect is a good way for the player to indicate what sort of problems they would find interesting to deal with.

The trouble aspect should not necessarily be the thing that is most likely to cause the PC trouble, especially if it would be boring to deal with in game.
A hardboiled detective might drink excessively, but ~~Can't Resist a Drink~~ might not add much roleplaying potential, whereas ~~Soft Spot for Losers Like Me~~ offers the GM and other players a lot of story hooks.

Some example troubles are:
~~I Don't Know Which Side I'm On~~,
~~Everyone I Get Close To Ends Up In Trouble~~,
or ~~My Past Is A Dangerous Mystery, Even to Me~~.

Neither character aspect is entirely good or entirely bad.
The PC's concept could harm them from time-to-time while their trouble might actually help in certain circumstances.
Look for opportunities to interpret a PC's aspects in a way that gives the PC depth or makes the game more exciting.

> Now that the group has a setting, they turn to building their characters.
>
{RobinPlayer} is playing {RobinPC}, but one who is disillusioned after returning from the failed 10th crusade.
> He feels like an outsider in his own country after the steam revolution and downfall of Richard the Lionhearted.
> He wishes to return to a simpler time, at any cost.
>
> {RobinPlayer} chooses the following aspects to convey this:
>
> {:.key-def}
> | Concept: | ~~Loyal archer to a deposed king~~ |
> | Trouble: | ~~Steam powered changed everything expect me; I'll change it back~~ |
>
> {MarianPlayer}'s PC is {MarianPC}, a genius tinkerer partially responsible for ushering in the steam revolution.
> She loves building new gadgets and ignores who is funding her work or what they plan to use it for.
>
> {:.key-def}
> | Concept: | ~~The best tinkerer in Nottingham; maybe anywhere~~ |
> | Trouble: | ~~Machines I can trust when people betray me~~ |
>
> {TuckPlayer} is playing {TuckPC}. 
> Formerly a good, godfearing man, {TuckPC} has started to question his faith now that magic is seeping into the world.
> The magic has given the rotund friar great power to help those in need, but is also changing him in ways he does not understand.
>
> {:.key-def}
> | Concept: | ~~Friar turned hedge-wizard using his new power for good~~ |
> | Trouble: | ~~My order can never find out about my gift, but it's getting harder to hide~~ |

Characters in {GameName} also have some mechanical "crunch".
The Concept aspect is rated at +2 and the Trouble aspect is rated at +1.
Characters also have a refresh of two and three consequences.
We will talk about how these work later when we talk about performing actions.

## Non-Player Characters

NPCs are the characters in the story that fill out the world.
They're played by the GM and include everyone from background characters at a pirate bar, to marauding goblins bent on steal treasure, to the general of the empire's army who is more than he seems.

NPCs are more free-form than PCs.
They use all the same components---aspects, refresh, consequences---but just enough to fulfill their role in the story.
Background characters can often get by with only a name.
Characters intended to act as a minor obstacle, such as guards trying to keep the characters out of the king's ball, need just an aspect about their motivation.
Recurring characters can be given a few aspects with appropriate values.
If a character suddenly becomes more important, you can add aspects as needed to give them more narrative weight; in fact doing so is a great way to organically develop the story line and characters.

Sometimes the story calls for a very large number of NPCs, for example during a riot you might need hundreds or thousands of people.
The best way to handle these situations is to create a single NPC to represent the entire mob.
Build them just like a normal NPC with aspects; the only difference is how you narrate their actions.

{% comment %} TODO #55 Add example NPCS: https://github.com/MiniFate/MiniFate/issues/55 {% endcomment %}

# How to Play

## Setting the Scene

## Rolling the Dice

## Fate Points

Compel and invoke

# Conflicts

Pretty much the same as roleplaying, but:
- Different pacing due to lots of rolls
- Map, optionally, depending on the situation
- Worrying about stress and consequences

Note: "conflict" is pretty broad.
It can be anything where the party is up against opponents
It can be a negotiation.
It can be a race.
It can be anything where these mechanics feel right.

## Stress and Consequences

you get a fate point for taking a consequence?
recovery fits here too

## Drawing a Map

Probably the top priority section for diagrams!

# Appendix

## Mages, Mechs, and Mercs

How to do weird stuff.
Aspect-based narration.
Skills were actually the thing that made this weird.
With just aspects, you can roll for whatever makes sense

## Character Advancement

Add a new aspect after every story arc.
Bump the rest up.
Linear, not pyramid.
Unclear if this is a core rule or not

## Other Things?

[fate_core]: https://www.evilhat.com/home/fate-core/
[fae]: https://www.evilhat.com/home/fae/
