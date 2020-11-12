
Given(/^I land on Home screen$/) do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites") #later this will be appium code instead of ruby code
  end

  When(/^I press Menu icon$/) do
    find_element(accessibility_id: "Open navigation drawer").click
  end


  Then(/^I should see left side Menu$/) do
    text("Unit Converter")
  end


  When(/^I press My conversions button$/) do
    text("My conversions").click
  end

  Then(/^I land on My conversions screen$/) do
    text("No personal conversion created yet")
  end