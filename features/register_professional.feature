@facebook_test

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

  And the following users exist:
    | last_name  | first_name | gender | image                      | phone_number  | description  | address       | zipcode | city     | country | uid |
    | Kent       | Clark      | male   | http://tinyurl.com/opnc38n | (555)228-6261 | I love bats  | 387 Soda Hall | 94720   | Berkeley | US      | 5  |
    | Pinzon     | Juan       | male   | http://tinyurl.com/okrw3vd | (555)123-1234 |   love dogs  | 387 Cory Hall | 94720   | Berkeley | US      | 6  |
  
  And I am logged in
  
Scenario: I should be able to see all of the professionals
  When I follow "My Profile"
  And I follow "See All Professionals"
  Then I should see "Frodo"
  And I should see "Sam"
  And I should see "Bilbo"
  And I should not see "Make a New Professional Service"

Scenario: I should have the option to make a new professional service
  When I follow "My Profile"
  And I press "Sign Up As A Professional"
  And I should see "Make a New Professional Service"
  
Scenario: I should be able to make a new professional service
  When I follow "My Profile"
  And I press "Sign Up As A Professional"
  And I follow "Make a New Professional Service"
  