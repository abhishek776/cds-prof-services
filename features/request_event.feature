@facebook_test

Feature: Users should be able to request to fulfill events by other users
  
  As a user that wants to take care of other people's dogs
  I should be able to request to fulfill an event of a dog that I do not own
  In order to take care of dogs I find on the website.
  
Background: user has been added to the database and logged in
  Given the following users exist:
    | last_name  | first_name | gender | image                      | phone_number  | description  | address       | zipcode | city     | country | uid |
    | Kent       | Clark      | male   | http://tinyurl.com/opnc38n | (555)228-6261 | I love bats  | 387 Soda Hall | 94720   | Berkeley | US      | 5  |
    | Pinzon     | Juan       | male   | http://tinyurl.com/okrw3vd | (555)123-1234 |   love dogs  | 387 Cory Hall | 94720   | Berkeley | US      | 6  |
  
  And the following dogs exist:
    | name     | mix              | age | size            | gender | likes      | energy  | personality | user_id |
    | Princess | Labrador         | 1   | small (0-15)    | Female | cats       | High    | whatever    | 5       |
    | Spock    | Aidi             | 3   | medium (16-40)  | Male   | dogs (all) | Some    | lover       | 6       |
     
  And I am logged in

Scenario: I can request the event
  When I go to "Batman"'s dog page
  And I follow "Book Event"
  Then I should see "Unbook Event"
