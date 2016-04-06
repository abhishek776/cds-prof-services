@facebook_test
Feature: star dogs that you like
  As a user or professional service
  I should be able to star a dog I like
  So that the dog appears on a shortlist of dogs I've starred
  
Background: user has been added to the database and logged in
  And I am on the explore dogs page
  And I am logged in
  
Scenario: User can star/unstar dog from search results
  When I follow "My Profile"
  And I follow "All Dogs"
  And I follow "Batman"
  And I follow "Star"
  Then I should see "Unstar"
  When I follow "My Profile"
  Then I should see "Batman"
  When I follow "Unstar"
  Then I should not see "Batman"

Scenario: User can not star his own dogs 
  When I follow "My Profile"
  And I follow "Add Dog"
  When I fill in "Dog Name" with "Cat"
  And I fill in "Motto" with "Miay"
  And I fill in "Description" with "I am a cat"
  And I fill in "Health Notes" with "excelent"
  And I fill in "General Availability" with "anytime"
  When I press "Submit" 
  And I follow "All Dogs"
  And I follow "Cat"
  And I follow "Star"
  Then I should not see "Unstar"
  
Scenario: User can unstar dog from search results
  When I follow "My Profile"
  And I follow "All Dogs"
  And I follow "Batman"
  And I follow "Star"
  And I follow "Unstar"
  And I follow "My Profile"
  