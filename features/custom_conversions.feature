@custom_conversions
Feature: User able to create and manage custom conversions

  Scenario: User able to create new conversion
    Given I land on Home screen
    Then I press Menu icon
    Then I press My conversions button
    Then I press Create your first conversion button
    And I type "Power" as custom conversion name
    When I press New unit button
    Then I type "Horse power" as unit name
    Then I type "HP" as unit symbol
    Then I type "1" as unit value
    Then I press Submit checkmark on Custom conversions screen
    When I press New unit button
    Then I type "Mule power" as unit name
    Then I type "MP" as unit symbol
    Then I type "0.5" as unit value
    Then I press Submit checkmark on Custom conversions screen
    When I press OK button on Custom conversions screen
    Then I verify "Power" added to Custom conversions list
