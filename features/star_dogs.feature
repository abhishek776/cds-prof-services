@facebook_test
Feature: star dogs that you like
  As a user or professional service
  I should be able to star a dog I like
  So that the dog appears on a shortlist of dogs I've starred
  
Background: user has been added to the database and logged in
  Given the following users exist:
    | last_name  | first_name | gender | image                      | phone_number  | description  | address       | zipcode | city     | country | uid |
    | Kent       | Clark      | male   | http://tinyurl.com/opnc38n | (555)228-6261 | I love bats  | 387 Soda Hall | 94720   | Berkeley | US      | 5  |
    | Pinzon     | Juan       | male   | http://tinyurl.com/okrw3vd | (555)123-1234 |   love dogs  | 387 Cory Hall | 94720   | Berkeley | US      | 6  |
  
  And the following dogs exist:
    | name     | mix              | age | size            | gender | likes      | energy  | personality | user_id |
    | Princess | Labrador         | 1   | small (0-15)    | Female | cats       | High    | whatever    | 5  |
    | Rat      | Aidi             | 3   | medium (16-40)  | Male   | dogs (all) | Some    | lover       | 6       |
    
  
  And I am on the explore dogs page
  And I am logged in
  

Scenario: User can star dog from search results
  # When I am logged in
  When I follow "My Profile"
  And I follow "All Dogs"
  And I should see "Batman"
  And I should see "Rat"
  # And I should see "star_6"
  # And I follow "star_6"
  # And I click a star for dog with dog id "6"
  
#   And I follow "My Profile"
#   Then I should see "Rat"

# Scenario: User can star dog from dog profile
#   When I am logged in
#   And I follow "Princess"
#   And I should see "star_5"
#   And I click a star for dog with dog id "5"


# Scenario: User should be able to unstar a dog from search results
#   When I am logged in
#   And I click a star for dog with dog id "2"
#   And I click a star for dog with dog id "2"
#   And I click a star for dog with dog id "1"
#   And I follow "My Stars"
#   Then I should not see "The Joker"
#   And I should see "Batman"

# Scenario: User should be able to unstar a dog from dog profile
#   When I am logged in
#   And I am on the search dogs page
#   And I follow "Batman"
#   And I click a star for dog with dog id "1"
#   Then I should see "1"
#   And I click a star for dog with dog id "1"
#   Then I should see "0"
#   And I follow "My Favorites"
#   Then I should not see "Batman"