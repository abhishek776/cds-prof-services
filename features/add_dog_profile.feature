@facebook_test

Feature: Facebook OAuth is used for signing into accounts
  As a new City Dog Share user
  So that I can use City Dog Share
  I want to use my facebook account for authentication
  
  Background:
    Given I am on the home page
    And I am logged in
	
  Scenario: As a logged in user I should be abble to add dog
    When I follow "My Profile"
    Then I should see "Dogs"
    And I should see "Add Dog"
    When I follow "Add Dog"
    Then I should see "Name"
    When I fill in "Dog Name" with "Cat"
    And I fill in "Motto" with "Miay"
    And I fill in "Description" with "I am a cat"
    And I fill in "Health Notes" with "excelent"
    And I fill in "General Availability" with "anytime"
    When I press "Submit" 
    Then I should be on Clark's profile page
    When I follow "To All Dogs"
    Then I should see "Cat"
    When I follow "Cat"
    Then I should see "I am a cat"
    And I should see "Miay"
    And I should see "excelent"
    And I should see "anytime"
    
    When I follow "My Profile"
    And I follow "To All Dogs"
    And I follow "Cat"
    Then I should see "Delete Dog"
    When I follow "Delete Dog"
    Then I should be on Clark's profile page
    When I follow "To All Dogs"
    Then I should not see "Cat"
    
Scenario: I should be able to cancel dog creation
    When I go to the create dogs page
    When I fill in "Dog Name" with "Moon"
    When I press "Cancel"
    Then I should not see "Moon"
