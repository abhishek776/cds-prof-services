@facebook_test

Feature: view dog profile
  As any user, prospective user, or service
  I should be able to view any dog's profile
  In order to learn more about dogs I am interested in.
  
Background: dogs have been added to the database
  Given I am exploring dogs:
  When I follow "Cat"
  Then I should see "I am a cat"

    
Scenario: I'm able to access edit dog page
  Then I follow "Edit Dog"
  Then I should see "Edit information about Cat"


Scenario: Owner can edit his or her dog
  # When I am logged in as "Bruce Wayne"
  # And I am on "The Joker"'s dog page
  Then I follow "Edit Dog"
  #And I edit the name to "Bane"
  And I fill in "dog_name" with "Bane" 
  And I press "Submit"
  Then I should be on "Bane"'s dog page
  And I should see "Bane"
  And I should not see "Cat"
  
  
  
  

# Scenario: Non-owner should not be able to edit his or her dog
#   When I am logged in as "Clark Kent"
#   And I am on "The Joker"'s dog page
#   Then I should not see "Edit Dog"
