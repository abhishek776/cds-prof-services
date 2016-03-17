Feature: explore dogs in the area
  As a user or professional service
  I should be able to see a list of dogs in my area
  So that I can find dogs I like and dogs that need care
  
Background: dogs have been added to the database
  Given the following dogs exist:
    
  | name          | gender | age | energy | size            | personality     | mix                             |
  | Batman        | Male   | 3   | High   | large (41-100)  | still a puppy   | German Shepherd Dog             |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                            |
  | Harley Quinn  | Female | 4   | Some   | small (0-15)    | lover           | Poodle
  

Scenario: I should be able to see all of the dogs and a number of features
  When I am on the explore dogs page
  Then I should see "Batman"
  And I should see "Male"
  And I should see "3 years"
  And I should see "German Shepherd Dog"
  And I should see "High"
  And I should see "still a puppy"
  And I should see "Harley Quinn"
  And I should see "The Joker"
  
Scenario: I should be able to filter the dogs by age
  When I am on the explore dogs page 
  And I filter age "3 months to 5 years"
  And I press "Go"
  Then I should see "Batman"
  And I should see "Harley Quinn"
  And I should not see "The Joker"
  
Scenario: I should be able to filter the dogs by gender
  When I am on the explore dogs page 
  And I filter gender "Female"
  And I press "Go"
  Then I should see "Harley Quinn"
  And I should not see "The Joker"
  
Scenario: I should be able to filter the dogs by size
  When I am on the explore dogs page 
  And I filter size "small, medium"
  And I press "Go"
  Then I should see "Harley Quinn"
  And I should see "The Joker"
  And I should not see "Batman"
  
Scenario: I should be able to filter the dogs by mix
  When I am on the explore dogs page
  And I filter mix "German Shepherd Dog"
  And I press "Go"
  Then I should see "Batman"
  And I should not see "The Joker"
  
Scenario: I should be able to filter the dogs by energy level
  When I am on the explore dogs page
  And I filter energy "Active, High"
  And I press "Go"
  Then I should see "Batman"
  And I should see "The Joker"
  And I should not see "Harley Quinn"
  
Scenario: I should be able to apply multiple filters to the dogs
  When I am on the explore dogs page
  And I filter size "small"
  And I filter age "3 months to 5 years"
  And I press "Go"
  Then I should see "Harley Quinn"
  And I should not see "Batman"
  And I should not see "The Joker"
  
  
  


  
  
  
  
