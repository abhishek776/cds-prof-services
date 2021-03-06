## Step Definitions for Facebook Login and Sign Up ##



# require 'uri'
# require 'cgi'
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

# Given /the following users exist/ do |users_table|
#   users_table.hashes.each do |user|
#     # each returned element will be a hash whose key is the table header.
#     # you should arrange to add that movie to the database here.
#     new_user = User.create!(user)
#     # new_user.uid = "12345"
#     # new_user.save
#   end
# end


# Given /^I am logged in$/ do  
#   visit "/login"
# end  

# Given /^my authentication fails$/ do
#   visit "/auth/failure"
# end

# Given /^(?:|I )am on (.+)$/ do |page_name|
#   visit path_to(page_name)
# end

# When /^(?:|I )follow "([^"]*)"$/ do |link|
#   click_link(link)
# end

# When /^(?:|I )press "([^"]*)"$/ do |button|
#   click_button(button)
# end

# When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
#   fill_in(field, :with => value)
# end

# Then /^(?:|I )should see "([^"]*)"$/ do |text|
#   if page.respond_to? :should
#     page.should have_content(text)
#   else
#     assert page.has_content?(text)
#   end
# end

# Then /^(?:|I )should not see "([^"]*)"$/ do |text|
#   if page.respond_to? :should
#     page.should_not have_content(text)
#   else
#     assert page.has_content?(text)
#   end
# end

# Then /^(?:|I )should be on (.+)$/ do |page_name|
#   current_path = URI.parse(current_url).path
#   if current_path.respond_to? :should
#     current_path.should == path_to(page_name)
#   else
#     assert_equal path_to(page_name), current_path
#   end
# end

# When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
#   select(value, :from => field, match: :first)
# end
