Given /the following dogs exist/ do |dogs_table|\
  dogs_table.hashes.each do |dog|
    new_dog = Dog.new()
    new_dog.name = dog[:name]
    new_dog.gender = dog[:gender]
    new_dog.size_id = Size.find_by_value(dog[:size]).id
    new_dog.dob = Time.now.advance(years:-dog[:age].to_i)
    new_dog.mixes << Mix.find_by_value(dog[:mix])
    new_dog.personalities << Personality.find_by_value(dog[:personality])
    new_dog.energy_level_id = EnergyLevel.find_by_value(dog[:energy]).id
    new_dog.save!
  end
end

Given /I am exploring dogs/ do
  steps %Q{
    Given I am on the home page
    When I follow "FACEBOOK LOGIN"
    Then I should be on Clark's home feed
    And I should see "Feed!"
    When I follow "My Profile"
    Then I should see "Dogs"
    And I should see "Add Dog"
    When I follow "Add Dog"
    Then I should see "Name"
    When I fill in "Name" with "Cat"
    And I fill in "Motto" with "Miay"
    And I fill in "Description" with "I am a cat"
    And I fill in "Health Notes" with "exelent"
    And I fill in "General Availability" with "anytime"
    When I press "update_dog_button" 
    Then I should be on Clark's profile page
    When I follow "To All Dogs"
    Then I should see "Explore Dogs"
  }
end
  
  
  

When /I am logged in/ do
  pending
end

When /I am not logged in/ do
  pending
end

When /I filter (.*) "([^"]*)"/ do |filter, value|
  pending
end

When /I filter event/ do
  pending
end

When /I click a star for dog with dog id "([^"]*)"/ do |dog_id|
  pending
end

Then /I should not see a star/ do 
  pending
end

When /I create a "(.*)" event for "(.*)"/ do |type, name|
  pending
end

Then /I should see a "(.*)" event on "(.*)"'s event list/ do |type, name|
  pending
end

Given /^the dog "(.*?)" has an event$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I follow the "(.*?)" link$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I log in as "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see that someone requested "(.*?)"'s event$/ do |arg1|
  pending
end

When /^I edit the name to "(.*?)"$/ do |arg1|
  steps %Q{ 
    I fill in "name" with arg1 
    I press "Submit"
  }
end

When /^I create a dog with the following info:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
