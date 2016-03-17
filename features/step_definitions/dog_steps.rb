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

When /^I edit the name to "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I create a dog with the following info:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end
