Feature: view dog profile
  As a dogowner who uses the website
  I should be able to change the profile of my dogs
  In order to update new information about my dog
  
Background: dogs have been added to the database
  Given the following dogs exist:
    
  | name          | gender | age | energy | size            | personality     | mix                             |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                            |

Scenario: Owner can edit his or her dog
  When I am logged in as "Bruce Wayne"
  And I am on "The Joker"'s dog page
  And I edit the name to "Bane"
  Then I should be on "The Joker"'s dog page
  And I should see "Bane"
  And I should not see "The Joker"

Scenario: Non-owner should not be able to edit his or her dog
  When I am logged in as "Clark Kent"
  And I am on "The Joker"'s dog page
  Then I should not see "Edit Dog"
