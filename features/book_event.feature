@facebook_test
Feature: confirm event booking for your dog
  As a dogowner
  I should be able to view everyone who wants to book my dog's event 
  So that I can confirm a booking with someone I approve of.

Background: user has been added to the database and logged in
  Given I am exploring dogs
  And I have created an event for "Cat" today
  And I have created an event for "Batman" today
  And I am on the home page
  And "Bruce" has requested an event for "Cat"
  
Scenario: I can see contact info when I was confirmed
  When I am on "Batman"'s dog page
  When I click book for "Batman"
  And I should see "Unbook"
  When "Clark" was confirmed for "Batman"'s event 
  When I am on "Batman"'s dog page
  And I should see "You are confirmed for this event!"
  And I should see "(555)228-9999"

Scenario: I can reject candidates
  When I am on the "Cat"'s dog page
  And I should see "Reject"
  When I follow "Confirm"
  And I should see "You have confirmed this event."
  And I should see "(555)228-9999"
  And I should not see "Candidates"

Scenario: I could not book my dogs
  When I am on the "Cat"'s dog page
  And I should not see "Book Event"

  
