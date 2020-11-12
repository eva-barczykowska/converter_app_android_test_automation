@home_screen
Feature: Tests for Home screen functionality

  Background: Given I land on Home screen

  @default_unit_pickers
  Scenario: Default values on Home screen are Foot and Centimeter
    Then Left Unit picker should be "Foot"
    And Right Unit picker should be "Centimeter"

    @show_all_button
    Scenario: Show All button should be enabled at launch
      Then Show All button should be disabled
      When I type "1" on application keyboard
      Then Show All button should be enabled

  @conversions
  Scenario Outline: Verify default conversion
    When I type "<target>" on application keyboard
    Then I should see result as "<result>"
    Examples:
      |target|result    |
      |1     |30.48     |
      |2     |60.96     |
      |3     |91.44     |
      |9     |274.32    |
      |1011  |30 815.28 |


    Scenario: User able to add current conversion to Favourites list
      Then I press Add to Favorites icon
      When I press Menu icon
      Then I press Favorite conversions
      Then I verify "Length" added to Favorite conversions list
@problematic
    Scenario: User able to search by exiting conversion type
      Then I press Search icon
      Then I type "Temperature" in Search field
      And I press Return button on soft keyboard
      Then I see "Temperature" as a current unit converter
      Then Left Unit picker should be "Celsius"
      And Right Unit picker should be "Fahrenheit"


  Scenario Outline: User able to select values from unit pickers
    Then I select "<unit_type>" from Left unit picker
    When I type "<amount>" on application keyboard
    Then I should see result as "<result>"
    Examples:
      | unit_type | amount | result |
      | Inch      | 1      |2.54    |
      | Foot      | 1      |30.48   |
      | Decimeter | 1      |10      |


    Scenario: User able to convert values
      When I press Menu icon
      Then I select "Volume" from Menu
      Then I select "Cup" from Right unit picker
      When I type "1" on application keyboard
      Then I should see result as "15.1416"


    Scenario: User able to switch values
      Then Left Unit picker should be "Foot"
      And Right Unit picker should be "Centimeter"
      When I press on switch units button
      Then Left Unit picker should be "Centimeter"
      And Right Unit picker should be "Foot"
    @wip
    Scenario: User able to clean up conversion history
      When I press Menu icon
      Then I select "History" from Menu
      Then I see "History" as a current unit converter
      Then I should see text "No history right now"
      When I press Menu icon
      Then I select "Length" from Menu
      When I type "1" on application keyboard
      When I press Menu icon
      Then I select "History" from Menu
      And I verify that 1st result in history list is "Length"
      When I press delete from history at 1st row
      Then I should see text "No history right now"




