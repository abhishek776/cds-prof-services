@facebook_test
Feature: star dogs that you like
  As a user or professional service
  I should be able to star a dog I like
  So that the dog appears on a shortlist of dogs I've starred
  
Background: user has been added to the database and logged in
  Given the following users exist:
    | last_name  | first_name | gender | image                      | phone_number  | description  | address       | zipcode | city     | country | uid |
    | Flash      | Clark      | male   | http://tinyurl.com/opnc38n | (555)228-6261 | I love bats  | 387 Soda Hall | 94720   | Berkeley | US      | 5  |
    | Pinzon     | Juan       | male   | http://tinyurl.com/okrw3vd | (555)123-1234 |   love dogs  | 387 Cory Hall | 94720   | Berkeley | US      | 6  |
  
  And the following dogs exist:
    | name     | mix              | age | size            | gender | likes      | energy  | personality | user_id |
    | Princess | Labrador         | 1   | small (0-15)    | Female | cats       | High    | whatever    | 1  |
    | Rat      | Aidi             | 3   | medium (16-40)  | Male   | dogs (all) | Some    | lover       | 5       |
    
  
  And I am on the explore dogs page
  And I am logged in
  
Scenario: User can star/unstar dog from search results
  When I follow "My Profile"
  And I follow "Explore"
  And I should see "Princess"
  And I follow "Princess"
  And I click a star for "Princess"
  Then I should see "1"
  And I click a star for "Princess"
  Then I should see "0"
  And I click a star for "Princess"
  When I follow "My Profile"
  Then I should see "Princess"
  And I click a star for "Princess" 
  And I should not see "Princess"

Scenario: User can not star his own dogs 
  When I follow "My Profile"
  And I follow "Add Dog"
  When I fill in "Dog Name" with "Cat"
  And I fill in "Motto" with "Miay"
  And I fill in "Description" with "I am a cat"
  And I fill in "Health Notes" with "excelent"
  And I fill in "General Availability" with "anytime"
  When I press "Submit" 
  And I follow "Explore"
  And I follow "Cat"
  And I click a star for "Cat"
 
  
Scenario: User can unstar dog from search results
  When I follow "My Profile"
  And I follow "Explore"
  And I should see "Princess"
  And I follow "Princess"
  And I click a star for "Princess"
  And I should see "1"
