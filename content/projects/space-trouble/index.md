+++
title = "Space Trouble"
description = 'A "Space Team" inspired game, written using Rust and a Feather M0.'
+++

# Space Trouble

"Space Trouble" is in development as a game to be played during a space-themed party (unfortunately
delayed until after the Coronovirus apocalypse). It is my way of learning embedded development past
the quick examples seen on Arduino tutorial projects. The project itself takes inspiration from the
party game app [Space Team](https://spaceteam.ca/).

The idea of Space Trouble is that each of three players has in front of them a panel of buttons and
knobs, along with a screen instructing them what control needs twiddling to keep the ship sailing
smoothly. 

{% thumbnail(path="panel.png" alt="Picture of panel", width=600) %}
  Prototype panel. One thing I learned from the prototype is that the buttons I
  use on the left have built-in debouncing, but sometimes require more effort
  than expected to push. The final panel will most likely have an LED next to the
  buttons to give feedback to the user that the button was pressed enough to
  register.
{% end %}

The catch is that although your panel's screen might be telling you to "Enable the Gelatinous
Darkbucket", the Gelatinous Darkbucket control may in fact be on someone else's panel. Therefore,
players must communicate with each other (which often takes the form of chaotic yelling).

## Current Status

Currently, I have developed a prototype panel which runs the game in its entirety, which is shown
below. The next step will be to create three such panels, each with a module to enable wireless
communication with the others.

## Implementation

The prototype panel has been implemented using a [Feather M0](https://www.adafruit.com/product/2772)
development board. The software itself is implemented in Rust, and the source code can be found in
[this GitHub repo](https://github.com/markhildreth/space_trouble).
