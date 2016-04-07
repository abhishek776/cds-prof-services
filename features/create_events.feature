@facebook_test

Feature: Create event for your dog
  As a user who owns dogs
  I should be able to create events for my dog
  In order to request people to sit or walk my dog
  
Background: user has been added to the database and logged in
  Given I am exploring dogs:

Scenario: I should be able to create an event to sit my dog
  When I go to the create events page
  And I fill in "date_timepicker_start" with "1/3/2017"
  And I fill in "date_timepicker_end" with "1/4/2017"
  And I check "times_Morning"
  And I choose "my_location_My_House"
  And I fill in "description" with "junk"
  And I press "update_event_button"
  
