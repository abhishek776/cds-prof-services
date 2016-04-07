Feature:
  As a user or professional services
  I want to view a map of the dogs in my area
  So that I can see where the dogs in my area are and how close they are to me

Background:
  Given I am logged in as a new user
  And the following dogs exist
  
  | name          | gender | age | energy | size            | personality     | mix                   |
  | Batman        | Male   | 3   | High   | large (41-100)  | still a puppy   | German Shepherd Dog   |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                  |
  | Harley Quinn  | Female | 4   | Some   | small (0-15)    | lover           | Poodle                |

Scenario: All dogs on map
  Given I am on the explore dogs page
  Then I should see a map with "three" pins

Scenario: Filtered by male
  Given I am on the explore dogs page
  And I filter by "male"
  Then I should see a map with "two" pins
