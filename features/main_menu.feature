@main_menu
Feature: As a user I want to convert units

  Scenario: When I tap on the menu icon, I should see left side menu
    Given I land on Home screen
    When I press Menu icon
    Then I should see left side Menu


  Scenario: I should be able to open My conversions screen
    Given I land on Home screen
    When I press Menu icon
    And I press My conversions button
    Then I land on My conversions screen


