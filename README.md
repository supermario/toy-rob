
<img style="float: right; margin-left: 20px;" src="http://mario.net.au/images/toyrob.jpg" width="220">

[![Build Status](https://travis-ci.org/supermario/toy-rob.svg)](https://travis-ci.org/supermario/toy-rob)
[![Code Climate](https://codeclimate.com/github/supermario/toy-rob/badges/gpa.svg)](https://codeclimate.com/github/supermario/toy-rob)
[![Dependency Status](https://gemnasium.com/supermario/toy-rob.svg)](https://gemnasium.com/supermario/toy-rob)


Toy R.O.B
=========

R.O.B. (short for Robotic Operating Buddy) is an accessory for the Nintendo Entertainment System who made appearances in a few Mario games as a character.

Toy R.O.B. is a fun simulator version of R.O.B. which can be commanded to move around a board (an implementation of the 'Toy Robot' programming challenge).

<div style='clear:both;'></div>

## Usage

    $ bundle install

Input commands manually on command line:

    $ ./bin/simulator

Run commands from a file:

    $ ./bin/simulator < commands.txt


## Testing

Toy R.O.B. uses [RSpec](http://rspec.info/) and [Turnip](https://github.com/jnicklas/turnip) for unit/acceptance testing, [SimpleCov](https://github.com/colszowka/simplecov) for code test coverage, [Rubocop](https://github.com/bbatsov/rubocop) and [Code Climate](https://codeclimate.com/) for quality metrics.

Run tests and code coverage:

    $ rspec

Detailed coverage report (after running rspec):

    $ open coverage/index.html

Check for offences:

    $ rubocop

## Specification

The original specification for the 'Toy Robot' challenge.

### Description
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

*Create an application that can read in commands of the following form*
`PLACE X,Y,F`
`MOVE`
`LEFT`
`RIGHT`
`REPORT`

- `PLACE` will put the toy robot on the table in position `X,Y` and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.
- The origin (`0,0`) can be considered to be the `SOUTH WEST` most corner.
- The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command. The application should discard all commands in the sequence until a valid `PLACE` command has been executed
- `MOVE` will move the toy robot one unit forward in the direction it is currently facing.
- `LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- `REPORT` will announce the `X`,`Y` and `F` of the robot. This can be in any form, but standard output is sufficient.
- A robot that is not on the table can choose to ignore the <code>MOVE</code>, <code>LEFT</code>, <code>RIGHT</code> and <code>REPORT</code> commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.


### Constraints
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

`PLACE 0,0,NORTH`
`MOVE`
`REPORT`
Output: `0,1,NORTH`

`PLACE 0,0,NORTH`
`LEFT`
`REPORT`
Output: `0,0,WEST`

`PLACE 1,2,EAST`
`MOVE`
`MOVE`
`LEFT`
`MOVE`
`REPORT`
Output: `3,3,NORTH`
