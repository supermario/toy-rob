Feature: Movement
  Scenario: Moving north
    Given a board of width 5 and height 5
    And a toy-rob at coords 0,0 facing north
    When toy-rob moves
    Then he should be at 0,1 facing north

  Scenario: Turning right
    Given a board of width 5 and height 5
    And a toy-rob at coords 0,0 facing north
    When toy-rob turns right
    Then he should be at 0,0 facing east

  Scenario: Turning left
    Given a board of width 5 and height 5
    And a toy-rob at coords 0,0 facing north
    When toy-rob turns left
    Then he should be at 0,0 facing west

  Scenario: Going for a walk
    Given a board of width 5 and height 5
    And a toy-rob at coords 1,2 facing east
    When toy-rob moves
    And toy-rob moves
    And toy-rob turns left
    And toy-rob moves
    Then he should be at 3,3 facing north

  Scenario: Doing a loop
    Given a board of width 5 and height 5
    And a toy-rob at coords 0,0 facing north
    When toy-rob moves
    And toy-rob turns right
    And toy-rob moves
    And toy-rob turns right
    And toy-rob moves
    And toy-rob turns right
    And toy-rob moves
    And toy-rob turns right
    Then he should be at 0,0 facing north

  Scenario: Invalid placement
    Given a board of width 5 and height 5
    And a toy-rob at coords 6,6 facing north
    Then toy-rob should not be on the board

  Scenario: Unplaced
    Given a board of width 5 and height 5
    And a toy-rob outside of the space-time continuum
    Then toy-rob should not be on the board

