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
  Then I follow "edit_dog_button"
  Then I should see "Edit Dog"


Scenario: Owner can edit his or her dog
  Then I follow "edit_dog_button"
  And I fill in "Motto" with "Solo-Yolo"
  And I fill in "Availability" with "Never"
  And I fill in "Description" with "Solo-Yolo"
  And I fill in "Dog Name" with "Bane" 
  And I press "Submit"
  Then I should see "Bane"
  
Scenario: I should be able to cancel dog editing
  Then I follow "edit_dog_button"
  When I fill in "Dog Name" with "Moon"
  When I follow "Cancel"
  Then I should not see "Moon"
