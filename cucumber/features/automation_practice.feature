@order
Feature: Example Feature
When I want to place an order on http://automationpractice.com/index.php? website
As a user I need to always sign up
I want to run and adjust the tests bellow

  Background:
    Given I am on website "http://automationpractice.com/index.php?"
    When I go to the sign in page
      And I input an valid email and proceed to create an account
      And then I fill the form
    Then I sign up

  @cheque_indent
  Scenario: Place an order
    Given I am on the "Dresses" Category
      And I go to "Casual Dresses"
    When I select the first product in the list
      And I add it to cart on the "M" size
      And I proceed to checkout
      And I select the address
      And I select the shipping
      And I select the payment type
    Then I place the order