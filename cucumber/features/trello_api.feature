@trello
Feature: Example Feature
When I want to create a card on trello
As a user I need to move the card between columns
I want to run and adjust the tests bellow

  @simple_actions
  Scenario: Create a card and move between columns
    Given I create a card in the Backlog Column
    When I change the card name to "DB-Server"
      And I move it to "To Do" column
      And I move it to "In Progress" column
      And I move it to "Testing" column
      And I move it to "Done" column
    Then after all the proccess I delete the card