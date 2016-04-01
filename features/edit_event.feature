@facebook_test

Feature: User should be able to edit their dog's event

As a dog parent
In order to change the day I want a sitter
I want to edit my dog's event

Background: user has been added to the database and logged in
  Given the following users exist:
    | last_name  | first_name | gender | image                      | phone_number  | description  | address       | zipcode | city     | country | uid |
    | Kent       | Clark      | male   | http://tinyurl.com/opnc38n | (555)228-6261 | I love bats  | 387 Soda Hall | 94720   | Berkeley | US      | 5  |
    | Pinzon     | Juan       | male   | http://tinyurl.com/okrw3vd | (555)123-1234 |   love dogs  | 387 Cory Hall | 94720   | Berkeley | US      | 6  |
  
  And the following dogs exist:
    | name     | mix              | age | size            | gender | likes      | energy  | personality | user_id |
    | Princess | Labrador         | 1   | small (0-15)    | Female | cats       | High    | whatever    | 5  |
    | Spock    | Aidi             | 3   | medium (16-40)  | Male   | dogs (all) | Some    | lover       | 6       |
    
    
  
  And I am logged in
  
  Scenario: User should be able to delete their dog's event
    When I follow "My Profile"
    
    When I follow "Add Dog"
    Then I should see "Name"
    When I fill in "Dog Name" with "Cat"
    And I fill in "Motto" with "Miay"
    And I fill in "Description" with "I am a cat"
    And I fill in "Health Notes" with "excelent"
    And I fill in "General Availability" with "anytime"
    When I press "Submit" 
    And I have created an event for "Cat" today
    And I should see "Cat"
    When I follow "Cat"
    
    And I should see "Edit Event"
    When I follow "edit_event_button"
    And I should see "Edit Cat's Event"
    And I check "times_Afternoon"
    And I choose "my_location_Your_House"
    And I press "Schedule"
    And I should see "Time: Morning, Afternoon"
    And I should see "Location: Your House"
    
    When I follow "Edit"
    And I press "Delete Event"
    Then I should see "Your event has been deleted."


 