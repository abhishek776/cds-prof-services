Feature: explore professionals in the area
  As a user
  I should be able to see a list of professionals in my area
  So that I can find professionals I like and professionals that can care for my dog
  
Background: professionals have been added to the database
  Given the following professionals exist:
    
  | name          | description        | motto                             |
  | Frodo         | LF ring            | Nananana                          |
  | Sam           | Like a puppy       | We'll see who has the last laugh  |
  | Bilbo         | Eleventy-one       | Who?                              |

Scenario: I should be able to see all of the professionals
  When I am on the explore professionals page
  Then I should see "Frodo"
  And I should see "Sam"
  And I should see "Bilbo"
  And I should not see "Batman"
  
Scenario: I should be able to see a professional's name, motto, and description
  When I am on the explore professionals page
  Then I should see "Frodo"
  Then I should see "LF ring"
  Then I should see "Nananana"
  
Scenario: I should be able to view a professional's individual profile
  When I am on the explore professionals page
  Then I should see "Frodo"
  When I follow "Frodo"
  Then I should not see "Dog-Care Professionals"
  And I should see "Frodo"