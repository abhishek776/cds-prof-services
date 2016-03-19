Feature: star dogs that you like
  As a user or professional service
  I should be able to star a dog I like
  So that the dog appears on a shortlist of dogs I've starred
  
Background: dogs have been added to the database
  Given the following dogs exist:

  | name          | gender | age | energy | size            | personality     | mix                             |
  | Batman        | Male   | 3   | High   | large (41-100)  | still a puppy   | German Shepherd Dog             |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                            |
  | Harley Quinn  | Female | 4   | Some   | small (0-15)    | lover           | Poodle                          |
  
  And I am on the explore dogs page
  
Scenario: I must be logged in to star a dog from search results
  When I am not logged in
  Then I should not see a star 

Scenario: User can star dog from search results
  When I am logged in
  And I click a star for dog with dog id "3"
  And I follow "My Stars"
  Then I should see "Harley Quinn"

Scenario: User can star dog from dog profile
  When I am logged in
  And I follow "Batman"
  And I click a star for dog with dog id "1"
  And I follow "My Stars"
  Then I should see "Batman"


Scenario: User should be able to unstar a dog from search results
  When I am logged in
  And I click a star for dog with dog id "2"
  And I click a star for dog with dog id "2"
  And I click a star for dog with dog id "1"
  And I follow "My Stars"
  Then I should not see "The Joker"
  And I should see "Batman"

Scenario: User should be able to unstar a dog from dog profile
  When I am logged in
  And I am on the search dogs page
  And I follow "Batman"
  And I click a star for dog with dog id "1"
  Then I should see "1"
  And I click a star for dog with dog id "1"
  Then I should see "0"
  And I follow "My Favorites"
  Then I should not see "Batman"