Feature: Command Line
  Scenario: Moving north
    Given a board of width 5 and height 5
    And we're using the CLI
    When we send the command "PLACE 0,0,NORTH"
    And we send the command "MOVE"
    And we send the command "REPORT"
    Then we should see "0,1,NORTH"

  Scenario: Turning right
    Given a board of width 5 and height 5
    And we're using the CLI
    When we send the command "PLACE 0,0,NORTH"
    And we send the command "RIGHT"
    And we send the command "REPORT"
    Then we should see "0,0,EAST"

  Scenario: Turning left
    Given a board of width 5 and height 5
    And we're using the CLI
    When we send the command "PLACE 0,0,NORTH"
    And we send the command "LEFT"
    And we send the command "REPORT"
    Then we should see "0,0,WEST"

  Scenario: Going for a walk
    Given a board of width 5 and height 5
    And we're using the CLI
    When we send the command "PLACE 1,2,EAST"
    And we send the command "MOVE"
    And we send the command "MOVE"
    And we send the command "LEFT"
    And we send the command "MOVE"
    And we send the command "REPORT"
    Then we should see "3,3,NORTH"

  Scenario: Doing a loop
    Given a board of width 5 and height 5
    And we're using the CLI
    When we send the command "PLACE 0,0,NORTH"
    And we send the command "MOVE"
    And we send the command "RIGHT"
    And we send the command "MOVE"
    And we send the command "RIGHT"
    And we send the command "MOVE"
    And we send the command "RIGHT"
    And we send the command "MOVE"
    And we send the command "RIGHT"
    And we send the command "REPORT"
    Then we should see "0,0,NORTH"

  Scenario: Invalid placement
    Given a board of width 5 and height 5
    And we're using the CLI
    When we send the command "PLACE 6,6,NORTH"
    And we send the command "REPORT"
    Then we should see "unplaced"

  Scenario: Unplaced
    Given a board of width 5 and height 5
    And we're using the CLI
    When we send the command "REPORT"
    Then we should see "unplaced"

  Scenario: Movements before placement
    Given a board of width 5 and height 5
    And we're using the CLI
    When we send the command "MOVE"
    And we send the command "RIGHT"
    And we send the command "LEFT"
    And we send the command "REPORT"
    Then we should see "unplaced"
