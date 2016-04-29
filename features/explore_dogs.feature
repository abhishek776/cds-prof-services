Feature: explore dogs in the area
  As a user or professional service
  I should be able to see a list of dogs in my area
  So that I can find dogs I like and dogs that need care
  
Background: dogs have been added to the database
  Given the following dogs exist:
    
  | name          | gender | age | energy | size            | personality     | mix                   |user_id   |
  | Bane          | Male   | 1   | High   | large (41-100)  | still a puppy   | German Shepherd Dog   |1         |
  | The Joker     | Male   | 6   | Active | medium (16-40)  | fetcher         | Mutt                  |1         |
  | Harley Quinn  | Female | 4   | Some   | small (0-15)    | lover           | Poodle                |1         |
  

Scenario: I should be able to see all of the dogs and a number of features
  When I am on the explore dogs page
  Then I should see "Bane"
  And I should see "Male"
  And I should see "1 years"
  And I should see "German Shepherd Dog"
  And I should see "High"
  And I should see "Harley Quinn"
  And I should see "The Joker"
  
Scenario: I should be able to filter the dogs by age
  When I am on the explore dogs page 
  And I select "0-2 years" from "age"
  And I press "Filter"
  Then I should not see "Harley Quinn"
  And I should not see "The Joker"
  
Scenario: I should be able to filter the dogs by gender
  When I am on the explore dogs page 
  And I select "Female" from "gender"
  And I press "Filter"
  Then I should see "Harley Quinn"
  And I should not see "The Joker"
  
Scenario: I should be able to filter the dogs by size
  When I am on the explore dogs page 
  And I select "large (41-100)" from "size"
  And I press "Filter"
  Then I should not see "Harley Quinn"
  And I should not see "The Joker"
  
Scenario: I should be able to filter the dogs by mix
  When I am on the explore dogs page
  And I select "German Shepherd Dog" from "mix"
  And I press "Filter"
  Then I should not see "The Joker"
  
Scenario: I should be able to filter the dogs by energy level
  When I am on the explore dogs page
  And I select "High" from "energy_level"
  And I select "Active" from "energy_level"
  And I press "Filter"
  Then I should not see "Harley Quinn"
  
Scenario: I should be able to filter the dogs by events
  When I am on the explore dogs page
  And I check "has_event"
  And I press "Filter"
  Then I should not see "Bane"
  And I should not see "The Joker"
  And I should not see "Harley Quinn"
  
Scenario: I should be able to apply multiple filters to the dogs
  When I am on the explore dogs page
  And I select "High" from "energy_level"
  And I select "0-2 years" from "age"
  And I press "Filter"
  Then I should not see "Harley Quinn"
  And I should not see "The Joker"
  

  
  
  


  
  
  
  
