When(/^I complete and submit the form$/) do
  fill_in 'dog_name', :with => 'Matthew'
  fill_in 'dog_motto', :with => 'yoyo'
  click_on 'Submit'
end