@facebook_test

Feature: view dog profile
  As any user, prospective user, or service
  I should be able to view any dog's profile
  In order to learn more about dogs I am interested in.
  
Background: dogs have been added to the database
  Given I am exploring dogs
    
Scenario: I'm able to see dog information

  When I follow "Cat"
  Then I should see "Cat"
  Then I should see "Miay"
  Then I should see "I am a cat"
  Then I should see "anytime"
  Then I should see "exelent"

