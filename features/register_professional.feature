Feature: explore professionals in the area
  As a user
  I should be able to see a list of professional services in my area
  So that I can join one or make my own
  
Background: professionals have been added to the database
  Given the following professionals exist:
    
  | name          | description        | motto                             |
  | Frodo         | LF ring            | Nananana                          |
  | Sam           | Like a puppy       | We'll see who has the last laugh  |
  | Bilbo         | Eleventy-one       | Who?                              |

Scenario: I should be able to see all of the professionals
  When I am on the register professionals page
  Then I should see "Frodo"
  And I should see "Sam"
  And I should see "Bilbo"
  And I should not see "Batman"
  