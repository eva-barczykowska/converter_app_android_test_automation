Then(/^Left Unit picker should be "([^"]*)"$/) do |value|
  actual_picker_text = find_elements(id: "select_unit_spinner")[0].text
  if actual_picker_text != value
    fail("Expected left unit picker value picker is #{value}, actual value picker is #{actual_picker_text}")
  end
end

#value is a local variable, it lives only between do and end

Then(/^Right Unit picker should be "([^"]*)"$/) do |value|
  array_of_elements = find_elements(id: "select_unit_spinner")
  actual_picker_text = array_of_elements[1].text
  if actual_picker_text != value
    fail("Expected right unit picker value is #{value} , actual value is #{actual_picker_text}")
  end
end



Then(/^Show All button should be (enabled|disabled|undefined)$/) do |state|
  button_state = find_element(id: "btn_show_all").enabled?
  if state == "enabled"
    fail("Expected to be enabled") if button_state != true
  elsif state == "disabled"
    fail("Expected to be disabled") if button_state != false
  end
end

#the above is an assertion

When(/^I press on Clear button$/) do
  puts ("Clear button is pressed")
end



When(/^I type "([^"]*)" on application keyboard$/) do |target|
  digits = target.split("")

  digits.each do |num|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
  end
end

Then(/^I should see result as "([^"]*)"$/) do |result|
  value = find_element(id: "target_value").text

  if value != result
    fail("expected value is #{result}, actual value is #{value}")
  end
end


Then(/^I press Add to Favorites icon$/) do
 find_element(id: "action_add_favorites").click
end


Then(/^I press Favorite conversions$/) do
  text("Favorite conversions").click
end


And(/^I verify "([^"]*)" added to Favorite conversions list$/) do |unit_type|
 item_text = find_element(id: "favorites_item_hint").text
   if unit_type != item_text
     fail("Cannot find #{unit_type} in Favorites list")
   end
end


Then(/^I press Search icon$/) do
find_element(id: "action_search").click
end


Then(/^I type "([^"]*)" in Search field$/) do |text|
  find_element(id: "search_src_text").send_keys(text)
end


And(/^I press Return button on soft keyboard$/) do
  Appium::TouchAction.new.tap(x:0.99, y:0.99, count: 1).perform
end

#nested search
#how to locate parent element and then child
#/how to locate an element inside  container
# find_element looks for an element ANYWHERE on the screen so if we have more than 1 element, it will find the first one
# and then stop
# also, if we need to be careful WHERE the element we are asserting is
# below we are using class name  plus text to locate the element in the right place, using hierarchy

Then(/^I see "([^"]*)" as a current unit converter$/) do |current_unit|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
end


Then(/^I select "([^"]*)" from Left unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[0].click
  find_in_list(value)
end

Then(/^I select "([^"]*)" from Menu$/) do |value|
  text(value).click
end

Then(/^I select "([^"]*)" from Right unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[1].click
  find_in_list(value)
end

When(/^I press on switch units button$/) do
  find_element(id: "img_switch").click
end


Then(/^I should see text "([^"]*)"$/) do |value|
  text(value)
end



And(/^I verify that (\d+)(?:st|nd|rd|th)? result in history list is "([^"]*)"$/) do |index, text|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  actual_text = array_of_elements[index.to_i - 1].find_element(id: "history_item_hint").text
  if actual_text != text
    fail("Expected text is #{text} actual text is #{actual_text}")
  end
end


When(/^I press delete from history at (\d+)st row$/) do |index|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  actual_text = array_of_elements[index.to_i - 1].find_element(id: "deleteIcon").click
end

#find_element and find_elements
# find_elements will always return an array

