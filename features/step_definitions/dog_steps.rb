Given /the following dogs exist/ do |dogs_table|
  dogs_table.hashes.each do |dog|
    new_dog = Dog.new()
    new_dog.user_id = dog[:user_id]
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

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    new_user = User.new()
    new_user.uid = user[:uid]
    new_user.first_name = user[:first_name]
    new_user.last_name = user[:last_name]
    new_user.description = user[:description]
    new_user.save!
  end
end

And /^I have created an event for "([^"]*)" (today|3 days ago)$/ do |dog, time|
  new_event = Event.new()
  if time == "today"
    new_event.start_date = DateTime.current.to_date
    new_event.end_date = DateTime.current.to_date
  else
    new_event.start_date = 3.days.ago
    new_event.end_date = 3.days.ago
  end
  new_event.time_of_day = ["Morning"]
  new_event.my_location = "My House"
  new_event.description = "Princess needs a walk"
  new_event.dog = Dog.find_by_name(dog)
  new_event.save!
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
    Then I should see "Dog Name"
    When I fill in "Dog Name" with "Cat"
    And I fill in "Motto" with "Miay"
    And I fill in "Description" with "I am a cat"
    And I fill in "Health Notes" with "exelent"
    And I fill in "General Availability" with "anytime"
    When I press "Submit" 
    Then I should be on Clark's profile page
    When I follow "To All Dogs"
    Then I should see "Explore Dogs"
  }
end
  
  
Given /^I am logged in$/ do  
  visit "/auth/facebook?type=login"
end    

# When /I am logged in/ do
#   pending
# end

When /I am not logged in/ do
  pending
end

When /I filter (.*) "([^"]*)"/ do |filter, value|
  pending
end

When /I filter event/ do
  pending
end

And /^I click a star for dog with dog id "(.)"/ do |id|
    click_link("star_#{id}")
end

And /^I should not see a star$/ do
  all('div.stars').count.should == 0
  all('span.stars').count.should == 0
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

Given(/^I am logged in as a new user$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I like "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a map with "([^"]*)" pins$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I own the following dogs:$/) do |table|
  # table is a Cucumber::Core::Ast::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I edit "([^"]*)"'s profile$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be able to upload additional photos$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I have added additional photos to "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see an additional photos section$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

