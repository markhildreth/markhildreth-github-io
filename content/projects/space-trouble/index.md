+++
title = "Space Trouble"
description = 'A "Space Team" inspired game, written using Rust and a Feather M0.'
weight = 0
+++

# Space Trouble

* [GitHub](https://github.com/markhildreth/space_trouble)

"Space Trouble is in development as a game to be played during a space-themed party (unfortunately
delayed until after the Coronovirus apocalypse).  It is my way of learning embedded development past
the quick examples seen on Arduino tutorial projects. The project itself takes inspiration from the
party game app [Space Team](https://spaceteam.ca/).

The idea of Space Trouble is that each of three players has in front of them a panel of buttons and
knobs, along with a screen instructing them what control needs twiddling to keep the ship sailing
smoothly. 

{% thumbnail(path="panel.png" alt="Picture of panel", width=600, position="center") %}
  Prototype panel. One thing I learned from the prototype is that the buttons I
  use on the left have built-in debouncing, but sometimes require more effort
  than expected to register a "push". The final panel will most likely have an
  LED next to the buttons to give feedback to the user that the button was
  pressed enough to register.
{% end %}

The catch is that although your panel's screen might be telling you to "Enable the Gelatinous
Darkbucket", the Gelatinous Darkbucket control may in fact be on someone else's panel. Therefore,
players must communicate with each other (which often takes the form of chaotic yelling).

## Current Status

Currently, I have developed a prototype panel which runs the game in its entirety, which is shown
below. The next step will be to create three such panels, each with a module to enable wireless
communication with the others.

The game flow goes as follows:

* The system is turned on. The user gets a "Press any button to start."
* The game begins. The user is given directions. If they perform an incorrect input, they lose two
  hull points. If the timer runs out before performing the input, they lose 4 hull points.
* The "distance" is constantly increasing, working as a score.
* When the hull finally hits zero, there is a game over screen showing the score for five seconds.
* Then the system goes back to "Press any button to start."

## Implementation

{% thumbnail(path="wiring.png" alt="Image of Inside of Box Wiring", width=200, position="right") %}
The wiring on the inside of the box.
{% end %}

The prototype panel has been implemented using a [Feather M0](https://www.adafruit.com/product/2772)
development board. The [software](https://github.com/markhildreth/space_trouble) itself is
implemented in Rust.

Some general ideas regarding programming this in Rust:

* Early on, there were some hickups getting the item to upload. This was because, despite the
  fact that the Feather M0 is a well-supported board, I had an earlier version that did not
  end up having the same boot loader as later versions. This led me down a rabbit hole to try to
  upload using boot loader instructions that would never have worked for my device. I ended up
  [updating the documentation](https://github.com/atsamd-rs/atsamd/commit/011ba2b71822553f08880def71147a407ccdca8e) for this.
* The Rust crates out there split between using hal-embedded and not, but the ones that do use
  `hal-embedded`i make it easier to put stuff together.
* Once I hit a point where I was able to constantly get things compiled/uploaded, I found that I was
  able to do massive refactorings until I compiled, plug it in, and things "just worked."
