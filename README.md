# Artoo Adaptor For Mazesolver

This repository contains the Artoo (http://artoo.io/) adaptor for Mazesolver.

Artoo is a open source micro-framework for robotics using Ruby.

For more information about Artoo, check out the repo at https://github.com/hybridgroup/artoo

## About Mazesolver

Mazesolver provides an Artoo interface to a virtual robot.  It was developed as a coding exercise for the Austin RB group in support of the August 2013 meeting to teach how to use the framework, demonstrate how to generate new adaptors for Artoo, and extend the adaptor to support additional commands and events.

## Mazesolver Commands and Events

### Commands
The Artoo driver provides access to the following commands for the Mazesolver:
```
:up, :down, :left, :right, :current_pos
```

### Events
The Mazesolver queues messages for blocked moves and when the maze is solved. The driver publishes these messages for use in defined work processes:
```
on mazesolver, :solved => proc { puts "Win!" }
on mazesolver, :blocked => proc { puts "Try another direction." }
```

## The Coding Exercise 

Using the Artoo DSL, create a definition for a Mazesolver robot that

* Randomly performs a direction command until the maze is solved
* Announce the position of the Mazesolver as it proceeds through the maze
* Announce blocked and solved messages

The basic result of this exercise is an inefficient robot. The following suggestions for the Mazesolver can improve its performance

* Add historical position tracking and avoid repeat failed moves
* Add a look command to return available paths before performing a direction command

A final set of improvements for the exercise include

* Add dynamic maze generation
* Add visual representation of the solver in the maze
* Use the modular style of Artoo to add multiple solvers and race them!

### Known problems

Some users had a problem when running artoo like ```artoo start my_robot.rb``` and the environment not including the artoo-mazesolver in their gem path. If this happens for you, run the command with ```bundle exec```

## Acknowledgements

I want to thank Ron Evans for creating Artoo, Tim Tyrell for the opportunity to talk to Austin RB, the Austin RB group for doing the exercise and showing me all their great implementations, and Eric Wood for providing a visual progress interface for this project.