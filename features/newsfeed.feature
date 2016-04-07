Feature:
  As a user of the website
  I should be able to see information about dogs I follow and that are relevant to my profile on my newsfeed.
  So that I can consume content I am interested
 
Background: 
  Given I am logged in as a new user
  And the following dogs exist:
    
  | name          | gender | age | energy | size            | personality     | mix                   |
  | Batman        | Male   | 3   | High   | large (41-100)  | still a puppy   | German Shepherd Dog   |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                  |
  | Harley Quinn  | Female | 4   | Some   | small (0-15)    | lover           | Poodle                |

Scenario: As a new user, I should see prepoulated content
  When I go to the home page
  Then I should see "Batman" before "The Joker"
  And I should see "The Joker" before "Harley Quinn"

Scenario: 
 When I go to the newsfeed
 And I like "Harley Quinn"
 Then I should be on the home page
 Then I should see "Harley Quinn" before "Batman"
 And I should see "Batman" before "The Joker"
