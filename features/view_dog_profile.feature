Feature: view dog profile
  As any user, prospective user, or service
  I should be able to view any dog's profile
  In order to learn more about dogs I am interested in.
  
Background: dogs have been added to the database
  Given the following dogs exist:
    
  | name          | gender | age | energy | size            | personality     | mix                             |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                            |

Scenario: View the dog page with all correct information
  When I am on "The Joker"'s dog page
  Then I should see "The Joker"
  Then I should see "Male"
  Then I should see "6"
  Then I should see "Active"
  Then I should see "medium (16-40)"
  Then I should see "featcher"
  Then I should see "Mutt"
  