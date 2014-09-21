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

