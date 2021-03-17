---
---
## Dice and Fate Points

{% include macros.html %}

<!--- TODO: better name.

- Deciding What Happens
- Narrative Control
- Game Mechanics
- Mechanics
- Taking Action
- Resolving Conflicts

-->

{GameName} uses dice to add an element of unpredictability to the story. Without
them, you might as well be writing a novel! That said, it's not all up to
chance. Players can spend fate points to re-roll the dice at dramatically
appropriate moments, or even invent new aspects about the world. But watch
out---the GM has fate points as well, which they can use to complicate the
PCs' lives at just the wrong moment.

### Skill Rolls <!-- TODO #58 Clean up skills: https://github.com/MiniFate/MiniFate/issues/58 -->

Dice are an important part of {GameName}, but that doesn't mean you need to roll
for every little thing. As a general rule, the GM should prompt players for a
roll in situations where a competent hero might reasonably fail _and_ failure
adds an interesting twist to the story. For example, a ~~Swashbuckling
Genius~~ probably doesn't need to roll to fend off an attack by a ~~Nameless
Deck-Hand~~... but she might roll `Fight` to subdue him before his friends
escape, or `Network` to recognize him as a ~~Student of the Blade Dancers~~.

Players can roll to:

- Create a scene aspect with a free invocation
- Destroy a scene aspect
- Inflict stress on another character (typically an NPC)
- Defend against someone inflicting stress on them
<!-- What about making people believe you? Is that stress? Is that an aspect?
-->

Sometimes the aspects describing a scene aren't the ones you want. Your
character can create new aspects or destroy existing ones with a role. To do
so, the player states their intention and the GM sets a difficulty from 0
(easy) to 6 (hard) and which skill needs to be rolled. The player rolls their
dice, sums the result, and adds their skill value (0 if they don't have the
skill). If this total meets or beats the GMs difficulty, they succeed. When
creating an aspect, the player gets one free invocation; they get an
additional invocation if they succeed with style by beating the target number
by 2 or more.

> Tor Byron and Naka were waiting in a warehouse up by the docks for a contact
> when they notice some thugs approaching. True to her aspect ~~Never Met A
> Problem My Magic Couldn't Ignite~~, Naka thinks things would go better if
> the warehouse were an inferno. The GM tells her it's full of dried tobacco
> and should ignite easily, so her target is 1 and the skill she needs is
> `Shoot`.
>
> Naka rolls {{dice--pmpp}} and adds her +2 `Shoot` for a total of 4, easily
> beating the target. The GM writes ~~Billowing Smokey Inferno~~ on a note
> card, draws two boxes on it to represent Naka's free invocations, and places
> it on the table. It's going to be a lot harder for the ambushers to find
> them now!

Rolling to inflict or defend against stress involves opposed rolls. The
attacking character rolls their dice and adds their skill to the total. So
does the defending character. If the attacker's total is higher, the
difference between to the two sums is the amount of stress inflicted.

> Naka's helmsmen has stepped out of line one too many times; the last straw
> was selling them out to a rival crew and trying to take over the ship in the
> confusion! He lunges at Naka with his sword as she tries to leap out of the
> way. He rolls his dice and gets {{dice-pznp}} which is 1. He adds his
> `Fight` score of +1 for a total of 2.
>
> Naka's `Agility` is +1 but she rolls {{dice-nznz}} to dodge giving her a
> total of -1. The difference between the attack and her defense is 3, so she
> takes 3 stress.
<!-- Shoot, do we have to talk about stress now!? -->

Roll outcomes:

<!-- TODO: Do these move up higher on the page? Is fail missing the target and
succeed at a cost... equaling? 

- Fail when < target
- Succeed at a Cost when = target
- Succeed when > target
- Succeed with Style > target + 1 

Seems very compressed around 0, 1, 2

-->


- Fail
- Succeed at a Cost
- Succeed
- Succeed with Style

### Stress and Consequences <!-- TODO #57 Rewrite Stress https://github.com/MiniFate/MiniFate/issues/57 -->

When a PC fails to defend themselves against an attack, they have three options:

- Mark a stress box of value N or greater, where N is the margin of the roll.
  Each PC has three stress boxes, valued 1, 2, and 3.
- Add a consequence of valued N or greater, where N is the margin of the roll.
  Each PC has three consequence slots, valued 2, 4, and 6.
