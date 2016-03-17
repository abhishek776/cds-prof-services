Feature: Users should be able to request to fulfill events by other users
  
  As a user that wants to take care of other people's dogs
  I should be able to request to fulfill an event of a dog that I do not own
  In order to take care of dogs I find on the website.
 
Background:
  Given I am logged in
  And the dog "Batman" has an event

Scenario: I can request the event
  When I go to "Batman"'s dog page
  And I follow the "Request Event" link
  And I follow "Log Out"
  And I log in as "Bruce Wayne"
  Then I should see that someone requested "Batman"'s event
