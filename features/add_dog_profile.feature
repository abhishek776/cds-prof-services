Feature: add dog profile
 As a dogowner who uses the website
 I should be able to add dogs I own to my page
 In order to create pages for all my dogs for the world to see
  
Background: dogs have been added to the database
  Given I am logged in as "Bruce Wayne"

Scenario: View the dog page with all correct information
  When I go to the add dogs page
  And I create a dog with the following info:
  
  | name          | gender | age | energy | size            | personality     | mix     |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt    |   
  
  Then I should be on "The Joker"'s dog page
  And I should see "The Joker"
  And I should see "Male"
  And I should see "6"
  And I should see "Active"
  And I should see "medium (16-40)"
  And I should see "featcher"
  And I should see "Mutt"
  