- Be out of the fight. <!-- Should you have to write an aspect for this? -->

"Out of the fight" doesn't typically mean "dead"---many classic stories have
the hero or villain meet an apparent end only to show up at an opportune
moment. But it does mean the PC takes no more actions for the rest of the
scene.

### Fate Points

Fate Points are a currency that can be spent to assert narrative control over
the game. Both the players and the GM have pools of Fate Points available to
spend. Players start each session with a number of Fate Points equal to their
PC's Refresh; additional Fate Points are earned by accepting compels during
the session.

The GM start each scene with as many Fate Points as there are PCs active in
the scene. Additionally, there is an unlimited pool of Fate Points that the
players and GM return their Fate Points to when they spend them, and from
which the GM pays players Fate Points for compels.

### Invoking Aspects

The players and the GM may pay a Fate Point after rolling the dice to invoke
a relevant aspect. They explain how the aspect casts the action their
character is attempting to take in a new light, and may then either:

- Re-roll the dice
- Add a +2 bonus to the previous roll

> The _Angry Pig_ has been impounded for failure to pay import taxes and Tor
> Byorn is trying to convince the officials to let it go in exchange for a
> future payment. After rolling his `Persuasion` against their `Insight`,
> the margin is -1, failure.
>
> Tor Byorn's player holds up one of the poker chips the group uses for fate
> points and says "As you know, I have ~~Lost My Boat in a Game of Cards~~
> before, and I'm not keen to lose another one." The GM takes the fate point
> and Tor Byorn adds +2 to his roll, converting it into a success. The _Angry
> Pig_ is released, for now.

<!--- TODO #60: is two options dumb? https://github.com/MiniFate/MiniFate/issues/60 -->

### Compels <!-- TODO #59 Write compels: https://github.com/MiniFate/MiniFate/issues/59 -->

Sometimes the GM will come up with a fun twist that makes a PC's life
difficult. In this case they may offer the PC's player a compel: they GM will
give the player a fate point and the player will let the GM dictate what
happens next.

> A goblin barge got the drop on the _Angry Pig_ by sailing too close to an
> aether storm. Although the barge is roughed up from the storm, its cannons
> have lined up a perfect shot on the _Pig's_ unarmored stern. Naka orders the
> crew to prepare to fight as she tosses a desperate fireball at the barge.
> She rolls `Shoot` against the Goblins' `Agility` as they try to steer around
> the fireball. Naka rolls extremely well with {{dice-pppp}} for a +6, while
> the GM rolls poorly for the Goblins.
>
> The GM turns to Naka: "A one in a million shot! Your fireball takes out all
> the rigging, the wheel, and even starts a major fire. The barge should sink
> right through the clouds without causing you any more trouble... Or" he
> holds up a fate point, "Is the flaming wreck now on a collision course, sure
> to tangle with your rigging, and allowing dozens of goblins to spill out
> onto the _Angery Pig's_ deck as you fight the flames?"
>
> Naka's player thinks for a moment, takes the fate point, and calls out to
> the other players "Tor Byorn, I took out their steering! But it looks like
> they're heading right for us! Brace for impact!"

<!-- TODO: Edit more below -->

Players can also compel the GM! Anyone can pay a fate point to add an aspect
to the scene. The GM is allowed to refuse.

The fate point economy is a closed loop. When a player spends a fate point or
compels the GM, that point goes to the GM. Same thing the other way. One
exception: the GM can compel players even if they're out of fate points? In
that case they just grab an extra fate point

## Examples

<!-- TODO: Where does this go? -->

> The _Angry Pig_ is slowly navigating an aether storm when Tor Byron hears
> the sound of grappling hooks biting into soft wood. "Goblin raiders! They
> must have be stalking us through the storm!" he calls out.
>
> Too late to talk it out, Tor Byron's player declares that his PC hefts his
> magic axe and charges the goblins, aiming to drive them off his boat. The
> Goblins have the aspect **Cowerdly Except in Large Numbers**.
>
> The GM asks Tor Byron to roll

Tor Byorn doesn't roll to see if he can steer a boat straight, we know he is a
former captain, of course he can! Likewise when the _Angry Pig_ is boarded by
aether Goblins Tor Byorn will roll `Fight` to drive them away, but his
eventual success is not really in doubt, instead he rolls to see if he can
defeat them before they make off with his treasure.
