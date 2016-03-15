Feature: explore dogs in the area
  As a user or professional service
  I should be able to see a list of dogs in my area
  So that I can find dogs I like and dogs that need care
  
Background: dogs have been added to the database
  Given the following dogs exist:
  | name          | gender | dob          | energy_level_id |
  | Batman        | Female | 12-Dec-2012  | 1               |

  And the following mix links exist:
  | dog_id  | mix_id  |
  | 1       | 210     |
  | 1       | 280     |
  
  And the following personality links exist:
  | dog_id  | personality_id  |
  | 1       | 8               |

Scenario: 
  When I am on the explore dogs page
  Then I should see "Batman"
  And I should see "Female"
  And I should see "3 years"
  And I should see "Golden Retriever, Husky"
  And I should see "High"
  And I should see "still a puppy"
  
  
  
